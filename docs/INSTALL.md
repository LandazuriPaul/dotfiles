# Install Instructions

You can follow these instructions to install this repository on a brand-new machine (server or laptop).

## Prerequisites

### Hostname

The templates pick what to render from the hostname (`blastoise`, `raichu`,
…), so set it **before** initialising the repository, or the host-specific
files are silently skipped:

```shell
sudo hostnamectl set-hostname <hostname>   # Linux
```

### System packages (Linux)

Homebrew's build requirements, plus `zsh` (macOS already ships it):

```shell
sudo apt-get install build-essential procps curl file git zsh
```

### Homebrew

The Homebrew package manager allows to install recent versions of useful tools.
See [official instructions](https://brew.sh/). On Linux this is the same
project (formerly Linuxbrew), installed under `/home/linuxbrew/.linuxbrew`.

Skip the post-installation `.zshrc` updates: the dotfiles' `.zshrc` already
loads Homebrew. They aren't installed yet, so load it in the current shell:

```shell
eval "$(/opt/homebrew/bin/brew shellenv)"              # macOS
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" # Linux
```

### Dependencies

```shell
brew install git mise   # macOS
brew install mise       # Linux
```

- `mise` is a tool version manager and much more (see [mise website](https://mise.jdx.dev)):
  it installs every other tool, from [config.toml.tmpl](../dot_config/mise/config.toml.tmpl).
- `git` on macOS: Apple's (from the Xcode command line tools) works but lags
  behind. On Linux, apt's `git` is already installed above.

No `gcc` or `gpg` from Homebrew: bottles are prebuilt, so there's nothing to
compile (the Xcode tools and `build-essential` cover the rare exception), and
nothing here uses `gpg` (no signed commits; Ubuntu ships it for apt anyway).

#### What not to install with Homebrew or mise

Homebrew and mise install files owned by **your user**. That's fine for tools
you run yourself, but not for anything that runs as **root** (a system
service, a privileged helper): whoever gets into your account could replace
that binary, and root would then run their code. Install those with the
system package manager (apt), the vendor's own installer or package (`.dmg`,
`.pkg`, apt repository), so the files are root-owned and updates come from
the OS or the vendor.

Don't install these with Homebrew or mise:

- **Tailscale**: `tailscaled` runs as root. macOS: the `.dmg` from
  tailscale.com (updates from its UI). Linux: Tailscale's apt repository
  (`curl -fsSL https://tailscale.com/install.sh | sh` sets it up).
- **Docker Engine on Linux**: `dockerd` runs as root. Use Docker's apt
  repository. The `docker` CLI on its own is fine with mise.
- **Lima's `socket_vmnet`** (macOS): Lima's root network helper, only needed
  for its `vmnet` networks. Lima's docs require a root-owned copy, never
  Homebrew's. Not used here: Colima runs with `vmType: vz` and needs no root
  helper.

Fine with mise: Colima, Lima and the Docker CLI on macOS. They run as your
user, and the Docker daemon runs as root only inside Colima's VM, not on
the Mac.


### Password Managers

See [PASSWORD_MANAGERS](./PASSWORD_MANAGERS.md).

### SSH Key

SSH keys are stored encrypted in 1Password (Landázuri account), one per machine,
and never written to disk in plaintext. See [PASSWORD_MANAGERS](./PASSWORD_MANAGERS.md)
for the account setup.

**Laptops (macOS):**

- Turn on the agent: 1Password → Settings → Developer → "Use the SSH Agent" + Touch ID.
- Generate the machine's key: New Item → SSH Key → Generate → Ed25519, titled
  `<hostname>-ssh-key` (e.g. `blastoise-ssh-key`).
- Add its public key to GitHub ([SSH settings](https://github.com/settings/keys))
  and to any servers' `authorized_keys`.
- `~/.ssh/config` gets the agent socket and per-host key pins via chezmoi; the
  public key is rendered to `~/.ssh/<hostname>.pub` (mode `0600`).

**Headless servers (e.g. raichu):**

The Touch ID agent is desktop-only, so a headless host uses a read-only 1Password
**service account** instead:

- Keep the server's key in a dedicated vault (`raichu`) and generate a service
  account scoped read-only to it.
- Store the token as a `raichu-service-account` credential item in the Landázuri
  `Private` vault, with the token saved under a secret field name `token`.
  chezmoi renders it to `~/.config/op/raichu.token` (`0600`,
  read via the interactive landázuri session, so no dependency on SSH).
- On login, `~/.shell/env/raichu.sh` starts a persistent user `ssh-agent` and runs
  `~/.shell/scripts/load-ssh-key.sh`, which pipes the key from 1Password into the
  agent (`op read … | ssh-add -`). The key stays in memory only.

For the design rationale and the non-obvious gotchas behind this setup, see [SSH](./SSH.md).

## Repository

`chezmoi` and the 1Password CLI (`op`) are only installed by `mise install`,
whose config comes from this repository, but the templates need `op` to
render. Bootstrap them in a temporary shell instead:

```shell
mise exec chezmoi@latest 1password-cli@latest -- bash
```

In that shell:

1. Make your 1Password accounts available to `op`:
   - Laptop: 1Password → Settings → Developer → "Integrate with 1Password CLI".
   - Server (no desktop app): add the Landázuri account only:
     ```shell
     op account add
     ```
2. Sign in to the Landázuri account (its UUID is in the `USER ID` column of
   `op account list`):
   ```shell
   eval "$(op signin --account <landazuri-uuid>)"
   ```
   On a laptop, sign in to the other accounts the same way (or wait for
   `cm-login.sh`, available once the repository is applied).
3. Initialise and apply the repository. It's public, so clone it over HTTPS:
   no SSH key is loaded yet, since the key setup comes from this repository.
   ```shell
   chezmoi init --apply LandazuriPaul
   ```
   It prompts once for each 1Password account UUID (see
   [PASSWORD_MANAGERS](./PASSWORD_MANAGERS.md)). On a server, leave the
   accounts it doesn't use empty.
4. `exit` the temporary shell.

To push changes later, switch the remote to SSH once the machine's key works:

```shell
chezmoi git -- remote set-url origin git@github.com:LandazuriPaul/dotfiles.git
```

## Tool Installation

Start a new `zsh` session, which now activates `mise` with the dotfiles'
config, and install the tools. You can check and change them in
[config.toml.tmpl](../dot_config/mise/config.toml.tmpl) (`raichu` only gets
the basic ones):

```shell
zsh
mise install
```

The first `zsh` may fail to install its plugins, and that's expected. zinit
clones them from `https://github.com/…`, which `.gitconfig` rewrites to SSH,
but on a server the SSH key is only loaded later in that same startup
(`~/.profile` starts the agent). The plugins need the key, and the key needs
the shell to finish starting. Once it has, start a fresh one, which inherits
the now-loaded agent, and the clones succeed:

```shell
exec zsh
```

Accept GitHub's host key if SSH asks. The plugins are only cloned once, so
this happens only on the first setup.

## Default shell (Linux)

Last, once `zsh` is fully configured, make it your login shell (macOS already
defaults to `zsh`):

```shell
chsh -s /usr/bin/zsh
```

Log out and back in, and you're good to go!

---

## Extra steps

Once you have all of these tools installed, you can complete your installation with the following next steps:

- [DEVELOPMENT](./DEVELOPMENT.md): For development tools.
- [UTILITIES](./UTILITIES.md): For other utility applications.
