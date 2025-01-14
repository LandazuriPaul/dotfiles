# Raycast

## Install app

Download and install Raycast from the official website: [https://www.raycast.com/](https://www.raycast.com/).

## Basic settings

### Directory

To use script commands, you need to add a Script Directory:

- If you don't have it yet, create your script directory:
    ```shell
    mkdir -p ~/.raycast/script-commands
    ```
- Go to Raycast Settings > Extensions > + > Add Script Directory (or Script Commands > Add Directories)
- Add the `script-commands` directory

### Calendar

- Got to Raycast Settings > Extensions > Calendar
- Select the calendars you want to see in Raycast
- For the Google services, select the default application (in my case, Choosy)

### Clipboard History

- Set alias: `cb`
- Record hotkey: `cmd+ctrl+V`

### Dictionary

- Set alias: `di`

## Extensions

To install a new extension, in Raycast, use the `store` command. Here are the extensions I find very useful:

### 1Password

Access your 1Password items from Raycast.

#### Command Configuration
- `My Passwords`:
  - alias: `op`

### Base64

Easily encode and decode text (from clipboard or from prompt) to and from base 64.

### Brew

Easily list, browse and manage your brew packages.

### One Time Password

Access your 2FA code right from Raycast. I set an alias to it for ease of access: `otp`.

### Color Casket

Quick colour picker

### Convert Date

Convert dates from Unix timestamps to and from human-readable formats.

### Dash

#### Command Configuration
- `Create Docset Quicklink`: disabled
- `Find in Dash`:
  - alias: `dd`

### Docker

Manage your Docker images, containers and more.

### Fantastical

Create Fantastical events from Raycast.

### GitHub

Access your GitHub notifications from Raycast.

#### Command Configuration
- `My Pull Requests`:
  - alias: `pr`
- `Notifications`:
  - alias: `gn`

### Google Workspace

Search and create Google Drive documents from Raycast.

#### Command Configuration
- `Search Google Drive Files`:
  - alias: `gd`
- `Starred Google Drive Files`:
  - alias: `gds`

### IP Geolocation

#### Command Configuration
- `My IP Geolocation`:
  - alias: `mi`

### Speedtest

Just a useful command to run internet speed tests from Raycast.

### Script commands

Once installed, before browsing and installing commands:

- Go to Raycast Settings > Extensions > Search Script Command (or if you're installing it from Raycast prompt, you should have a form after installation)
- Tick the checkbox "I will manually add the Folder Path to Raycast Preferences > Extensions > Scripts > Script
  commands > Add Directories."
- Just to be sure, paste the path to the directory: `~/.raycast/script-commands`.

You might have to restart Raycast for this to take effect.

Then you can start installing interesting script commands:

#### [Change Case](https://github.com/raycast/script-commands/tree/master/commands#change-case)

Handy util to change the case of text held in the clipboard. The result is pushed to the clipboard.

If you have installed Python via `pyenv`, you might to create a symbolic link to your current Python binary:
```shell
sudo ln -s "$HOME/.pyenv/shims/python" /usr/local/bin/python
```
