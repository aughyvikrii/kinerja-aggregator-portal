# CLAUDE.md — Aggregator Platform Specification

## Project Overview

Build a modern web platform called **SolusiSDM Aggregator Platform** that acts as an aggregator marketplace and analytics hub for:

1. Medical Check Up (MCU)
2. Man Power Supply
3. Training
4. Psychological Test

The platform connects:

* **Partners** → Vendors/providers of the services above
* **Companies** → Companies that need these services through their HR applications

The platform must also simulate integration with external HR applications where HR admins create orders that are later synced into this Aggregator Platform.

---

# Main Requirements

## Technical Stack

### Frontend

* Pure static frontend application
* NO backend
* NO database
* Use mock JSON/static data
* HTML-first architecture
* Use:

  * TailwindCSS
  * Alpine.js (optional lightweight interactivity)
  * Lucide Icons
* Design style:

  * Clean
  * Spacious
  * Negative-space heavy
  * Similar feeling to shadcn/ui
  * Minimal
  * Enterprise SaaS
  * White/neutral background
  * Soft border
  * Rounded-xl
  * Modern dashboard aesthetic

---

# Application Structure

Create 2 major applications/views:

## 1. Aggregator Platform

Main centralized platform.

### Actors

* Partner
* Aggregator Internal Admin
* Company Viewer (optional readonly)

---

## 2. HR Application

A separate mock application representing each company's internal HR system.

### Actor

* HR Admin

HR Admin creates orders from their HR system.
Orders are then synchronized into Aggregator Platform.

---

# Core Concepts

## Partner

Partner is a business/vendor entity.

A Partner may provide:

* MCU
* Training
* Psychological Test
* Man Power Supply

Each partner has:

* Company profile
* Service categories
* Rating
* SLA
* Analytics
* Incoming orders
* Workforce capacity
* Branch locations

---

## Company

Company is a client entity using the service.

Company users DO NOT directly order inside aggregator platform.

Instead:

1. HR Admin creates order in HR App
2. Order syncs to Aggregator Platform
3. Partner receives order
4. Partner processes request
5. AI analytics summarizes outcomes

---

# UI / UX Principles

## Design Rules

### Visual Style

* Extremely clean
* Minimal distractions
* Large padding
* Soft shadows
* Low contrast borders
* Neutral color palette
* Responsive
* Dashboard-first

### Typography

* Modern sans-serif
* Strong hierarchy
* Large headings
* Small muted descriptions

### Components

Create reusable:

* Cards
* Tables
* Badges
* Tabs
* Sidebars
* KPI blocks
* Analytics widgets
* Activity timeline
* Charts
* Empty states

---

# Pages — Aggregator Platform

---

# AUTH PAGES

## Login

* Email
* Password
* Login as:

  * Partner
  * Aggregator Admin
  * Company Viewer

## Register Partner

* Business Name
* Category selection
* Address
* Contact Person
* Business license upload UI mock

---

# PARTNER DASHBOARD

## Overview Dashboard

Show:

* Total incoming orders
* Active projects
* Revenue estimation
* SLA performance
* AI health insights
* Employee risk indicators
* Upcoming schedules

### Widgets

* Line chart
* Donut chart
* Risk score cards
* Latest activity feed

---

# PARTNER — MCU MODULE

## MCU Orders

Table:

* Company
* Employee count
* Schedule
* Status
* Result completion

## MCU Result Analytics

AI-generated insight examples:

* High hypertension trend
* Smoking risk trend
* Fitness score average
* Workforce health index

Include:

* Risk scoring
* Recommendations
* Heatmap visualization mock

---

# PARTNER — TRAINING MODULE

## Training Programs

* Program list
* Trainer
* Duration
* Capacity
* Completion rate

## Training Analytics

AI insights:

* Skill gap analysis
* Department competency trend
* Learning effectiveness
* Certification readiness

---

# PARTNER — PSYCHOLOGICAL TEST MODULE

## Psychological Test Orders

* Company
* Test type
* Candidate count
* Status

## AI Summary

* Personality distribution
* Burnout risk
* Leadership potential
* Team compatibility

---

# PARTNER — MAN POWER SUPPLY MODULE

## Workforce Requests

* Position requested
* Quantity
* Deployment status
* Contract duration

## Workforce Analytics

* Fulfillment rate
* Attendance consistency
* Turnover prediction
* Performance trend

---

# PARTNER PROFILE PAGE

Show:

* Company profile
* Service categories
* Branches
* Certifications
* SLA metrics
* Performance score
* Client reviews

---

# AGGREGATOR ADMIN DASHBOARD

## Global Analytics

Show:

* Total orders across all categories
* Active partners
* Company growth
* AI industry insights

### Cross-domain AI Insight Examples

* Health trends affecting productivity
* Training effectiveness correlation
* Burnout risk prediction
* Workforce sustainability score

---

# ORDER MANAGEMENT PAGE

Unified table:

* Order ID
* Company
* Partner
* Category
* Status
* SLA
* Sync source
* AI flag

---

# AI ANALYTICS CENTER

This is the most important page.

Create futuristic enterprise AI dashboard.

## Features

### AI Executive Summary

Summarize:

* Workforce health
* Mental readiness
* Training readiness
* Productivity risk

### AI Recommendation Engine

Examples:

* Recommend leadership training
* Suggest periodic MCU
* Suggest burnout prevention
* Recommend workforce redistribution

### Predictive Analytics

* Attrition prediction
* Workforce risk map
* Productivity trend
* Mental health stability

### Correlation Engine

Correlate:

* MCU results
* Psychological test
* Training performance
* Attendance/performance

---

# COMPANY VIEWER PAGE

Readonly visibility:

* Existing orders
* Vendor status
* Progress tracking
* Analytics result summary

---

# Pages — HR Application

This is a separate mock application.

---

# HR APP DASHBOARD

Show:

* Total workforce
* Pending assessments
* Upcoming MCU
* Active training
* Recruitment requests

---

# CREATE ORDER PAGE

Very important.

HR Admin can create:

* MCU request
* Training request
* Psychological Test request
* Man Power Supply request

Each form should have:

* Company
* Department
* Employee count
* Schedule
* Notes
* Priority
* Partner preference

When submitted:

* Show fake synchronization process
* Order appears in Aggregator Platform mock

---

# HR APP — ORDER HISTORY

Table:

* Order type
* Partner
* Date
* Status
* Sync status

---

# HR APP — ANALYTICS

Show simplified analytics from aggregator:

* Workforce health summary
* Training score
* Risk score
* Recommendations

---

# Data Model (Mock JSON)

Create mock data structures for:

## Partners

* id
* name
* category
* branches
* SLA
* rating

## Companies

* id
* name
* industry

## Orders

* id
* category
* partner_id
* company_id
* status
* created_at

## AI Insights

* risk_score
* summary
* recommendation
* trend

---

# Suggested Folder Structure

```txt
/apps
  /aggregator-platform
  /hr-app

/components
/layouts
/pages
/data
/assets
```

---

# UI Components To Build

## Shared Components

* Sidebar
* Topbar
* KPI Card
* Analytics Card
* Table
* Badge
* Status Pill
* Timeline
* Chart Block
* AI Insight Panel

---

# Charts & Visualizations

Use lightweight chart library.

Recommended:

* ApexCharts
* Chart.js

Needed charts:

* Line chart
* Donut chart
* Heatmap mock
* Trend chart
* Radar chart

---

# Color Palette

Use neutral professional colors.

## Primary

* Zinc
* Slate
* White

## Accent

* Indigo
* Blue
* Emerald

## Risk Colors

* Red
* Amber
* Green

Avoid oversaturated colors.

---

# Important UX Notes

## AI Analytics Experience

Must feel:

* Intelligent
* Executive-level
* Strategic
* Data-driven

Add:

* Insight cards
* AI-generated summaries
* Recommendation blocks
* Confidence indicators

---

# Responsiveness

Must support:

* Desktop first
* Tablet responsive
* Mobile adaptive

---

# Mock Integration Flow

Simulate:

1. HR Admin creates order
2. Sync animation/loading
3. Order appears in Aggregator Platform
4. Partner receives order
5. Analytics generated

No real API needed.

---

# Deliverables

Generate:

* Full static frontend
* Multiple pages
* Shared layout system
* Reusable components
* Mock data
* Responsive UI
* Beautiful enterprise dashboards

---

# Additional Direction

The final result should feel like:

* Modern B2B SaaS
* Enterprise analytics platform
* HR intelligence system
* AI-driven operational dashboard

Reference inspirations:

* Vercel Dashboard
* Linear
* Stripe Dashboard
* shadcn/ui
* Retool
* Notion enterprise UI

Avoid:

* Cluttered UI
* Heavy gradients
* Excessive animations
* Bright neon colors

Focus on:

* Clean structure
* Readability
* Analytics-first layout
* Professional enterprise feel
