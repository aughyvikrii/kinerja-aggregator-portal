# SolusiSDM Aggregator Platform

A modern web platform that acts as an aggregator marketplace and analytics hub for HR services including Medical Check Up (MCU), Man Power Supply, Training, and Psychological Testing.

## Overview

The platform connects:
- **Partners** → Vendors/providers of services
- **Companies** → Companies that need these services through their HR applications

## Architecture

This is a **pure static frontend** application:
- No backend
- No database
- Mock JSON/static data
- HTML-first architecture

### Two Applications

1. **Aggregator Platform** (`/apps/aggregator-platform/`)
   - Partners manage incoming orders
   - Admins view global analytics
   - Company viewers see readonly summaries

2. **HR Application** (`/apps/hr-app/`)
   - HR Admins create orders
   - Orders sync to Aggregator Platform

## Tech Stack

- HTML5 with semantic markup
- TailwindCSS (via CDN)
- Alpine.js for lightweight interactivity
- Lucide Icons
- Chart.js for visualizations

## Getting Started

Open `index.html` in your browser or serve with any static server:

```bash
# Python 3
python3 -m http.server 8000

# Node.js
npx serve .
```

Then navigate to:
- http://localhost:8000/apps/aggregator-platform/login.html - Aggregator Platform
- http://localhost:8000/apps/hr-app/dashboard.html - HR Application

## Design System

- Clean, minimal, spacious layouts
- White/neutral background with soft borders
- Enterprise SaaS aesthetic (inspired by shadcn/ui, Vercel Dashboard, Linear)
- Responsive: Desktop first, tablet responsive, mobile adaptive

## Project Structure

```
/apps
  /aggregator-platform    # Main platform (Partner, Admin, Company views)
  /hr-app                 # HR Application (HR Admin)
/components               # Reusable UI components
/layouts                  # Shared layout templates
/data                     # Mock JSON data files
/assets                   # Static assets
```

## Data

Mock data is stored in `/data/`:
- `partners.json` - Partner/vendor information
- `companies.json` - Company/client data
- `orders.json` - Order records
- `ai-insights.json` - AI analytics mock data
