# Shared Error Handler Pattern

Standard error handling pattern for all Coastal Design Studio n8n workflows.

## Error Handler Workflow

This is a reusable error workflow that can be connected to any main workflow.

### Trigger
Set as Error Workflow in main workflow settings.

### Nodes

```
[Error Trigger]
  → [Format Error Message]
  → [Log to Google Sheets]
  → [IF: Critical?]
    → [Yes: Send Slack Alert]
    → [Yes: Send Email]
  → [End]
```

### Error Message Format

```json
{
  "workflow": {
    "id": "{{ $json.execution.workflowId }}",
    "name": "{{ $json.workflow.name }}"
  },
  "execution": {
    "id": "{{ $json.execution.id }}",
    "mode": "{{ $json.execution.mode }}"
  },
  "error": {
    "message": "{{ $json.execution.error.message }}",
    "node": "{{ $json.execution.error.node.name }}",
    "timestamp": "{{ $now.toISO() }}"
  },
  "context": {
    "lastNodeExecuted": "{{ $json.execution.lastNodeExecuted }}",
    "data": "{{ JSON.stringify($json.execution.data).slice(0, 500) }}"
  }
}
```

### Slack Alert Template

```json
{
  "channel": "#coastal-alerts",
  "attachments": [
    {
      "color": "danger",
      "title": "🚨 Workflow Error",
      "fields": [
        {
          "title": "Workflow",
          "value": "{{ $json.workflow.name }}",
          "short": true
        },
        {
          "title": "Node",
          "value": "{{ $json.error.node }}",
          "short": true
        },
        {
          "title": "Error",
          "value": "{{ $json.error.message }}"
        },
        {
          "title": "Time",
          "value": "{{ $json.error.timestamp }}",
          "short": true
        }
      ],
      "footer": "n8n Error Handler",
      "ts": "{{ Math.floor(Date.now() / 1000) }}"
    }
  ]
}
```

### Critical Error Conditions

Consider an error critical if:
- Affects client data
- Causes data loss
- Blocks scheduled operations
- Fails 3+ times consecutively

### Google Sheets Log Format

| Column | Content |
|--------|---------|
| A | Timestamp |
| B | Workflow Name |
| C | Workflow ID |
| D | Node Name |
| E | Error Message |
| F | Execution ID |
| G | Severity (Critical/Warning/Info) |
| H | Resolved (Yes/No) |

---

## Implementation

### Step 1: Create Error Workflow
1. Create new workflow named `coastal-shared-error-handler`
2. Add Error Trigger node
3. Add nodes from pattern above
4. Save and activate

### Step 2: Connect to Main Workflows
1. Open main workflow settings
2. Set "Error Workflow" to `coastal-shared-error-handler`
3. Save

### Step 3: Test
1. Create intentional error in test workflow
2. Verify error handler executes
3. Check Slack notification received
4. Verify Google Sheets logging

---

## Maintenance

- Review error logs weekly
- Clear resolved errors monthly
- Update Slack channel if team changes
- Rotate credentials quarterly
