# Output Directory

Generated content and reports are stored here, organised by type.

## Structure

```
output/
├── brands/                 # Brand concepts and guidelines
│   └── [client-name]/
│       └── [date]-brand-concepts.md
├── newsletters/            # Generated newsletters
│   └── [client-name]/
│       └── [yyyy-mm]-newsletter.md
├── seo-reports/            # SEO audits and keyword research
│   └── [client-name]/
│       └── [date]-seo-audit.md
├── maintenance/            # Weekly maintenance reports
│   └── [yyyy-mm-dd]-maintenance-report.md
├── competitive-analysis/   # Competitor research
│   └── [client-name]/
│       └── [date]-competitive-analysis.md
└── README.md
```

## Naming Convention

- **Dates:** Use ISO format `yyyy-mm-dd` (e.g., `2026-02-01`)
- **Client folders:** Match `clients/` naming (kebab-case)
- **Files:** `[date]-[type].md`

## Examples

```
output/brands/seaside-wellness-spa/2026-02-01-brand-concepts.md
output/newsletters/beachfront-properties/2026-02-newsletter.md
output/maintenance/2026-02-03-maintenance-report.md
```

## Git Behaviour

Generated output is tracked in git for:
- Version history
- Team collaboration
- Client delivery reference

Large files (images, videos) should go in Google Drive instead.

## Cleaning Up

Archive old reports periodically:
```bash
# Move reports older than 6 months to archive
mkdir -p output/_archive
mv output/maintenance/2025-*.md output/_archive/
```
