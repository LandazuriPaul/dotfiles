# Accounts settings

On my personal computer, I usually prefer to use a non-admin (here `paul`) account on a daily basis and have an admin (`admin`) one for installations, updates and OS settings.

## Admin account

I start by creating an admin account on my laptop, usually simply called `admin`. To have it a bit hidden, I also like to remove it from the login screen.

The following command will hide the `admin` account from the login screen and offer a new "Other..." item which requires entering the account username as well:

```sh
sudo defaults write /Library/Preferences/com.apple.loginwindow HiddenUsersList -array-add admin
```

For me, this is enough. If you want to have the account completely hidden along with its home folder, you are probably looking for some more advanced administration settings usually destined at companies. You can find some information on the topic at [this Apple's documentation page](https://support.apple.com/en-us/HT203998).

## Non-admin account

Once you have defined your admin account and created a non-admin one (which will be the predominantly used one), you usually also want to be able to run `sudo` commands from the non-admin session. To do so, we need to add it to the `sudoers`. Also, to increase the security, I force this account to use the `root` password.

### Root password

To enable the `root` user and define its password, follow [Apple's instructions](https://support.apple.com/en-us/HT204012#enable).

The enabled `root` user is different from the `admin` account and it shouldn't be used for daily actions or even to install new softwares. It should be kept for CLI usage only.

### Non-admin account integration to `sudoers`

Once you have created your non-admin account (here `paul`), you can add it to the `sudoers`. Run the following command from an `admin`'s shell (otherwise the `sudo` will error as you're not allowed to call it yet):

```sh
sudo visudo -f /etc/sudoers.d/paul
```

And paste this in it:

```sh
Defaults:paul	rootpw
paul		ALL = (ALL) ALL
```

The first line forces this account to use the `root` password to run `sudo` commands. The second one simply allows the account to call the `sudo` for any command.

Having this defined in the `/etc/sudoers.d/paul` file instead of the default `/etc/sudoers` will prevent from losing the changes on subsequent macOS updates (which can override the `/etc/` files ). It will be read by macOS though, thanks to the last line of the `/etc/sudoers` file which includes any file in the `/etc/sudoers.d/` folder:

```sh
## Read drop-in files from /private/etc/sudoers.d
## (the '#' here does not indicate a comment)
#includedir /private/etc/sudoers.d
```
