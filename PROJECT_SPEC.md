# 🎂 Project Specification: Bakery on Rails

## 📖 Overview

**Bakery on Rails** is a modern bakery e-commerce platform built with Ruby on Rails and React, featuring a clean product browsing experience, admin-only product and order management, Stripe-powered checkout, dynamic product search, and secure user authentication using Devise and JWT.

---

## ✨ Features

### 👥 User Roles

- **Admin**  
  - Upload, edit, and delete products
  - Manage payments and user upgrades  
  - Access admin-only interface  

- **User**  
  - Create orders 
---

### 🎂 Product Management

- Each product includes:
  - `name`, `description`, `price`
  - Image files via **Active Storage**

- Admins can:
  - Upload new products
  - Assign/remove multiple products
  - Stream real-time order data via orders `show` page

---

### 🏷️ Order System

- **Many-to-many** relationship using a join table: `order_id`
- Admins can:
  - Create, edit, and delete order
- Users can:
  - View their orders

---

### 🔍 Search & Filtering
  - SQL-based
---

### 💳 Payments

- Stripe integration:
  - Allows users to **pay in advance** 
- Admin:
  - View/manage payments and user order status
- Users:
  - Receive confirmation email and receipt upon successful payment

---

### 🔐 Authentication & Authorization

- **Devise** for authentication (sign up, sign in, etc.)
- **Pundit** for role-based access control (Admin/User)

---

### 🧑‍🎨 UI/UX

- Design:
  - Modern, simplified interface
  - **Monochromatic**, splendid, and custom fonts
- Technologies:
  - **TailwindCSS** for layout
  - **React Hook** for dynamic interactivity
  - Custom JS for tag and filter interaction
- Responsive design for both desktop and mobile

---

## 🧪 Testing

- **RSpec** for model, feature, and request specs
- **FactoryBot** for test data
- **Shoulda-Matchers** for validation and association testing

---

## 🧱 Technical Stack

| Component      | Technology                  |
|----------------|-----------------------------|
| Language       | Ruby 3.2+                   |
| Framework      | Rails 8+                    |
| Database       | SQLite                       |
| Images Uploads  | Active Storage              |
| Auth           | Devise + JWT                |
| Authorization  | Pundit                      |
| Payments       | Stripe                      |
| Frontend UI    | ReactJS + TailwindCSS |
| Cache/Jobs     | Redis             |

---

## 🚀 Setup & Deployment

See `README.md` for full instructions on setup and deployment.

- Use `Rails credentials` to store sensitive keys (Stripe, JWT)
- Redis must be running for cache functionality
- Active Storage requires local or cloud file storage (e.g., local disk or S3)

---

## 📂 Notable Files & Directories

| Path                             | Description                               |
|----------------------------------|-------------------------------------------|
| `app/models/`                    | Models: Product, Order, User, Payment, Voucher |
| `app/controllers/`              | CRUD and custom actions for main resources |               

---


---
