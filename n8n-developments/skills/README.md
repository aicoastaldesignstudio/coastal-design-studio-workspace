# n8n Skills Reference

This directory contains references and guides for using n8n-skills with Coastal Design Studio workflows.

## Official n8n-skills

The n8n-skills repository provides expert guidance for building n8n workflows:

**Repository:** https://github.com/czlonkowski/n8n-skills

### Installation

```bash
# Claude Code plugin installation
/plugin install czlonkowski/n8n-skills

# Or manual installation
git clone https://github.com/czlonkowski/n8n-skills.git
cp -r n8n-skills/skills/* ~/.claude/skills/
```

### The 7 Skills

| Skill | Purpose | When to Use |
|-------|---------|-------------|
| **n8n-expression-syntax** | Correct {{}} expression syntax | Writing expressions, accessing $json |
| **n8n-mcp-tools-expert** | MCP tool usage (PRIORITY) | Any MCP operation |
| **n8n-workflow-patterns** | Proven architectural patterns | Designing new workflows |
| **n8n-validation-expert** | Validation error interpretation | Debugging validation issues |
| **n8n-node-configuration** | Node configuration guidance | Setting up specific nodes |
| **n8n-code-javascript** | JavaScript in Code nodes | Custom logic in JS |
| **n8n-code-python** | Python in Code nodes | Custom logic in Python |

---

## Coastal-Specific Patterns

### WordPress Health Check Pattern
```
[Schedule Trigger]
  → [Get Client List from Sheet]
  → [Loop: For Each Client]
    → [HTTP: Check WP REST API]
    → [IF: Issues Found?]
      → [Yes: Log Issue, Add to Report]
      → [No: Mark Healthy]
  → [Generate Summary Report]
  → [Send Slack Notification]
```

### Client Onboarding Pattern
```
[Manual Trigger with Client Data]
  → [Create Client Record]
  → [Run Brand Analysis (Sub-workflow)]
  → [Run SEO Audit (Sub-workflow)]
  → [Run Competitor Analysis (Sub-workflow)]
  → [Compile Results]
  → [Generate Client Package]
  → [Notify Team]
```

### Newsletter Generation Pattern
```
[Schedule: 1st of Month]
  → [Get Newsletter Topics]
  → [Generate Content (AI)]
  → [Format for Email]
  → [Create Draft in Mailchimp]
  → [Notify for Review]
```

---

## Quick Reference

### Expression Gotchas

**Webhook data is under $json.body:**
```javascript
// WRONG
{{ $json.name }}

// CORRECT (for webhook input)
{{ $json.body.name }}
```

**Use $input in Code nodes:**
```javascript
// Get all items
const items = $input.all();

// Get first item
const item = $input.first();
```

### Common Node Configurations

**HTTP Request to WordPress:**
```json
{
  "method": "GET",
  "url": "https://site.com/wp-json/wp/v2/posts",
  "authentication": "genericCredentialType",
  "genericAuthType": "httpBasicAuth"
}
```

**Slack Message:**
```json
{
  "channel": "#coastal-maintenance",
  "text": "Maintenance complete",
  "attachments": []
}
```

---

## Learning Resources

1. **n8n Documentation:** https://docs.n8n.io/
2. **n8n-skills GitHub:** https://github.com/czlonkowski/n8n-skills
3. **n8n-mcp GitHub:** https://github.com/czlonkowski/n8n-mcp
4. **n8n Community:** https://community.n8n.io/

---

## Credits

n8n-skills conceived by Romuald Członkowski - [www.aiadvisors.pl/en](https://www.aiadvisors.pl/en)
