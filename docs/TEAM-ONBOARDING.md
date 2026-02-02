# Team Onboarding: Claude Code via Cursor

Welcome to Coastal Design Studio. This guide will get you set up with Claude Code in Cursor.

---

## Prerequisites

- macOS, Windows, or Linux
- Node.js 18 or higher ([download](https://nodejs.org))
- Claude Pro or Max subscription ([claude.ai](https://claude.ai))
- Access to the team Git repository

---

## Setup Steps

### Step 1: Install Cursor

1. Download Cursor from [cursor.com](https://cursor.com)
2. Install and open the application
3. Complete the initial setup wizard

### Step 2: Install Claude Code CLI

1. Open Cursor's integrated terminal:
   - Mac: `Cmd + `` ` ``
   - Windows/Linux: `Ctrl + `` ` ``
2. Run the installation command:
   ```bash
   npm install -g @anthropic-ai/claude-code
   ```
3. Verify installation:
   ```bash
   claude --version
   ```

### Step 3: Clone the Workspace

1. In Cursor's terminal, clone the repository:
   ```bash
   git clone <repository-url>
   ```
2. Open the folder in Cursor:
   - File → Open Folder → select `coastaldesignstudio`

### Step 4: Authenticate Claude Code

1. In Cursor's terminal, start Claude Code:
   ```bash
   claude
   ```
2. Follow the prompts to sign in with your Claude Pro/Max account
3. Complete authentication in your browser

### Step 5: Verify Team Context

Run this command to confirm you have access to the shared workspace:
```bash
claude "What skills and agents are available?"
```

You should see our agency skills (`/maintenance`, `/newsletter`, `/client-pipeline`, etc.) and custom agents (`@brand-refiner`, `@seo-optimizer`, etc.).

---

## Daily Workflow

1. Open `coastaldesignstudio` folder in Cursor
2. Open the integrated terminal (`Cmd/Ctrl + `` ` ``)
3. Run `claude` to start your session
4. The team context from `CLAUDE.md` loads automatically

---

## Optional: MCP Servers

For enhanced features (persistent memory, web search, browser automation), set up MCP servers:

1. See `.claude/SETUP.md` for installation instructions
2. Configure your local `~/.claude/mcp.json`
3. Restart Claude Code to load the servers

---

## Quick Reference

| Command | Description |
|---------|-------------|
| `claude` | Start Claude Code session |
| `claude --help` | Show all CLI options |
| `/help` | Show available commands (inside session) |
| `/maintenance` | Run weekly maintenance workflow |
| `/newsletter` | Generate client newsletter |

---

## Troubleshooting

### "command not found: claude"
- Ensure Node.js 18+ is installed: `node --version`
- Reinstall: `npm install -g @anthropic-ai/claude-code`

### Authentication issues
- Run `claude logout` then `claude` to re-authenticate
- Ensure your Claude Pro/Max subscription is active

### Context not loading
- Confirm you're in the `coastaldesignstudio` directory
- Check that `CLAUDE.md` exists in the project root

---

## Getting Help

- **Slack:** #coastal-design-studio
- **Documentation:** See `docs/USER-GUIDE.md` for full reference
- **Claude Code issues:** [github.com/anthropics/claude-code/issues](https://github.com/anthropics/claude-code/issues)

---

*Last updated: February 2025*
