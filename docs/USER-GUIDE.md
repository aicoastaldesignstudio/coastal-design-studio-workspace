# COASTAL DESIGN STUDIO - CLAUDE CODE USER GUIDE
Complete Working Instructions for Team Members

---

## TABLE OF CONTENTS

1. [Getting Started](#getting-started)
2. [Daily Workflows](#daily-workflows)
3. [Using Custom Agents](#using-custom-agents)
4. [Using Slash Commands](#using-slash-commands)
5. [Client Onboarding Process](#client-onboarding-process)
6. [Weekly Maintenance Workflow](#weekly-maintenance-workflow)
7. [Monthly Tasks](#monthly-tasks)
8. [Advanced Techniques](#advanced-techniques)
9. [Troubleshooting](#troubleshooting)
10. [Best Practices](#best-practices)

---

## GETTING STARTED

### First-Time Setup (10 Minutes)

**Prerequisites:**
- Mac or Linux computer
- Git installed
- Access to team Slack
- 1Password team vault access

**Step 1: Install Claude Code**
```bash
# Mac
brew install claude

# Linux
curl -fsSL https://get.claude.ai | sh

# Verify installation
claude --version
```

**Step 2: Clone Team Repository**
```bash
# Navigate to your projects folder
cd ~/Projects

# Clone the team workspace
git clone https://github.com/coastal-design-studio/team-workspace.git COASTALDESIGNSTUDIO

# Enter directory
cd COASTALDESIGNSTUDIO
```

**Step 3: Run Setup Script**
```bash
# Run the automated setup
./scripts/setup-claude.sh

# You should see:
# ✅ Team setup verified
# ⚠️  Edit ~/.claude/mcp.json with credentials
```

**Step 4: Get Team Credentials**

Contact team lead to get:
1. **WordPress Database Credentials** (for client site access)
2. **DataForSEO API Key** (from 1Password vault: "Coastal Design - DataForSEO")
3. **Google Workspace Account** (for Ads/Analytics OAuth)
4. **Meta Business Account** (for Facebook/Instagram Ads)

**Step 5: Configure MCP Servers**
```bash
# Open MCP config file
nano ~/.claude/mcp.json

# Or use your preferred editor:
# code ~/.claude/mcp.json  (VS Code)
# open -a TextEdit ~/.claude/mcp.json  (Mac TextEdit)
```

**Replace PLACEHOLDER values:**
```json
{
  "mcpServers": {
    "wordpress": {
      "command": "wordpress-mcp",
      "args": [
        "--host", "coastal-db.wpengine.com",
        "--user", "coastal_admin",
        "--password", "your-password-from-1password",
        "--database", "coastal_wp_prod"
      ]
    },
    "dataforseo": {
      "command": "dataforseo-mcp",
      "env": {
        "DATAFORSEO_LOGIN": "your-login@coastal.com",
        "DATAFORSEO_PASSWORD": "your-api-password"
      }
    },
    "google-ads": {
      "command": "google-ads-mcp",
      "args": ["--oauth"]
    },
    "google-analytics": {
      "command": "google-analytics-mcp",
      "args": ["--oauth"]
    },
    "meta-ads": {
      "command": "meta-ads-mcp",
      "args": ["--oauth"]
    }
  }
}
```

**Save and close the file.**

**Step 6: Test Your Setup**
```bash
# Start Claude Code in team directory
cd ~/Projects/COASTALDESIGNSTUDIO
claude

# You should see Claude Code start successfully
```

**In the Claude session, test:**
```
Type: @CLAUDE.md
```

**You should see:** Coastal Design Studio team context loaded.
```
Type: /help
```

**You should see:** List of custom commands including `/maintenance`, `/client-pipeline`, etc.
```
Type: @brand-refiner
```

**Claude should respond:** With coastal brand strategy agent introduction.

**If all three work: Setup complete!**

---

## DAILY WORKFLOWS

### Morning Routine (5 Minutes)

**Every workday morning:**
```bash
# 1. Navigate to team workspace
cd ~/Projects/COASTALDESIGNSTUDIO

# 2. Pull latest team updates
git pull origin main

# 3. Start Claude Code
claude
```

**In Claude session:**
```
Load team context:
@CLAUDE.md

Check today's tasks:
"What maintenance tasks are scheduled for today?"

Review any client flags:
"Check for any urgent client issues flagged yesterday"
```

---

### Starting Work on a Client Project

**When you begin work on a specific client:**
```
1. Load context about the client:
"Tell me about [Client Name] - what's their brand voice,
target market, and current priorities?"

2. Reference our team standards:
@CLAUDE.md

3. Begin your task with clear instructions:
"I need to [specific task] for [Client Name].
Follow our coastal design principles and their brand voice."
```

**Example:**
```
You: "Tell me about Beachfront Properties Noosa"

Claude: [Provides client overview based on previous work/context]

You: "I need to create a new blog post for them about
'Winter Property Market Trends on the Sunshine Coast'.
Use their luxury real estate voice - sophisticated,
aspirational, local market expertise."

Claude: [Generates content in appropriate voice]
```

---

### Ending Your Day (2 Minutes)
```
Before closing Claude Code:

"Summarize today's work on [Client Name]:
- What was completed
- What needs review
- Any blockers or issues
- Next steps for tomorrow"

Save important prompts or context for tomorrow:
"Save this conversation summary to project notes"

Exit Claude Code:
exit
```

---

## USING CUSTOM AGENTS

Our team has 5 specialized agents optimized for coastal businesses.

### @brand-refiner - Premium Coastal Brand Concepts

**When to use:**
- New client onboarding (brand development phase)
- Rebranding existing client
- Exploring brand refresh options
- Creating sub-brands for client services

**How to use:**
```
Basic invocation:
@brand-refiner

With context:
"Using @brand-refiner, create 3 brand concept directions
for a new boutique hotel in Mooloolaba. Target market:
affluent couples 35-55, seeking romantic coastal escape.
Differentiator: Rooftop bar with ocean views,
locally-sourced cuisine."

Specific request:
"@brand-refiner - Generate tagline options for
Sunshine Coast Real Estate. Premium beachfront properties.
Avoid clichés like 'where dreams come true' or 'your slice
of paradise'. Want sophisticated, aspirational tone."
```

**Expected output:**
```
CONCEPT A: Modern Coastal Luxury
Positioning: Architectural sophistication meets natural beauty
Taglines:
- "Where design meets the horizon"
- "Coastal living, elevated"
- "Modern sanctuary, timeless coast"

Color Palette:
- Primary: Deep Ocean (#1a3a52)
- Accent 1: Sandy Neutral (#e8dcc8)
- Accent 2: Coastal Sage (#a8b5a0)

Typography: Clean sans-serif (modern architectural feel)
Visual Mood: Minimalist architecture, natural materials,
expansive ocean views, premium without pretension

[continues with Concepts B and C...]
```

**What to do with output:**

1. **Review concepts** - Which direction resonates?
2. **Refine chosen direction**: "I like Concept A. Develop it further with specific font recommendations and photography style"
3. **Share with team/client** - Copy into presentation deck
4. **Save for reference**: "Save this brand concept as baseline for all future work on [Client Name]"

---

### @seo-optimizer - Local Coastal SEO

**When to use:**
- Optimizing new website pages
- Monthly SEO refresh
- Competitive keyword research
- Local search optimization

**How to use:**
```
Page optimization:
"Using @seo-optimizer, optimize the Services page for
'Waterfront Cafe Caloundra'. Target keywords:
waterfront dining Caloundra, beachfront cafe,
ocean view restaurant. Competitors: [competitor domains]"

Keyword research:
"@seo-optimizer - Find keyword opportunities for luxury
real estate in Noosa. Use DataForSEO to analyze what
top 3 competitors rank for. Focus on beachfront/waterfront
property keywords."

Meta optimization:
"Create SEO-optimized title and meta description for
homepage of boutique hotel in Mooloolaba. Target:
romantic getaway, couples retreat, boutique accommodation."
```

**Expected output:**
```
SEO Optimization for Waterfront Cafe Caloundra

Primary Keyword: "waterfront dining Caloundra"
Secondary Keywords:
- beachfront cafe Caloundra
- ocean view restaurant Sunshine Coast
- alfresco dining Caloundra waterfront

Recommended Title Tag (58 chars):
"Waterfront Dining Caloundra | Ocean View Cafe & Restaurant"

Meta Description (155 chars):
"Fresh seafood and locally-sourced cuisine with panoramic
ocean views. Award-winning waterfront dining in the heart
of Caloundra. Book your table today."

Heading Structure:
H1: Waterfront Dining Experience in Caloundra
H2: Fresh, Local, Seasonal Menu
H2: Panoramic Ocean Views from Every Table
H2: Perfect for Special Occasions & Events

Internal Link Opportunities:
- Link to "About Our Local Suppliers" from menu section
- Link to "Book a Table" from header
- Link to "Events & Functions" from special occasions mention

Competitor Analysis (via DataForSEO):
[Detailed competitive insights...]
```

**Best practices:**

- Always include location (suburb/city)
- Use coastal/waterfront terminology appropriately
- Check DataForSEO competitive data before optimizing
- Balance SEO with natural, premium voice

**Avoid:**
- Don't keyword stuff
- Don't use generic "best" or "top" unless backed by awards
- Don't ignore local Sunshine Coast suburbs

---

### @newsletter-writer - Coastal Lifestyle Content

**When to use:**
- Monthly agency newsletter
- Client newsletters
- Email campaigns
- Blog post creation (coastal lifestyle topics)

**How to use:**
```
Agency newsletter:
"Using @newsletter-writer, create our March newsletter.
Topics: Spring property market trends on Sunshine Coast,
new website launch for [client], coastal design trend
spotlight (natural materials). 800 words. Sophisticated
coastal voice. Include 2 client success story snippets."

Client newsletter:
"@newsletter-writer - Create April newsletter for
Beachfront Properties Noosa. Topics: Autumn market report,
new luxury listings (3 properties), local community event
(Noosa Food & Wine Festival). Target: current clients and
prospects. 600 words. Sophisticated real estate voice."

Blog post:
"Create blog post: 'Why Coastal Architecture Embraces
Natural Light and Flow' for boutique hotel client.
800 words. Educational but brand-aligned. Include
references to our hotel's design principles."
```

**Expected output:**
```
COASTAL DESIGN STUDIO - MARCH NEWSLETTER

Subject Line Options:
- "Spring Market Insights: Your Coastal Property Update"
- "New Beginnings: March on the Sunshine Coast"
- "Coastal Living: Spring Trends & Client Success Stories"

[Newsletter content follows with appropriate sections,
coastal lifestyle tone, client stories, subtle CTAs]

---

Key Metrics for Success:
- Email open rate target: 25-30%
- Click-through rate target: 3-5%
- Unsubscribe rate: <1%

Suggested Send Time: Tuesday 9am AEST (best engagement)
```

**Customization tips:**
```
Adjust tone:
"Make this more conversational and warm, less corporate"

Add urgency:
"Include time-sensitive offer for spring promotion"

Personalize:
"Add personalization tokens for first name and
property preferences"
```

---

### @competitive-intel - Market Intelligence

**When to use:**
- New client competitive analysis
- Monthly competitive monitoring
- Positioning strategy development
- Pricing research

**How to use:**
```
Full competitive analysis:
"Using @competitive-intel, analyze top 3 competitors for
boutique accommodation in Mooloolaba:
[competitor1.com], [competitor2.com], [competitor3.com]

Focus areas:
- Pricing (room rates, packages)
- Service offerings (what makes them different)
- Website UX and conversion flow
- SEO keywords they rank for
- Social media presence and engagement
- Design aesthetic and brand positioning

Provide strategic recommendations for differentiation."

Quick competitor check:
"@competitive-intel - What new services has
[competitor.com] added in the last month?
Use web scraping to check their services page."

Pricing intelligence:
"Analyze pricing for waterfront cafes in Caloundra.
What's the average main dish price? How does
[our-client] compare?"
```

**Expected output:**
```
COMPETITIVE INTELLIGENCE REPORT
Boutique Accommodation - Mooloolaba Market

Competitor 1: Oceanfront Boutique Hotel
- Pricing: $350-$650/night
- Differentiators: Rooftop bar, couples-focused
- SEO: Ranks #1 for "boutique hotel Mooloolaba"
- Website UX: Strong booking flow, 3 clicks to reservation
- Design: Modern coastal, navy/white palette
- Social: 15K Instagram followers, high engagement

Competitor 2: [Analysis continues...]

Competitor 3: [Analysis continues...]

STRATEGIC RECOMMENDATIONS:
1. Price positioning: Enter at $400-$550 (premium but accessible)
2. Differentiation opportunity: Eco-luxury angle (competitors
   don't emphasize sustainability)
3. SEO gap: "romantic getaway Mooloolaba" has low competition
4. UX improvement: Implement one-page booking (competitors
   use multi-step)
5. Design direction: Organic materials aesthetic (less
   competition in this space)

MONTHLY MONITORING PLAN:
- Track pricing changes
- Monitor new service additions
- Watch SEO ranking shifts
- Alert on major website redesigns
```

**How to use intelligence:**

1. **Strategic planning** - Share report in client strategy sessions
2. **Positioning** - Identify gaps and opportunities
3. **Pricing** - Benchmark and adjust
4. **SEO** - Target competitor weaknesses
5. **Ongoing monitoring** - Monthly updates

---

### @design-inspiration - Coastal Design Trends

**When to use:**
- Starting new website design project
- Creating mood boards for clients
- Researching coastal design trends
- Finding stock photos/assets for projects

**How to use:**
```
Project kickoff:
"Using @design-inspiration, create design inspiration
board for luxury real estate website targeting Noosa
beachfront properties.

Style preferences:
- Modern minimalist (not busy)
- Premium feel (sophisticated, not flashy)
- Natural materials palette
- Architectural photography emphasis

Include:
- Color palette recommendations
- Website design references (Awwwards/Dribbble)
- Stock photo suggestions from Envato
- Typography direction"

Trend research:
"@design-inspiration - What are current coastal
architecture design trends for 2026? Focus on
sustainable/eco-luxury aesthetics. Find examples
from Awwwards."

Asset finding:
"Find 10 premium stock photos from Envato Elements
suitable for boutique hotel website. Style: Natural
light, coastal interiors, organic materials, no people.
Muted color palette."
```

**Expected output:**
```
DESIGN INSPIRATION BOARD
Luxury Real Estate - Noosa Beachfront Properties

COLOR PALETTE (Coastal Minimalist):
Primary:
- Sand White (#f5f1e8) - backgrounds, large spaces
- Deep Ocean (#2c4251) - headings, accents

Secondary:
- Driftwood Grey (#a89f91) - text, subtle elements
- Coastal Sage (#b8c5b0) - call-to-actions, highlights
- Warm Stone (#d4c8b8) - borders, dividers

TYPOGRAPHY DIRECTION:
Headings: Modern serif (editorial feel, sophistication)
- Recommended: Playfair Display, Cormorant, Ogg
Body: Clean sans-serif (readability, contemporary)
- Recommended: Inter, Sailec, Circular

WEBSITE DESIGN REFERENCES:
1. [Awwwards Link] - Minimalist real estate site,
   excellent property showcase grid
2. [Dribbble Link] - Coastal architecture firm,
   beautiful use of whitespace
3. [Awwwards Link] - Luxury hotel site, smooth scrolling
   parallax with ocean imagery

ENVATO STOCK PHOTOS (Recommended):
1. "Modern coastal interior natural light" - #47382910
2. "Beachfront architecture exterior" - #51927384
3. "Ocean view through minimal window" - #44821093
[7 more recommendations...]

COASTAL DESIGN PRINCIPLES TO INCORPORATE:
- Generous whitespace (breathing room like open coast)
- Large, high-quality imagery (showcase properties fully)
- Smooth transitions (flow like ocean rhythm)
- Natural material textures (wood, stone, linen)
- Mobile-first (beach browsing on phone)

GOOGLE ANTIGRAVITY CONCEPT:
[AI-generated visual concept for overall aesthetic direction]
```

**Next steps with output:**

1. **Share with client** for approval on direction
2. **Brief designer** with specific references and assets
3. **Download Envato assets** using team account
4. **Create Figma mood board** for presentation

---

## USING SLASH COMMANDS

Slash commands are pre-built workflows for common tasks.

### /maintenance - Weekly Client Maintenance

**What it does:**
Runs complete maintenance workflow across all active client sites:
- WordPress plugin/theme security updates
- SEO optimization (meta, internal links)
- Broken link detection and repair
- Database optimization
- Performance checks
- Weekly client reports

**When to use:**
Every Monday morning (standard team schedule)

**How to use:**
```
Basic usage (all clients):
/maintenance

Specific client only:
"Run /maintenance workflow for [Client Name] only"

With focus area:
"Run /maintenance focusing on SEO optimization.
We've had ranking drops for 3 clients - prioritize
keyword/meta refresh."

Custom schedule:
"Run /maintenance for Friday afternoon instead -
I'll review Monday morning"
```

**What happens:**

1. **GSD Framework activates** - Orchestrates multiple parallel subagents
2. **Subagent 1: Security** - Checks for plugin/theme updates, tests compatibility
3. **Subagent 2: SEO** - Optimizes meta descriptions, adds internal links, checks schema
4. **Subagent 3: Performance** - Database cleanup, image optimization, cache clear
5. **Subagent 4: Links** - Finds broken links, suggests replacements
6. **Subagent 5: Reporting** - Generates client-ready maintenance report

**Timeline:**
- Monday 9am: You trigger `/maintenance`
- Monday 11am: GSD completes work (runs autonomously)
- Wednesday 10am: You review outputs and approve
- Friday: Deploy to production

**Expected output:**
```
WEEKLY MAINTENANCE REPORT - March 4, 2026
Coastal Design Studio

CLIENT: Beachfront Properties Noosa
Status: Complete - No issues

Updates Applied:
- WordPress 6.8.1 security patch
- Yoast SEO plugin updated (23.1 → 23.2)
- Contact Form 7 updated (5.9.1 → 5.9.2)

SEO Optimizations:
- Updated 5 meta descriptions (better keyword targeting)
- Added 8 internal links across blog posts
- Fixed schema markup on 2 property listing pages

Performance:
- Database optimized (removed 342 post revisions)
- Image optimization: 15 images compressed (saved 2.3MB)
- Cache cleared and regenerated

Broken Links:
- Fixed: 3 internal links (old blog URLs redirected)
- Flagged: 1 external link needs manual review (competitor site)

Recommendations:
- Consider updating hero image on homepage (current is 2 years old)
- Blog posting frequency dropped - schedule 2 posts for April

---

CLIENT: Oceanfront Cafe Caloundra
Status: Attention Required

[Similar format continues for each client...]

---

SUMMARY ACROSS ALL CLIENTS:
- 8 clients: No issues
- 2 clients: Attention needed
- 0 clients: Urgent issues

Total time saved: 22 hours (vs. manual maintenance)
```

**Your action required:**
```
Review report:
"Show me the 2 clients with attention flags -
what needs manual review?"

Approve deployment:
"Approve all maintenance updates for the 8 clean clients.
Schedule deployment for Friday 5pm."

Address flagged items:
"For the 2 flagged clients, what specifically needs
my attention?"
```

---

### /client-pipeline - Complete New Client Onboarding

**What it does:**
Runs the full 10-bot pipeline to create everything needed for new client:
1. Brand concepts (3 directions)
2. Website structure (5 pages + copy)
3. Local SEO strategy (keywords, metas)
4. Google Ads campaigns (3 campaigns + negatives)
5. Negative keyword setup
6. Tracking configuration (GA4, events)
7. Meta Ads strategy (retargeting + creatives)
8. Newsletter template
9. Competitive intelligence report
10. Design inspiration board

**When to use:**
- New client signed contract
- Existing client expanding services (new sub-brand)
- Pitch/proposal needs (create concept package)

**How to use:**
```
Full pipeline:
"Run /client-pipeline for new client:

Business: Seaside Wellness Spa
Location: Mooloolaba, Sunshine Coast
Services: Day spa, massage therapy, facials, wellness packages
Target Market: Women 35-60, affluent, health-conscious
Differentiator: Ocean-view treatment rooms, locally-sourced
organic products, holistic wellness approach
Brand Style: Serene luxury, natural wellness, coastal tranquility
Primary CTA: Book appointment (phone + online booking)
Service Areas: Mooloolaba, Alexandra Headland, Maroochydore"

Partial pipeline (specific components):
"Run brand development and website structure only from
/client-pipeline for [business name]. Skip ads setup
for now - client wants to review branding first."

Pitch/proposal mode:
"Create concept package for pitch to potential client
[business name]. Run /client-pipeline but mark all
outputs as 'Concept - For Proposal' and include pricing
estimate for implementation."
```

**What happens (15-20 minute autonomous workflow):**
```
PHASE 1: Research & Planning (GSD Framework)
↓
Analyzes business type, location, market
Maps competitive landscape
Defines brand positioning opportunities
↓
PHASE 2: Brand Development (@brand-refiner)
↓
Creates 3 brand concept directions
Color palettes, typography, visual mood
Tagline options for each direction
↓
PHASE 3: Website Structure (@seo-optimizer involved)
↓
5-page website structure:
- Homepage (conversion-focused)
- Services (detailed offerings)
- About (trust-building)
- Location/Contact (local SEO optimized)
- Blog setup (content strategy)

Persuasive copy for each page (brand voice applied)
Call-to-action placement strategy
↓
PHASE 4: SEO Foundation (@seo-optimizer)
↓
Local keyword research (Sunshine Coast focus)
Title tags and meta descriptions for all pages
Internal linking strategy
Schema markup recommendations
Content calendar (12 blog topics)
↓
PHASE 5: Google Ads Setup
↓
3 campaign structures:
- Brand awareness (broad local)
- Service-specific (massage, facials, etc.)
- Competitor targeting

15 responsive search ad variations
47 negative keywords (DIY, cheap, discount, etc.)
Bid strategy recommendations
↓
PHASE 6: Tracking Configuration
↓
GA4 event tracking setup:
- Phone clicks
- Booking form submissions
- Service page views
- CTA button clicks

UTM parameter templates
Conversion funnel mapping
↓
PHASE 7: Meta Ads Strategy
↓
Retargeting campaign structure
20 ad creative variations (image + copy)
Audience segments (website visitors, engaged users)
Creative rotation schedule
↓
PHASE 8: Newsletter Template (@newsletter-writer)
↓
Monthly newsletter template
Welcome email sequence (3 emails)
Promotional email templates
↓
PHASE 9: Competitive Intel (@competitive-intel)
↓
Top 3 competitor analysis
Pricing benchmarks
Service differentiators
SEO opportunity gaps
↓
PHASE 10: Design Inspiration (@design-inspiration)
↓
Mood board with coastal wellness aesthetic
Stock photo selections (Envato)
Website design references
Color psychology for wellness
↓
FINAL OUTPUT: Complete Client Package
```

**Expected deliverables:**
```
NEW CLIENT PACKAGE - SEASIDE WELLNESS SPA
Generated: March 4, 2026

BRAND CONCEPTS (PDF - 12 pages)
- Concept A: Serene Coastal Sanctuary
- Concept B: Modern Wellness Haven
- Concept C: Organic Ocean Therapy
[Detailed brand guidelines for chosen direction]

WEBSITE STRUCTURE & COPY (Document)
- Complete 5-page structure with conversion copy
- Mobile-responsive layout recommendations
- CTA placement strategy
- Image/photo recommendations

SEO STRATEGY (Spreadsheet + Document)
- 47 target keywords with search volume
- Page-by-page optimization plan
- 12-month content calendar
- Local citation strategy

GOOGLE ADS CAMPAIGNS (Document)
- 3 campaign structures (detailed)
- 15 ad variations (ready to deploy)
- Negative keyword list (47 terms)
- Budget allocation recommendations

TRACKING & ANALYTICS SETUP (Technical Doc)
- GA4 configuration instructions
- Event tracking code
- Conversion goals setup
- UTM templates

META ADS STRATEGY (Document + Creative Brief)
- Campaign structure
- 20 ad variations (copy)
- Audience targeting strategy
- Creative direction for designer

EMAIL MARKETING (Templates)
- Monthly newsletter template
- Welcome sequence (3 emails)
- Promotional templates

COMPETITIVE ANALYSIS (Report - 8 pages)
- Detailed competitor breakdown
- Pricing benchmarks
- Positioning recommendations
- Market opportunity analysis

DESIGN INSPIRATION BOARD (PDF)
- Mood board (coastal wellness aesthetic)
- Color psychology
- 15 stock photo selections (Envato links)
- 5 website design references

PROJECT TIMELINE & NEXT STEPS
- Implementation roadmap (8 weeks)
- Client approval milestones
- Resource requirements
- Launch checklist

ESTIMATED PROJECT VALUE: $8,500
ESTIMATED IMPLEMENTATION TIME: 6-8 weeks
```

**Your next steps:**
```
1. Review package:
"Walk me through the Concept A brand direction -
is this appropriate for the target market?"

2. Customize if needed:
"The website copy feels a bit too formal.
Make it warmer and more welcoming while
maintaining the serene luxury tone."

3. Prepare client presentation:
"Create a client presentation deck (PowerPoint)
from this package. Highlight the 3 brand concepts
and show one complete website page mockup for each."

4. Get client approval:
[Present to client, get feedback]

5. Refine based on feedback:
"Client chose Concept B (Modern Wellness Haven).
Update all materials to reflect this direction only.
They also want to emphasize couples packages more."

6. Move to implementation:
"Create implementation project plan - break this
into weekly sprints with specific deliverables."
```

---

### /newsletter - Monthly Newsletter Generation

**What it does:**
Creates complete newsletter (agency or client) with appropriate voice

**When to use:**
- First week of each month (agency newsletter)
- Mid-month (client newsletters)
- Special campaigns or announcements

**How to use:**
```
Agency newsletter:
/newsletter for Coastal Design Studio

Topics: March 2026
- Spring property market update (Sunshine Coast)
- New client showcase (Seaside Wellness Spa)
- Design trend: Biophilic interiors for coastal homes
- Team update: New designer joining

Length: 800 words
Voice: Sophisticated coastal, thought leadership
Include: 2 client success snippets, 1 design tip, soft CTA

Client newsletter:
"Run /newsletter for Beachfront Properties Noosa

Topics: April market report, 3 new luxury listings,
upcoming open houses, local event (Noosa Jazz Festival)
Target: Current clients + prospects
Length: 600 words
Voice: Sophisticated real estate, local expertise
Include: Property showcase, market data, community connection"
```

**Expected output:**
```
NEWSLETTER - COASTAL DESIGN STUDIO - MARCH 2026

Subject Line Options (A/B test):
A: "Spring Market Insights + Fresh Coastal Design Trends"
B: "Your March Update: Property, Design & Community"
C: "Coastal Living: What's New on the Sunshine Coast"

Recommended: Subject B (balance of value + relevance)

---

[Newsletter content in HTML format]

PREVIEW TEXT (visible in inbox):
"Spring property market update, new client showcase,
and why biophilic design is trending in coastal homes..."

BODY STRUCTURE:

Introduction (50 words):
[Warm welcome, seasonal reference, value preview]

Section 1: Spring Property Market Update (200 words):
[Data-backed insights, Sunshine Coast specific,
trend analysis, expert positioning]

Section 2: Client Showcase - Seaside Wellness Spa (150 words):
[New client highlight, before/after narrative,
results/outcomes, subtle CTA to "work with us"]

Section 3: Design Trend Spotlight (200 words):
[Biophilic interiors explanation, why it works for
coastal homes, 3 actionable tips readers can implement]

Section 4: Team Update (100 words):
[New designer intro, humanize the team, personality]

Section 5: What We're Reading/Watching (50 words):
[2-3 coastal design/business resource recommendations]

Closing & CTA (50 words):
[Thank you, soft CTA: "Schedule a consultation",
social media links, unsubscribe]

---

TECHNICAL SPECS:
- Word count: 800
- Reading time: 3 minutes
- Emails to include: [your email list segment]
- Best send time: Tuesday 9am AEST
- Mobile optimization: Yes
- Image suggestions: 3 (hero image, client project, design trend)

TRACKING:
- UTM parameters: utm_source=newsletter&utm_medium=email&utm_campaign=march2026
- Track clicks: CTA button, client showcase link, design resources
- Success metrics: >25% open rate, >3% CTR

NEXT STEPS:
1. Review content and approve
2. Designer creates email template with images
3. Upload to email platform (Mailchimp/Klaviyo)
4. Schedule send for Tuesday 9am
5. Monitor performance first 24 hours
```

**Customization options:**
```
Adjust tone:
"Make this more conversational, less formal.
We're talking to friends, not corporate clients."

Add urgency:
"Include time-sensitive spring promotion -
15% off website packages booked in March."

Personalize:
"Add dynamic content blocks:
- Property owners see market update
- Business owners see client showcase
- Both see design trends"

Shorten:
"Cut to 500 words - focus only on property
market update and new client showcase."
```

---

### /competitive-analysis - Deep Market Intelligence

**What it does:**
Comprehensive competitive research report with strategic recommendations

**When to use:**
- New client onboarding (understand their competitive landscape)
- Monthly monitoring (track competitor changes)
- Pricing decisions (benchmark against market)
- Positioning strategy (identify differentiation opportunities)

**How to use:**
```
Full analysis:
"Run /competitive-analysis for:

Client: Seaside Wellness Spa
Competitors:
- serenityspamooloolaba.com
- coastalwellnessretreats.com
- oceanbreezetherapy.com.au

Focus areas:
- Pricing (service rates, packages)
- Service offerings (what's unique)
- Website UX and booking flow
- SEO keywords and rankings
- Social media engagement
- Brand positioning and messaging
- Customer reviews and sentiment

Provide actionable differentiation strategy."

Quick check:
"Run quick /competitive-analysis -
has [competitor.com] changed pricing or
added new services in the last 30 days?"

Pricing focus:
"Competitive pricing analysis only for
boutique hotels in Mooloolaba (3 competitors).
What's the average nightly rate? Package pricing?
Where should we position our client?"
```

**What happens:**
```
PHASE 1: Web Scraping (FireCrawl MCP)
- Scrapes all 3 competitor websites
- Downloads services pages, pricing, about pages
- Captures current content and structure

PHASE 2: SEO Analysis (DataForSEO MCP)
- Pulls ranking keywords for each competitor
- Analyzes backlink profiles
- Identifies ranking gaps and opportunities

PHASE 3: Social Media Monitoring (manual review + scraping)
- Instagram/Facebook follower counts
- Engagement rates
- Content themes and frequency

PHASE 4: Synthesis & Strategy
- Compares all data points
- Identifies market gaps
- Creates strategic recommendations
```

**Expected output:**
```
COMPETITIVE INTELLIGENCE REPORT
Client: Seaside Wellness Spa
Market: Day Spas - Mooloolaba, Sunshine Coast
Date: March 4, 2026

---

EXECUTIVE SUMMARY

Market Position: Premium day spa market is competitive but
fragmented. No dominant player owns "ocean-view wellness"
positioning - this is our opportunity.

Key Finding: Competitors compete on price and promotions.
Client can differentiate through premium positioning +
ocean views + organic/local products.

Recommended Strategy: Position 20% above market average.
Focus on "wellness experience" not "spa treatment". Target
affluent locals + tourists celebrating special occasions.

---

COMPETITOR 1: SERENITY SPA MOOLOOLABA

Overview:
- Established: 2018
- Location: Main Beach, Mooloolaba
- Staff: 6 therapists
- Differentiator: "Affordable luxury"

Pricing:
- Swedish Massage (60min): $95
- Facial (60min): $110
- Packages: $180-$320
- Strategy: Mid-market pricing, frequent promotions

Services:
- Core: Massage, facials, body treatments
- Unique: Hot stone therapy, couples packages
- Missing: Wellness programs, holistic health

Website UX:
- Booking: 4-click process (friction)
- Mobile: Not fully optimized
- Speed: 3.2s load time (slow)
- Design: Dated (circa 2019), stock photos

SEO Performance (DataForSEO):
- Top Keyword: "day spa Mooloolaba" (#3)
- Total Ranking Keywords: 87
- Backlinks: 34 (low authority)
- Traffic Estimate: 800 visits/month

Social Media:
- Instagram: 2,400 followers
- Engagement Rate: 2.1% (below average)
- Post Frequency: 2-3 times/week
- Content: Treatment photos, promotions

Customer Sentiment (Reviews):
- Google Rating: 4.3/5 (127 reviews)
- Common Praise: "Relaxing atmosphere", "friendly staff"
- Common Criticism: "Booking system confusing", "dated decor"

Strengths:
- Established local reputation
- Affordable pricing attracts price-conscious market
- Consistent social media presence

Weaknesses:
- Website UX creates booking friction
- Dated design reduces premium perception
- No unique positioning (generic "day spa")
- Heavy promotion dependency (devalues brand)

---

COMPETITOR 2: COASTAL WELLNESS RETREATS
[Similar detailed analysis...]

---

COMPETITOR 3: OCEAN BREEZE THERAPY
[Similar detailed analysis...]

---

COMPARATIVE ANALYSIS

Pricing Benchmark:
Average massage (60min): $102
Average facial (60min): $118
Average package: $245
Our Recommendation: $125 massage, $145 facial, $295 packages
(Premium positioning - 20% above market)

Service Gaps (Opportunities):
- No competitor offers ocean-view treatment rooms
- No competitor emphasizes organic/local products
- No competitor has holistic wellness programs (yoga, meditation)
- No competitor targets couples celebration market specifically

SEO Opportunities:
- "ocean view spa Mooloolaba" - No competition (0 results)
- "organic spa treatments Sunshine Coast" - Low competition
- "wellness retreat Mooloolaba" - Dominated by resorts (not day spas)
- "couples spa package Mooloolaba" - Medium competition, winnable

Website UX Advantage:
- All competitors have 3-4 click booking flows
- Opportunity: One-click booking (phone or online)
- All competitors lack mobile optimization
- Opportunity: Mobile-first design

Social Media White Space:
- No competitor focuses on "wellness lifestyle" content
- Opportunity: Educational content (self-care tips, wellness advice)
- Average engagement rate: 2.3%
- Opportunity: >4% with authentic content strategy

---

STRATEGIC RECOMMENDATIONS

1. POSITIONING
Position: "Coastal Wellness Sanctuary"
Not a spa, a wellness experience.

Messaging:
- Primary: "Ocean-view wellness for mind, body, spirit"
- Secondary: "Locally-sourced organic treatments"
- Tertiary: "Your coastal sanctuary for renewal"

Differentiation:
- Ocean views (unique to us)
- Holistic approach (not just treatments)
- Local/organic products (environmental values)
- Premium but not pretentious

Target Market:
Primary: Affluent women 35-60, health-conscious,
value experience over price
Secondary: Couples celebrating occasions
(anniversaries, babymoons, getaways)

2. PRICING STRATEGY
- Premium positioning (20% above market)
- No discounts/promotions (devalues brand)
- Value-based pricing (experience, not time)
- Package incentives (not price cuts)

Recommended Rates:
- Signature Ocean Massage (60min): $125
- Organic Coastal Facial (60min): $145
- Couples Oceanfront Package (2hrs): $295
- Half-Day Wellness Retreat (4hrs): $450

3. SEO STRATEGY
Primary Keywords (Low Competition, High Intent):
- "ocean view spa Mooloolaba"
- "wellness retreat Mooloolaba couples"
- "organic spa treatments Sunshine Coast"

Secondary Keywords:
- "day spa Mooloolaba" (defend against competitors)
- "luxury massage Sunshine Coast"
- "holistic wellness Mooloolaba"

Content Strategy:
- 12 blog posts targeting long-tail wellness keywords
- FAQ page targeting "couples spa", "wellness programs"
- Location pages for each Sunshine Coast suburb

4. WEBSITE UX
Must-haves:
- One-click booking (phone + online form)
- Mobile-first design (60% traffic is mobile)
- <2 second load time
- Ocean view imagery throughout
- Trust signals (certifications, testimonials)

Conversion Optimizations:
- Above-fold CTA on every page
- Click-to-call button (mobile)
- Live chat for questions
- Gift certificate purchase (easy process)

5. SOCIAL MEDIA STRATEGY
Focus: Instagram (primary platform for target market)

Content Pillars:
- Wellness education (40%): Tips, advice, self-care
- Behind-the-scenes (30%): Team, products, philosophy
- Customer experiences (20%): Testimonials, results
- Coastal lifestyle (10%): Ocean views, local connection

Engagement Target: 4-5% (double competitor average)
Post Frequency: 4-5 times/week
Stories: Daily (behind-scenes, tips, Q&A)

6. MONTHLY MONITORING PLAN
Track competitor changes:
- Pricing adjustments
- New service additions
- Website redesigns
- SEO ranking shifts
- Social media campaigns

Monthly Report Includes:
- Any strategic moves by competitors
- Our ranking progress vs. competitors
- Market share estimates
- Recommended tactical adjustments

---

IMPLEMENTATION ROADMAP

Month 1: Foundation
- Website launch (SEO optimized, one-click booking)
- Social media profiles setup
- Google Business Profile optimization
- Initial content creation (4 blog posts)

Month 2: Growth
- Google Ads launch (brand + competitors)
- Meta Ads launch (retargeting)
- Email marketing setup (welcome sequence)
- Content marketing (4 more blog posts)

Month 3: Scale
- Influencer partnerships (local wellness influencers)
- Strategic partnerships (hotels, concierges)
- PR outreach (local media, wellness publications)
- Review generation campaign

Month 4-6: Optimize
- A/B testing (ads, website, messaging)
- Double down on what's working
- Scale successful channels
- Launch referral program

---

SUCCESS METRICS

Month 3 Goals:
- Website traffic: 2,000 visits/month
- Booking conversions: 3% (60 bookings)
- SEO: Rank #1 for "ocean view spa Mooloolaba"
- Social: 1,000 Instagram followers, 4% engagement

Month 6 Goals:
- Website traffic: 4,000 visits/month
- Booking conversions: 4% (160 bookings)
- SEO: Rank top 3 for 20+ keywords
- Social: 2,500 Instagram followers, 5% engagement

Month 12 Goals:
- Market leader in "premium wellness" category
- 80% capacity (sustainable, not overwhelmed)
- 5% above market pricing (maintained, no discounting)
- Strong brand recognition across Sunshine Coast

---

COMPETITIVE THREATS TO MONITOR

Short-term (0-3 months):
- Competitor price wars (don't follow them down)
- New spa opening (monitor but don't panic)

Medium-term (3-12 months):
- Competitor website redesigns (maintain our UX advantage)
- Competitor service additions (stay ahead with innovation)

Long-term (12+ months):
- Market saturation (differentiation becomes critical)
- Economic downturn (premium positioning tested)

---

FINAL RECOMMENDATION

This market is ripe for disruption. Competitors are competing
on price and promotions - a race to the bottom.

Our opportunity: Premium positioning through unique ocean
views, holistic wellness approach, and authentic local/organic
values. Target affluent market that values experience over price.

Avoid: Discounting, generic "day spa" positioning, following
competitors into price wars.

Lean into: Ocean views (literal differentiator), wellness
lifestyle (not just treatments), premium without pretension.

This strategy positions Seaside Wellness Spa for sustainable
premium market leadership while competitors fight over
bargain-hunters.

---

Next Steps:
1. Review this report with client
2. Get buy-in on premium positioning strategy
3. Begin implementation (website, SEO, social)
4. Set up monthly competitive monitoring
5. Track success metrics against goals

Report prepared by: Coastal Design Studio
Date: March 4, 2026
```

**How to use this report:**
```
Present to client:
"Create client presentation deck from competitive
analysis. Highlight: market opportunity, our
unique differentiation, strategic recommendations,
projected ROI."

Refine strategy:
"Client is nervous about premium pricing. Show them
the data on why competing on price is a losing strategy
in this market."

Implement tactically:
"Based on competitive analysis, create our Google Ads
campaign targeting the SEO gaps we identified."

Monitor monthly:
"Set up monthly competitive monitoring. Alert me if
any competitor makes strategic moves in the areas
we're targeting."
```

---

## CLIENT ONBOARDING PROCESS (Complete Walkthrough)

### Week 1: Discovery & Research

**Day 1: Client Kickoff Call**

After client meeting, document everything:
```
"Create client onboarding brief for [Client Name]:

Business: [Type]
Location: [Suburb, Sunshine Coast]
Services: [List]
Target Market: [Demographics, psychographics]
Differentiators: [What makes them unique]
Brand Personality: [Adjectives describing desired brand]
Competitors: [3-5 competitor domains]
Goals: [Business objectives]
Budget: [Project budget]
Timeline: [Launch deadline]

Save this as our project brief for all future work."
```

**Day 2-3: Run Client Pipeline**
```
"Run /client-pipeline using the brief we just created.

Special instructions:
- Brand concepts should feel [specific aesthetic]
- Website must emphasize [key differentiator]
- SEO focus on [specific suburbs]
- Primary CTA is [phone/form/booking]

Generate complete package."
```

**Day 4: Internal Review**
```
Review outputs:
"Walk me through each component of the client package.
Are the brand concepts aligned with their business goals?
Does the website structure support their conversion objectives?"

Refine as needed:
"The Brand Concept B feels closest but needs more [specific].
Update it to emphasize [adjustment]."
```

**Day 5: Client Presentation**
```
"Create client presentation deck:

Slides:
1. Welcome / Agenda
2. Our Understanding (project brief)
3. Competitive Landscape (key findings)
4. Brand Concept A (3 slides: overview, mood board, applications)
5. Brand Concept B (3 slides)
6. Brand Concept C (3 slides)
7. Website Structure Preview (sitemap + homepage mockup)
8. SEO Strategy Overview
9. Marketing Roadmap (ads, social, content)
10. Timeline & Next Steps
11. Investment & Agreement

Make it visual, professional, coastal aesthetic throughout."
```

Present to client, get feedback and decision.

---

### Week 2: Brand Finalization & Design

**Client chooses Brand Concept B. Now refine it:**
```
"Client selected Concept B: Modern Wellness Haven.

Updates needed based on feedback:
- They want warmer, more welcoming (less clinical)
- Emphasize sustainability/eco-conscious more
- Include couples/romance angle (Valentine's gift market)

Refine Concept B with these adjustments:
- Update tagline options
- Adjust color palette (warmer tones)
- Revise messaging pillars
- Create detailed brand guidelines document"
```

**Create comprehensive brand guidelines:**
```
"Create complete brand guidelines document for
[Client Name] - Concept B (Modern Wellness Haven):

Include:
- Brand story and positioning
- Logo usage guidelines
- Color palette (with hex codes)
- Typography system
- Photography style
- Voice and tone guidelines
- Messaging framework
- Do's and Don'ts

Format as professional PDF ready for designer handoff."
```

---

### Week 3-4: Website Development

**Brief designer with finalized brand:**
```
"Create designer brief for [Client Name] website:

Pages needed:
1. Homepage
2. Services
3. About
4. Bookings/Contact
5. Blog

For each page provide:
- Wireframe structure
- Copy (finalized from pipeline)
- Image requirements (with Envato stock photo links)
- CTA placement
- Conversion optimization notes

Designer will build in Elementor - our brief covers
structure, copy, conversion strategy."
```

**While designer works, prepare technical setup:**
```
"Create technical setup checklist for [Client Name]:

Hosting:
- Provision WP Engine account
- Install WordPress
- Install required plugins (list them)
- Configure security settings

SEO:
- Install Yoast SEO Premium
- Configure XML sitemaps
- Set up Google Search Console
- Set up Google Analytics 4
- Create initial page title/meta templates

Performance:
- Set up WP Rocket caching
- Configure CDN
- Optimize database settings

Provide step-by-step technical setup instructions."
```

---

### Week 5-6: SEO & Content

**Implement SEO strategy from pipeline:**
```
"Using the SEO strategy we created in /client-pipeline:

1. Optimize all 5 pages with target keywords
2. Create 4 initial blog posts targeting:
   - [Keyword 1]
   - [Keyword 2]
   - [Keyword 3]
   - [Keyword 4]

For each blog post:
- 800-1000 words
- SEO-optimized (title, meta, headers, internal links)
- Client brand voice
- Include images (provide Envato stock photo links)
- CTA at end (book appointment)
- Readable, engaging, valuable content

Write all 4 blog posts."
```

**Set up local SEO:**
```
"Create local SEO setup checklist:

Google Business Profile:
- Complete profile optimization
- Category selection
- Business description (SEO optimized)
- Service area setup (Sunshine Coast suburbs)
- Photo uploads (15-20 high-quality images)
- Post initial update

Local Citations:
- Identify top 20 citation sources for [business type] in Australia
- Create citation submission spreadsheet
- Draft business description (consistent NAP)

Schema Markup:
- LocalBusiness schema for homepage
- Service schema for services page
- Review schema for testimonials

Provide detailed setup instructions for each."
```

---

### Week 7: Marketing Launch Preparation

**Set up Google Ads campaigns from pipeline:**
```
"Using the Google Ads strategy from /client-pipeline:

Set up campaigns in Google Ads interface:

Campaign 1: Brand Awareness
- Budget: $30/day
- Keywords: [from pipeline]
- Ad copy: [from pipeline]
- Extensions: Callout, sitelink, call

Campaign 2: Service-Specific
- Budget: $40/day
- Keywords: [from pipeline]
- Ad copy: [from pipeline]
- Extensions: [configured]

Campaign 3: Competitor
- Budget: $20/day
- Keywords: [competitor terms]
- Ad copy: [from pipeline]

Provide:
- Campaign setup instructions
- Tracking tag installation guide
- Conversion setup steps
- Initial bid recommendations"
```

**Set up Meta Ads:**
```
"Create Meta Ads setup for [Client Name]:

Using strategy from /client-pipeline:

Campaign 1: Warm Audience (Website Visitors)
- Objective: Conversions (booking)
- Audience: Website visitors (last 30 days)
- Creative: [20 ad variations from pipeline]
- Budget: $300/month

Campaign 2: Lookalike Audience
- Objective: Traffic
- Audience: Lookalike (website visitors)
- Creative: [awareness-focused ads]
- Budget: $200/month

Provide:
- Pixel installation instructions
- Audience creation steps
- Ad creative specifications
- Campaign setup guide"
```

---

### Week 8: Launch & Handoff

**Pre-launch checklist:**
```
"Create pre-launch checklist for [Client Name]:

Technical:
[ ] SSL certificate installed
[ ] All pages load correctly
[ ] Mobile responsive (test all pages)
[ ] Forms working (test submissions)
[ ] Phone click-to-call working
[ ] Online booking system tested
[ ] All images optimized (<200KB)
[ ] Page speed >90 (mobile + desktop)

SEO:
[ ] Google Search Console verified
[ ] Google Analytics 4 tracking
[ ] XML sitemap submitted
[ ] Robots.txt configured
[ ] All pages have unique title/meta
[ ] Schema markup validated
[ ] Internal links working
[ ] No broken links

Marketing:
[ ] Google Ads campaigns live
[ ] Meta Ads campaigns live
[ ] Conversion tracking verified
[ ] Google Business Profile optimized
[ ] Social media profiles created
[ ] Email marketing platform configured

Content:
[ ] All page copy finalized
[ ] 4 blog posts published
[ ] About/bio content complete
[ ] Service descriptions detailed
[ ] Testimonials (if available) added

Run through entire checklist and confirm status of each item."
```

**Launch day:**
```
"It's launch day for [Client Name]!

Tasks:
1. Final check of all items on pre-launch checklist
2. Make website live (remove 'coming soon')
3. Submit sitemap to Google Search Console
4. Launch Google Ads campaigns
5. Launch Meta Ads campaigns
6. Post 'Grand Opening' on Google Business Profile
7. Post launch announcement on social media
8. Send launch email to client's email list (if they have one)
9. Monitor for any issues first 24 hours

Create launch day task list with timing and ownership."
```

**Client handoff:**
```
"Create client handoff package for [Client Name]:

Documents:
1. Website login credentials (secure document)
2. Hosting account details
3. Google Ads account access
4. Google Analytics access
5. Social media accounts
6. Brand guidelines (PDF)
7. Content calendar (next 3 months)
8. SEO strategy document
9. Monthly maintenance plan
10. How to request changes/updates

Training:
- Schedule 1-hour training call
- Create training video (screen recording):
  * How to write a blog post
  * How to update service pages
  * How to check analytics
  * How to respond to Google reviews

Ongoing Support:
- Explain monthly maintenance plan
- Set expectations for response times
- Provide emergency contact info

Package everything professionally and send to client."
```

---

## WEEKLY MAINTENANCE WORKFLOW (Detailed)

### Monday Morning: Trigger Maintenance
```bash
# 9:00 AM - Start your week
cd ~/Projects/COASTALDESIGNSTUDIO
claude
```

**In Claude:**
```
Load context:
@CLAUDE.md

Trigger maintenance:
/maintenance

GSD will now:
"Running weekly maintenance workflow for all 10 clients.

Executing in parallel:
- Security updates (Subagent 1)
- SEO optimization (Subagent 2)
- Performance checks (Subagent 3)
- Broken link detection (Subagent 4)
- Report generation (Subagent 5)

Estimated completion: 11:00 AM
You'll be notified when ready for review."
```

**You can now work on other things. GSD runs autonomously.**

---

### Wednesday Morning: Review Maintenance Results
```
10:00 AM - Review session:

"Show me this week's maintenance report summary.
Highlight any clients with issues that need my attention."

Response:
"WEEKLY MAINTENANCE SUMMARY - March 4, 2026

8 clients: Clean (no issues)
2 clients: Attention needed

ATTENTION NEEDED:

Client: Beachfront Properties Noosa
Issue: Plugin conflict detected (Yoast SEO + custom plugin)
Action needed: Manual review and resolution
Estimated time: 30 minutes

Client: Oceanfront Cafe Caloundra
Issue: Broken external link to supplier website (no longer active)
Action needed: Find replacement link or remove
Estimated time: 15 minutes

ALL OTHER CLIENTS: Approved for deployment."

Your response:
"For the 8 clean clients, approve deployment for Friday 5pm.

For Beachfront Properties, show me details on the plugin
conflict. Let's resolve it now.

For Oceanfront Cafe, remove the broken supplier link and
replace with a link to their 'About Our Ingredients' page instead."
```

**Resolve flagged issues:**
```
"Okay, I've reviewed the plugin conflict. It's a namespace
collision in the custom reviews plugin. Here's the fix:

[Claude provides code fix]

Should I apply this fix to the staging site for testing?"

Your response:
"Yes, apply fix to staging. Then run full site test to
ensure no other issues. If clean, schedule for production
deployment Friday."
```

---

### Friday Afternoon: Deploy Updates
```
5:00 PM - Final deployment:

"Deploy all approved maintenance updates to production:

8 clean clients: Deploy immediately
Beachfront Properties: Deploy plugin fix (tested on staging)
Oceanfront Cafe: Deploy link fix

After deployment, run final smoke test on all sites to
confirm everything is working.

Generate client maintenance reports (send Monday morning)."

Response:
"Deploying updates to all 10 client sites...

All updates deployed successfully
Smoke tests passed (all sites responsive)
Client reports generated and ready

CLIENT REPORTS READY TO SEND:
- Beachfront Properties Noosa: [Report Link]
- Oceanfront Cafe Caloundra: [Report Link]
- Seaside Wellness Spa: [Report Link]
[...continues for all clients]

Recommended: Review reports Monday morning before sending to clients."
```

---

### Monday Morning (Next Week): Send Client Reports
```
"Send weekly maintenance reports to all clients.

Email template:
Subject: Weekly Website Maintenance Report - [Client Name]

Hi [Client],

Your weekly website maintenance has been completed. Here's
what we did this week:

Security Updates
- WordPress core: Up to date
- Plugins: 3 updates applied and tested
- No security vulnerabilities detected

SEO Optimization
- Updated 2 blog post meta descriptions
- Added 3 new internal links
- Schema markup: Validated

Performance
- Page speed: 95/100 (excellent)
- Database optimized
- Images: 5 images compressed

Site Health
- Uptime: 100% (monitored 24/7)
- No broken links detected
- SSL certificate: Valid

Your site is healthy and optimized!

Questions? Reply to this email or call us anytime.

Best regards,
[Your Name]
Coastal Design Studio

---

Send this email to all 10 clients with their specific report data."
```

---

## MONTHLY TASKS

### First Monday of Month: Newsletter Creation
```
"Create agency newsletter for [Current Month]:

Topics:
- [Seasonal topic relevant to Sunshine Coast]
- [Recent client success story - anonymized if needed]
- [Design/marketing trend relevant to our clients]
- [Team update or community involvement]

Include:
- 2-3 actionable tips readers can implement
- 1 soft CTA (schedule consultation)
- Links to recent blog posts
- Social media follow CTAs

800 words, sophisticated coastal voice."
```

Review, customize, send mid-month.

---

### Second Week: Competitive Monitoring
```
"Run monthly competitive monitoring for all active clients:

For each client:
1. Check if competitors changed pricing
2. Check if competitors added new services
3. Check if competitors launched marketing campaigns
4. Track SEO ranking changes (us vs. them)

Generate summary report:
- Any significant competitor moves
- Recommended tactical responses
- Opportunities to capitalize on

Flag urgently if any competitor makes major strategic move."
```

---

### Third Week: Performance Review
```
"Monthly performance review for all clients:

For each client, analyze:

Website Performance:
- Traffic (month-over-month)
- Bounce rate
- Top performing pages
- Conversion rate

SEO Performance:
- Keyword ranking changes
- Top ranking keywords
- New ranking opportunities
- Search Console issues

Ads Performance (if running):
- Google Ads ROI
- Meta Ads ROI
- Cost per conversion
- Wasted spend

Generate recommendations:
- What's working (do more)
- What's not (optimize or stop)
- New opportunities identified

Create client performance reports (for quarterly reviews)."
```

---

### Fourth Week: Content Planning
```
"Create content calendar for next month:

For each client:
- 2 blog post topics (SEO-targeted)
- 4 social media post ideas
- 1 email campaign idea
- Any seasonal/timely content opportunities

Provide:
- Topic titles
- Target keywords
- Brief outline
- Content angle/hook

This becomes the content production queue for next month."
```

---

## ADVANCED TECHNIQUES

### Combining Multiple Agents

**For complex client deliverables, chain agents together:**
```
"Multi-agent workflow for [Client Name] quarterly refresh:

Step 1: @competitive-intel
"Run competitive analysis - what have competitors changed
in last 3 months?"

Step 2: @seo-optimizer
"Based on competitive changes, update our keyword strategy.
What new opportunities exist?"

Step 3: @newsletter-writer
"Create quarterly client update incorporating competitive
insights and SEO wins. Sophisticated tone, data-backed."

Step 4: @design-inspiration
"Refresh design mood board based on latest coastal design
trends. What should we update on client's website?"

Execute all 4 steps and create comprehensive quarterly
refresh proposal."
```

---

### Using GSD for Complex Multi-Step Tasks

**GSD (Get Stuff Done) Framework handles complex workflows autonomously:**
```
"Use GSD Framework to execute this multi-step project:

Project: Complete website audit and optimization for [Client]

Phase 1: Discovery
- Analyze current website performance
- Identify technical SEO issues
- Review content quality
- Check competitor positions

Phase 2: Strategy
- Create prioritized issue list
- Develop optimization roadmap
- Estimate time/resources needed
- Get client approval (pause here for my review)

Phase 3: Execution
- Fix technical SEO issues
- Optimize existing content
- Create new content for gaps
- Improve site speed

Phase 4: Validation
- Run post-optimization tests
- Compare before/after metrics
- Document all changes
- Create client presentation

Execute phases 1-2, pause for my review before phase 3."
```

**GSD will:**
1. Break into subagents (each gets fresh 200k context)
2. Execute research in parallel
3. Synthesize findings
4. Present for your review before proceeding

---

### Saving Custom Prompts for Reuse

**When you create a great prompt, save it:**
```
"I want to save this prompt for future use:

Prompt Name: 'Coastal Real Estate Blog Post'

Prompt Text:
'Create SEO-optimized blog post for coastal real estate
client targeting [keyword].

Requirements:
- 1000 words
- Sophisticated luxury real estate voice
- Data-backed (include market statistics)
- Local Sunshine Coast references
- 3 internal links to property listings
- CTA: Schedule showing
- Include meta title/description
- Suggest hero image from Envato'

Save this as reusable template in my workspace."
```

Now you can call it anytime:
```
"Use 'Coastal Real Estate Blog Post' template.
Keyword: 'beachfront investment properties Noosa'
Client: Beachfront Properties Noosa"
```

---

### Context Management for Long Projects

**For multi-week projects, maintain context:**
```
Session 1 (Week 1):
"Start new project: [Client Name] complete rebrand.
Save all context from today's work to project file."

Session 2 (Week 2):
"Load project context for [Client Name] rebrand.
Continue where we left off - client approved Concept B.
Now develop full brand guidelines."

Session 3 (Week 3):
"Load [Client Name] rebrand context.
Brand guidelines complete. Now create website brief
for designer based on approved brand direction."
```

Each session picks up exactly where you left off.

---

### Batch Processing Multiple Clients

**Process similar tasks across all clients efficiently:**
```
"Batch operation: Update meta descriptions for all clients

For each of our 10 clients:
1. Load current homepage meta description
2. Analyze if it's optimized for their primary keyword
3. If not optimized, rewrite it using their brand voice
4. Provide before/after comparison
5. Note estimated SEO impact

Create spreadsheet with all recommendations.
Flag any client where current meta is actually good (don't fix what works)."
```

---

## TROUBLESHOOTING

### Agent Not Responding as Expected

**Problem:** `@brand-refiner` gives generic output, not coastal-focused

**Solution:**
```
"@brand-refiner is not applying our coastal design principles.

Let me be more specific in my request:

Using @brand-refiner agent (which specializes in coastal
business branding), create 3 brand concepts for [Client].

Critical requirements:
- Sophisticated coastal aesthetic (not touristy/kitschy)
- Natural materials palette (ocean, sand, stone, sky)
- Premium positioning (affluent Sunshine Coast market)
- Environmental consciousness (sustainability matters here)

Reference our team standards in @CLAUDE.md for coastal
design principles.

Now create the 3 concepts."
```

**Key:** Be explicit about what you want, reference team context.

---

### MCP Connection Failing

**Problem:** `Error: Could not connect to WordPress MCP server`

**Diagnosis steps:**
```
1. Check MCP config:
"What MCP servers are configured? Show me current config."

2. Verify credentials:
Open ~/.claude/mcp.json and check:
- No PLACEHOLDER values remain
- Host/database names are correct
- Password is accurate (check 1Password)

3. Test connection manually:
wordpress-mcp --test-connection

4. Common issues:
- Database host changed (WP Engine updates)
- Password expired (rotate credentials)
- Firewall blocking connection
- MCP server not installed/updated

5. Fix:
Update ~/.claude/mcp.json with correct credentials
Restart Claude Code: exit and claude
```

---

### Slash Command Not Found

**Problem:** `/maintenance` returns "Command not found"

**Solution:**
```
1. Verify you're in correct directory:
pwd
# Should show: ~/Projects/COASTALDESIGNSTUDIO

If not:
cd ~/Projects/COASTALDESIGNSTUDIO
exit
claude

2. Check command exists:
ls -la .claude/commands/
# Should show maintenance.sh

3. Check command is executable:
chmod +x .claude/commands/maintenance.sh

4. Try again:
/maintenance
```

---

### Output Quality Issues

**Problem:** Generated content doesn't match brand voice

**Solution:**
```
"The content you generated doesn't match [Client]'s brand voice.

Their voice is: [Describe specific voice characteristics]

Examples of their voice:
[Paste 2-3 examples of their existing content]

Please regenerate using this specific voice. Match the
tone, vocabulary, sentence structure, and personality
you see in the examples."
```

**Key:** Provide examples, be specific about voice characteristics.

---

### Git Issues

**Problem:** `git pull` shows conflicts

**Solution:**
```bash
# See what files have conflicts
git status

# If conflicts in your personal configs (shouldn't be in Git):
git reset --hard origin/main
# This discards your local changes to tracked files

# If conflicts in shared files:
git stash  # Save your local changes
git pull origin main  # Get team updates
git stash pop  # Reapply your changes
# Resolve conflicts manually
git add [resolved-files]
git commit -m "merge: resolve conflicts"
git push
```

**Prevention:** Pull before you start work each day:
```bash
cd ~/Projects/COASTALDESIGNSTUDIO
git pull origin main
claude
```

---

## BEST PRACTICES

### Daily Habits

**Start of day:**
```bash
1. cd ~/Projects/COASTALDESIGNSTUDIO
2. git pull origin main
3. claude
4. @CLAUDE.md (load team context)
```

**During work:**
```
5. Reference agents for specialized tasks
6. Use slash commands for routine workflows
7. Save important context for future sessions
```

**End of day:**
```
8. Document any client updates or issues
9. Save complex prompts for reuse
10. Exit cleanly: exit
```

---

### Effective Prompting

**Vague (avoid):**
```
"Create a website for a spa"
```

**Specific (preferred):**
```
"Using @brand-refiner, create brand concept for Seaside
Wellness Spa in Mooloolaba. Target: affluent women 35-60,
health-conscious. Differentiator: ocean-view treatment rooms,
organic products. Brand personality: serene luxury,
wellness-focused, environmental consciousness. Need 3
concept directions with taglines, color palettes,
visual mood."
```

**Key elements of effective prompts:**
1. **Agent reference** (if using specialized agent)
2. **Specific details** (who, what, where, why)
3. **Constraints** (voice, style, length)
4. **Desired output format** (what you want to receive)

---

### Team Collaboration

**When multiple people work on same client:**
```
"Load shared context for [Client Name].

Team member [Name] was working on this yesterday.
Show me summary of their work so I can continue
without duplicating efforts."
```

**Document your work for team:**
```
"Save today's work on [Client Name] to shared project notes:
- What was completed
- Decisions made
- Next steps needed
- Any blockers or questions

Make it easy for team member to pick up tomorrow."
```

---

### Quality Control

**Before sending anything to client, review:**
```
"Quality check this [deliverable] before I send to client:

1. Brand voice: Does it match their voice guidelines?
2. Accuracy: Are all facts/data correct?
3. Completeness: Did we address all requirements?
4. SEO: Is it optimized appropriately?
5. Visual appeal: Is it professionally formatted?
6. CTAs: Are calls-to-action clear and appropriate?
7. Proofreading: Any typos or errors?

Flag any issues before I send."
```

---

### Staying Organized

**Use consistent naming:**
```
Client files:
- client-name-brand-guidelines.pdf
- client-name-website-brief.md
- client-name-seo-strategy.xlsx
- client-name-competitive-analysis.pdf

This makes files easy to find and share.
```

**Track client status:**
```
"Create client status dashboard:

For each active client show:
- Current project phase
- Last activity date
- Next milestone
- Any blockers
- Health status (green/yellow/red)

Update this weekly so team knows status at a glance."
```

---

### Continuous Improvement

**Monthly review:**
```
"End-of-month team review:

What workflows worked well this month?
What was frustrating or inefficient?
What new agents or commands would improve our work?
What training or documentation is needed?

Generate list of improvements to implement next month."
```

**Learn from successes:**
```
"That [deliverable] for [Client] turned out really well.

What made it successful?
What can we replicate for other clients?
Should we create a template or reusable process?

Document this as a best practice for the team."
```

---

## GETTING HELP

### When Stuck

1. **Reference team context:** `@CLAUDE.md`
2. **Ask Claude directly:** "I'm trying to [task] but [problem]. What should I do?"
3. **Check this guide:** Search for your issue in Table of Contents
4. **Ask team:** #coastal-design-studio Slack channel
5. **Escalate:** Tag team lead if urgent or blocking

---

### Common Questions

**"How do I [specific task]?"**
→ Search this guide or ask Claude: "How do I [task] for [context]?"

**"Why isn't [something] working?"**
→ See Troubleshooting section above

**"Can I customize [agent/command]?"**
→ Yes! Talk to team lead about your idea. We can update agents.

**"What if client asks for something outside our usual scope?"**
→ Ask Claude: "Client requested [unusual thing]. How should we approach this?"
Then discuss with team lead before committing.

---

## REMEMBER

**Claude Code is a tool, not magic.**

It excels at:
- Execution when given clear context
- Maintaining consistency across repetitive tasks
- Saving hours on routine work
- Enabling you to focus on creative strategy

It still needs:
- Your expertise and judgment
- Clear instructions
- Review before client delivery
- Your client relationships

**Your job:** Provide creative direction, strategic thinking, client relationships, quality control.

**Claude's job:** Execute efficiently, maintain consistency, research thoroughly, draft quickly.

**Together:** Deliver exceptional coastal design + marketing services at scale.

---

**Welcome to Coastal Design Studio. Let's build something beautiful together.**

---

**Document Version:** 1.0
**Last Updated:** February 2026
**Questions?** #coastal-design-studio Slack channel
