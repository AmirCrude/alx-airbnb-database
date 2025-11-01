# Task 0: Practice SQL joins

## SQL Join Queries Overview

This section outlines examples of different SQL join operations used in the booking system to combine data across related tables such as **User**, **Booking**, **Property**, and **Review**.

### 1\. INNER JOIN — Bookings with User Details

Retrieves all bookings along with the user information who made them.Only records that exist in both the **Booking** and **User** tables appear in the results.

**Example:** Get bookings with user details

SELECT ...

FROM Booking b

INNER JOIN User u

ON b.user_id = u.user_id;

### 2\. LEFT JOIN — Properties and Their Reviews

Retrieves all properties along with any associated reviews.Properties that have no reviews are still included, with NULL in review-related columns.

**Example:** Get all properties and their reviews

SELECT ...

FROM Property p

LEFT JOIN Review r

ON p.property_id = r.property_id;

### 3\. FULL OUTER JOIN — All Users and All Bookings

Retrieves every user and every booking, including unmatched records on both sides.Users without bookings and bookings without users are both shown.

**Example:** Get all users and bookings (including unmatched)

SELECT ...

FROM User u

FULL OUTER JOIN Booking b

ON u.user_id = b.user_id;

**Note:** Some SQL databases (such as MySQL) do not support FULL OUTER JOIN directly. You can emulate it using a combination of LEFT JOIN and RIGHT JOIN with UNION.

# Task 1: Practice Subqueries

## Objective

Write both correlated and non-correlated subqueries using the Airbnb database to perform advanced data filtering and analysis.

## Overview

Subqueries are nested SQL queries used for filtering, aggregation, or comparison.They are classified into:

- **Non-Correlated Subqueries**: Execute independently of the main query.
- **Correlated Subqueries**: Depend on values from the outer query and execute once per row.

## Query 1: Non-Correlated Subquery

Find all properties with an average rating greater than 4.0.

SELECT

p.property_id,

p.name AS property_name,

p.location,

p.pricepernight

FROM Property p

WHERE p.property_id IN (

SELECT

r.property_id

FROM Review r

GROUP BY r.property_id

HAVING AVG(r.rating) > 4.0

)

ORDER BY p.name;

**Explanation:**The subquery calculates the average rating for each property and filters those above 4.0.The main query retrieves property details for those results.Query 2: Correlated Subquery

Find users who have made more than three bookings.

SELECT

u.user_id,

u.first_name,

u.last_name,

u.email

FROM User u

WHERE (

SELECT COUNT(\*)

FROM Booking b

WHERE b.user_id = u.user_id

) > 3

ORDER BY u.first_name, u.last_name;

**Explanation:**For each user, the subquery counts bookings linked to their ID.The outer query filters users with more than three total bookings.

# Task 2: Aggregations and Window Functions

## Objective

Use SQL aggregation and window functions to analyze booking and property data in the Airbnb database.

## Overview

This task focuses on two key SQL techniques:

- **Aggregation functions** such as COUNT and SUM for summarizing data.
- **Window functions** such as ROW_NUMBER or RANK for ranking or ordering data within partitions.

## Query 1: Total Bookings per User

Find the total number of bookings made by each user.

SELECT

u.user_id,

u.first_name,

u.last_name,

COUNT(b.booking_id) AS total_bookings

FROM User u

LEFT JOIN Booking b ON u.user_id = b.user_id

GROUP BY u.user_id, u.first_name, u.last_name

ORDER BY total_bookings DESC;

**Explanation:**This query joins the User and Booking tables, groups by user, and counts the total bookings per user.The results are ordered from the highest to the lowest number of bookings.

## Query 2: Rank Properties by Total Bookings

Rank properties based on the number of bookings they have received.

SELECT

p.property_id,

p.name AS property_name,

COUNT(b.booking_id) AS total_bookings,

RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank

FROM Property p

LEFT JOIN Booking b ON p.property_id = b.property_id

GROUP BY p.property_id, p.name

ORDER BY booking_rank;

**Explanation:** The query counts how many bookings each property has, then uses the RANK() window function to assign a ranking.Properties with equal booking counts receive the same rank.
