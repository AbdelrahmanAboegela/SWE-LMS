
# SWE-LMS (Library Management System)

## Table of Contents
1. [Overview](#overview)
2. [Key Features](#key-features)
3. [Technology Stack](#technology-stack)
4. [Setup & Installation](#setup--installation)
    - [Clone the Repository](#1-clone-the-repository)
    - [Set up the MySQL Database](#2-set-up-the-mysql-database)
    - [Run the Application](#3-run-the-application)
5. [Contributing](#contributing)
6. [License](#license)

## Overview

SWE-LMS is a **Library Management System** developed as the capstone project for a Software Engineering course. This system is built using **C# Windows Forms** and integrates with a **MySQL** database managed through **phpMyAdmin**. It provides a robust platform to manage library resources efficiently, including books, users, and transactions such as borrowing and returning books.

## Key Features

- **Book Management**: Add, update, delete, and search for books in the library.
- **User Management**: Manage library staff, borrowers, and other users with access controls.
- **Borrowing & Returning System**: Track the lending and returning of books, including overdue notifications.
- **Categorization of Books**: Classify books into different categories to make searching easier.
- **Authentication System**: Login functionality for librarians and admin users with secure password handling.

## Technology Stack

- **Front-End**: C# Windows Forms
- **Back-End**: MySQL Database (using phpMyAdmin)
- **IDE**: Visual Studio
- **Database Script**: SQL script (`dblibrary.sql`) for generating and managing the database schema.
- **Documentation**: Full documentation with diagrams and details provided in `SWE_Phase 2.docx`.

## Setup & Installation

### 1. Clone the repository:
```bash
git clone https://github.com/AbdelrahmanAboegela/SWE-LMS
```

### 2. Set up the MySQL Database:
- Open **phpMyAdmin** and import the `dblibrary.sql` file to create the necessary database structure.
- Update the database connection string in the `App.config` file to match your local MySQL server configuration.

### 3. Run the Application:
- Open the solution file (`LibrarySystem.sln`) in **Visual Studio**.
- Restore any missing packages or dependencies.
- Build and run the application.

