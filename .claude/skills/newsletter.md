# Newsletter Generation

Create monthly newsletters for the agency or clients with appropriate coastal voice.

---

## Overview

This skill generates publication-ready newsletters with:
- Appropriate brand voice (agency or client-specific)
- Seasonal Sunshine Coast relevance
- SEO-friendly content
- Clear structure and CTAs

---

## Newsletter Types

### 1. Agency Newsletter
Monthly thought leadership for Coastal Design Studio's audience.

**Voice:** Knowledgeable expert, coastal lifestyle enthusiast
**Audience:** Sunshine Coast business owners, marketing managers
**Goal:** Position agency as premium coastal specialists

### 2. Client Newsletter
Monthly communication for client's customer base.

**Voice:** Client's brand voice (from client brief)
**Audience:** Client's customers and prospects
**Goal:** Drive engagement and conversions for client

---

## Execution Steps

### Step 1: Gather Context

**For Agency Newsletter:**
```
1. Check current month and season
2. Review recent client projects (for case studies)
3. Identify relevant coastal business trends
4. Note any local Sunshine Coast events
5. Check content calendar for planned topics
```

**For Client Newsletter:**
```
1. Read client brief from clients/[client-name]/client-brief.md
2. Extract brand voice guidelines
3. Check client's recent activities/news
4. Identify relevant topics for their audience
5. Note any promotions or events to include
```

### Step 2: Generate Newsletter

**Using @newsletter-writer agent:**

```
"Create [month] newsletter for [Agency/Client Name]:

Type: [Agency/Client]
Voice: [Brand voice description]
Audience: [Target audience]

Topics to include:
1. [Topic 1]
2. [Topic 2]
3. [Topic 3]
4. [Topic 4 - optional]

Requirements:
- 600-800 words total
- Read time under 3 minutes
- Mobile-friendly short paragraphs
- One clear primary CTA
- At least one local Sunshine Coast reference
- Australian English spelling

Include:
- 3 subject line options (A/B testing)
- Preview text (40-90 characters)
- Full newsletter content with sections marked
- Image suggestions for each section
- Recommended send time"
```

### Step 3: Quality Check

```
Review generated newsletter for:

□ Brand voice consistency
□ Appropriate length (600-800 words)
□ Local relevance included
□ CTA is clear and singular
□ No spelling/grammar errors
□ Australian English used
□ Mobile-friendly formatting
□ Sections are scannable
```

### Step 4: Save Output

**Agency Newsletter:**
`output/newsletters/agency/[yyyy-mm]-newsletter.md`

**Client Newsletter:**
`output/newsletters/[client-name]/[yyyy-mm]-newsletter.md`

---

## Seasonal Content Guide

### Summer (December - February)
**Sunshine Coast Context:**
- Tourism peak season
- Beach lifestyle content
- Holiday trading hours
- New year business planning
- Outdoor dining/activities

**Topics:**
- Summer marketing strategies
- Managing holiday demand
- Beach season preparation
- New year business goals

### Autumn (March - May)
**Sunshine Coast Context:**
- Shoulder season begins
- Noosa Food & Wine Festival (May)
- Local events calendar
- Perfect weather for outdoor activities

**Topics:**
- Shoulder season marketing
- Event-based promotions
- Website refresh recommendations
- Autumn menu/service updates

### Winter (June - August)
**Sunshine Coast Context:**
- Whale watching season
- Hinterland attractions
- Cosy coastal vibes
- Quieter beach periods

**Topics:**
- Winter marketing pivots
- Indoor experience focus
- Website optimisation projects
- Planning for summer

### Spring (September - November)
**Sunshine Coast Context:**
- Lead-up to busy season
- Spring events and markets
- Perfect weather returns
- Pre-summer preparations

**Topics:**
- Summer preparation checklist
- Spring campaign launches
- New season services/menus
- Holiday booking drives

---

## Usage Examples

**Agency Newsletter:**
```
"/newsletter for February

Topics:
- Summer wrap-up and Q1 trends
- Client spotlight: Seaside Wellness Spa launch
- Design trend: Biophilic coastal interiors
- Team update: New designer joining

Include subtle CTA for website consultations"
```

**Client Newsletter:**
```
"/newsletter for Beachfront Properties Noosa - March

Topics:
- Autumn market update (Noosa specific)
- 3 new luxury listings to feature
- Noosa Food & Wine Festival mention
- Open house schedule

Voice: Sophisticated luxury real estate
CTA: Schedule private viewing"
```

**Quick Newsletter:**
```
"/newsletter quick for Coastal Cafe - Valentine's Day promotion

Single topic: Valentine's dinner special
Include: Menu preview, booking CTA
Length: 300 words"
```

---

## Output Format

```markdown
# Newsletter: [Title]
**For:** [Agency/Client Name]
**Month:** [Month Year]
**Generated:** [Date]

---

## Subject Lines (A/B Test)
1. [Best option - recommended]
2. [Alternative]
3. [Alternative]

## Preview Text
[40-90 characters visible in inbox]

---

## Newsletter Content

### [Section 1 Header]
[Content - 2-3 paragraphs max]

**Image suggestion:** [Description of image needed]

---

### [Section 2 Header]
[Content]

**Image suggestion:** [Description]

---

### [Section 3 Header]
[Content]

**Image suggestion:** [Description]

---

### [CTA Section]
[Clear call-to-action with button text]

---

## Technical Notes

**Recommended Send Time:** [Day and time AEST]
**Estimated Read Time:** [X] minutes
**Word Count:** [X] words

**Tracking:**
- UTM: `utm_source=newsletter&utm_medium=email&utm_campaign=[campaign-name]`
- Track: [What to measure]

**Images Needed:**
1. [Image 1 description]
2. [Image 2 description]
3. [Image 3 description]
```

---

## Integration

After newsletter generation:

1. **Review** the output in `output/newsletters/`
2. **Refine** voice/tone if needed
3. **Source images** from Envato or client assets
4. **Build** in email platform (Mailchimp/Klaviyo)
5. **Schedule** for recommended send time
6. **Monitor** performance after 24-48 hours
