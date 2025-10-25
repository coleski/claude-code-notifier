#!/bin/bash

# Claude Code Stop Hook - Notify when Claude finishes

# Only notify if we're in VS Code terminal
if [ "$TERM_PROGRAM" = "vscode" ]; then
  # Check if VS Code is the frontmost (active) application
  frontmost=$(osascript -e 'tell application "System Events" to get name of first application process whose frontmost is true' 2>/dev/null)

  # Only play sound if you've switched to a different app entirely
  if [ "$frontmost" != "Code" ] && [ "$frontmost" != "Visual Studio Code" ] && [ "$frontmost" != "Electron" ]; then
    afplay /System/Library/Sounds/Glass.aiff 2>/dev/null &
  fi
fi

# Exit successfully (don't block Claude)
exit 0
