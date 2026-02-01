# Capture Insight

Capture client-specific learnings, decisions, and patterns to persistent notes.

---

## Overview

This skill appends insights to client-specific `notes.md` files, building a persistent knowledge base that survives across sessions. Use it whenever you discover something worth remembering about a client.

---

## When to Use

Capture insights when you discover:

- **Decisions** - Design choices, technical decisions, approved directions
- **Preferences** - Client communication style, feedback patterns, likes/dislikes
- **Patterns** - Recurring requests, seasonal needs, workflow quirks
- **Technical** - Site constraints, integration requirements, known issues

---

## Execution Steps

### Step 1: Identify the Client

Determine which client folder to use:
```
clients/[client-name]/notes.md
```

If `notes.md` doesn't exist for the client, create it with the standard header.

### Step 2: Categorise the Insight

Choose one category:
- `DECISION` - A choice that was made and why
- `PREFERENCE` - How the client likes things done
- `PATTERN` - Something recurring or predictable
- `TECHNICAL` - System constraints or requirements
- `CONTEXT` - Background info that adds understanding

### Step 3: Format the Entry

```markdown
### [CATEGORY] - [Brief Title]
**Date:** [yyyy-mm-dd]
**Context:** [Where this came from - meeting, project, email, etc.]

[The insight - 1-3 sentences, specific and actionable]

---
```

### Step 4: Append to Notes

Add the entry to the bottom of the client's `notes.md` file, above any footer if present.

---

## Notes File Structure

**Initial file (if creating new):**

```markdown
# Client Notes: [Client Name]

Persistent insights, decisions, and patterns discovered during projects.

---

## Insights

[Entries appended here]

---

*Last updated: [date]*
```

**Entry examples:**

```markdown
### DECISION - Homepage hero uses video background
**Date:** 2026-02-02
**Context:** Brand concept presentation

Client chose video hero over static image. Values movement and "life" - fits their dynamic brand positioning. Use short loops (8-12 sec) to manage load times.

---

### PREFERENCE - Prefers Loom for feedback
**Date:** 2026-02-02
**Context:** Revision round 2

Client struggles to articulate feedback in writing. Video recordings work better - they can point and explain. Send Loom link for all major reviews.

---

### PATTERN - Quarterly menu updates
**Date:** 2026-02-02
**Context:** Website maintenance

Restaurant updates menu seasonally (March, June, Sept, Dec). Schedule proactive check-ins 2 weeks before each change. They often forget to notify us.

---

### TECHNICAL - WooCommerce conflicts with caching
**Date:** 2026-02-02
**Context:** Cart abandonment debugging

Their WP Rocket setup was caching cart pages. Exclude /cart/, /checkout/, /my-account/ from cache. Document in site notes.

---
```

---

## Usage Examples

**Quick capture:**
```
"/capture-insight for Beachfront Properties:
DECISION - Use Noosa styling, not generic coastal
They want to differentiate from Mooloolaba competitors"
```

**Detailed capture:**
```
"/capture-insight for Seaside Wellness Spa

Category: PREFERENCE
Title: Approval process requires owner sign-off
Context: Website launch delay

The marketing manager can approve concepts but final sign-off requires the owner who is only available Tuesdays and Fridays. Build this into project timelines - expect 3-4 day delays on approvals."
```

**Technical capture:**
```
"/capture-insight for Coastal Cafe Coolum

TECHNICAL - Instagram feed widget breaks on mobile
Their embedded Insta feed (Smash Balloon) causes CLS issues on mobile. Disabled for now. Revisit when they renew plugin license."
```

---

## Integration with Memory MCP

This skill complements the memory MCP server:

| Memory MCP | /capture-insight |
|------------|------------------|
| Session-to-session recall | Permanent file storage |
| Automatic/implicit | Explicit/intentional |
| General context | Client-specific |
| May decay over time | Persists indefinitely |

Use both: Memory MCP for working context, `/capture-insight` for important learnings worth keeping permanently.

---

## Best Practices

1. **Be specific** - "Prefers blue" is less useful than "Prefers navy (#1a365d) over lighter blues - matches their existing signage"

2. **Include context** - Where did this insight come from? This helps evaluate relevance later.

3. **Make it actionable** - Focus on what to do differently next time, not just what happened.

4. **Capture early** - Don't wait until project end. Capture insights as they occur.

5. **Review periodically** - Before starting new work with a client, read their notes.md.

---

## Output Location

All notes stored in client folders:
```
clients/[client-name]/notes.md
```

---

## Related

- **@wordpress-manager** - Technical insights often come from maintenance
- **/maintenance** - Weekly checks may surface patterns
- **/client-pipeline** - Onboarding captures initial preferences
