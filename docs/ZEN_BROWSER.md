# Zen Browser

Everything I set up for my Zen browsing experience.

## Install

Download from the official website: [https://zen-browser.app/](https://zen-browser.app/).

## Profiles

The Zen Browser, like any Firefox-based browser, supports multiple profiles.
Unfortunately, tools like Velja and Choosy, don't support Firefox profiles though.

But there is an easy workaround to create "shadow apps" in macOS to launch the app with a specific profile.
You can even customise the "shadow app" icon and name.

Below I detail the process to get such a "shadow app" set up. In this instance, we create a new "Zen Work" app:

1. First, make sure you have set up your profile in Zen Browser, and name it `Work`.

2. In the `/Applications` directory, create a new directory called `Zen Work.app`.

3. Inside this directory (either using the terminal right-clicking on it and selecting "reveal package content"),
   create a new directory called `Contents`.

4. Create a new directory under `Contents` called `MacOS`.

5. Create a file under `Macos`: `zen-work` and paste the following in it (`Work` is the name of the target profile):
   ```shell
   #!/bin/sh
   exec /Applications/Zen\ Browser.app/Contents/MacOS/zen -P "Work" --no-remote "$@"
   ```

6. Make this file executable:
   ```shell
   chmod +x /Applications/Zen\ Work.app/Contents/MacOS/zen-work
   ```

7. Copy the original `Info.plist` from `/Applications/Zen Browser.app/Contents`

8. Edit it and change the following values:
   - `CFBundleExecutable` to `zen-work`
   - `CFBundleIdentifier` to `app.zen-work.zen`
   - `CFBundleName` to `Zen Work`

9. Finally, you can change the shadow app's icon by opening its info window (select it in the Finder and press `cmd+I`).
    You can find some good icons on [https://macosicons.com/](https://macosicons.com/).
    Once downloaded, you can drag the icon file to the icon shown on the top left of the get info window (not the larger bottom one).
