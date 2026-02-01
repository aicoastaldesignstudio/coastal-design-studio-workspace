# Client Onboarding Pipeline - Brief

## Purpose
Automate the complete new client onboarding process, reducing time from 60+ hours to under 8 hours (mostly review time).

## Background
Currently, new client onboarding involves:
1. Manual competitive research (4-6 hours)
2. Brand concept development (8-12 hours)
3. SEO strategy creation (4-6 hours)
4. Website copy writing (8-12 hours)
5. Ad campaign planning (4-6 hours)
6. Package compilation (2-4 hours)

Total: 30-46 hours of work over 2-4 weeks

This workflow automates the generation phase, allowing team to focus on refinement and client relationships.

## Requirements

### Functional
- [ ] Accept client brief data via webhook
- [ ] Validate all required fields present
- [ ] Fetch and analyze competitor websites
- [ ] Research market keywords
- [ ] Generate 3 brand concept directions
- [ ] Generate SEO keyword strategy
- [ ] Generate website copy (5 pages)
- [ ] Generate Google Ads campaign structure
- [ ] Generate Meta Ads campaign structure
- [ ] Generate email marketing templates
- [ ] Compile all outputs into client package
- [ ] Save package to Google Drive
- [ ] Create tracking entry in sheet
- [ ] Notify team via Slack

### Non-Functional
- [ ] Complete full pipeline in under 30 minutes
- [ ] Handle concurrent requests (max 3)
- [ ] Graceful error handling for each phase
- [ ] AI-generated content requires human review flag

## Scope

### In Scope
- Competitive website scraping
- Market keyword research
- Brand concept generation (AI)
- Website copy generation (AI)
- Ad campaign structure creation
- Email template creation
- Package compilation
- Google Drive integration
- Slack notifications

### Out of Scope (v1)
- Design asset creation (designer handles)
- WordPress site setup
- Actual ad campaign creation
- Payment processing
- Contract generation

## Success Criteria
- [ ] Pipeline completes in under 30 minutes
- [ ] Generated content quality sufficient for refinement (not rewrite)
- [ ] Team time reduced from 40+ hours to 8 hours
- [ ] 100% of outputs saved to correct Drive location
- [ ] Team notified within 5 minutes of completion

## Dependencies
- Brave Search API for market research
- HTTP access to competitor websites
- OpenAI or Claude API for content generation
- Google Drive API for storage
- Google Sheets API for tracking
- Slack API for notifications

## Timeline
- **Planning:** February 2026
- **Development:** February-March 2026
- **Testing:** March 2026
- **Production:** March 2026
