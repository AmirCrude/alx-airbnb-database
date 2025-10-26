# 🏠 Airbnb Database ERD Requirements

## **1. Project Overview**
This document defines the **entities**, **attributes**, and **relationships** for the **Airbnb Database Project**.  
The goal is to design a structured and normalized database model that supports users, property listings, bookings, payments, reviews, and messaging — forming the foundation for an Airbnb-like web application.

The Entity-Relationship Diagram (ERD) visually represents how these entities interact and ensures data consistency, integrity, and scalability in future development.

---

## **2. Objectives**
- Identify all entities and their key attributes.  
- Define clear relationships between entities (one-to-many, many-to-one, etc.).  
- Create an ERD using Draw.io or similar tools.  
- Provide a solid database foundation for further normalization and schema creation.

---

## **3. Entities and Attributes**

### 🧑‍💼 **User**
| Attribute | Type | Constraints | Description |
|------------|------|-------------|--------------|
| user_id | UUID | PK, Indexed | Unique identifier for each user |
| first_name | VARCHAR | NOT NULL | User’s first name |
| last_name | VARCHAR | NOT NULL | User’s last name |
| email | VARCHAR | UNIQUE, NOT NULL | User’s email address |
| password_hash | VARCHAR | NOT NULL | Encrypted user password |
| phone_number | VARCHAR | NULL | User’s phone number |
| role | ENUM (guest, host, admin) | NOT NULL | Defines user role |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Registration timestamp |

---

### 🏡 **Property**
| Attribute | Type | Constraints | Description |
|------------|------|-------------|--------------|
| property_id | UUID | PK, Indexed | Unique identifier for property |
| host_id | UUID | FK → User(user_id) | Property owner |
| name | VARCHAR | NOT NULL | Property title |
| description | TEXT | NOT NULL | Property details |
| location | VARCHAR | NOT NULL | City or address |
| pricepernight | DECIMAL | NOT NULL | Price per night |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Creation timestamp |
| updated_at | TIMESTAMP | ON UPDATE CURRENT_TIMESTAMP | Last update timestamp |

---

### 🧾 **Booking**
| Attribute | Type | Constraints | Description |
|------------|------|-------------|--------------|
| booking_id | UUID | PK, Indexed | Unique identifier for booking |
| property_id | UUID | FK → Property(property_id) | Booked property |
| user_id | UUID | FK → User(user_id) | Guest who made the booking |
| start_date | DATE | NOT NULL | Booking start date |
| end_date | DATE | NOT NULL | Booking end date |
| total_price | DECIMAL | NOT NULL | Total booking cost |
| status | ENUM (pending, confirmed, canceled) | NOT NULL | Booking status |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Creation timestamp |

---

### 💳 **Payment**
| Attribute | Type | Constraints | Description |
|------------|------|-------------|--------------|
| payment_id | UUID | PK, Indexed | Unique payment identifier |
| booking_id | UUID | FK → Booking(booking_id) | Related booking |
| amount | DECIMAL | NOT NULL | Payment amount |
| payment_date | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Payment date |
| payment_method | ENUM (credit_card, paypal, stripe) | NOT NULL | Payment type |

---

### ⭐ **Review**
| Attribute | Type | Constraints | Description |
|------------|------|-------------|--------------|
| review_id | UUID | PK, Indexed | Unique identifier for review |
| property_id | UUID | FK → Property(property_id) | Reviewed property |
| user_id | UUID | FK → User(user_id) | Reviewer (guest) |
| rating | INTEGER | CHECK (1 ≤ rating ≤ 5), NOT NULL | Rating score |
| comment | TEXT | NOT NULL | Review text |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Date of review |

---

### 💬 **Message**
| Attribute | Type | Constraints | Description |
|------------|------|-------------|--------------|
| message_id | UUID | PK, Indexed | Unique message identifier |
| sender_id | UUID | FK → User(user_id) | Message sender |
| recipient_id | UUID | FK → User(user_id) | Message receiver |
| message_body | TEXT | NOT NULL | Message content |
| sent_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Time message was sent |

---

## **4. Relationships Between Entities**

| Relationship | Type | Description | Cardinality |
|---------------|------|-------------|--------------|
| **User → Property** | One-to-Many | A host can list many properties | 1 User → N Properties |
| **User → Booking** | One-to-Many | A guest can make multiple bookings | 1 User → N Bookings |
| **Property → Booking** | One-to-Many | A property can have many bookings | 1 Property → N Bookings |
| **Booking → Payment** | One-to-One | Each booking has one payment | 1 Booking → 1 Payment |
| **Property → Review** | One-to-Many | A property can have many reviews | 1 Property → N Reviews |
| **User → Review** | One-to-Many | A user can leave many reviews | 1 User → N Reviews |
| **User → Message (Sender)** | One-to-Many | A user can send many messages | 1 User → N Sent Messages |
| **User → Message (Recipient)** | One-to-Many | A user can receive many messages | 1 User → N Received Messages |

📝 **Note:**  
Although `User → Message` appears twice (as sender and recipient), both are necessary since they represent **different roles** in the same table (sender and receiver).

---

## **5. Constraints and Indexing**
- **Primary Keys:** Automatically indexed.  
- **Unique Constraints:** `email` in `User`.  
- **Foreign Keys:** Ensure referential integrity between entities.  
- **Indexes:**  
  - `user.email`  
  - `property.property_id`  
  - `booking.booking_id`  
  - `payment.booking_id`

---

## **6. ER Diagram Reference**
A visual ER diagram was created using **Draw.io** and saved as:
