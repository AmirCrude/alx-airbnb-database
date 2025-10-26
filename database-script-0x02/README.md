# Airbnb Clone Database Seeding

## Overview

This document explains how to populate the **Airbnb Clone Project** database with sample data using the `seed.sql` script.  
The seed data provides realistic examples of users, properties, bookings, payments, reviews, and messages to help test the database relationships and queries.

---

## What Sample Data Includes

### 1. Users

Four sample users are added to represent different roles:

- **Admin**: Manages and oversees the platform.
- **Host**: Owns and lists properties.
- **Guests**: Can book properties and leave reviews.

**Note:** The table name User is a keyword reserved for security purposes. "User" is a valid name.

### 2. Properties

Two properties are added under the host user:

- _Addis Haven_ – A cozy apartment located in Addis Ababa.
- _Lake View Retreat_ – A peaceful cottage near Lake Tana.

### 3. Bookings

Two bookings demonstrate the reservation system:

- Confirmed booking by **Mikias** for _Addis Haven_.
- Pending booking by **Hana** for _Lake View Retreat_.

### 4. Payments

Each booking includes a corresponding payment record with diverse methods:

- Credit card and PayPal examples are used for variety.

### 5. Reviews

Users who completed bookings leave feedback:

- Ratings and comments are stored for each property.

### 6. Messages

Simulates communication between host and guest:

- A guest inquires about availability.
- Host replies with confirmation.

---

## How to Run the Seed Script (PostgreSQL)

### Prerequisites

- PostgreSQL installed and running on your machine.
- A database created for the project (e.g., `airbnb_db`).
- The schema (tables) already created using your `schema.sql` file.

### Steps

1. **Open pgAdmin** and connect to your PostgreSQL server.
2. In the **Query Tool,** open your `seed.sql` file or paste the script directly into the editor.
3. **Execute the script** by clicking the **Run** button.
4. After it runs successfully, you can verify the data by running:
   ```
   SELECT * FROM "User";
   SELECT * FROM Property;
   SELECT * FROM Booking;
   ```

## Summary

The `seed.sql` script provides realistic sample data for testing and validating your Airbnb Clone database.
Using **pgAdmin** makes it easy to visualize tables, inspect relationships, and confirm that your schema and data are working as expected.
