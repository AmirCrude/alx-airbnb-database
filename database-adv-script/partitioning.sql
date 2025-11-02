-- =========================================================
-- Recreate Booking table with correct partitioning
-- =========================================================

-- 1️⃣ Drop the old Booking table (and its dependencies)
DROP TABLE IF EXISTS Booking CASCADE;

-- 2️⃣ Create the parent partitioned Booking table
CREATE TABLE Booking (
    booking_id UUID DEFAULT uuid_generate_v4(),
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status VARCHAR(10) CHECK (status IN ('pending', 'confirmed', 'canceled')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT pk_booking PRIMARY KEY (booking_id, start_date),
    CONSTRAINT fk_booking_property FOREIGN KEY (property_id)
        REFERENCES Property(property_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_booking_user FOREIGN KEY (user_id)
        REFERENCES "User"(user_id)
        ON DELETE CASCADE
)
PARTITION BY RANGE (start_date);

-- 3️⃣ Create yearly partitions (adjust years as needed)
CREATE TABLE booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE booking_2025 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- 4️⃣ Optional catch-all partition
CREATE TABLE booking_default PARTITION OF Booking DEFAULT;

-- 5️⃣ Helpful indexes
CREATE INDEX idx_booking_property ON Booking(property_id);
CREATE INDEX idx_booking_user ON Booking(user_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
