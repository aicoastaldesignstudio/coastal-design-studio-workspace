# Client Directory

This directory contains client-specific data, briefs, and project files.

## Structure

```
clients/
├── _template/              # Template for new clients
│   └── client-brief.md
├── [client-name]/          # One folder per client (kebab-case)
│   ├── client-brief.md     # Core client information
│   ├── brand-guidelines.md # Approved brand direction
│   ├── seo-keywords.csv    # Keyword tracking
│   └── [other files]
└── README.md               # This file
```

## Creating a New Client Folder

```bash
# From project root
cp -r clients/_template clients/new-client-name
```

Then edit `clients/new-client-name/client-brief.md` with client details.

## Naming Convention

Use kebab-case (lowercase with hyphens):
- `beachfront-properties-noosa`
- `seaside-wellness-spa`
- `coastal-cafe-mooloolaba`

## What to Store Here

**Do store:**
- Client briefs and project documentation
- Brand guidelines and voice documents
- Keyword research and SEO strategy
- Meeting notes and project history

**Don't store:**
- Credentials (use 1Password)
- Large media files (use Google Drive)
- Generated output (use `output/` directory)

## Referencing Client Data

When working with agents, reference client context:

```
"Load the client brief for beachfront-properties-noosa and create
a blog post targeting their primary keywords."
```

The memory MCP can also store frequently-accessed client context.
