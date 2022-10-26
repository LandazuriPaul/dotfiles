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
3. Install `oh-my-zsh`
    ```shell
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ```
4. Install `powerlevel10k`
    ```shell
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    ```
5. Install `zsh-autosuggestions`
    ```shell
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    ```
6. Install `zsh-syntax-highlighting`
   ```shell
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
   ```
7. Install `z`
   ```shell
   git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
   ```
8. Install `fzf`
   ```shell
   sudo apt-get install fzf
   .fzf/install
   ```
   
9. Install [1Password8](https://1password.com/downloads) and `1Password CLI`:
   ```shell
   brew install --cask 1password/tap/1password-cli
   ```
   In 1Password8 settings, enable TouchID (in `security`) and `Biometric unlock for 1Password CLI` (in `developer`).

10. Install `Bitwarden CLI`:
   ```shell
   brew install bitwarden-cli
   ```
