# Coastal Design Studio - MCP Setup Guide

Complete guide for setting up MCP servers and external integrations.

---

## Prerequisites

Before setting up MCPs:

1. **Node.js 18+** installed
   ```bash
   node --version  # Should be 18.x or higher
   ```

2. **Claude Code** installed
   ```bash
   claude --version
   ```

3. **Team 1Password access** for API keys

---

## MCP Installation

### Step 1: Copy Template to Config

```bash
# Run from project root
cp .claude/templates/mcp.template.json ~/.claude/mcp.json
```

### Step 2: Install MCP Servers

The servers install automatically via npx on first use, but you can pre-install:

```bash
# Core servers (recommended)
npx -y @modelcontextprotocol/server-filesystem --help
npx -y @modelcontextprotocol/server-fetch --help
npx -y @modelcontextprotocol/server-brave-search --help
npx -y @modelcontextprotocol/server-memory --help

# Optional servers
npx -y @modelcontextprotocol/server-puppeteer --help
npx -y @modelcontextprotocol/server-slack --help
npx -y @modelcontextprotocol/server-google-drive --help
```

### Step 3: Configure API Keys

Edit `~/.claude/mcp.json` and replace PLACEHOLDER values:

| Placeholder | Where to Get | 1Password Entry |
|-------------|--------------|-----------------|
| `PLACEHOLDER_PROJECT_PATH` | Your local path | N/A - use `~/Projects/COASTALDESIGNSTUDIO` |
| `PLACEHOLDER_BRAVE_API_KEY` | https://brave.com/search/api/ | "Coastal Design - Brave Search" |
| `PLACEHOLDER_SLACK_BOT_TOKEN` | Slack App Dashboard | "Coastal Design - Slack Bot" |
| `PLACEHOLDER_SLACK_TEAM_ID` | Slack Workspace Settings | "Coastal Design - Slack Bot" |
| `PLACEHOLDER_GOOGLE_CLIENT_ID` | Google Cloud Console | "Coastal Design - Google OAuth" |
| `PLACEHOLDER_GOOGLE_CLIENT_SECRET` | Google Cloud Console | "Coastal Design - Google OAuth" |

---

## API Key Setup Guides

### Brave Search API

1. Go to https://brave.com/search/api/
2. Sign up for free tier (2,000 queries/month)
3. Create API key
4. Add to `BRAVE_API_KEY` in mcp.json

**Usage:** Market research, competitor discovery, local business search

### Slack Integration

1. Go to https://api.slack.com/apps
2. Create new app for workspace
3. Add Bot Token Scopes:
   - `chat:write`
   - `channels:read`
   - `files:write`
4. Install to workspace
5. Copy Bot Token and Team ID

**Usage:** Team notifications, client updates, maintenance alerts

### Google Drive (Optional)

1. Go to Google Cloud Console
2. Create OAuth 2.0 credentials
3. Enable Google Drive API
4. Download credentials JSON
5. Run OAuth flow on first use

**Usage:** Client document access, shared asset management

---

## WordPress Integration

WordPress sites are accessed via REST API using the fetch MCP.

### Setup for Each Client Site

1. **Install Application Passwords plugin** (or use WordPress 5.6+)

2. **Create application password:**
   - WordPress Admin > Users > Your Profile
   - Scroll to "Application Passwords"
   - Create new password for "Claude Code"

3. **Store in client brief:**
   ```markdown
   ## WordPress Access
   - **Site URL:** https://client-site.com
   - **API Base:** https://client-site.com/wp-json/wp/v2
   - **Username:** coastal-admin
   - **App Password:** (stored in 1Password: "Client Name - WP API")
   ```

4. **Test connection:**
   ```bash
   curl -u "username:app-password" https://site.com/wp-json/wp/v2/posts
   ```

### Common WordPress API Endpoints

| Endpoint | Purpose |
|----------|---------|
| `/wp-json/wp/v2/posts` | Blog posts |
| `/wp-json/wp/v2/pages` | Pages |
| `/wp-json/wp/v2/media` | Media library |
| `/wp-json/wp/v2/plugins` | Installed plugins |
| `/wp-json/wp-site-health/v1/tests/background-updates` | Update status |

---

## DataForSEO Integration

DataForSEO requires a paid account. Use via HTTP API with fetch MCP.

### Setup

1. Sign up at https://dataforseo.com/
2. Get API credentials from dashboard
3. Store in 1Password: "Coastal Design - DataForSEO"

### Usage Example

```javascript
// Base64 encode credentials
const auth = btoa('login:password');

// API call via fetch
fetch('https://api.dataforseo.com/v3/serp/google/organic/live/advanced', {
  method: 'POST',
  headers: {
    'Authorization': `Basic ${auth}`,
    'Content-Type': 'application/json'
  },
  body: JSON.stringify([{
    keyword: "day spa mooloolaba",
    location_name: "Queensland,Australia",
    language_name: "English"
  }])
});
```

---

## Google Ads & Analytics

Use official Google APIs with OAuth authentication.

### Google Ads API

1. Apply for Google Ads API access
2. Create OAuth credentials in Google Cloud Console
3. Use google-ads npm package or API directly

### Google Analytics 4

1. Enable GA4 API in Google Cloud Console
2. Create service account with Analytics read access
3. Add service account email to GA4 property

---

## Meta (Facebook/Instagram) Ads

### Setup

1. Create Meta Business account
2. Create app in Meta for Developers
3. Get Marketing API access
4. Generate access tokens

### Permissions Required

- `ads_management`
- `ads_read`
- `business_management`

---

## Verification

After setup, verify MCPs are working:

```bash
# Start Claude Code
claude

# Test filesystem
"List files in clients/ directory"

# Test fetch
"Fetch the homepage of example.com and summarise it"

# Test brave search
"Search for day spas in Mooloolaba"

# Test memory
"Remember that Client X prefers blue colour palettes"
```

---

## Troubleshooting

### MCP Not Connecting

1. Check Node.js version: `node --version` (needs 18+)
2. Verify mcp.json syntax: `cat ~/.claude/mcp.json | jq .`
3. Check for PLACEHOLDER values: `grep PLACEHOLDER ~/.claude/mcp.json`
4. Restart Claude Code: `exit` then `claude`

### API Rate Limits

| Service | Free Tier | Notes |
|---------|-----------|-------|
| Brave Search | 2,000/month | Upgrade for more |
| DataForSEO | Pay per use | ~$0.01/query |
| Google APIs | Varies | Check quotas |
| Meta API | Varies | Business verification required |

### Permission Errors

- **Filesystem:** Check path exists and is readable
- **Slack:** Verify bot is in the channel
- **Google Drive:** Re-run OAuth flow

---

## Security Notes

1. **Never commit credentials** - .gitignore protects mcp.json
2. **Use 1Password** for all team credentials
3. **Rotate keys** if compromised
4. **Limit scopes** - only request permissions needed
5. **Client credentials** - store in client briefs, not mcp.json

---

## Getting Help

- **MCP Documentation:** https://modelcontextprotocol.io/
- **Team Slack:** #coastal-design-studio
- **Credentials:** Contact team lead

---

**Last Updated:** February 2026
