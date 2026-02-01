# Client Onboarding Pipeline

Complete new client onboarding workflow - from brief to launch-ready package.

---

## Pipeline Overview

This 10-phase pipeline creates everything needed for a new client:

| Phase | Agent/Tool | Output |
|-------|------------|--------|
| 1 | Research | Competitive landscape analysis |
| 2 | @brand-refiner | 3 brand concept directions |
| 3 | @seo-optimizer | Keyword strategy & site structure |
| 4 | Content | Website copy (5 pages) |
| 5 | @competitive-intel | Deep competitor analysis |
| 6 | Ads Strategy | Google Ads campaign structure |
| 7 | Ads Strategy | Meta Ads campaign structure |
| 8 | @newsletter-writer | Email templates |
| 9 | @design-inspiration | Visual mood board |
| 10 | Package | Compiled client deliverable |

---

## Prerequisites

Before running this pipeline:

1. **Client brief exists** at `clients/[client-name]/client-brief.md`
2. **Basic info completed:**
   - Business name and type
   - Location (suburb)
   - Target market
   - Services/products
   - 2-3 competitor URLs

---

## Execution Steps

### Phase 1: Research & Discovery

**Input:** Client brief
**Output:** `output/competitive-analysis/[client]/[date]-discovery.md`

```
1. Read client brief from clients/[client-name]/client-brief.md
2. Extract:
   - Business type and location
   - Target market details
   - Listed competitors

3. Using brave-search MCP:
   - Search "[business type] [suburb] Sunshine Coast"
   - Identify top 5 competitors
   - Note their positioning

4. Using fetch MCP:
   - Scrape each competitor homepage
   - Extract services, pricing signals, messaging

5. Document findings:
   - Market landscape summary
   - Competitor strengths/weaknesses
   - Positioning opportunities
```

### Phase 2: Brand Development

**Agent:** @brand-refiner
**Output:** `output/brands/[client]/[date]-brand-concepts.md`

```
Using @brand-refiner agent:

"Create 3 brand concept directions for [Client Name]:

Business: [from brief]
Location: [suburb], Sunshine Coast
Target Market: [from brief]
Competitors: [from Phase 1]
Differentiators: [from brief]

Requirements:
- Sophisticated coastal aesthetic
- Premium positioning for Sunshine Coast market
- Distinct from identified competitors
- Practical for web and print application

Deliver:
- 3 complete concept directions
- Tagline options for each
- Colour palettes with hex codes
- Typography recommendations
- Visual mood descriptions
- Coastal design elements to incorporate"
```

### Phase 3: SEO Foundation

**Agent:** @seo-optimizer
**Output:** `output/seo-reports/[client]/[date]-seo-strategy.md`

```
Using @seo-optimizer agent:

"Create SEO strategy for [Client Name]:

Business: [type]
Location: [suburb], Sunshine Coast
Services: [from brief]
Competitors: [from Phase 1]

Deliver:
- Primary keywords (5-10) with search volume
- Secondary keywords (10-20)
- Long-tail opportunities
- Site structure recommendation (5 pages)
- Title/meta templates for each page
- Schema markup recommendations
- Content calendar (12 blog topics)
- Local SEO checklist"
```

### Phase 4: Website Content

**Input:** Brand concepts + SEO strategy
**Output:** `output/brands/[client]/[date]-website-copy.md`

```
Create conversion-focused copy for 5 pages:

1. HOMEPAGE
   - Hero headline and subhead
   - Value proposition section
   - Services overview
   - Trust signals (testimonials placeholder)
   - Primary CTA

2. SERVICES/MENU
   - Service descriptions
   - Pricing presentation (if applicable)
   - Booking/contact CTA

3. ABOUT
   - Brand story
   - Team introduction
   - Values/philosophy
   - Local connection

4. LOCATION/CONTACT
   - Contact details
   - Location description (SEO optimised)
   - Map placeholder
   - Hours of operation
   - Contact form guidance

5. BLOG SETUP
   - Blog landing page intro
   - Category structure
   - First 2 blog post outlines

Requirements:
- Apply chosen brand voice
- Include target keywords naturally
- Clear CTAs on every page
- Mobile-first content structure
```

### Phase 5: Competitive Intelligence

**Agent:** @competitive-intel
**Output:** `output/competitive-analysis/[client]/[date]-full-analysis.md`

```
Using @competitive-intel agent:

"Deep competitive analysis for [Client Name]:

Competitors:
1. [URL] - [Name]
2. [URL] - [Name]
3. [URL] - [Name]

Analyse:
- Pricing strategy and positioning
- Service offerings comparison
- Website UX and booking flow
- SEO performance (rankings, keywords)
- Social media presence
- Review sentiment
- Content strategy

Deliver:
- Detailed competitor profiles
- SWOT analysis
- Differentiation strategy
- Quick wins to implement
- Monthly monitoring plan"
```

### Phase 6: Google Ads Strategy

**Output:** `output/brands/[client]/[date]-google-ads.md`

```
Create Google Ads campaign structure:

CAMPAIGN 1: Brand Awareness
- Campaign type: Search
- Keywords: Brand terms, "[business] [suburb]"
- Ad copy: 3 responsive search ads
- Budget recommendation: $X/day

CAMPAIGN 2: Service-Specific
- Campaign type: Search
- Keywords: Service + location combinations
- Ad copy: 3 responsive search ads per service
- Budget recommendation: $X/day

CAMPAIGN 3: Competitor Targeting
- Campaign type: Search
- Keywords: Competitor brand terms
- Ad copy: Differentiation-focused
- Budget recommendation: $X/day

NEGATIVE KEYWORDS:
- DIY, cheap, free, discount
- Job seekers terms
- Unrelated services
- [Full list of 30+ negatives]

EXTENSIONS:
- Sitelinks (4)
- Callouts (4)
- Call extension
- Location extension
```

### Phase 7: Meta Ads Strategy

**Output:** `output/brands/[client]/[date]-meta-ads.md`

```
Create Meta Ads campaign structure:

CAMPAIGN 1: Retargeting (Warm)
- Objective: Conversions
- Audience: Website visitors (30 days)
- Placements: Instagram Feed, Facebook Feed
- Creative: 5 ad variations
- Budget: $X/month

CAMPAIGN 2: Lookalike (Growth)
- Objective: Traffic
- Audience: Lookalike of converters
- Placements: All placements
- Creative: 5 ad variations
- Budget: $X/month

AD CREATIVE BRIEFS:
1. [Headline] / [Body copy] / [Image direction]
2. [Headline] / [Body copy] / [Image direction]
... (10 total variations)

AUDIENCE TARGETING:
- Demographics: [from client brief]
- Interests: [relevant to business type]
- Behaviours: [purchasing signals]
- Location: [service area suburbs]
```

### Phase 8: Email Marketing

**Agent:** @newsletter-writer
**Output:** `output/newsletters/[client]/[date]-email-templates.md`

```
Using @newsletter-writer agent:

"Create email marketing templates for [Client Name]:

1. WELCOME SEQUENCE (3 emails)
   Email 1: Welcome + brand introduction
   Email 2: Services/value overview
   Email 3: Social proof + first offer

2. MONTHLY NEWSLETTER TEMPLATE
   - Structure and sections
   - Content prompts
   - CTA placement

3. PROMOTIONAL TEMPLATES
   - Seasonal offer template
   - New service announcement
   - Event invitation

Requirements:
- Match brand voice from Phase 2
- Include personalisation tokens
- Mobile-optimised formatting
- Clear single CTA per email"
```

### Phase 9: Design Direction

**Agent:** @design-inspiration
**Output:** `output/brands/[client]/[date]-mood-board.md`

```
Using @design-inspiration agent:

"Create design mood board for [Client Name]:

Brand Direction: [Chosen concept from Phase 2]
Business Type: [from brief]
Location Context: [suburb] Sunshine Coast

Deliver:
- Refined colour palette (5-7 colours with hex)
- Typography system (headings, body, accent)
- Photography style guide
- Texture and pattern recommendations
- Website design references (3-5 examples)
- Stock photo recommendations from Envato (10 images)
- Icon style direction
- Application examples (web, social, print)"
```

### Phase 10: Package Compilation

**Output:** `output/brands/[client]/[date]-client-package.md`

```
Compile all outputs into client-ready package:

# Client Package: [Business Name]
Generated: [Date]

## Table of Contents
1. Executive Summary
2. Brand Concepts (Phase 2)
3. Website Structure & Copy (Phase 4)
4. SEO Strategy (Phase 3)
5. Competitive Analysis (Phase 5)
6. Google Ads Strategy (Phase 6)
7. Meta Ads Strategy (Phase 7)
8. Email Marketing (Phase 8)
9. Design Direction (Phase 9)
10. Implementation Roadmap
11. Investment Summary

## Implementation Roadmap
Week 1-2: Brand approval and refinement
Week 3-4: Website development
Week 5-6: SEO implementation and content
Week 7: Ads setup and tracking
Week 8: Launch and optimisation

## Next Steps
1. Schedule brand presentation call
2. Client selects preferred concept
3. Refine chosen direction
4. Begin implementation
```

---

## Usage

```
"Run /client-pipeline for [client-name]"
```

With options:
```
"Run /client-pipeline for seaside-wellness-spa - brand and website only"
"Run /client-pipeline for new-client - create brief first"
"Run /client-pipeline for existing-client - refresh competitive analysis only"
```

---

## Output Structure

```
output/brands/[client-name]/
├── [date]-brand-concepts.md
├── [date]-website-copy.md
├── [date]-google-ads.md
├── [date]-meta-ads.md
├── [date]-mood-board.md
└── [date]-client-package.md

output/seo-reports/[client-name]/
└── [date]-seo-strategy.md

output/competitive-analysis/[client-name]/
├── [date]-discovery.md
└── [date]-full-analysis.md

output/newsletters/[client-name]/
└── [date]-email-templates.md
```

---

## Estimated Time

- **Full pipeline:** 15-25 minutes (autonomous)
- **Brand only:** 5-10 minutes
- **SEO only:** 5-10 minutes
- **Competitive only:** 10-15 minutes
