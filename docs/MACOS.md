# macOS

This document lists my macOS settings and useful commands to set up my environment.

## Settings

| Setting                                                                             | Description / Reasoning                             | Value                                    |
|-------------------------------------------------------------------------------------|-----------------------------------------------------|------------------------------------------|
| Network > Set Service Order...                                                      | Obviously cable beats Wi-Fi                         | `USB > Thunderbolt > Wi-Fi > iPhone USB` |
| Desktop & Dock > Automatically hide and show the Dock                               | Optimise window space.                              | `enabled`                                |
| Desktop & Dock > Stage Manager                                                      | Not useful in macOS                                 | `disabled`                               |
| Desktop & Dock > Group windows by application                                       | Very useful when a lot of applications are running  | `enabled`                                |
| Keyboard > Keyboard navigation                                                      | Navigate between native buttons using the `Tab` key | `enabled`                                |
| Keyboard > Keyboard Shortcuts... > Keyboard > Move focus to next window             | Very handy to switch between an app's windows       | `option+tab`                             |
| Keyboard > Keyboard Shortcuts... > Input Sources > Select the previous input source | Disable the next source, you can just loop over     | `control+space`                          |
| Trackpad > More Gestures > App Exposé                                               | Show windows for the current app                    | `Swipe Down with Three Fingers`          |

## Commands

### Screenshot directory

Here is how you can change the default directory for your screenshots:

```shell
mkdir -p ~/Pictures/Screenshots/ # Create the screenshot directory
defaults write com.apple.screencapture location ~/Pictures/Screenshots # Define your new directory as the screenshot destination
```

### Dock hiding delay

```shell
defaults write com.apple.dock autohide-delay -float 0; defaults write com.apple.dock autohide-time-modifier -int 0;killall Dock
```

### TouchID for `sudo` commands

To be able to use TouchID for `sudo` commands, add this line to the `/etc/pam.d/sudo` file: `auth sufficient pam_tid.so`

```shell
sudo vi /etc/pam.d/sudo

# paste this line
auth       sufficient     pam_tid.so
```

Then restart iTerm2.

### Check Secure Input

A handy command to check if a program is stuck using the Secure Input:

```shell
ioreg -l -d 1 -w 0 | grep SecureInput
```

### Microphone toggle

Service to toggle on/off the
microphone: [https://medium.com/macoclock/how-in-the-bleep-do-i-mute-my-mic-anywhere-on-macos-d2fa1185b13](https://medium.com/macoclock/how-in-the-bleep-do-i-mute-my-mic-anywhere-on-macos-d2fa1185b13).

Then you can assign a shortcut to this service in the System Preferences > Keyboard > Shortcuts > Services
