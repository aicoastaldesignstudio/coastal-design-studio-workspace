# Maintenance Automation - n8n Workflow

## Overview
Automated weekly maintenance workflow for all Coastal Design Studio client WordPress sites.

## Status
- [x] Planning
- [ ] Development
- [ ] Testing
- [ ] Production

---

## Workflow Details

### Purpose
Automate the Monday morning maintenance routine:
- Check WordPress core, plugin, and theme updates
- Run basic SEO health checks
- Detect broken links
- Generate client-ready maintenance reports
- Notify team of any issues requiring attention

### Trigger
- **Type:** Schedule
- **Details:** Every Monday at 9:00 AM AEST
- **Cron:** `0 9 * * 1`

### Input
- Client list from Google Sheets (or clients/ directory)
- WordPress API credentials for each client

### Output
- Individual client maintenance reports
- Summary report for team
- Slack notifications
- Updated maintenance log

---

## Workflow Architecture

```
[Schedule Trigger: Monday 9 AM]
  │
  ├→ [Get Client List from Sheet]
  │
  ├→ [Loop: For Each Client]
  │    │
  │    ├→ [HTTP: Check WP Core Version]
  │    ├→ [HTTP: List Plugins]
  │    ├→ [HTTP: Check Site Health]
  │    ├→ [HTTP: Get Recent Posts]
  │    │
  │    ├→ [Code: Analyze Results]
  │    │
  │    ├→ [IF: Issues Found?]
  │    │    ├→ [Yes: Add to Issues List]
  │    │    └→ [No: Mark Healthy]
  │    │
  │    └→ [Generate Client Report]
  │
  ├→ [Compile Summary Report]
  │
  ├→ [Save Reports to Google Drive]
  │
  └→ [Send Slack Summary]
```

---

## Nodes Required

| Node | Purpose | Status |
|------|---------|--------|
| Schedule Trigger | Monday 9 AM AEST | [ ] |
| Google Sheets | Get client list | [ ] |
| HTTP Request | WordPress API calls | [ ] |
| Code (JS) | Analyze results | [ ] |
| IF | Branch on issues | [ ] |
| Set | Format data | [ ] |
| Merge | Combine results | [ ] |
| Google Sheets | Log maintenance | [ ] |
| Google Drive | Save reports | [ ] |
| Slack | Send notifications | [ ] |

---

## Credentials Required

| Credential | Type | n8n Name |
|------------|------|----------|
| Google Sheets | OAuth | `google-sheets-coastal` |
| Google Drive | OAuth | `google-drive-coastal` |
| Slack | Bot Token | `slack-coastal-team` |
| WordPress (per client) | Basic Auth | `wp-[client-name]` |

---

## WordPress API Endpoints

```javascript
// Core version
GET /wp-json/

// Plugins list
GET /wp-json/wp/v2/plugins

// Site health
GET /wp-json/wp-site-health/v1/tests/background-updates

// Recent posts (for content freshness)
GET /wp-json/wp/v2/posts?per_page=5&orderby=date

// Pages (for broken link check)
GET /wp-json/wp/v2/pages
```

---

## Health Check Criteria

| Check | Green | Yellow | Red |
|-------|-------|--------|-----|
| WP Core | Current | 1 minor behind | Major behind |
| Plugins | All current | 1-3 updates | 4+ updates |
| SSL | Valid >30 days | Valid <30 days | Expired |
| Last Post | <30 days | 30-60 days | >60 days |
| Page Speed | <3s | 3-5s | >5s |

---

## Error Handling

### Expected Errors
| Error | Handling |
|-------|----------|
| API timeout | Retry 3x with backoff |
| Auth failure | Log, skip client, alert |
| Site down | Log as critical, immediate alert |

### Notifications
- **On Success:** Slack summary to #coastal-maintenance
- **On Failure:** Slack alert to #coastal-alerts

---

## Testing

### Test Cases
- [ ] Single client - all healthy
- [ ] Single client - updates needed
- [ ] Single client - critical issues
- [ ] Multiple clients - mixed status
- [ ] Client with invalid credentials
- [ ] Client site down

---

## Integration with Existing Skills

This workflow replaces the manual `/maintenance` skill execution with automated n8n execution.

After this workflow runs:
1. Team reviews summary on Wednesday
2. Approves/schedules updates
3. Updates deployed Friday

---

## Changelog
| Date | Change | Author |
|------|--------|--------|
| 2026-02 | Initial planning | Claude |
