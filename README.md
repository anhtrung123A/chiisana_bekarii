# 小さなベーカリー
# 🎂 Bakery on Rails

A modern bakery e-commerce platform built with **Ruby on Rails** and **React**, featuring a clean product browsing experience, admin-only product and order management, Stripe-powered checkout, dynamic product search, and secure user authentication using Devise and JWT.

---

## 📦 Requirements

- Ruby 3.2+
- Rails 8+
- SQLite
- Node.js & Yarn
- Redis
- ReactJS
- Stripe API keys (for payments)
- JWT (authentication)

---

## ⚙️ Setup

### 1. Clone the repository
```bash
git clone https://github.com/anhtrung123A/chiisana_bekarii.git
cd banh_shop_on_rails
```
### 2. Install dependencies
```bash
bundle install
yarn install
```
### 3. Set up the database
```bash
rails db:migrate
rails db:seed
```
### 4. Configure the credential
  - Edit ```bash config/credentials.yml.enc ``` for secrets (Stripe keys, etc.)
  - Ensure ```bash config/master.key ``` is present
### 5. Start Redis
  - Via Docker
    ```bash
    docker run -d --name redis -p 6379:6379 redis:7
    ```
  - Check service availability by using Redis Insight
### 6. Start the Rails server
  ```bash 
  cd backend
  ```
  ```bash 
  rails server
  ```
### 7. Start the React server 
  ```bash
  cd frontend
  ```
  ```bash
  npm run dev
  ```
## 📦 Services
  - Active Storage: For video uploads/streaming
  - Redis: Product caching and background jobs
  - Stripe: For payment and pro account upgrades
  - Devise: For authentication
  - Pundit: For authorization
  - ReactJS: For modern, reactive UI
  - Kaminari: For pagination
  - WebSocket: For real-time order statistic
