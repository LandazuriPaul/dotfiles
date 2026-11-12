Development tools
---

Some development tools to complete the installation process.

First, make sure that we went through the [INSTALL.md](./INSTALL.md) and have mise installed all languages and tools.

- [CLI Tools](#cli-tools)
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

1. For macOS, install the Xcode Command Line tools and GNU implementations of common CLI tools:

   ```sh
   xcode-select --install
   brew install grep gnu-sed
   ```

2. Install some utilities via brew [btop](https://github.com/aristocratos/btop), [dtop](https://dtop.dev/):
   ```sh
   brew install btop dtop
   ```

3. Install [tmux](https://github.com/tmux/tmux) and [its package manager](https://github.com/tmux-plugins/tpm)):

   ```sh
   mkdir -p $HOME/.tmux/plugins
   git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
   ```

# Terminal Applications

## Ghostty

Install Ghostty from the official website: [https://ghostty.org/](https://ghostty.org/).

The configuration is saved under the [.config/ghostty](/dot_config/ghostty/) directory.

# Editors and IDEs

## Zed

[Zed](https://zed.dev/) is a very fast and modern editor.

On macOS, once installed, be sure to install the CLI binary: [see official docs](https://zed.dev/docs/reference/cli#installation). 

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

## AI Tools

[OpenUsage](https://www.openusage.ai/) is a macOS menu bar app that provides AI subscriptions tracking.
