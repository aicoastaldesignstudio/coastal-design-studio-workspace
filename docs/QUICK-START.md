# COASTAL DESIGN STUDIO - QUICK START GUIDE
Get productive in 10 minutes

---

## SETUP (ONE TIME)

**1. Install Claude Code:**
```bash
brew install claude
```

**2. Clone Repository:**
```bash
cd ~/Projects
git clone https://github.com/coastal-design-studio/team-workspace.git COASTALDESIGNSTUDIO
cd COASTALDESIGNSTUDIO
```

**3. Run Setup:**
```bash
./scripts/setup-claude.sh
```

**4. Get Credentials from Team Lead:**
- WordPress database access
- DataForSEO API key (1Password: "Coastal Design - DataForSEO")
- Google/Meta OAuth setup

**5. Configure MCP:**
```bash
nano ~/.claude/mcp.json
# Replace all PLACEHOLDER values with real credentials
# Save and close (Ctrl+O, Ctrl+X)
```

**6. Test:**
```bash
claude
# Type: @CLAUDE.md
# Should load team context successfully
```

---

## DAILY WORKFLOW

**Morning:**
```bash
cd ~/Projects/COASTALDESIGNSTUDIO
git pull origin main
claude
```

**Load team context:**
```
@CLAUDE.md
```

**Start your work - use agents as needed:**
```
@brand-refiner - Premium coastal brand concepts
@seo-optimizer - Local Sunshine Coast SEO
@newsletter-writer - Coastal lifestyle content
@competitive-intel - Market intelligence
@design-inspiration - Coastal design trends
```

---

## COMMON COMMANDS

**Weekly maintenance (every Monday):**
```
/maintenance
```

**New client onboarding:**
```
"Run /client-pipeline for [Business Name] in [Location].
Services: [List]. Target: [Audience]. Brand: [Style]."
```

**Monthly newsletter:**
```
/newsletter for [Month]
Topics: [List 3-4 topics]
```

**Competitive analysis:**
```
"Run /competitive-analysis for [Client Name].
Competitors: [domain1.com], [domain2.com], [domain3.com]"
```

---

## TIPS FOR BETTER RESULTS

**Be specific:**
```
"Create brand concepts for Mooloolaba day spa targeting
affluent women 35-60. Style: serene luxury, ocean views,
organic products."
```

**Too vague:**
```
"Create a spa brand"
```

**Reference context:**
```
"Using @CLAUDE.md team standards and @brand-refiner agent,
create 3 coastal brand concepts for [client]."
```

**Provide examples:**
```
"Match the voice in these examples: [paste 2-3 samples]"
```

---

## TROUBLESHOOTING

**Agent not working?**
- Make sure you're in COASTALDESIGNSTUDIO directory
- Reference agent with `@agent-name`
- Load team context first: `@CLAUDE.md`

**MCP connection failing?**
- Check `~/.claude/mcp.json` has real credentials (not PLACEHOLDER)
- Verify credentials in 1Password
- Restart Claude: `exit` then `claude`

**Command not found?**
- Verify you're in project root: `pwd`
- Make commands executable: `chmod +x .claude/commands/*.sh`

---

## FULL DOCUMENTATION

**Complete guide:** `docs/USER-GUIDE.md`

**Team context:** `@CLAUDE.md`

**Help:** #coastal-design-studio Slack channel

---

## YOUR FIRST TASK

**Test everything works:**
```
1. Start Claude: claude
2. Load context: @CLAUDE.md
3. Test agent: @brand-refiner
4. Ask: "Create 1 brand tagline for a Noosa cafe"
5. If you get a coastal-focused tagline → Setup complete!
```

**Welcome to the team!**

---

**Questions?** Ask in #coastal-design-studio Slack
