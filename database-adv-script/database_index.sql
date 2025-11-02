
-- ------------------------
-- User table indexes
-- ------------------------
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_role ON User(role);

-- ------------------------
-- Booking table indexes
-- ------------------------
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- ------------------------
-- Property table indexes
-- ------------------------
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);

-- ------------------------
-- Payment table indexes
-- ------------------------
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

