# Paul Landázuri macOS dotfiles

This repository aims to ease the process of installing all
crucial programs and settings on a brand new macOS.

## Pre-installation steps

To add an extra layer of security, I don't use an admin account on a daily basis. In order to set up a more secure account system than the default one, please follow the [ACCOUNTS.md](./ACCOUNTS.md) instructions.

## Dependencies installation

To be sure you have all the prerequisites that this dotfiles repository makes use of, you should first go through the [INSTALL.md](./INSTALL.md) instructions. Otherwise, some of the dotfiles included in this repository will be useless and the shell prompt might be broken.

## Install the dotfiles versioning system

To install these dotfiles, simply follow chezmoi's procedure (see the [official documentation](https://www.chezmoi.io/quick-start/#using-chezmoi-across-multiple-machines) for more information):

1. First make sure to add a new SSH key to your GitHub account, following [the official documentation](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account).

2. Install `chezmoi` locally:
    ```shell
    brew install chezmoi
    ```

3. Then you can initialise the repository with chezmoi:
    ```shell
    chezmoi init --apply git@github.com:LandazuriPaul/dotfiles.git
    ```
    > If you'd rather download the repository first before applying, you can remove the `--apply` flag.
