# Maintenance Automation

> Automated weekly WordPress maintenance for all Coastal Design Studio clients

## Status: Planning

## Quick Links
- [Project Details](.claude/CLAUDE.md)
- [Brief](docs/brief.md)

## What It Does
Runs every Monday at 9 AM to check all client WordPress sites for:
- Core/plugin/theme updates needed
- SSL certificate status
- Content freshness
- Basic performance metrics

Generates individual client reports and a team summary.

## Schedule
- **Trigger:** Monday 9:00 AM AEST
- **Duration:** ~30 minutes for 10 clients
- **Output:** Reports in Google Drive, summary in Slack

## How to Use

### Automatic
Runs automatically every Monday. No action needed.

### Manual Trigger
1. Open workflow in n8n
2. Click "Execute Workflow"
3. Or trigger specific client: POST to webhook with client name

## Changelog

### v0.1 - February 2026
- Initial planning
