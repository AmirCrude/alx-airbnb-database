-- 1. INNER JOIN: Retrieve all bookings with user details
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
ON b.user_id = u.user_id;

-- 2. LEFT JOIN: Retrieve all properties and their reviews (even those without reviews)
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    r.review_id,
    r.rating,
    r.comment
FROM Property p
LEFT JOIN Review r
ON p.property_id = r.property_id;

-- 3. FULL OUTER JOIN: Retrieve all users and all bookings (include unmatched)
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
ON u.user_id = b.user_id;
