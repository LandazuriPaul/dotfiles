# Install Instructions

You can follow these instructions to install this repository on a brand-new machine (server or laptop).

## Prerequisites

### Homebrew

The Homebrew package manager allows to install recent versions of useful tools.
See [official instructions](https://brew.sh/).

If indicated, follow the post-installation recommendations (except the `.zshrc` updates) for Linux:
```shell
sudo apt-get install build-essential
```

### ZSH

- Install `zsh`:
  - Linux (Debian/Ubuntu):
    ```shell
    sudo apt-get install zsh
    ```
  
  - macOS:
    ```shell
    brew install zsh
    ```
  
- Set `zsh` as your default shell:
  ```shell
  chsh -s /bin/zsh
  ```

### Dependencies

Some dependencies:

```shell
brew install git gcc gpg mise
```

Explanations:
- `git`, `gcc` and `gpg` might be already installed, but `brew` has access to more recent versions and uses them internally.
- `mise` is a tool version manager and much more. See [mise website](https://mise.jdx.dev).


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
- Store the token as a `raichu-service-account` Password item in the Landázuri
  `Private` vault; chezmoi renders it to `~/.config/op/raichu.token` (`0600`,
  read via the interactive landázuri session, so no dependency on SSH).
- On login, `~/.shell/env/raichu.sh` starts a persistent user `ssh-agent` and runs
  `~/.shell/scripts/load-ssh-key`, which pipes the key from 1Password into the
  agent (`op read … | ssh-add -`). The key stays in memory only.

## Repository

Finally, you can install this repository and apply it using `chezmoi`.

```shell
chezmoi init --apply git@github.com:$GITHUB_USERNAME/dotfiles.git
```

Once you have run this command, the `dotfiles` should be installed.

## Tool Installation

With `mise` installed and its configuration available with the above dotfiles initialisation, you can install the remaining dependencies with the below command.
You can check and change them in [mise.toml](../dot_config/mise/config.toml):

```shell
mise install
```

Now your terminal is fully ready and you can just launch a new session, you're good to go!

---

## Extra steps

Once you have all of these tools installed, you can complete your installation with the following next steps:

- [DEVELOPMENT](./DEVELOPMENT.md): For development tools.
- [UTILITIES](./UTILITIES.md): For other utility applications.
- [USEFUL_COMMANDS](./USEFUL_COMMANDS.md): For other useful commands.
