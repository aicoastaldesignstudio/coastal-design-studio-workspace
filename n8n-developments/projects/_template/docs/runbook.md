# [Project Name] - Runbook

> Operational guide for running this workflow in production

## Overview
[One paragraph description]

---

## Quick Reference

| Item | Value |
|------|-------|
| **Workflow ID** | [n8n workflow ID] |
| **Schedule** | [Cron or trigger type] |
| **Owner** | [Team/Person] |
| **Last Updated** | [Date] |

---

## How to Trigger

### Automatic
[Describe automatic trigger]

### Manual
1. [Step 1]
2. [Step 2]
3. [Step 3]

---

## Expected Behavior

### Normal Operation
[What happens when it runs successfully]

### Output
[What it produces]

### Duration
- **Typical:** [X] minutes
- **Maximum:** [X] minutes

---

## Monitoring

### Where to Check Status
- n8n Executions: [Link]
- Slack Channel: #[channel]
- Logs: [Location]

### Success Indicators
- [Indicator 1]
- [Indicator 2]

### Failure Indicators
- [Indicator 1]
- [Indicator 2]

---

## Troubleshooting

| Symptom | Possible Cause | Solution |
|---------|----------------|----------|
| Workflow doesn't start | Trigger misconfigured | Check cron/webhook settings |
| API errors | Credentials expired | Rotate credentials in n8n |
| Timeout | Data volume too high | Reduce batch size |
| [Other] | [Cause] | [Solution] |

---

## Emergency Procedures

### Disable Workflow
1. Go to n8n → Workflows
2. Find [Workflow Name]
3. Toggle "Active" to OFF

### Re-enable Workflow
1. Verify issue is resolved
2. Toggle "Active" to ON
3. Monitor first execution

### Rollback
[Steps to rollback if needed]

---

## Maintenance

### Regular Tasks
- [ ] Weekly: Check execution logs
- [ ] Monthly: Review error rates
- [ ] Quarterly: Update credentials

### Credential Rotation
[Steps for rotating credentials]

---

## Escalation

| Level | Contact | When |
|-------|---------|------|
| L1 | [Person/Channel] | First response |
| L2 | [Person/Channel] | > 30 min unresolved |
| L3 | [Person/Channel] | Critical failure |

---

## History

| Date | Event | Notes |
|------|-------|-------|
| [Date] | Deployed to production | Initial release |
