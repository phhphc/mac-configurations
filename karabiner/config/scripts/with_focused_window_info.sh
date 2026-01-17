#!/bin/sh

DATA=$(osascript -e '
  tell application "System Events"
      set frontApp to first application process whose frontmost is true
      set appName to name of frontApp
      set windowTitle to ""
      try
          set windowTitle to name of window 1 of frontApp
      on error
          set windowTitle to ""
      end try
      return appName & ":::" & windowTitle
  end tell'
)

export APP_NAME="${DATA%%:::*}"
export WINDOW_TITLE="${DATA##*:::}"

exec $@