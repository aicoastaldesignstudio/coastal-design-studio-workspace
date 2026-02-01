# Coastal Design Studio - Team Workspace

Premium WordPress + Elementor websites for coastal businesses on the Sunshine Coast.

## Quick Start

### New Team Member Setup
```bash
# 1. Clone this repo
git clone https://github.com/coastal-design-studio/team-workspace.git COASTALDESIGNSTUDIO
cd COASTALDESIGNSTUDIO

# 2. Run setup script
./scripts/setup-claude.sh

# 3. Configure MCP servers (see .claude/SETUP.md)
# Get API keys from team 1Password vault

# 4. Start Claude Code
claude

# 5. Test
# Type: @CLAUDE.md (loads team context)
```

## Documentation

| Document | Purpose |
|----------|---------|
| [Quick Start Guide](docs/QUICK-START.md) | Get productive in 10 minutes |
| [Complete User Guide](docs/USER-GUIDE.md) | Comprehensive documentation |
| [MCP Setup Guide](.claude/SETUP.md) | API keys and MCP configuration |
| [CLAUDE.md](CLAUDE.md) | Team context and standards |

## Directory Structure

```
COASTALDESIGNSTUDIO/
├── .claude/
│   ├── agents/              # Team-specific AI agents
│   │   ├── brand-refiner.md
│   │   ├── seo-optimizer.md
│   │   ├── newsletter-writer.md
│   │   ├── competitive-intel.md
│   │   ├── design-inspiration.md
│   │   └── wordpress-manager.md
│   ├── skills/              # Workflow automation
│   │   ├── maintenance.md
│   │   ├── client-pipeline.md
│   │   └── newsletter.md
│   ├── commands/            # Legacy shell commands
│   ├── templates/           # Configuration templates
│   │   └── mcp.template.json
│   └── SETUP.md             # MCP installation guide
├── clients/                 # Client data and briefs
│   ├── _template/
│   └── [client-name]/
├── output/                  # Generated content
│   ├── brands/
│   ├── newsletters/
│   ├── seo-reports/
│   ├── maintenance/
│   └── competitive-analysis/
├── docs/                    # Team documentation
│   ├── USER-GUIDE.md
│   └── QUICK-START.md
├── scripts/
│   ├── setup-claude.sh
│   └── verify-setup.sh
├── CLAUDE.md                # Team context (load with @CLAUDE.md)
├── README.md                # This file
└── .gitignore
```

## Custom Agents

| Agent | Purpose | Usage |
|-------|---------|-------|
| @brand-refiner | Generate coastal-inspired brand concepts | `"Using @brand-refiner, create concepts for..."` |
| @seo-optimizer | Local SEO for Sunshine Coast suburbs | `"Using @seo-optimizer, optimise..."` |
| @newsletter-writer | Coastal lifestyle newsletter content | `"Using @newsletter-writer, create..."` |
| @competitive-intel | Competitor analysis and positioning | `"Using @competitive-intel, analyse..."` |
| @design-inspiration | Curate coastal design trends | `"Using @design-inspiration, create mood board..."` |
| @wordpress-manager | WordPress site maintenance via API | `"Using @wordpress-manager, check..."` |

## Skills (Workflows)

| Skill | Purpose | Usage |
|-------|---------|-------|
| /maintenance | Weekly client maintenance | `"/maintenance"` or `"Run maintenance for [client]"` |
| /client-pipeline | Full new client onboarding | `"Run /client-pipeline for [client-name]"` |
| /newsletter | Monthly newsletter generation | `"/newsletter for [month]"` |

## MCP Servers

Configured via `~/.claude/mcp.json`. See [SETUP.md](.claude/SETUP.md) for details.

| MCP | Purpose |
|-----|---------|
| filesystem | Read/write project files |
| fetch | Web scraping and API calls |
| brave-search | Market research and discovery |
| memory | Persistent client context |
| puppeteer | Screenshots and testing |

## Team Resources

- **Slack:** #coastal-design-studio
- **Credentials:** 1Password team vault
- **Design Assets:** Envato Elements (team account)
- **Hosting:** WP Engine (login in 1Password)

## Client Workflow

1. **Create client folder:** `cp -r clients/_template clients/new-client-name`
2. **Complete client brief:** Edit `clients/new-client-name/client-brief.md`
3. **Run onboarding:** `"Run /client-pipeline for new-client-name"`
4. **Review outputs:** Check `output/brands/new-client-name/`
5. **Present to client:** Refine based on feedback

## Maintenance Workflow

- **Monday 9am:** Run `/maintenance`
- **Wednesday 10am:** Review reports (team sync)
- **Friday 5pm:** Deploy approved updates

---

**Coastal Design Studio** | Sunshine Coast, QLD | February 2026
