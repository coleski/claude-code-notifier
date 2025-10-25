#!/bin/bash

# Claude Code Stop Hook - Play sound when Claude finishes (only if terminal NOT focused)

# Only notify if we're in VS Code terminal
if [ "$TERM_PROGRAM" = "vscode" ]; then
  # Check if VS Code is the frontmost (active) application
  frontmost=$(osascript -e 'tell application "System Events" to get name of first application process whose frontmost is true' 2>/dev/null)

  # Log for debugging
  echo "[$(date)] Frontmost app: '$frontmost'" >> /tmp/claude-hook.log

  # Only play sound if VS Code is NOT the active app (user switched away)
  if [ "$frontmost" != "Code" ] && [ "$frontmost" != "Visual Studio Code" ] && [ "$frontmost" != "Electron" ]; then
    echo "[$(date)] Playing sound - not in VS Code" >> /tmp/claude-hook.log
    afplay /System/Library/Sounds/Glass.aiff 2>/dev/null &
  else
    echo "[$(date)] Skipping sound - VS Code is active" >> /tmp/claude-hook.log
  fi
fi

# Exit successfully (don't block Claude)
exit 0
