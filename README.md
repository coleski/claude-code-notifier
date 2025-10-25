# Claude Code Notifier

Get notified when Claude Code finishes responding - but only when you're not watching!

## Features

- 🔔 **Sound notification** when Claude finishes (only if VS Code is not active)
- 🎯 **Smart detection** - silent when you're actively viewing VS Code
- 🪝 **Claude Code hooks** integration

## Setup

### 1. Install the Claude Code Hook

```bash
# Copy the hook script
cp hook-stop.sh ~/.claude/hooks/stop
chmod +x ~/.claude/hooks/stop
```

### 2. Configure Claude Code Settings

Add this to `~/.claude/settings.json`:

```json
{
  "hooks": {
    "Stop": [
      {
        "matcher": "*",
        "hooks": [
          {
            "type": "command",
            "command": "/Users/YOUR_USERNAME/.claude/hooks/stop"
          }
        ]
      }
    ]
  }
}
```

Replace `YOUR_USERNAME` with your actual username.

## How It Works

1. When Claude Code finishes responding, the `Stop` hook triggers
2. The hook checks if VS Code (Electron) is the frontmost application
3. If you've switched to another app, it plays a sound notification
4. If you're still in VS Code, it stays silent (no interruption!)

## Testing

1. Ask Claude a question in VS Code
2. **Stay in VS Code** - should be silent ✅
3. Ask another question
4. **Switch to browser/another app** - should hear "Glass" sound 🔔

## Requirements

- macOS (uses `afplay` and `osascript`)
- Claude Code with hooks enabled
- VS Code terminal

## License

MIT
