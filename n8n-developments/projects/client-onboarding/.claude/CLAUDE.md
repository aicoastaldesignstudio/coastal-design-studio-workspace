# Client Onboarding Pipeline - n8n Workflow

## Overview
Automated client onboarding pipeline that orchestrates the 10-phase new client setup process.

## Status
- [x] Planning
- [ ] Development
- [ ] Testing
- [ ] Production

---

## Workflow Details

### Purpose
Automate the new client onboarding process:
1. Receive client brief data
2. Trigger competitive analysis
3. Generate brand concepts
4. Create SEO strategy
5. Generate website copy
6. Create ad campaign structures
7. Compile complete client package
8. Notify team for review

### Trigger
- **Type:** Webhook + Manual
- **Details:** POST to `/webhook/client-onboarding`
- **Input:** Client brief JSON

### Input
```json
{
  "client_name": "Seaside Wellness Spa",
  "business_type": "Wellness",
  "location": "Mooloolaba",
  "services": ["massage", "facials", "wellness packages"],
  "target_market": "Women 35-60, affluent, health-conscious",
  "competitors": ["competitor1.com", "competitor2.com"],
  "differentiator": "Ocean-view treatment rooms",
  "brand_style": "Serene luxury"
}
```

### Output
- Complete client package in Google Drive
- Individual component documents
- Slack notification to team
- Client folder created in `clients/`

---

## Workflow Architecture

```
[Webhook: Receive Client Brief]
  │
  ├→ [Validate Input Data]
  │
  ├→ [Create Client Folder Structure]
  │
  ├→ [PARALLEL: Research Phase]
  │    ├→ [Fetch Competitor Sites]
  │    ├→ [Search Market Keywords]
  │    └→ [Gather Industry Data]
  │
  ├→ [Merge Research Results]
  │
  ├→ [SEQUENTIAL: Generation Phase]
  │    ├→ [Generate Brand Concepts (AI)]
  │    ├→ [Generate SEO Strategy]
  │    ├→ [Generate Website Copy]
  │    ├→ [Generate Ad Strategies]
  │    └→ [Generate Design Direction]
  │
  ├→ [Compile Client Package]
  │
  ├→ [Save to Google Drive]
  │
  ├→ [Update Client Tracking Sheet]
  │
  └→ [Notify Team via Slack]
```

---

## Phase Details

### Phase 1: Competitive Research
- Fetch competitor websites using HTTP Request
- Extract key information (services, pricing, positioning)
- Search for market keywords using Brave Search

### Phase 2: Brand Development
- Use AI node (Claude/OpenAI) with brand-refiner prompt
- Generate 3 concept directions
- Include colour palettes, typography, taglines

### Phase 3: SEO Foundation
- Keyword research using search APIs
- Generate title/meta templates
- Create content calendar topics

### Phase 4-7: Content & Ads
- Generate website copy using AI
- Create Google Ads campaign structures
- Create Meta Ads structures
- Generate newsletter templates

### Phase 8-10: Compilation
- Compile all outputs into structured package
- Save to Google Drive
- Create client folder locally
- Notify team

---

## Nodes Required

| Node | Purpose | Status |
|------|---------|--------|
| Webhook | Receive client data | [ ] |
| Set | Validate and format input | [ ] |
| HTTP Request | Fetch competitor sites | [ ] |
| Code (JS) | Extract competitor data | [ ] |
| HTTP Request | Brave Search API | [ ] |
| OpenAI/Claude | Generate brand concepts | [ ] |
| OpenAI/Claude | Generate copy | [ ] |
| Set | Format outputs | [ ] |
| Merge | Combine results | [ ] |
| Google Drive | Save documents | [ ] |
| Google Sheets | Update tracking | [ ] |
| Slack | Notify team | [ ] |

---

## Credentials Required

| Credential | Type | n8n Name |
|------------|------|----------|
| Brave Search | API Key | `brave-search-coastal` |
| OpenAI | API Key | `openai-coastal` |
| Google Drive | OAuth | `google-drive-coastal` |
| Google Sheets | OAuth | `google-sheets-coastal` |
| Slack | Bot Token | `slack-coastal-team` |

---

## AI Prompts

### Brand Concept Generation
```
Using the Coastal Design Studio brand-refiner approach, create 3 brand
concept directions for:

Business: {{client_name}}
Type: {{business_type}}
Location: {{location}}, Sunshine Coast
Target Market: {{target_market}}
Competitors: {{competitors}}
Differentiator: {{differentiator}}

Requirements:
- Sophisticated coastal aesthetic (not touristy)
- Premium positioning
- Distinct from competitors
- Practical for web and print

For each concept provide:
- Positioning statement
- 3-5 tagline options
- Colour palette (hex codes)
- Typography direction
- Visual mood description
- Key messaging themes
```

### Website Copy Generation
```
Create conversion-focused website copy for {{client_name}}:

Brand Concept: {{chosen_concept}}
Services: {{services}}
Target Market: {{target_market}}
Primary CTA: {{primary_cta}}

Create copy for:
1. Homepage (hero, value prop, services overview, trust signals)
2. Services page (detailed descriptions)
3. About page (brand story, values)
4. Contact page (location, hours, form guidance)

Requirements:
- Match brand voice
- Include SEO keywords naturally
- Clear CTAs on every section
- Mobile-first content structure
```

---

## Error Handling

### Expected Errors
| Error | Handling |
|-------|----------|
| Invalid input | Return validation error, notify sender |
| Competitor site unreachable | Skip, note in report |
| AI generation fails | Retry 3x, notify team if still failing |
| Google Drive error | Queue for retry, notify team |

### Notifications
- **On Success:** Slack notification with package link
- **On Failure:** Slack alert with error details

---

## Testing

### Test Cases
- [ ] Complete pipeline with valid data
- [ ] Missing required fields
- [ ] Invalid competitor URLs
- [ ] AI service unavailable
- [ ] Large number of competitors
- [ ] Special characters in client name

---

## Changelog
| Date | Change | Author |
|------|--------|--------|
| 2026-02 | Initial planning | Claude |
