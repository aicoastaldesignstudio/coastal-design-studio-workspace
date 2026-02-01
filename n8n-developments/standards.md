# Coastal Design Studio - n8n Workflow Standards

Mandatory requirements for all n8n workflow development.

---

## The Three Principles

### 1. Client Data Security
- Never hardcode client credentials in workflows
- Use n8n Credential store for all API keys
- Client WordPress passwords stored in n8n, referenced by name
- Log data summaries, not full payloads

### 2. Fail Gracefully
- Every external call has error handling
- Critical failures notify team via Slack
- Partial failures don't block entire workflow
- Always log what failed and why

### 3. Audit Everything
- All workflow executions logged
- Client-affecting actions timestamped
- Reports generated for client visibility
- Easy to trace what happened when

---

## Project Structure

Every n8n project must have:

```
n8n-developments/projects/[project-name]/
├── .claude/
│   └── CLAUDE.md        # Project context and requirements
├── workflows/
│   └── [workflow].json  # Exported workflow (optional backup)
├── docs/
│   ├── brief.md         # What we're building
│   └── runbook.md       # How to operate (required for production)
└── README.md            # Quick overview
```

---

## Naming Conventions

### Workflows
```
coastal-[category]-[function]-v[version]
```

**Categories:**
- `maintenance` - Client site maintenance
- `client` - Client onboarding/service
- `reporting` - Analytics and reports
- `monitoring` - Health checks and alerts
- `content` - Newsletter, blog automation

**Examples:**
```
coastal-maintenance-wp-updates-v1
coastal-client-seo-audit-v1
coastal-reporting-weekly-summary-v1
coastal-monitoring-uptime-v1
coastal-content-newsletter-v1
```

### Nodes
```
[Action]-[Target]
```

**Examples:**
```
Fetch-Client-Sites
Check-WordPress-Health
Generate-SEO-Report
Send-Slack-Alert
Update-Maintenance-Log
```

---

## Credential Naming

Use consistent credential names in n8n:

| Service | Credential Name |
|---------|-----------------|
| WordPress (per client) | `wp-[client-name]` |
| Slack Team | `slack-coastal-team` |
| Google Ads | `google-ads-coastal` |
| Google Analytics | `ga4-coastal` |
| SendGrid | `sendgrid-coastal` |
| Brave Search | `brave-search-coastal` |

---

## Error Handling Requirements

### Minimum Requirements
1. Every HTTP/API node has "Continue on Fail" or error branch
2. Errors logged with context (what failed, input data sample)
3. Critical failures trigger Slack notification

### Error Workflow Pattern
```
[Trigger] → [Main Logic] → [Success Path]
                ↓
          [Error Handler] → [Log Error] → [Notify Slack]
```

### Error Message Format
```json
{
  "workflow": "coastal-maintenance-wp-updates-v1",
  "node": "Check-WordPress-Health",
  "client": "beachfront-properties",
  "error": "Connection timeout",
  "timestamp": "2026-02-01T09:00:00Z",
  "context": "Checking plugin updates"
}
```

---

## Client Workflow Standards

### WordPress Health Check
Required checks:
- [ ] Core version current
- [ ] Plugin updates available
- [ ] Theme updates available
- [ ] SSL certificate valid
- [ ] Page speed acceptable
- [ ] No critical errors in logs

### SEO Audit
Required data:
- [ ] Homepage meta title/description
- [ ] Schema markup present
- [ ] Sitemap accessible
- [ ] Robots.txt valid
- [ ] Mobile-friendly

### Maintenance Report
Required sections:
- [ ] Updates applied
- [ ] Issues found
- [ ] Recommendations
- [ ] Next steps

---

## Scheduling Guidelines

### Weekly Maintenance
- **Trigger:** Monday 9:00 AM AEST
- **Duration:** Allow 2 hours for all clients
- **Notification:** Summary to #coastal-maintenance Slack

### Monthly Reports
- **Trigger:** 1st of month 8:00 AM AEST
- **Duration:** Allow 1 hour per client
- **Delivery:** Email to client, copy to team

### Real-time Monitoring
- **Frequency:** Every 15 minutes
- **Alert threshold:** 3 consecutive failures
- **Escalation:** Immediate Slack, email after 30 min

---

## Testing Checklist

Before marking workflow complete:

### Functional
- [ ] Happy path works end-to-end
- [ ] Empty/null input handled
- [ ] Invalid data handled gracefully
- [ ] Large data sets work (batching if needed)

### Error Handling
- [ ] API failures handled
- [ ] Timeout scenarios handled
- [ ] Rate limiting handled
- [ ] Auth failures handled

### Production Ready
- [ ] Credentials use n8n store (not hardcoded)
- [ ] Error workflow connected
- [ ] Logging at key points
- [ ] Retry logic on external calls
- [ ] Runbook created

---

## Documentation Requirements

### Brief (brief.md)
```markdown
# [Workflow Name]

## Purpose
[What this workflow does]

## Trigger
[How it starts - webhook, schedule, manual]

## Input
[What data it needs]

## Output
[What it produces]

## Dependencies
[Other workflows, APIs, credentials]
```

### Runbook (runbook.md)
```markdown
# [Workflow Name] - Runbook

## Overview
[One paragraph description]

## How to Trigger
[Manual steps if needed]

## Expected Behavior
[What should happen when it runs]

## Monitoring
[Where to check status]

## Troubleshooting
| Symptom | Possible Cause | Solution |
|---------|----------------|----------|
| [Issue] | [Cause] | [Fix] |

## Disable/Re-enable
[Steps to pause workflow]

## Contacts
[Who to escalate to]
```

---

## Integration Patterns

### WordPress REST API
```javascript
// Authentication
headers: {
  "Authorization": "Basic " + btoa(username + ":" + appPassword)
}

// Common endpoints
GET  /wp-json/wp/v2/posts      // List posts
GET  /wp-json/wp/v2/plugins    // List plugins
POST /wp-json/wp/v2/posts      // Create post
```

### Slack Notifications
```javascript
// Success notification
{
  "channel": "#coastal-maintenance",
  "text": "✅ Maintenance complete",
  "attachments": [{
    "color": "good",
    "fields": [
      {"title": "Clients Processed", "value": "10", "short": true},
      {"title": "Issues Found", "value": "2", "short": true}
    ]
  }]
}
```

### Google Sheets Logging
```javascript
// Append row to maintenance log
{
  "spreadsheetId": "xxx",
  "range": "Maintenance!A:F",
  "values": [
    [date, client, action, status, notes, operator]
  ]
}
```

---

## Version Control

### Workflow Backups
- Export workflow JSON after major changes
- Store in `projects/[name]/workflows/`
- Use n8n workflow versions feature

### Change Log
Track changes in project README:
```markdown
## Changelog

### v1.1 - 2026-02-15
- Added retry logic for WordPress API calls
- Fixed timezone issue in scheduling

### v1.0 - 2026-02-01
- Initial release
```

---

## Performance Guidelines

### Execution Limits
- Single workflow: < 5 minutes
- Batch processing: < 100 items per execution
- API calls: < 60 per minute (respect rate limits)

### Optimization
- Use batching for bulk operations
- Cache API responses where appropriate
- Split large workflows into sub-workflows

---

**Last Updated:** February 2026
**Maintained By:** Coastal Design Studio
