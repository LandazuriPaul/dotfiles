# SSH Keys

SSH keys are stored in 1Password (Landázuri account), one per machine, and are
never written to disk in plaintext. `INSTALL.md` has the from-scratch setup
steps; this document records **why** it's built this way and the **non-obvious
gotchas** behind the odd-looking choices.

## Model

| Machine | Mechanism | Auth to use the key |
| --- | --- | --- |
| Laptops (macOS, e.g. `blastoise`) | 1Password SSH agent | Touch ID |
| Headless servers (e.g. `raichu`) | key loaded into an in-memory `ssh-agent` via a read-only service account | scoped token on disk (`0600`) |

The private key never leaves 1Password / the agent. A process that reads the
filesystem finds only public keys and an encrypted vault.

## Why headless servers are different

The 1Password Touch ID agent requires the desktop app, which can't run on a
headless box — and a server reached from several devices can't borrow a laptop's
forwarded agent. So `raichu` holds its **own** key in a dedicated `raichu` vault
and loads it into a normal `ssh-agent` at login (`op read … | ssh-add -`, key in
memory only) using a **service account** scoped read-only to that one vault.

Trade-off, accepted deliberately: the service-account token is a real secret on
disk. A headless host that must work unattended can't be Touch-ID-gated, so the
goal shifts from "no usable secret on disk" to "one **scoped, revocable,
auditable** secret, with the key never persisted." The token grants read of the
`raichu` vault only, and is itself managed from 1Password (see `INSTALL.md`).

The load happens at login, so it covers interactive sessions and persists across
them. A cron job that must run **after a reboot with no prior login** would not
have the agent yet — that would need a systemd **user** `ssh-agent` service plus
`loginctl enable-linger`. Not set up, because no such job exists.

## Gotchas (the reasons behind the weird bits)

- **Identify accounts by UUID, not sign-in address.** Two accounts share
  `my.1password.com`, so the address is ambiguous. See `PASSWORD_MANAGERS.md`.

- **Reference 1Password fields by ID, not label.** The desktop app localises
  field *labels* (a French app stores the SSH private key as `clé privée`), and
  secret references are ASCII-only — an accented label can't even be typed in a
  reference. Field **IDs** stay English/stable: use `private_key`, `public_key`.
  Append `?ssh-format=openssh` when piping to `ssh-add`. If unsure of an ID:
  `op item get <item> --format json | jq '.fields[] | {id,label}'`.

- **`agent.toml` matching is strict** (unlike `op read`, which is lenient). Use
  the **exact** vault name (`Private`, not `private`) and identify the account by
  **UUID** — not the email, and not the shared `my.1password.com` address.

- **Public-key files must be `0600` (`private_` prefix).** SSH permission-checks
  any `IdentityFile` as if it were a private key and rejects group/other access.
  chezmoi's default mode follows the umask (`0664` on a umask-`002` host), which
  SSH refuses; `0444` is refused too (readable by others). `0600` is the only
  reliably-accepted mode, so the `.pub` templates carry `private_`.

- **`~/.config/op` must be `0700`** or the `op` CLI refuses to run
  ("permissions too broad"). The source dir is `private_op` so chezmoi sets
  `0700`; its default directory mode is too broad.

- **`~/.ssh/config` pins one key per host** with `IdentityFile <pubkey>` +
  `IdentitiesOnly yes`, and the global `Host *` defaults come **last** in the
  file. Order matters: a host's own `IdentityFile` accumulates *before* the
  `Host *` default, so the right key is offered first — avoiding "Too many
  authentication failures" and never presenting the personal key to work hosts.
  Host-identifying entries (hostnames, ports, users) live only in the 1Password
  `ssh_config` secret, never the repo.

- **Template host guards use `.hostname`, never `.chezmoi.hostname`.**
  `.hostname` is the normalised value from `.chezmoi.toml.tmpl`; the raw
  `.chezmoi.hostname` can differ (e.g. `blastoise-123`, or an unreliable value on
  Linux) and silently skips a guarded block.

## Where things live

- **Repo:** generic, non-identifying config only — the macOS agent socket path,
  per-machine public keys (rendered from 1Password), the `github.com` pin.
- **1Password `ssh_config` secret:** all host-identifying config (hostnames,
  ports, users, `ProxyJump`, downstream `IdentityFile` pins).
