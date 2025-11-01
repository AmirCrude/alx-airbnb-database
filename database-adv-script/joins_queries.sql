```sql
-- 1. INNER JOIN: Retrieve all bookings with user details
-- Ordered by booking start date (earliest first)
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM Booking b
INNER JOIN User u
ON b.user_id = u.user_id
ORDER BY b.start_date ASC;

-- 2. LEFT JOIN: Retrieve all properties and their reviews (even those without reviews)
-- Ordered by property name, then review rating (highest first)
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    r.review_id,
    r.rating,
    r.comment
FROM Property p
LEFT JOIN Review r
ON p.property_id = r.property_id
ORDER BY p.name ASC, r.rating DESC;

-- 3. FULL OUTER JOIN: Retrieve all users and all bookings (include unmatched)
-- Ordered by user last name, then booking start date
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.status,
    b.start_date,
    b.end_date
FROM User u
FULL OUTER JOIN Booking b
ON u.user_id = b.user_id
ORDER BY u.last_name ASC, b.start_date ASC;
```
