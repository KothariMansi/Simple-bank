# 🏦 SimpleBank API

A backend banking service built with **Go**, designed using **clean architecture principles**, and powered by **PostgreSQL**. This project focuses on modular design, efficient database interaction via **SQLC**, and maintainable code practices.

This is a part of my backend development learning journey — focusing on API design, database integration, and production-grade tooling like Docker and GitHub Actions.

---

## 🔧 Tech Stack

- **Language**: Go (Golang)
- **Database**: PostgreSQL
- **Framework**: Gin (for HTTP server)
- **SQL Generator**: SQLC
- **Migrations**: Golang Migrate
- **Containerization**: Docker
- **CI/CD**: GitHub Actions

---

## 🚀 Features (as of now)

- Create and manage bank accounts
- Transfer money between accounts
- SQLC-powered type-safe database access
- Database migrations using `golang-migrate`
- Docker support for containerized dev
- CI pipeline using GitHub Actions

---

## 🛠️ Setup Instructions

```bash
# Clone the repository
git clone https://github.com/KothariMansi/Simple-bank.git
cd Simple-bank

# Set environment variables
cp app.env.example app.env

# Start PostgreSQL in Docker
make postgres

# Create and migrate database
make createdb
make migrateup

# Run the server
make server
