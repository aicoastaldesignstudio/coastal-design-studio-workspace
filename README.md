# Coastal Design Studio - Team Workspace

Premium WordPress + Elementor websites for coastal businesses on the Sunshine Coast.

## Quick Start

### New Team Member Setup
```bash
# 1. Clone this repo
git clone https://github.com/coastal-design-studio/team-workspace.git
cd team-workspace

# 2. Run setup script
./scripts/setup-claude.sh

# 3. Get credentials from team lead
# - WordPress database access
# - DataForSEO API key (1Password)
# - Google/Meta OAuth setup

# 4. Start Claude Code
claude

# 5. Test
# Type: @CLAUDE.md
# Type: /help
```

## What's Included

- **Custom Agents** - Coastal-focused brand, SEO, content agents
- **Workflow Commands** - /maintenance, /client-pipeline, /newsletter
- **Team Standards** - See CLAUDE.md for voice, workflows, code standards
- **MCP Integration** - WordPress, DataForSEO, Google Ads, GA4, Meta

## Directory Structure

```
COASTALDESIGNSTUDIO/
├── .claude/
│   ├── agents/           # Team-specific AI agents
│   │   ├── brand-refiner.md
│   │   ├── seo-optimizer.md
│   │   ├── newsletter-writer.md
│   │   ├── competitive-intel.md
│   │   └── design-inspiration.md
│   ├── commands/         # Workflow automation
│   │   ├── maintenance.sh
│   │   ├── client-pipeline.sh
│   │   └── newsletter.sh
│   └── templates/        # Configuration templates
│       └── mcp.template.json
├── scripts/
│   ├── setup-claude.sh   # New team member setup
│   └── verify-setup.sh   # Verify installation
├── CLAUDE.md             # Team context and standards
├── README.md             # This file
└── .gitignore            # Keeps credentials out of git
```

## Team Resources

- **Slack:** #coastal-design-studio
- **Credentials:** 1Password team vault
- **Design Assets:** Envato Elements (team account)
- **Hosting:** WP Engine (team login in 1Password)

## Custom Agents

| Agent | Purpose |
|-------|---------|
| @brand-refiner | Generate coastal-inspired brand concepts |
| @seo-optimizer | Local SEO for Sunshine Coast suburbs |
| @newsletter-writer | Coastal lifestyle newsletter content |
| @competitive-intel | Competitor analysis and positioning |
| @design-inspiration | Curate coastal design trends |

## Workflow Commands

| Command | Purpose |
|---------|---------|
| /maintenance | Weekly client maintenance |
| /client-pipeline | Full new client onboarding |
| /newsletter | Monthly newsletter generation |

## Documentation

- `CLAUDE.md` - Complete team context and standards
- `.claude/agents/*.md` - Individual agent instructions
- `.claude/templates/mcp.template.json` - MCP configuration template

---

**Coastal Design Studio** | Sunshine Coast, QLD
