# Password Managers

This dotfiles repository uses chezmoi's powerful feature to read secrets from password managers.

This achieves 2 main goals:

- Making sure that sensitive information (IP, keys, etc.) are not shared in the `dotfiles` repository

- Keeping secrets cleanly separated (personal, professional, etc.)

## CLI & Desktop Apps

The 1Password CLI connected to chezmoi is required.

For a server, you only need the CLI version.

For a laptop, you'll want to install it alongside the desktop version.

## 1Password

- [CLI instructions](https://developer.1password.com/docs/cli/get-started/)
- [macOS Desktop instructions](https://1password.com/fr/downloads/mac)
- [Linux Desktop instructions](https://1password.com/fr/downloads/linux)

### Identifying accounts

The templates need to tell `op` which account to read from. A sign-in address
is **not** a unique identifier: several accounts can share one (for example two
personal accounts both on `my.1password.com`), and `op` cannot resolve which is
meant, failing with:

```
no 1Password account found matching my.1password.com
```

A CLI shorthand would disambiguate, but shorthands require the CLI to manage its
own accounts (`op account add`), which is refused while the desktop app manages
them ("Integrate with 1Password CLI"). To keep the convenience of the app
integration (Touch ID unlock), the templates identify each account by its
**account UUID**, which is unique and always resolves.

To keep the UUIDs out of this public repository, they are not hard-coded. The
config template [`.chezmoi.toml.tmpl`](../.chezmoi.toml.tmpl) prompts for them
once per machine via `promptStringOnce` and stores them in the local, uncommitted
`~/.config/chezmoi/chezmoi.toml` under `[data.onepassword]`. Templates then refer
to them by readable name — `.onepassword.mfc`, `.onepassword.enapi` and
`.onepassword.landazuri` — e.g.:

```
{{ onepasswordRead "op://private/mfc_kubeconfig/mfc_kubeconfig.yaml" .onepassword.mfc }}
```

This repository expects these accounts:

| Name        | Sign-in address       | Account                        |
| ----------- | --------------------- | ------------------------------ |
| `mfc`       | `my.1password.com`    | MyFoodCourt                    |
| `enapi`     | `enapi.1password.com` | ENAPI                          |
| `landazuri` | `my.1password.com`    | Landázuri (1Password Families) |

Note that `mfc` and `landazuri` share the `my.1password.com` sign-in address,
which is exactly why the account UUID (not the address) is used as the
identifier.

Set them up on a new machine:

1. Find each account's UUID in the `USER ID` column:

   ```sh
   op account list
   ```

2. Run `chezmoi init`. It prompts once for each UUID and writes them to the local
   config (they are never committed). To re-enter them later, delete the
   `[data.onepassword]` block from `~/.config/chezmoi/chezmoi.toml` and re-run
   `chezmoi init`.

3. Verify each resolves (expects account info, not `account is not signed in`):

   ```sh
   op whoami --account <mfc-uuid>
   op whoami --account <enapi-uuid>
   op whoami --account <landazuri-uuid>
   ```

Once the UUIDs are set, `cm-login.sh` and `chezmoi apply` work as intended.
