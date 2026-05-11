---
sdk: docker
app_port: 7860
title: ISA 401 Airbnb Listing Explorer
emoji: 📊
colorFrom: yellow
colorTo: yellow
pinned: false
license: mit
short_description: Explore Airbnb Columbus listings data
---

# ISA 401 Airbnb Listing Explorer

**Your AI-Powered Assistant for Exploring Airbnb Listings**

[![Live App](https://img.shields.io/badge/Live_App-Hugging_Face-yellow)](https://huggingface.co/spaces/fmegahed/querychat_demo)

Explore the Columbus Airbnb Listings dataset using natural language queries.

---

## What is this app?

This Shiny application uses AI-powered natural language processing to help you explore the Airbnb dataset. Instead of writing SQL queries, simply ask questions in plain English and get instant results.

**Example queries:**
- "What are the highest rated listings in the past 6 months?"
- "How many hosts have more than one listing?"
- "What is the lowest cost for a private room?"
- "Are there entire homes/apts available for under 3 night stays?"

---

## Dataset Information

**Dataset:** Columbus Airbnb Listings (26 Sept, 2025)
**Publisher:** Inside Airbnb
**Website:** https://insideairbnb.com/get-the-data/


### Key Fields

| Field | Description |
|---|---|
| `id` | Unique Airbnb listing ID |
| `name` | Listing title |
| `host_id` | Unique host ID |
| `host_name` | Host's first name |
| `neighbourhood_group` | Neighbourhood group (may be empty for Columbus) |
| `neighbourhood` | Neighbourhood name |
| `latitude` | Listing latitude coordinates |
| `longitude` | Listing longitude coordinates |
| `room_type` | Entire home/apt, Private room, Shared room, or Hotel room |
| `price` | Nightly price in USD (integer) |
| `minimum_nights` | Minimum nights required per booking |
| `number_of_reviews` | Total review count |
| `last_review` | Date of most recent review (YYYY-MM-DD; blank if no reviews) |
| `reviews_per_month` | Average reviews per month; blank if no reviews |
| `calculated_host_listings_count` | Number of listings the host has in Columbus |
| `availability_365` | Days available in the next year ('0' = fully booked or delisted)|
| `number_of_reviews_ltm` | Number of reviews in the last 12 months |
| `license` | License/registration number (blank if no license/registration number ). |


---

## Features

- **Natural Language Queries**: Ask questions in plain English
- **SQL Transparency**: See the generated SQL for each query
- **Interactive Data Table**: Sort, filter, and export results
- **Miami University Theming**: Branded for ISA 401 course use

---

## Running Locally

**With R:**
```r
# Install dependencies
renv::restore()

# Run the app
shiny::runApp('.', host = '0.0.0.0', port = 7860)
```

**With Docker:**
```bash
# Build the image
docker build -t oews-explorer .

# Run with OpenAI API key
docker run --rm -p 7860:7860 -e OPENAI_API_KEY=$OPENAI_API_KEY oews-explorer
```

---

## Required Environment Variable

This app requires an OpenAI API key to function:

```bash
export OPENAI_API_KEY="your-api-key-here"
```

On Hugging Face Spaces, set this as a secret in your Space settings.

---

## Technology Stack

- **[Shiny](https://shiny.posit.co/)** - Web application framework for R
- **[querychat](https://github.com/posit-dev/querychat)** - Natural language data querying
- **[bslib](https://rstudio.github.io/bslib/)** - Bootstrap theming for Shiny
- **[DT](https://rstudio.github.io/DT/)** - Interactive data tables

---

## Course Information

This application was developed for **ISA 401** at **Miami University** to help students explore and understand labor market data using modern AI-powered tools.

