# 🐳 Containerized Data Application: Streamlit & PostgreSQL Architecture

[![Python](https://img.shields.io/badge/Python-3.9-blue.svg?logo=python&logoColor=white)](https://python.org)
[![Streamlit](https://img.shields.io/badge/Streamlit-FF4B4B?logo=streamlit&logoColor=white)](https://streamlit.io)
[![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?logo=docker&logoColor=white)](https://docker.com)
[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-336791?logo=postgresql&logoColor=white)](https://postgresql.org)

## 📌 Project Overview
This project demonstrates a production-ready, multi-container architecture. It packages a Python-based Streamlit application and a PostgreSQL database into completely isolated environments, orchestrated seamlessly via Docker Compose. 

The application provides an end-to-end data flow: it accepts CSV file uploads, persists the raw data into the PostgreSQL database, and dynamically queries the database to serve summary statistics back to the user interface.

📖 **Read the Full Architectural Breakdown on Medium:** [**Stop Saying "It Works on My Machine": A Data Practitioner’s Guide to Docker Architecture**](https://medium.com/@your_profile/your_article_link)

---

## 🏗️ Architectural Flow

![System Architecture Diagram](flow.png)

1. **User Interface:** Users interact with the Streamlit frontend exposed on `localhost:8501`.
2. **Data Processing:** The Python container reads the uploaded CSV and uses `SQLAlchemy` to establish a secure database connection.
3. **Internal Networking:** The application routes data securely to the database using Docker's internal DNS resolution (calling the `app-db` service name directly).
4. **Data Persistence:** The PostgreSQL container writes the ingested data to a Docker Named Volume (`pg_data`), bypassing the container's ephemeral filesystem to guarantee data survival across restarts.

---

## 🚀 Quick Start Guide

### Prerequisites
* [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed and running.

### 1. Clone the Repository
```bash
git clone [https://github.com/YourUsername/your-repo-name.git]
cd your-repo-name
```
### 2. Configure Environment Variables

Create a .env file in the root directory to securely inject database credentials at runtime:
```bash
POSTGRES_USER=admin_user
POSTGRES_PASSWORD=secure_password_123
POSTGRES_DB=postgres
```
### 3. Build and Launch

Use Docker Compose to build the application image and spin up the architecture in detached mode:
```Bash
docker compose up --build -d
```
### 4. Access the Application

Open your browser and navigate to: http://localhost:8501

---

## 🛠️ Tech Stack & Design Decisions

**Base Image Optimization:** Utilized python:3.9-slim to drastically reduce image bloat and minimize security vulnerabilities.

**Layer Caching:** Structured the Dockerfile to install system/Python dependencies before copying source code, ensuring lightning-fast rebuilds during iterative development.

**Decoupled Configuration:** Ensured zero hardcoded credentials exist in the codebase by passing variables securely through Compose via .env

---

## Docker Learning Resources

Below is a collection of high-quality free resources to help you learn Docker effectively. It contains documentation, video tutorials, interactive labs, and cheat sheets.

---

### 📖 Official Documentation & Guides

- **[Docker Docs](https://docs.docker.com/get-started/)**: The official documentation is the best place to start learning Docker concepts and best practices.

- **[Docker Under The Hood](https://medium.com/data-engineer-things/docker-under-the-hood-part-one-03abda8b631f?sk=21bdd4fd244b158c5c9856d9c247b705)**: Nancy's article on Docker for beginners.

### 🎥 Free Video Tutorials

- **[Docker Full Course – TechWorld with Nana (YouTube)](https://youtu.be/3c-iBn73dDE?si=cKNWzKmNMgf2ozlL)**: A comprehensive beginner-friendly course covering Docker fundamentals.

### 🏗 Interactive Learning & Hands-on Labs

- **[Play with Docker](https://labs.play-with-docker.com/)**: An online playground where you can practice Docker commands without installing anything.

### 📑 Cheat Sheets & Reference Guides

- **[Docker CLI Cheat Sheet by Docker](https://docs.docker.com/get-started/docker_cheatsheet.pdf)**: Features the common Docker CLI commands for easy reference.

