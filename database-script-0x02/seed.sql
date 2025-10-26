INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
    ('b2c1f6d0-4a88-4a29-9e31-112233445501', 'Amir', 'Abdu', 'amir@airbnb.com', 'hashed_pw_1', '+251911000001', 'admin', NOW()),
    ('d3e2a5b9-5b01-4f19-8a2e-112233445502', 'Sara', 'Kebede', 'sara@airbnb.com', 'hashed_pw_2', '+251911000002', 'host', NOW()),
    ('f4c3d7a1-6c12-4a21-9b3f-112233445503', 'Mikias', 'Tadesse', 'mikias@airbnb.com', 'hashed_pw_3', '+251911000003', 'guest', NOW()),
    ('a5b4e8c2-7d23-4c32-9c4f-112233445504', 'Hana', 'Tesfaye', 'hana@airbnb.com', 'hashed_pw_4', '+251911000004', 'guest', NOW());

INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at)
VALUES
    ('10112233-4455-6677-8899-111122223333', 'd3e2a5b9-5b01-4f19-8a2e-112233445502', 'Addis Haven', 'A cozy apartment in Bole.', 'Addis Ababa', 75.00, NOW(), NOW()),
    ('20223344-5566-7788-8899-222233334444', 'd3e2a5b9-5b01-4f19-8a2e-112233445502', 'Lake View Retreat', 'Peaceful cottage near Lake Tana.', 'Bahir Dar', 120.00, NOW(), NOW());

INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
    ('30112233-4455-6677-8899-333344445555', '10112233-4455-6677-8899-111122223333', 'f4c3d7a1-6c12-4a21-9b3f-112233445503', '2025-11-01', '2025-11-05', 300.00, 'confirmed', NOW()),
    ('30223344-5566-7788-8899-444455556666', '20223344-5566-7788-8899-222233334444', 'a5b4e8c2-7d23-4c32-9c4f-112233445504', '2025-12-10', '2025-12-13', 360.00, 'pending', NOW());

INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
    ('40112233-4455-6677-8899-555566667777', '30112233-4455-6677-8899-333344445555', 300.00, NOW(), 'credit_card'),
    ('40223344-5566-7788-8899-666677778888', '30223344-5566-7788-8899-444455556666', 360.00, NOW(), 'paypal');

INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
    ('50112233-4455-6677-8899-777788889999', '10112233-4455-6677-8899-111122223333', 'f4c3d7a1-6c12-4a21-9b3f-112233445503', 5, 'Wonderful stay, very clean and well-located!', NOW()),
    ('50223344-5566-7788-8899-888899990000', '20223344-5566-7788-8899-222233334444', 'a5b4e8c2-7d23-4c32-9c4f-112233445504', 4, 'Peaceful and relaxing atmosphere.', NOW());

INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
    ('60112233-4455-6677-8899-999900001111', 'f4c3d7a1-6c12-4a21-9b3f-112233445503', 'd3e2a5b9-5b01-4f19-8a2e-112233445502', 'Hello, is Addis Haven available next weekend?', NOW()),
    ('60223344-5566-7788-8899-000011112222', 'd3e2a5b9-5b01-4f19-8a2e-112233445502', 'f4c3d7a1-6c12-4a21-9b3f-112233445503', 'Yes, it’s available! I’ll send you the booking link.', NOW());
