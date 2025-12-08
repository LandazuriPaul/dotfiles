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
brew install git gcc gpg fzf zoxide chezmoi
```

Explanations:
- `git`, `gcc` and `gpg` might be already installed, but `brew` has access to more recent versions and uses them internally.
- `fzf` is a fantastic tool used by some ZSH extensions and referenced in this repository.
- `zoxide` is a smarter `cd` command and uses `fzf` for efficient matching.
- `chezmoi` for the dotfiles set up.

### Password Managers

See [PASSWORD_MANAGERS](./PASSWORD_MANAGERS.md).

### SSH Key

- Generate a new SSH key:
   ```sh
   ssh-keygen -t ed25519 -C "your_email@example.com"
   ```

- Register it in your GitHub account, in your [SSH settings](https://github.com/settings/keys).

## Repository

Finally, you can install this repository and apply it using `chezmoi`.

```shell
chezmoi init --apply git@github.com:$GITHUB_USERNAME/dotfiles.git
```

Once you have run this command, the `dotfiles` should be installed.

Just launch a new session and all the zsh extensions should be installed for you and you should be good to go!

---

## Extra steps

Once you have all of these tools installed, you can complete your installation with the following next steps:

- [DEVELOPMENT](./DEVELOPMENT.md): For development tools.
- [UTILITIES](./UTILITIES.md): For other utility applications.
- [USEFUL_COMMANDS](./USEFUL_COMMANDS.md): For other useful commands.
