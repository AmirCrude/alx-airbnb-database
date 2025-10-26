# Airbnb Clone Database Schema

## Overview

This document describes the database schema for the **Airbnb Clone Project**, which is part of building a scalable and realistic property booking system.  
The database is designed to handle user accounts, property listings, bookings, payments, reviews, and messages efficiently while maintaining data integrity and performance.

---

## Tables Created

### 1. User Table

Stores all registered users, including guests, hosts, and admins.  
This table contains user details such as names, email, password hash, phone number, and role.  
It ensures each user has a unique email address and a clearly defined role in the platform.

### 2. Property Table

Holds data about properties listed by hosts.  
Includes property details such as name, description, location, price per night, and timestamps for creation and updates.  
Each property is linked to the host who owns it.

### 3. Booking Table

Records all reservations made by users for specific properties.  
Includes start and end dates, total price, and booking status (pending, confirmed, or canceled).  
This table connects users and properties while tracking booking lifecycle events.

### 4. Payment Table

Maintains records of payments made for bookings.  
Stores transaction details including amount, payment method, and payment date.  
Ensures each payment is tied to a valid booking for accountability and tracking.

### 5. Review Table

Captures feedback left by users for properties they have booked.  
Includes a numeric rating (1–5), comments, and timestamps.  
Links users to the properties they reviewed to support transparency and trust within the platform.

### 6. Message Table

Handles communication between users, such as between guests and hosts.  
Stores sender and recipient IDs, message body, and timestamps.  
Supports a messaging feature that enhances coordination between booking parties.

---

## Relationships Implemented

| Relationship           | Description                                                        |
| ---------------------- | ------------------------------------------------------------------ |
| **User → Property**    | A host (user) can list multiple properties.                        |
| **User → Booking**     | A guest (user) can make multiple bookings.                         |
| **Property → Booking** | Each booking is linked to a single property.                       |
| **Booking → Payment**  | Each payment corresponds to one booking.                           |
| **Property → Review**  | A property can have multiple reviews from different users.         |
| **User → Review**      | A user can leave multiple reviews for properties they have booked. |
| **User ↔ Message**     | Users can send and receive multiple messages.                      |

These relationships ensure referential integrity and reflect the real-world structure of a booking system, allowing consistent data flow between entities.

---

## Notes on Performance

1. **Indexing**

   - Indexes are applied to frequently queried fields such as:
     - `email` in the **User** table for fast user lookups.
     - `property_id` in **Property** and **Booking** tables for efficient property searches.
     - `booking_id` in **Booking** and **Payment** tables for quick access to related records.
   - Primary keys are automatically indexed to improve retrieval performance.

2. **Foreign Keys**

   - All foreign keys enforce data integrity by ensuring referenced records exist (e.g., each booking must refer to a valid user and property).

3. **Data Constraints**

   - Unique and NOT NULL constraints maintain data consistency.
   - ENUM or check constraints validate restricted fields such as user roles, booking statuses, and payment methods.

4. **Scalability Considerations**

   - The schema supports scaling through efficient indexing and normalization.
   - Relationships are designed to minimize redundancy while maintaining fast join operations.

5. **Auditability**
   - Timestamp fields (e.g., `created_at`, `updated_at`) allow tracking of record creation and modification, aiding system transparency and debugging.

---

## Summary

This schema provides a solid foundation for the Airbnb Clone backend.  
It supports complex interactions between users, properties, and bookings while ensuring data accuracy, scalability, and performance.  
Future enhancements, such as caching or data partitioning, can be layered on top of this design without major structural changes.
