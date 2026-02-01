# n8n Developments - Coastal Design Studio

Workflow automation projects using n8n for Coastal Design Studio operations.

## Overview

This directory contains n8n workflow projects that automate agency and client operations:
- Weekly maintenance automation
- Client onboarding pipeline
- Newsletter generation
- Competitive monitoring
- And more...

## Quick Start

### Prerequisites
1. n8n instance running (cloud or self-hosted)
2. n8n-mcp MCP server configured
3. Required API credentials (Brave, OpenAI, Google, Slack)

### Create New Project
```bash
cp -r projects/_template projects/my-new-workflow
```

### Build Workflow
1. Read project CLAUDE.md for requirements
2. Use n8n-mcp tools to build workflow
3. Validate with `n8n_validate_workflow`
4. Test with `n8n_test_workflow`
5. Create runbook for production

## Directory Structure

```
n8n-developments/
├── CLAUDE.md              # n8n context and rules
├── README.md              # This file
├── standards.md           # Workflow standards
├── projects/              # Individual workflow projects
│   ├── _template/         # Template for new projects
│   ├── maintenance-automation/
│   └── client-onboarding/
├── skills/                # n8n-skills references
│   └── README.md
└── shared/                # Shared components
    └── error-handler-template.md
```

## Projects

| Project | Purpose | Status |
|---------|---------|--------|
| [maintenance-automation](projects/maintenance-automation/) | Weekly client WordPress maintenance | Planning |
| [client-onboarding](projects/client-onboarding/) | New client 10-phase pipeline | Planning |

## MCP Tools

All workflow operations use n8n-mcp:

```javascript
// Search for nodes
mcp__n8n-mcp__search_nodes({query: "slack"})

// Get node details
mcp__n8n-mcp__get_node({nodeType: "nodes-base.slack"})

// Create workflow
mcp__n8n-mcp__n8n_create_workflow({name, nodes, connections})

// Update workflow
mcp__n8n-mcp__n8n_update_partial_workflow({id, operations})

// Validate
mcp__n8n-mcp__n8n_validate_workflow({id})

// Test
mcp__n8n-mcp__n8n_test_workflow({workflowId})
```

## Standards

See [standards.md](standards.md) for:
- Naming conventions
- Error handling requirements
- Credential management
- Testing checklist
- Documentation requirements

## Skills

See [skills/README.md](skills/README.md) for n8n-skills reference.

The 7 skills from [czlonkowski/n8n-skills](https://github.com/czlonkowski/n8n-skills):
1. n8n-expression-syntax
2. n8n-mcp-tools-expert
3. n8n-workflow-patterns
4. n8n-validation-expert
5. n8n-node-configuration
6. n8n-code-javascript
7. n8n-code-python

## Resources

- **n8n-mcp:** https://github.com/czlonkowski/n8n-mcp
- **n8n-skills:** https://github.com/czlonkowski/n8n-skills
- **n8n Docs:** https://docs.n8n.io/
- **n8n Community:** https://community.n8n.io/

---

**Coastal Design Studio** | n8n Workflow Automation
