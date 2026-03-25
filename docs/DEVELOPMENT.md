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

2. Install utilities via brew [btop](https://github.com/aristocratos/btop), [worktrunk](https://worktrunk.dev/) (for some reason, not available on mise):
   ```sh
   brew install btop worktrunk
   ```

3. Install [tmux](https://github.com/tmux/tmux) and [its package manager](https://github.com/tmux-plugins/tpm)):

   ```sh
   mkdir -p $HOME/.tmux/plugins
   git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
   ```

4. Install [Docker](https://www.docker.com/) following this [link](https://download.docker.com/mac/stable/Docker.dmg).

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

## Zed

[Zed](https://zed.dev/) is a very fast and modern editor.

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
