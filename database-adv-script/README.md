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
