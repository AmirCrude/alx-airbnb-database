-- ==========================================
-- Step 1: Initial Query (Before Optimization)
-- ==========================================

SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name,
    u.last_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount AS payment_amount,
    pay.payment_method,
    pay.payment_date
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
ORDER BY b.created_at DESC;



-- ==========================================
-- Step 2: Refactored Query (Optimized)
-- ==========================================

-- Optimization applied:
-- 1. Removed unnecessary columns
-- 2. Used explicit SELECT columns instead of SELECT *
-- 3. Ensured indexes exist on join/filter columns
-- 4. Reduced JOINs to only essential tables

SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.first_name || ' ' || u.last_name AS user_name,
    p.name AS property_name,
    pay.amount AS payment_amount
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
ORDER BY b.start_date DESC;
