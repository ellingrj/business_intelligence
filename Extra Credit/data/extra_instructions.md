# Extra Instructions

## Room Type filter (exact)
- Use 'Entire home/apt' to find listings of entire homes or apartments. This type of listing is self-contained and does not share common areas with other guests. 
- Use 'Private room' to find listings where guests can rent a room without renting an entire property.
- Use 'Shared room' to find listings where the guests can sleep in a space shared with other travelers or the host.
- Use 'Hotel room' to find listings where guests can rent a private room in a home. These rooms are often found in boutique hotels, hostels, or properties providing guests with a level of service and hospitality associated with traditional hotels.

## Industry filter (exact)
- Text matches are **case-sensitive**.

## Price Queries
- Price is a nightly rate in whole dollars

## Listings with Zero Reviews
- reviews_per_month may be NULL

## Availability Interpretation
- availability_365 may be recorded as '0', meaning it is either fully booked or has been delisted
- 

## Host Analysis
- Hosts may have multiple listings in the Columbus area
- calculated_host_listings_count contains a count of the number of listings a host is thought to have in the Columbus area
  
## Verification step (recommended)
If any filter is ambiguous, request a preview first:
- “Show matching rows so I can confirm `name`, `neighbourhood`, and `room_type` before aggregating.”

## Action wording (so I take the right next step)
Start your request with:
- **Calculate** / **Compute** → run a query and return computed results
- **Show** / **Filter to** → update the dashboard view and return all columns

---

# Default behavior
If you include the relevant filters, I will apply these rules automatically. If a request is ambiguous, I will first show the matching rows and ask you to confirm the labels before aggregating.
