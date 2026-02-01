# Coastal Design Studio - Claude Code Team Workspace

## Agency Overview
**Name:** Coastal Design Studio
**Focus:** WordPress + Elementor websites for coastal/beachside businesses
**Location:** Sunshine Coast, Queensland, Australia
**Specialisation:** Premium coastal lifestyle brands (real estate, hospitality, professional services, lifestyle businesses)

---

## Team Voice & Brand

### Agency Voice
**Tone:** Sophisticated coastal lifestyle - premium but approachable, inspired but authentic, environmental consciousness

**Style Guidelines:**
- Natural, flowing language (like ocean rhythm)
- Benefit-focused, not feature-focused
- Coastal references when appropriate (but not clichéd)
- Environmental sensitivity
- Premium positioning (we serve established businesses, not startups)

**Avoid:**
- Tourist trap language
- Budget/discount messaging
- Corporate jargon
- Aggressive sales tactics

### Client Voice Examples

**Luxury Real Estate (Beachfront Properties):**
- Sophisticated, aspirational, exclusive
- Emphasise lifestyle, views, architecture
- Words: "curated", "bespoke", "coastal living", "architectural"

**Boutique Hotel/Resort:**
- Welcoming, serene, experiential
- Emphasise escape, renewal, coastal luxury
- Words: "retreat", "sanctuary", "oceanfront", "experience"

**Coastal Restaurant/Cafe:**
- Fresh, vibrant, local, seasonal
- Emphasise local ingredients, ocean views, community
- Words: "fresh catch", "local produce", "waterfront", "seasonal"

---

## Project Structure

### Client Data
All client information stored in `clients/[client-name]/`:
- `client-brief.md` - Core client information, brand voice, access credentials
- See `clients/example-coastal-cafe/` for reference

### Generated Output
All generated content stored in `output/`:
- `brands/` - Brand concepts, website copy, ad strategies
- `newsletters/` - Generated newsletters
- `seo-reports/` - SEO audits and keyword research
- `maintenance/` - Weekly maintenance reports
- `competitive-analysis/` - Competitor research

### n8n Automation
Workflow automation projects in `n8n-developments/`:
- `projects/` - Individual workflow projects
- `skills/` - n8n-skills reference
- `standards.md` - Workflow development standards
- See `n8n-developments/CLAUDE.md` for n8n context

---

## Technical Stack

### WordPress
- Theme: Custom or Genesis Framework (no page builders for theme)
- Page Builder: Elementor (visual design only)
- Hosting: WP Engine or Kinsta preferred
- Security: Wordfence, iThemes Security
- API: WordPress REST API for automation (see @wordpress-manager)

### MCP Servers
Configured in `~/.claude/mcp.json`. See `.claude/SETUP.md` for installation.
- **filesystem** - Read/write project files
- **fetch** - Web scraping, WordPress API calls
- **brave-search** - Market research, competitor discovery
- **memory** - Persistent client context
- **puppeteer** - Screenshots, testing

### Workflow Tools
- Version Control: Git/GitHub
- Project Management: ClickUp
- Design: Figma + Envato Elements
- Credentials: 1Password (team vault)

---

## Development Standards

### WordPress Best Practices
- Follow WP Coding Standards (WPCS)
- All inputs sanitised, outputs escaped
- Use child themes for customisations
- Optimise database queries
- Implement caching (WP Rocket or W3 Total Cache)

### SEO Standards
- Local SEO focus: Sunshine Coast suburbs
- Schema markup: LocalBusiness, Service, Article
- Image optimisation: WebP format, lazy loading
- Internal linking: Strategic, contextual
- Meta: Unique titles/descriptions, target keywords

### Performance Standards
- Core Web Vitals: Green scores required
- Page speed: <3 seconds mobile
- Image optimisation: All images <200KB
- Minimal plugins: <20 total

---

## Custom Agents

### @brand-refiner
Generates coastal-inspired premium brand concepts (3 directions).
```
"Using @brand-refiner, create brand concepts for [business type] in [suburb].
Target: [audience]. Differentiator: [unique selling point]."
```

### @seo-optimizer
Local SEO with Sunshine Coast focus + competitive analysis.
```
"Using @seo-optimizer, optimise [page/site] for [keyword] in [suburb].
Competitors: [URLs]."
```

### @newsletter-writer
Creates coastal lifestyle newsletters in appropriate brand voice.
```
"Using @newsletter-writer, create [month] newsletter for [client/agency].
Topics: [list]. Voice: [brand voice description]."
```

### @competitive-intel
Deep competitor analysis with actionable recommendations.
```
"Using @competitive-intel, analyse competitors for [client]:
[competitor URLs]. Focus: pricing, SEO, positioning."
```

### @design-inspiration
Curates coastal design trends and creates mood boards.
```
"Using @design-inspiration, create mood board for [client].
Style: [direction]. Include: colours, typography, photography."
```

### @wordpress-manager
WordPress site maintenance and content management via REST API.
```
"Using @wordpress-manager, check site health for [client]."
"Using @wordpress-manager, publish blog post to [client site]."
```

---

## Skills (Workflows)

### /maintenance
Weekly maintenance workflow for all clients.
```
/maintenance
"Run /maintenance for [specific client]"
```
**Output:** `output/maintenance/[date]-summary.md`

### /client-pipeline
Complete new client onboarding (10-phase pipeline).
```
"Run /client-pipeline for [client-name]"
```
**Prerequisite:** Client brief at `clients/[client-name]/client-brief.md`
**Output:** Complete package in `output/brands/[client-name]/`

### /newsletter
Monthly newsletter generation.
```
"/newsletter for [month]"
"/newsletter for [client] - [month]"
```
**Output:** `output/newsletters/[client]/[date]-newsletter.md`

---

## Local SEO Focus Areas

### Primary Service Area
**Sunshine Coast, Queensland**
- Caloundra
- Mooloolaba
- Maroochydore
- Alexandra Headland
- Coolum Beach
- Noosa Heads
- Peregian Beach

### Target Keywords Structure
`[service] + [location]` format:
- "beachfront real estate Noosa"
- "coastal restaurant Mooloolaba"
- "waterfront hotel Caloundra"

### Competitor Landscape
- Focus: Other Sunshine Coast design agencies
- Differentiation: Premium coastal aesthetic + AI automation
- Positioning: Sophisticated coastal luxury (not tourist-focused)

---

## Weekly Schedule

| Day | Task |
|-----|------|
| **Monday 9am** | Run `/maintenance` for all clients |
| **Wednesday 10am** | Team sync - review maintenance reports |
| **Friday 5pm** | Deploy approved updates to production |
| **First Monday** | Create agency newsletter |
| **Mid-month** | Client newsletters |

---

## Emergency Procedures

### If Client Site Goes Down
1. Check hosting status (WP Engine/Kinsta dashboard)
2. Review error logs in cPanel/hosting
3. Disable plugins one-by-one via database if needed
4. Contact hosting support if server issue
5. Notify client within 30 minutes

### If SEO Rankings Drop
1. Check Google Search Console for issues
2. Review recent website changes
3. Analyse competitor movements
4. Check for algorithm updates
5. Report findings to client

---

## Getting Help

**Documentation:**
- [Quick Start Guide](docs/QUICK-START.md)
- [Complete User Guide](docs/USER-GUIDE.md)
- [MCP Setup](.claude/SETUP.md)

**Team:**
- **Slack:** #coastal-design-studio
- **Team Lead:** [Your name] for MCP credentials, client questions
- **Weekly Sync:** Wednesday 10am AEST

---

## Standards

**Language:** Australian English (organisation, optimise, analyse)

**Naming:** kebab-case everywhere (lowercase, hyphens)

**File Dates:** ISO format (yyyy-mm-dd)

---

**Version:** 2.0 (February 2026)
**Team:** Coastal Design Studio
