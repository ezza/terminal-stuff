property ChromePosition : 0
property ChromeSize : 0
property iTermPosition : 0
property iTermSize : 0
--property newPosition : 0
--property newSize : 0
property SlackPosition : 0
property SlackSize : 0
property SublimePosition : 0
property SublimeSize : 0

display dialog "Set Window Position or Save Window Position?" buttons {"Restore", "Save"} default button "Restore"
set theResult to result

tell application "System Events"
  if (button returned of theResult is "Restore") then
    -- Restore Settings
    if (ChromePosition is not {0, 0}) then
      tell process "Google Chrome"
        set position of window 1 to ChromePosition
        set size of window 1 to ChromeSize
      end tell
    end if
    if (iTermPosition is not {0, 0}) then
      tell process "iTerm"
        set position of window 1 to iTermPosition
        set size of window 1 to iTermSize
      end tell
    end if
--    if (newPosition is not {0, 0}) then
--      tell process "new"
--        set position of window 1 to newPosition
--        set size of window 1 to newSize
--      end tell
--    end if
    if (SlackPosition is not {0, 0}) then
      tell process "Slack"
        set position of window 1 to SlackPosition
        set size of window 1 to SlackSize
      end tell
    end if
    if (SublimePosition is not {0, 0}) then
      tell process "Sublime Text 3"
        set position of window 1 to SublimePosition
        set size of window 1 to SublimeSize
      end tell
    end if
  else
    -- Save Settings
    tell process "Google Chrome"
      set ChromePosition to position of window 1
      set ChromeSize to size of window 1
    end tell
    tell process "iTerm"
      set iTermPosition to position of window 1
      set iTermSize to size of window 1
    end tell
    tell process "Slack"
      set SlackPosition to position of window 1
      set SlackSize to size of window 1
    end tell
--    tell process "new"
--      set newPosition to position of window 1
--      set newSize to size of window 1
--    end tell
    tell process "Sublime Text 3"
      set SublimePosition to position of window 1
      set SublimeSize to size of window 1
    end tell
  end if
end tell