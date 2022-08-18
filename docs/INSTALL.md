# General installation list

In order to have an operational system to develop, here is an sorted list of installation recommendations:

1. Generate a new SSH key:

   ```sh
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```

   And register it in your GitHub account, in your [SSH settings](https://github.com/settings/keys).

2. Install [Homebrew](https://brew.sh/), the macOS package manager:

   ```sh
   /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
   ```

3. Install the GPG CLI tool to be able to check package integrity:

   ```sh
   brew install gpg
   ```

4. Install the [git](https://git-scm.com/), the most common distributed version control system:

   ```sh
   brew install git
   ```

5. Install [zsh](https://www.zsh.org/) and set it as your default shell:

   ```sh
   brew install zsh # install ZSH
   chsh -s /bin/zsh # set it as your default shell
   ```

6. Install [Oh My ZSH!](https://ohmyz.sh/):

   ```sh
   sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

7. Install [iTerm2](https://iterm2.com/), following [this link](https://iterm2.com/downloads/stable/latest). Once installed, head to the instructions at [ITERM2.md](./ITERM2.md)

8. Install the [powerlevel10k](https://github.com/romkatv/powerlevel10k) theme for zsh:

   ```sh
   git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
   ```

   To have it nicely integrated, you should download the MesloLGS font, that you can find [here](https://github.com/romkatv/powerlevel10k#manual-font-installation).

9. Install some extra zsh plugins, `zsh-autosuggestions` and `zsh-syntax-highlighting`:

   ```sh
   git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
   ```

10. Install [fzf](https://github.com/junegunn/fzf), the general-purpose command-line fuzzy finder:

    ```sh
    brew install fzf
    ```

    Once installed, with `ctrl+r`, you'll be able to fuzzy-find entries in your zsh or bash history. See the project page for more information and usages.

11. Install [Docker](https://www.docker.com/) following this [link](https://download.docker.com/mac/stable/Docker.dmg).

---

## Extra steps

Once you have all of these tools installed, you can complete your installation with the following next steps:

- [DEVELOPMENT](./DEVELOPMENT.md): For development tools.
- [UTILITIES](./UTILITIES.md): For other utility applications.
- [USEFUL_COMMANDS](./USEFUL_COMMANDS.md): For other useful commands.
