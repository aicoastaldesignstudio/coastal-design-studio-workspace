# Client Onboarding Pipeline

> Automated 10-phase new client onboarding workflow

## Status: Planning

## Quick Links
- [Project Details](.claude/CLAUDE.md)
- [Brief](docs/brief.md)

## What It Does
When a new client signs up, this workflow:
1. Receives client brief data
2. Researches competitors and market
3. Generates brand concepts (AI)
4. Creates SEO strategy
5. Generates website copy
6. Creates ad campaign structures
7. Compiles complete client package
8. Notifies team for review

Replaces 60+ hours of manual work with ~20 minutes of automated processing.

## Schedule
- **Trigger:** Webhook (on-demand)
- **Duration:** ~15-20 minutes per client
- **Output:** Complete package in Google Drive

## How to Use

### Trigger via Webhook
```bash
curl -X POST https://n8n.coastaldesign.studio/webhook/client-onboarding \
  -H "Content-Type: application/json" \
  -d '{
    "client_name": "Seaside Wellness Spa",
    "business_type": "Wellness",
    "location": "Mooloolaba",
    "services": ["massage", "facials"],
    "target_market": "Women 35-60",
    "competitors": ["competitor1.com"],
    "differentiator": "Ocean-view rooms",
    "brand_style": "Serene luxury"
  }'
```

### Trigger via n8n UI
1. Open workflow in n8n
2. Click "Execute Workflow"
3. Input client data in test panel

## Changelog

### v0.1 - February 2026
- Initial planning
