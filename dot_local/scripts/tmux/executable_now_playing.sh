#!/bin/bash

# Returns the current playing song in Spotify or Apple Music on macOS

# To get an application identifier, use:
#   /usr/libexec/PlistBuddy -c 'Print CFBundleIdentifier' /Applications/Safari.app/Contents/Info.plist
# TODO: check if Spotify is installed

NOW_PLAYING=$(osascript <<EOF
# set is_spotify_playing to false
set is_music_playing to false
set should_display_info to false

# if application "Spotify" is running then
# 	tell application "Spotify"
# 		if player state is playing then
# 			set is_spotify_playing to true
# 		end if
# 	end tell
# end if

if application "Music" is running then
	tell application "Music"
		if player state is playing then
			set is_music_playing to true
		end if
	end tell
end if

# if is_spotify_playing then
# 	tell application "Spotify"
# 		# we don't want advert info
# 		if artist of current track > 0 then
# 			set should_display_info to true
# 			set track_name to name of current track
# 			set track_artist to artist of current track
# 		end if
# 	end tell

# else if is_music_playing then

if is_music_playing then
	tell application "Music"
		set should_display_info to true
		set track_name to name of current track
		set track_artist to artist of current track
	end tell
end if


if should_display_info then
	return "♫ " & track_name & " - " & track_artist
end if
EOF)

echo $NOW_PLAYING
