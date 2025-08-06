CREATE DATABASE RetailStoreDB;


USE RetailStoreDB;

CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY IDENTITY(1,1),
  FullName NVARCHAR(100) NOT NULL,
  Email NVARCHAR(100) NOT NULL UNIQUE
);
GO


CREATE TABLE Products (
  ProductID INT PRIMARY KEY IDENTITY(1,1),
  ProductName NVARCHAR(100) NOT NULL,
  Price DECIMAL(10, 2) NOT NULL
);
GO

CREATE TABLE Orders (
  OrderID INT PRIMARY KEY IDENTITY(1,1),
  CustomerID INT,
  OrderDate DATE NOT NULL,
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
GO


CREATE TABLE OrderDetails (
  OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
  OrderID INT,
  ProductID INT,
  Quantity INT NOT NULL,
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
GO

INSERT INTO Customers(Fullname, Email)
VALUES
('Alice Johnson', 'alice@example.com'),
  ('Bob Smith', 'bob@example.com'),
  ('Charlie Brown', 'charlie@example.com');
GO


INSERT INTO Products(ProductName, Price)
VALUES
('Laptop', 999.99),
('Smartphone', 499.99),
('Tablet', 299.99);
GO


INSERT INTO Orders (CustomerID, OrderDate)
VALUES
  (1, '2024-09-01'),
  (2, '2024-09-02');
GO


INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES
  (1, 1, 1),
  (1, 2, 2),
  (2, 3, 1);
GO



SELECT O.OrderID, C.FullName, O.OrderDate
FROM Orders O
INNER JOIN Customers C ON O.CustomerID = C.CustomerID;
GO


SELECT C.FullName, O.OrderID, O.OrderDate
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID;
GO


SELECT P.ProductName, O.OrderID, O.OrderDate
FROM Products P
RIGHT JOIN OrderDetails OD ON P.ProductID = OD.ProductID
RIGHT JOIN Orders O ON OD.OrderID = O.OrderID;
GO


SELECT C.FullName, O.OrderID, P.ProductName
FROM Customers C
FULL OUTER JOIN Orders O ON C.CustomerID = O.CustomerID
FULL OUTER JOIN OrderDetails OD ON O.OrderID = OD.OrderID
FULL OUTER JOIN Products P ON OD.ProductID = P.ProductID;
GO

