# n8n Developments - Coastal Design Studio

This directory contains n8n workflow automation projects for Coastal Design Studio operations.

## Overview

**Purpose:** Automate agency and client workflows using n8n
**MCP Server:** n8n-mcp (connected)
**Skills Reference:** n8n-skills (czlonkowski/n8n-skills)

---

## The Two Rules

### Rule 1: Always Use n8n-skills
Before building any workflow, load the relevant skill:

| When doing... | Load this skill |
|---------------|-----------------|
| Writing expressions | `n8n-expression-syntax` |
| Code nodes (JS) | `n8n-code-javascript` |
| Code nodes (Python) | `n8n-code-python` |
| Configuring nodes | `n8n-node-configuration` |
| Designing workflows | `n8n-workflow-patterns` |
| Validating configs | `n8n-validation-expert` |
| Using MCP tools | `n8n-mcp-tools-expert` |

### Rule 2: Always Use n8n-mcp
All workflow operations go through the MCP server:

```
mcp__n8n-mcp__[operation]
```

**Key operations:**
- `search_nodes` — Find the right node for the job
- `get_node` — Get node configuration details
- `validate_node` — Check config before building
- `n8n_create_workflow` — Create new workflow
- `n8n_get_workflow` — Retrieve existing workflow
- `n8n_update_partial_workflow` — Modify workflow
- `n8n_test_workflow` — Execute/test workflow
- `validate_workflow` — Validate entire workflow

---

## Directory Structure

```
n8n-developments/
├── CLAUDE.md              # This file - n8n context
├── standards.md           # Coastal-specific workflow standards
├── projects/              # Individual workflow projects
│   ├── _template/         # Template for new projects
│   ├── maintenance-automation/
│   ├── client-onboarding/
│   └── newsletter-automation/
├── skills/                # Skill references and guides
│   └── README.md
└── shared/                # Shared components
    └── error-handler.json
```

---

## Coastal Design Studio Workflows

### Agency Operations
| Workflow | Status | Purpose |
|----------|--------|---------|
| maintenance-automation | Planned | Weekly client site maintenance |
| newsletter-automation | Planned | Monthly newsletter generation |
| competitive-monitoring | Planned | Track competitor changes |

### Client Onboarding
| Workflow | Status | Purpose |
|----------|--------|---------|
| client-onboarding | Planned | 10-phase onboarding pipeline |
| brand-concepts | Planned | Generate brand concepts |
| seo-audit | Planned | Initial SEO analysis |

### Client Services
| Workflow | Status | Purpose |
|----------|--------|---------|
| wordpress-health-check | Planned | Site health monitoring |
| broken-link-checker | Planned | Find and report broken links |
| google-ads-reporting | Planned | Automated ad performance reports |

---

## MCP Tool Quick Reference

### Node Discovery
```javascript
// Search for nodes
mcp__n8n-mcp__search_nodes({query: "wordpress"})

// Get node details
mcp__n8n-mcp__get_node({nodeType: "nodes-base.httpRequest"})
```

### Workflow Management
```javascript
// Create workflow
mcp__n8n-mcp__n8n_create_workflow({name, nodes, connections})

// Update workflow
mcp__n8n-mcp__n8n_update_partial_workflow({id, operations})

// Validate workflow
mcp__n8n-mcp__n8n_validate_workflow({id})

// Test workflow
mcp__n8n-mcp__n8n_test_workflow({workflowId})
```

### Templates
```javascript
// Search templates
mcp__n8n-mcp__search_templates({query: "webhook slack"})

// Deploy template
mcp__n8n-mcp__n8n_deploy_template({templateId})
```

---

## Workflow Naming Convention

```
coastal-[category]-[function]-v[version]
```

**Examples:**
- `coastal-maintenance-wp-health-v1`
- `coastal-client-brand-generator-v1`
- `coastal-reporting-google-ads-v1`

---

## Integration Points

### WordPress Sites (via REST API)
- Use HTTP Request node with Basic Auth
- Endpoint: `https://[site]/wp-json/wp/v2/`
- Credentials: Application Passwords

### Google Services
- Google Ads: OAuth credentials
- Analytics: Service account
- Search Console: Service account

### Communication
- Slack: Webhook or Bot Token
- Email: SMTP or SendGrid

---

## Error Handling Standard

All workflows must include:
1. **Error Workflow** - Catch and log errors
2. **Retry Logic** - 3 attempts with exponential backoff
3. **Notifications** - Slack alert on critical failures
4. **Logging** - Key decision points logged

---

## Getting Started

1. **Create new project:**
   ```bash
   cp -r projects/_template projects/my-new-workflow
   ```

2. **Edit project CLAUDE.md** with workflow details

3. **Build workflow using n8n-mcp tools**

4. **Validate before deployment**

5. **Create runbook for production workflows**

---

## Related Resources

- **n8n-skills:** https://github.com/czlonkowski/n8n-skills
- **n8n-mcp:** https://github.com/czlonkowski/n8n-mcp
- **n8n Documentation:** https://docs.n8n.io/
- **Coastal Standards:** See `standards.md`
