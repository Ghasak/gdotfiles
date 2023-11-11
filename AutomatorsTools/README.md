# Apple Script
## ChangingLog

- Sat Nov 11 21:17:18 JST 2023: prompt -1: Adding faster apple script to activate and run emacs on fly.

## Location of our Custome Automator
The following automator macros are located at: "/Users/<user_name>/Library/Services/"

## 1. Starting Emacs Very fast
- Now, I am using the following configurations, `LaunchEmacsDelux` which will
  launch the emacs and it will be stay as a server, then we mapped the
  `command + e` to launch the emacs but first it will check if the app is
  already existed if not then it will open a new one, then forward the
  `command + e` to the `emacs`.

## Previous Configurations
The following `quick-action` applications are written in `AppleScript` which are used to do specific task:
1. Launch `safari` using `command + b` or `alt + b`
2. Lanuch `iTerm` once you click `command + return` keystrokes.
3. Lanuch `Emacs` once you click `command + e` keystrokes.


## How it works
- All `AppleScript` are stored as `quick-action`.
- go to `automator` then create a new `work-flow` select no `input` script in the top banner.
- You will need to write the scripts first or use the `stow` command to restor them.
    - The location of the `applescript` is under the `~/Library/Services/`
- Setting the shortcuts with the quick-action is done using `setting->keyboard->keyboard_shortcuts` then `App Shortcuts`.
- You have to provide the exact name for the shortcut, the names can be found at `Finder-> Services`.
