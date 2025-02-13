Development tools
---

Some development tools to complete the installation process.

- [CLI Tools](#cli-tools)
  - [General](#general)
  - [Python 3](#python-3)
  - [Node.js](#nodejs)
  - [Java](#java)
  - [DevOps Tools](#devops-tools)
- [Terminal Applications](#terminal-applications)
  - [Ghostty](#ghostty)
  - [iTerm2](#iterm2)
    - [Preferences](#preferences)
    - [Shell integration features](#shell-integration-features)
    - [Long-running commands](#long-running-commands)
- [Editors and IDEs](#editors-and-ides)
  - [Sublime Text](#sublime-text)
  - [Visual Studio Code](#visual-studio-code)
    - [Settings and extensions](#settings-and-extensions)
    - [Fonts](#fonts)
- [Other development tools](#other-development-tools)
  - [Fork](#fork)
  - [TablePlus](#tableplus)

# CLI Tools

## General

1. Install the Xcode Command Line tools:

   ```sh
   xcode-select --install
   ```

2. Install [Neovim](https://neovim.io/):

   ```sh
   brew install neovim
   ```

3. Install [vim-plug](https://github.com/junegunn/vim-plug) for both vim and neovim following the
   official [installation instructions](https://github.com/junegunn/vim-plug#installation).

4. Install [yq](https://github.com/kislyuk/yq):

   ```sh
   pip3 install yq
   ```

5. Install [bat](https://github.com/sharkdp/bat):

   ```sh
   brew install bat
   ```

6. Install [btop](https://github.com/aristocratos/btop):

   ```sh
   brew install btop
   ```

7. Install [tmux](https://github.com/tmux/tmux) and [its package manager](https://github.com/tmux-plugins/tpm):

   ```sh
   brew install tmux
   mkdir -p $HOME/.tmux/plugins
   git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
   ```

8. GNU implementations of common CLI tools: To avoid unnecessary headaches, better to use the standard GNU implementations of these common tools:
   ```sh
   brew install grep gnu-sed
   ```
## Python 3

1. Install [pyenv](https://github.com/pyenv/pyenv), the Python version manager:
    ```shell
    brew install pyenv
    ```
2. Install the latest Python3 version globally:
    ```shell
    pyenv install 3
    ```

## Node.js

1. Install [nvm](https://github.com/nvm-sh/nvm), the Node.js version manager:

   ```sh
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash
   ```

   Once the installation is complete, you can install the latest node version. This way you will be able to check that
   the next install - yarn - has been successfully installed:

   ```sh
   nvm install node
   ```

2. Install [Yarn](https://classic.yarnpkg.com/), an efficient Node.js package manager. In order to avoid installing a
   global Node.js version at the same time, avoid installing Yarn via Homebrew. You would rather want to install it
   directly via the install script:

   ```sh
   curl -o- -L https://yarnpkg.com/install.sh | bash
   ```

## Java

1. Install [jenv](https://www.jenv.be/), the Java version manager:
   ```sh
   brew install jenv
   ```

## DevOps Tools

1. Install the [Kubernetes](https://kubernetes.io/) CLI tool, `kubectl`:

    ```sh
    brew install kubernetes-cli
    ```

2. Install [kubectx](https://github.com/ahmetb/kubectx):

   ```sh
   brew install kubectx
   ```

3. Install [Google Cloud SDK](https://cloud.google.com/sdk/):

   ```sh
   brew install google-cloud-sdk
   ```

   If you want to add the `gcloud` completion, you will need to
   download [Cloud SDK package](https://cloud.google.com/sdk/docs/quickstart-macos) and place it in `$HOME/scripts` (
   according to the current `.zshrc` configuration).

    Also, if you want to work with GKE, you need to install the GKE plugin:
    ```shell
   gcloud components install gke-gcloud-auth-plugin
   ```

4. Install [Terraform](https://www.terraform.io/):

   ```sh
   brew install terraform
   ```

5. Install [Watch](https://formulae.brew.sh/formula/watch): Command line tool to run periodically a program and has its
   output upadted.

   ```sh
   brew install watch
   ```

6. Install [k9s](https://k9scli.io/):

   ```sh
   brew install k9s
   ```

7. Install [stern](https://github.com/wercker/stern):
   ```sh
   brew install stern
   ```

8. Install [jq](https://stedolan.github.io/jq/):
    ```shell
    brew install jq
    ```

9. Install [yq](https://mikefarah.gitbook.io/yq/):
    ```shell
    brew install yq
    ```

10. Install [gh](https://cli.github.com/):
    ```shell
    brew install gh
    ```

11. Install [cat](https://github.com/nektos/act):
    ```shell
    brew install act
    ```

# Terminal Applications

## Ghostty

Install Ghostty from the official website: [https://ghostty.org/](https://ghostty.org/).

The configuration is saved under the [.config/ghostty](/dot_config/ghostty/) directory.

## iTerm2

### Preferences

To be able to track the iTerm2 preference changes with this dotfiles repository, I configured iTerm2 to save the
preferences to a custom folder: `~/.iterm2_profile`. This setting is accessible in iTerm2's preferences > General >
Preferences.

### Shell integration features

It can be useful to run the iTerm2 integration script to enjoy all its features. In the main iTerm2 menu,
launch `Install Shell Integration`.

### Long-running commands

When on a local session, you can use [iTerm2 shell integration](https://iterm2.com/documentation-shell-integration.html)
feature called "Alert on next mark"

When on a remote session, I use a little trick inspired by [this SuperUser answer](https://superuser.com/a/1165272):
whenever I want to be notified at the end of a long-running command, I append ` ; echo -e '\a'` at the end of the
command. To do this as seamlessly as possible, I attached this action to a custom iTerm2 shortcut: `opt+a`.

# Editors and IDEs

## Sublime Text

[Sublime Text](https://www.sublimetext.com/) is a very lightweight and efficient editor.

## Visual Studio Code

### Settings and extensions

Once [VS Code](https://code.visualstudio.com/) is installed, first login with GitHub to be able to sync you settings.

### Fonts

FiraCode font for some nice ligature features:

```sh
brew tap homebrew/cask-fonts
brew install font-fira-code
```

# Other development tools

## Fork

[Fork](https://git-fork.com/) is a fast and friendly git GUI.

## TablePlus

[TablePlus](https://tableplus.com/) is a friendly GUI for relational databases.
