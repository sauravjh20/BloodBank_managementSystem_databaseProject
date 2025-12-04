# Blood Bank Management System

A complete PHP-based web application designed to digitalize and streamline blood bank operations.  
It manages donors, recipients, blood inventory, donation/receiving history, and real-time stock monitoring.  
Runs on **PHP** with an **Apache server**, using a **MySQL** database.

---

## 📌 Table of Contents
- [Overview](#overview)
- [Features](#features)
- [System Modules](#system-modules)
- [Screens / Pages](#screens--pages)
- [Database Schema](#database-schema)
- [Technology Stack](#technology-stack)
- [Installation & Setup](#installation--setup)
- [How to Use](#how-to-use)
- [Validation Rules](#validation-rules)
- [Future Enhancements](#future-enhancements)
- [Contributors](#contributors)
- [License](#license)

---

## 📘 Overview

The **Blood Bank Management System** is developed to help hospitals, clinics, and blood banks maintain accurate donor/recipient data and track blood inventory efficiently.  
The project supports:

- Person registration (donors & recipients)
- Donation events
- Receiving (blood transfusion) events
- Automated blood stock updates
- Viewing historical donation/receiving reports

---

## ⭐ Features

### 👤 Donor & Recipient Management
- Add new persons with complete details
- Search existing records by ID, phone, or name
- Update personal information

### 🩸 Blood Stock Management
- Real-time blood stock for all blood groups
- Automatic stock increase/decrease after donation/transfusion
- Low stock alerts

### 📝 Donation & Receiving History
- View records filtered by date range
- Complete logs for auditing and analysis

### 🔐 User Login System
- Basic user authentication
- Controlled access to system pages

---

## 🗂 System Modules

1. Add Person  
2. Search Person  
3. Donation Page  
4. Receive (Transfusion) Page  
5. Blood Stock Dashboard  
6. Donation History  
7. Receive History  
8. User Login / Authentication  

---

## 🖥 Screens / Pages

| Page | Description |
|------|-------------|
| **Add Person** | Register new donor/recipient |
| **Search Person** | Search by name, phone, or ID |
| **Donate Blood** | Record donation & update stock |
| **Receive Blood** | Record transfusion event |
| **Stock View** | Shows real-time blood stock |
| **Donation History** | Filtered record of past donations |
| **Receive History** | Record of all blood receiving events |

---

## 🛢 Database Schema

### **Tables**
- `person` – personal & medical details  
- `donation` – donation events  
- `receive` – blood transfusion/receiving events  
- `stock` – available blood units by blood group  
- `user` – login credentials  

> ERD includes Person, Donation, Receiving, Stock, and User modules.

---

## 🧰 Technology Stack

| Layer | Technology |
|-------|-----------|
| **Frontend** | HTML, CSS, JavaScript |
| **Backend** | PHP (Core PHP) |
| **Server** | Apache (XAMPP / WAMP / LAMP) |
| **Database** | MySQL / MariaDB |
| **Tools Used** | phpMyAdmin, Visual Studio Code / Sublime / PHPStorm |

---

## 🚀 Installation & Setup

### ✔ Requirements
- PHP 7+ or PHP 8
- Apache Web Server (XAMPP / WAMP / LAMP)
- MySQL / MariaDB
- Browser (Chrome/Firefox)

---
