# Airbnb Market Analysis: Columbus vs New York

## Author
Rylee Elling

## Project Overview
This project analyzes Airbnb listing data to compare the Columbus, Ohio and New York City markets. The goal is to identify business questions that could be answered with Airbnb data.

## Research Questions

1. Do listings with licenses have better reviews?
2. Are private rooms less costly than entire apartment/houses?
3. How does pricing differ among similar listing types in the same neighborhoods? 
4. Do longer listing descriptions lead to greater customer reviews? 
5. Does the number of minimum nights have an effect on the number of reviews left each month?

## Data Source Mapping

| # | Question | Data Needed | Source | Data Type |
|:-:|:---------|:------------|:-------|:----------|
| 1 | Do listings with licenses have better reviews? | Review Value, License Number | listings.csv, Airbnb website | Structured, Semi-structured |
| 2 | Are private rooms less costly than entire apartment/houses? | Listing type (private room or entire house/apt) | listings.csv | Structured |
| 3 | How does pricing differ among similar listing types in the same neighborhoods?  | Price, Location, Listing Type | listings.csv | Structured |
| 4 | Do longer listing descriptions lead to greater customer reviews? 
 | Listing Name, Word count of listing description, Review Value | listings.csv, Airbnb website | Structured, Semi-structured, Unstructured |
| 5 | Does the number of minimum nights have an effect on the number of reviews left each month? | Number of minimum nights, Count of monthly reviews | listing.csv | Structured |

## Data Overview
- **Columbus, Ohio:** 2877 listings (as of Sept 26, 2025)
- **New York City:** 36261 listings (as of Dec 4, 2025)
- **Primary data source:** [Inside Airbnb](http://insideairbnb.com/get-the-data)

## Project Status
- [x] Initial data exploration
- [x] Research questions defined
- [x] Data sources mapped
- [ ] Data downloaded and cleaned
- [ ] Analysis complete
- [ ] Visualizations created