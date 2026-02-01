# Weekly Maintenance Workflow

Run comprehensive maintenance for all active Coastal Design Studio clients.

---

## Workflow Overview

This skill orchestrates weekly maintenance across all client sites:

1. **Security Audit** - Check WordPress core, plugins, themes for updates
2. **SEO Health** - Verify meta tags, check for issues in Search Console
3. **Performance Check** - Test page speed, check Core Web Vitals
4. **Link Audit** - Find and report broken links
5. **Content Review** - Flag outdated content, check for opportunities
6. **Report Generation** - Create client-ready maintenance reports

---

## Execution Steps

### Phase 1: Gather Client List

```
Read all client briefs from clients/ directory.
For each client with WordPress access configured:
- Note site URL
- Note WordPress API credentials location
- Add to maintenance queue
```

### Phase 2: For Each Client Site

#### 2.1 Security Check
```
Using fetch MCP, check WordPress REST API:
- GET /wp-json/wp/v2/plugins (list plugins)
- Check for known vulnerable versions
- Note any plugins needing updates

Document findings in maintenance report.
```

#### 2.2 SEO Health Check
```
Using @seo-optimizer agent:
- Check homepage meta title/description
- Verify schema markup is present
- Check for any crawl errors (if Search Console access)
- Review recent organic traffic trends (if GA4 access)

Document findings and recommendations.
```

#### 2.3 Performance Check
```
Using fetch MCP or puppeteer:
- Load homepage and measure time
- Check mobile responsiveness
- Note any slow-loading resources

Compare against targets:
- Mobile page speed: <3 seconds
- Core Web Vitals: Green scores
```

#### 2.4 Link Audit
```
Using fetch MCP:
- Crawl main pages for links
- Check each link returns 200 status
- Flag 404s, redirects, external link issues

Categorise:
- Critical: Internal broken links
- Warning: External broken links
- Info: Redirects that could be updated
```

#### 2.5 Content Review
```
Check blog/news section:
- Last post date (flag if >30 days)
- Content freshness
- Seasonal relevance

Note opportunities:
- Outdated information
- Missing internal links
- SEO improvement opportunities
```

### Phase 3: Generate Reports

For each client, create report at:
`output/maintenance/[client-name]/[date]-maintenance.md`

```markdown
# Maintenance Report: [Client Name]
**Date:** [Today's Date]
**Site:** [URL]

## Summary
- Security: [Green/Yellow/Red]
- SEO: [Green/Yellow/Red]
- Performance: [Green/Yellow/Red]
- Links: [Green/Yellow/Red]

## Security Updates
[List any updates needed]

## SEO Findings
[List issues and recommendations]

## Performance
- Page Speed: [X] seconds
- Core Web Vitals: [Status]

## Broken Links
[List with fix recommendations]

## Content Recommendations
[List opportunities]

## Action Items
- [ ] [Urgent items]
- [ ] [This week items]
- [ ] [Nice to have]
```

### Phase 4: Create Summary Report

Create consolidated report at:
`output/maintenance/[date]-summary.md`

```markdown
# Weekly Maintenance Summary
**Week of:** [Date]

## Client Status
| Client | Security | SEO | Performance | Links | Action Needed |
|--------|----------|-----|-------------|-------|---------------|
| [Name] | [Status] | ... | ... | ... | [Yes/No] |

## Urgent Issues
[List any critical items]

## This Week's Updates Applied
[List completed updates]

## Recommendations for Review
[Items needing human decision]
```

---

## Usage

```
/maintenance
```

Or with options:
```
"Run /maintenance for beachfront-properties-noosa only"
"Run /maintenance focusing on SEO checks"
"Run /maintenance and flag anything needing immediate attention"
```

---

## Schedule

- **Trigger:** Every Monday 9:00 AM
- **Review:** Wednesday 10:00 AM (team sync)
- **Deploy:** Friday 5:00 PM (after approval)

---

## Output Location

```
output/maintenance/
├── 2026-02-03-summary.md           # Weekly summary
├── beachfront-properties/
│   └── 2026-02-03-maintenance.md   # Client report
├── seaside-wellness/
│   └── 2026-02-03-maintenance.md
└── ...
```
