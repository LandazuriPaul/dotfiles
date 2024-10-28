# Dotfiles

This repository uses [chezmoi](https://www.chezmoi.io/) to track dotfiles across different machines.

## Documentation

See the [docs](./docs/) directory for some documentation:

- [DEVELOPMENT](./docs/DEVELOPMENT.md): For development installations.
- [UTILITIES](./docs/UTILITIES.md): For utilities installations.
- [USEFUL_COMMANDS](./docs/USEFUL_COMMANDS.md): For random but useful commands.

## TODO

### Installation

Current steps to be automated:

1. Install `zsh`
    ```shell
    sudo apt-get install zsh
    ```
2. Change default shell to `zsh`
    ```shell
    chsh -s $(which zsh)
    ```
3. Install `fzf`
   ```shell
   sudo apt-get install fzf
   .fzf/install
   ```
4. Install [1Password8](https://1password.com/downloads) and `1Password CLI`:
   ```shell
   brew install --cask 1password/tap/1password-cli
   ```
   In 1Password8 settings, enable TouchID (in `security`) and `Biometric unlock for 1Password CLI` (in `developer`).

5. Install `Bitwarden CLI`:
   ```shell
   brew install bitwarden-cli
   ```
