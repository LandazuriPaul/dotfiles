# Useful commands

Here is a collection of useful commands which are rarely run, but quite handy :)

## macOS

### Screenshot directory

Here is how you can change the default directory for your screenshots:

```sh
mkdir -p ~/Pictures/Screenshots/ # Create the screenshot directory
defaults write com.apple.screencapture location ~/Pictures/Screenshots # Define your new directory as the screenshot destination
```

### TouchID for `sudo` commands

To be able to use TouchID for `sudo` commands, add this line to the `/etc/pam.d/sudo` file: `auth sufficient pam_tid.so`

```sh
sudo vi /etc/pam.d/sudo

# paste this line
auth       sufficient     pam_tid.so
```

Then restart iTerm2.

### Microphone toggle

Service to toggle on/off the microphone: [https://medium.com/macoclock/how-in-the-bleep-do-i-mute-my-mic-anywhere-on-macos-d2fa1185b13](https://medium.com/macoclock/how-in-the-bleep-do-i-mute-my-mic-anywhere-on-macos-d2fa1185b13).

Then you can assign a shortcut to this service in the System Preferences > Keyboard > Shortcuts > Services
