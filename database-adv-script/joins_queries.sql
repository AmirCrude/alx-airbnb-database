
-- Get all bookings with user and property details, ordered by start date
SELECT 
    b.booking_id,
    u.first_name AS guest_first_name,
    u.last_name AS guest_last_name,
    p.name AS property_name,
    b.start_date,
    b.end_date,
    b.status
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
ORDER BY b.start_date DESC;

-- Get all payments with booking and property details, ordered by payment date
SELECT 
    pay.payment_id,
    pay.amount,
    pay.payment_method,
    pay.payment_date,
    p.name AS property_name,
    u.first_name AS booked_by
FROM Payment pay
JOIN Booking b ON pay.booking_id = b.booking_id
JOIN Property p ON b.property_id = p.property_id
JOIN User u ON b.user_id = u.user_id
ORDER BY pay.payment_date DESC;

-- List reviews with reviewer info and property, ordered by rating descending
SELECT 
    r.review_id,
    u.first_name AS reviewer,
    p.name AS property_name,
    r.rating,
    r.comment,
    r.created_at
FROM Review r
JOIN User u ON r.user_id = u.user_id
JOIN Property p ON r.property_id = p.property_id
ORDER BY r.rating DESC;
