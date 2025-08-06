# RetailStoreProject

## Overview
This project demonstrates the design and implementation of a basic Retail Store database using SQL.
It includes core tables for **Customers, Products, Orders, and OrderDetails**—with primary and foreign key relationships, and supports sample data inserts and queries for a retail business scenario.

## Database Design

**Database Name:** RetailStoreDB

### Customers

| Column      | Type          | Notes                      |
|-------------|---------------|----------------------------|
| CustomerID  | INT           | PRIMARY KEY IDENTITY(1,1)  |
| FullName    | NVARCHAR(100) | NOT NULL                   |
| Email       | NVARCHAR(100) | NOT NULL UNIQUE            |

### Products

| Column      | Type          | Notes                      |
|-------------|---------------|----------------------------|
| ProductID   | INT           | PRIMARY KEY IDENTITY(1,1)  |
| ProductName | NVARCHAR(100) | NOT NULL                   |
| Price       | DECIMAL(10,2) | NOT NULL                   |

### Orders

| Column      | Type      | Notes                                      |
|-------------|-----------|--------------------------------------------|
| OrderID     | INT       | PRIMARY KEY IDENTITY(1,1)                  |
| CustomerID  | INT       |                                            |
| OrderDate   | DATE      | NOT NULL                                   |
| FOREIGN KEY | KEY       | (CustomerID) REFERENCES Customers(CustomerID) |

### OrderDetails

| Column         | Type      | Notes                                         |
|----------------|-----------|-----------------------------------------------|
| OrderDetailID  | INT       | PRIMARY KEY IDENTITY(1,1)                     |
| OrderID        | INT       |                                               |
| ProductID      | INT       |                                               |
| Quantity       | INT       | NOT NULL                                      |
| FOREIGN KEY    | KEY       | (OrderID) REFERENCES Orders(OrderID)          |
| FOREIGN KEY    | KEY       | (ProductID) REFERENCES Products(ProductID)    |

## How to use

1. Download the `RetailStoreDB.sql` file.
2. Run it in your preferred SQL environment (like MySQL Workbench, SQL Server, etc.) to create the database.

## Project Screenshots

### 1. Database Structure
![Database Structure](https://github.com/Avinashgupta94/RetailStoreProject/blob/main/screenshot1.jpg.jpg?raw=true)

### 2. Tables Overview
![Tables Overview](https://github.com/Avinashgupta94/RetailStoreProject/blob/main/screenshot2.jpg.jpg?raw=true)

### 3. Sample Query Output
![Sample Query Output](https://github.com/Avinashgupta94/RetailStoreProject/blob/main/screenshot3.jpg.jpg?raw=true)

### 4. Data Visualization
![Data Visualization](https://github.com/Avinashgupta94/RetailStoreProject/blob/main/screenshot4.jpg.jpg?raw=true)
