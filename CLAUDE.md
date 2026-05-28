# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**TalentOps Aggregator Platform** - A static web platform acting as an aggregator marketplace and analytics hub for:
1. Medical Check Up (MCU)
2. Man Power Supply
3. Training
4. Psychological Test

The platform connects **Partners** (vendors/providers) with **Companies** (clients) who need these services through their HR applications.

## Architecture

### Pure Static Frontend
- **NO backend** - All data is mock JSON/static data
- **NO database** - Uses static JSON files in `/data/`
- HTML-first architecture with Alpine.js for lightweight interactivity

### Three Applications

1. **Public Portal** (`/apps/public-portal/`)
   - Open to anyone - no login required
   - Companies can place orders directly without HR system integration
   - Includes order tracking functionality

2. **Aggregator Platform** (`/apps/aggregator-platform/`)
   - Actors: Partner, Aggregator Internal Admin, Company Viewer (readonly)
   - Main centralized platform for managing orders and analytics

3. **HR Application** (`/apps/hr-app/`)
   - Actor: HR Admin
   - Mock application representing a company's internal HR system
   - HR Admins create orders here that sync to Aggregator Platform

### Folder Structure

```
/apps
  /public-portal          # Public order portal (no login required)
  /aggregator-platform    # Main platform pages
  /hr-app                 # HR application mock
/components               # Reusable UI components
/layouts                  # Shared layout templates
/data                     # Mock JSON data files
/assets
  /css                    # Stylesheets (Tailwind output)
  /js                     # JavaScript utilities
  /images                 # Static images
```

## Tech Stack

- **HTML5** - Semantic markup
- **TailwindCSS** - Utility-first CSS (via CDN for static simplicity)
- **Alpine.js** - Lightweight JavaScript framework for reactivity
- **Lucide Icons** - Icon library (via CDN)
- **Chart.js** or **ApexCharts** - Charts and visualizations (via CDN)

## Design System

### Visual Style
- Modern gradient backgrounds (warm orange to cool blue transitions)
- Glassmorphism effects with backdrop-blur
- Floating card animations and hover effects
- Rounded-2xl/rounded-3xl corners throughout
- Lifestyle-inspired aesthetic (similar to ilovelife.co.id)
- Animated blobs and decorative elements
- Smooth transitions and micro-interactions
- Responsive: Desktop first, tablet responsive, mobile adaptive

### Color Palette
- **Primary**: Brand Orange (#f97316), Ocean Blue (#0ea5e9), White
- **Gradients**: Orange-to-blue transitions for hero sections
- **Background**: Warm cream (#fff7ed) to cool blue gradients
- **Accent**: Violet, Emerald, Rose for category differentiation
- **Risk Colors**: Red (high), Amber (medium), Green (low)
- **Glass Effect**: White with 85% opacity + backdrop blur

### Typography
- **Display Font**: Plus Jakarta Sans (bold, modern headers)
- **Body Font**: Inter (clean, readable body text)
- Gradient text effects for highlights
- Strong hierarchy with large display headings
- Small muted descriptions with good contrast

### Key Components
- Cards with soft shadows
- Tables with clean rows
- Badges and status pills
- KPI blocks with metrics
- Analytics widgets with charts
- Activity timelines
- AI Insight panels with recommendations
- Empty states

## Development Workflow

### No Build Step Required
This is a pure static site. Open HTML files directly in browser or serve with any static server:

```bash
# Using Make (podman + nginx)
make run

# Python 3
python3 -m http.server 8000

# Node.js (if npx available)
npx serve .

# PHP
php -S localhost:8000
```

Then navigate to http://localhost:8080 (or the port specified).

### TailwindCSS Setup
Using Tailwind via CDN for zero build configuration:

```html
<script src="https://cdn.tailwindcss.com"></script>
<script>
  tailwind.config = {
    theme: {
      extend: {
        colors: {
          // Custom colors if needed
        }
      }
    }
  }
</script>
```

### CDN Dependencies
Include these in all HTML files:

```html
<!-- TailwindCSS -->
<script src="https://cdn.tailwindcss.com"></script>

<!-- Alpine.js -->
<script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>

<!-- Lucide Icons -->
<script src="https://unpkg.com/lucide@latest"></script>

<!-- Chart.js -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
```

## Data Model (Mock JSON)

Data structures stored in `/data/` as JSON files:

### Partners
```json
{
  "id": "uuid",
  "name": "string",
  "category": ["MCU", "Training", "Psychological Test", "Man Power Supply"],
  "branches": [...],
  "SLA": "string",
  "rating": number
}
```

### Companies
```json
{
  "id": "uuid",
  "name": "string",
  "industry": "string"
}
```

### Orders
```json
{
  "id": "uuid",
  "category": "string",
  "partner_id": "uuid",
  "company_id": "uuid",
  "status": "pending|processing|completed|cancelled",
  "created_at": "ISO date"
}
```

### AI Insights
```json
{
  "risk_score": number,
  "summary": "string",
  "recommendation": "string",
  "trend": "up|down|stable"
}
```

## Page Structure

### Public Portal Pages (Lifepal-Style Flow)

**Flow:** Category → Subcategory → Partner Packages → Order Details → Company Info

- `/apps/public-portal/index.html` - Interactive multi-step order form:
  1. **Category Selection** - Choose MCU, Training, Psych Test, or Man Power
  2. **Subcategory Selection** - E.g., MCU: New Employee, Routine, Executive, Custom
  3. **Partner Packages** - Compare partner offerings with logos, features, prices
  4. **Order Details** - Employee count, department, schedule, location
  5. **Company Information** - Company data, PIC contact info
- `/apps/public-portal/track-order.html` - Track order status by reference ID

**Design Patterns:**
- Clean cards with hover effects
- Progress bar showing current step
- Partner comparison with ratings and feature tags
- Price formatting in Indonesian Rupiah
- Blue brand color scheme (`brand-600: #2563eb`)

### Aggregator Platform Pages

**Auth Pages:**
- `/apps/aggregator-platform/login.html` - Login (Partner, Admin, Company Viewer)
- `/apps/aggregator-platform/register-partner.html` - Partner registration

**Partner Dashboard:**
- `/apps/aggregator-platform/partner/dashboard.html` - Overview with KPIs, charts, activity
- `/apps/aggregator-platform/partner/employee-database.html` - AI-extracted employee health database
- `/apps/aggregator-platform/partner/employee-detail.html` - Individual employee health analytics (Diabetes, Hypertension, Obesity, Heart Disease)
- `/apps/aggregator-platform/partner/mcu-orders.html` - MCU orders table with upload results feature
- `/apps/aggregator-platform/partner/mcu-analytics.html` - Health analytics with AI insights
- `/apps/aggregator-platform/partner/training-programs.html` - Training programs list
- `/apps/aggregator-platform/partner/training-analytics.html` - Training effectiveness
- `/apps/aggregator-platform/partner/psychological-orders.html` - Psych test orders
- `/apps/aggregator-platform/partner/psychological-analytics.html` - Personality analysis
- `/apps/aggregator-platform/partner/workforce-requests.html` - Man power requests
- `/apps/aggregator-platform/partner/workforce-analytics.html` - Fulfillment metrics
- `/apps/aggregator-platform/partner/profile.html` - Partner profile

**Admin Dashboard:**
- `/apps/aggregator-platform/admin/dashboard.html` - Global analytics
- `/apps/aggregator-platform/admin/orders.html` - Unified order management
- `/apps/aggregator-platform/admin/ai-analytics.html` - AI Analytics Center (most important page)

**Company Viewer:**
- `/apps/aggregator-platform/company/dashboard.html` - Readonly view of orders and analytics

### HR Application Pages

- `/apps/hr-app/dashboard.html` - HR Admin dashboard
- `/apps/hr-app/create-order.html` - Create new orders (critical page)
- `/apps/hr-app/order-history.html` - Past orders with sync status
- `/apps/hr-app/analytics.html` - Simplified workforce analytics

## Key UX Patterns

### AI Analytics Experience
Pages with AI analytics should feel:
- Intelligent and executive-level
- Data-driven with strategic insights
- Include confidence indicators
- Show AI-generated summaries and recommendations

### Mock Integration Flow
Simulate the HR-to-Aggregator sync:
1. HR Admin creates order in HR App
2. Show fake synchronization animation/loading
3. Order appears in Aggregator Platform
4. Partner receives and processes order
5. AI analytics generate insights

### Chart Types Needed
- Line charts for trends
- Donut charts for distributions
- Heatmaps for risk visualization
- Radar charts for competency analysis

## Shared Components

Create reusable components in `/components/`:

- `sidebar.html` - Navigation sidebar
- `topbar.html` - Top navigation bar
- `kpi-card.html` - Metric display card
- `analytics-card.html` - Chart container
- `data-table.html` - Sortable/filterable table
- `badge.html` - Status badges
- `timeline.html` - Activity timeline
- `ai-insight-panel.html` - AI-generated insights display

## Common Tasks

### Adding a New Page
1. Create HTML file in appropriate `/apps/` subdirectory
2. Include standard CDN dependencies
3. Copy layout structure from existing page
4. Add navigation link to sidebar

### Adding Mock Data
1. Create or edit JSON file in `/data/`
2. Use Alpine.js `x-init` to fetch: `fetch('/data/partners.json').then(r => r.json())`
3. Render with `x-for` loops

### Partner Upload Feature
Partners can upload MCU/Training/Psych Test results:
1. Go to order page (e.g., `mcu-orders.html`)
2. Click on an order to open detail modal
3. Click "Upload Results" button (visible for Processing/Completed orders)
4. Select upload type: Medical Results, Reports, Certificates, or Raw Data
5. Drag & drop or click to select files (PDF, Excel, CSV, Word)
6. Submit - AI will automatically extract data for employee database

**Upload Types:**
- `results` - Medical/Training results (AI extraction enabled)
- `raw_data` - Raw data files for AI extraction to employee database
- `reports` - Detailed analysis reports
- `certificates` - Completion/fitness certificates

### Employee Database (AI-Extracted)
Partner-accessible database of employee health data extracted from MCU results:
- **Location:** `/apps/aggregator-platform/partner/employee-database.html`
- **Data Source:** AI extraction from uploaded MCU/Training results
- **Health Metrics Tracked:**
  - Diabetes Mellitus (glucose levels, risk scoring)
  - Hypertension (blood pressure analysis)
  - Obesity (BMI calculation and categorization)
  - Heart Disease (cholesterol, cardiovascular risk)
- **Features:** Search, filter by risk level, company, individual detail view with charts

### Employee Detail Analytics
Individual employee health profile with:
- 4 health condition cards with risk levels and progress bars
- Health trends chart (6-month history)
- Risk distribution visualization
- AI-generated recommendations per condition
- Downloadable health report

### Adding Charts
1. Include Chart.js CDN
2. Wrap canvas in a container with fixed height: `<div class="relative h-64"><canvas id="chartId"></canvas></div>`
3. Set `maintainAspectRatio: false` in Chart options
4. Initialize in Alpine.js `x-init`

**Important:** Charts will expand infinitely without a fixed-height container. Always use `h-64`, `h-72`, or similar on the wrapper div.

## Reference Inspirations

- Vercel Dashboard
- Linear
- Stripe Dashboard
- shadcn/ui
- Retool
- Notion enterprise UI
