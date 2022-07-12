# osascript  check_if_iterm_is_running.scpt $TERM_PROGRAM
--osascript ThisScriptName.scpt $TERM_PROGRAM
on run {TermType}
    if (TermType = "iTerm.app") then
        -- iTerm.app :-P
        tell application "iTerm"
            tell current window
                tell current session
                    set newSession to (split horizontally with default profile)
                end tell
            end tell
        end tell
    else if (TermType = "Apple_Terminal") then
        -- Terminal.app
        tell application "Terminal"
            do script "open 'https://iterm2.com/downloads.html'" in window 1
        end tell
    else
        -- Unknown terminal application
        return "Really? Not using iTerm.app or Terminal.app"
    end if
end run
