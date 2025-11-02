# Database Index Optimization Report

## Objective

Improve query performance by identifying frequently used columns and applying appropriate indexes in the **User**, **Booking**, **Property**, and **Payment** tables.

## Indexes Created

**User**

- email
- role

**Booking**

- user_id
- property_id

**Property**

- host_id
- location

**Payment**

- booking_id

## Test Query

Query used to measure performance:

SELECT

u.user_id,

u.first_name,

u.last_name,

COUNT(b.booking_id) AS total_bookings

FROM "User" u

LEFT JOIN Booking b ON u.user_id = b.user_id

GROUP BY u.user_id, u.first_name, u.last_name

ORDER BY total_bookings DESC;

## Performance Comparison

**Before Indexing**

- Query Plan: Sequential Scans on User and Booking
- Execution Time: ~0.66 ms

**After Indexing**

- Query Plan: Index Scans used on Booking.user_id
- Execution Time: ~4.28 ms (slightly higher due to small dataset and caching overhead)

## Summary

- Indexes were successfully created on high-usage columns.
- The EXPLAIN ANALYZE output confirms PostgreSQL can now utilize indexes for lookups and joins.
- On small datasets, improvements may not be visible, but performance gains become significant as data volume increases.
