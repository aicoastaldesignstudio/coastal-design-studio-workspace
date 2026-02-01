# Maintenance Automation - Brief

## Purpose
Automate the weekly client WordPress maintenance that currently takes 3-4 hours manually.

## Background
Currently, every Monday the team manually:
1. Logs into each client's WordPress admin
2. Checks for updates
3. Reviews site health
4. Checks recent activity
5. Creates maintenance notes
6. Sends reports to clients

This workflow automates steps 1-5 and generates reports automatically.

## Requirements

### Functional
- [ ] Check WordPress core version against latest
- [ ] List all plugins and their update status
- [ ] Check SSL certificate expiry
- [ ] Check last published content date
- [ ] Identify any critical site health issues
- [ ] Generate individual client reports
- [ ] Generate team summary report
- [ ] Store reports in Google Drive
- [ ] Send Slack notification with summary

### Non-Functional
- [ ] Must complete all clients within 60 minutes
- [ ] Must handle 20+ clients per run
- [ ] Must have error handling for offline sites
- [ ] Must not require client admin password (use app passwords)

## Scope

### In Scope
- WordPress core/plugin/theme update checking
- SSL certificate status
- Content freshness check
- Basic site health via WP REST API
- Report generation
- Slack notifications

### Out of Scope (v1)
- Automatic update application
- Deep SEO audits (separate workflow)
- Performance testing
- Broken link checking (separate workflow)
- Security scanning

## Success Criteria
- [ ] Replaces manual Monday maintenance routine
- [ ] Reduces maintenance time from 3+ hours to 15 minutes review
- [ ] Catches 100% of available WordPress updates
- [ ] Generates client-ready reports

## Dependencies
- WordPress REST API access for each client
- Google Sheets with client list
- Google Drive for report storage
- Slack for notifications
- n8n instance running

## Timeline
- **Planning:** February 2026
- **Development:** February 2026
- **Testing:** February 2026
- **Production:** March 2026
