-- Principal PART - FINAL PROJECT
-- create and Insert values

-- Create Database
CREATE DATABASE IF NOT EXISTS RetailSalesDB;
USE RetailSalesDB;

-- Creating the Funcionarios table
CREATE TABLE IF NOT EXISTS Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL
);

-- Creating the ClientesDiarios table
CREATE TABLE IF NOT EXISTS DailyCustomers (
    DailyCustomerID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    CustomersServed INT,
    Date DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Creating the TaloesDiarios table
CREATE TABLE IF NOT EXISTS DailyReceipts (
    DailyReceiptID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    ReceiptsIssued INT,
    Date DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Creating the UnidadesVendidas table
CREATE TABLE IF NOT EXISTS UnitsSold (
    UnitSoldID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    UnitsSold INT,
    Date DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Creating the VendasPorFuncionario table
CREATE TABLE IF NOT EXISTS SalesByEmployee (
    SaleID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    ValueInEuros DECIMAL(10, 2),
    Date DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Creating the ObjetivoDiario table
CREATE TABLE IF NOT EXISTS DailyObjectives (
    ObjectiveID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    DailyObjective DECIMAL(10, 2),
    Date DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE IF NOT EXISTS Metrics (
    MetricID INT PRIMARY KEY AUTO_INCREMENT,
    MetricName VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS MetricValues (
    MetricValueID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    MetricID INT,
    Value DECIMAL(10, 2),
    Date DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (MetricID) REFERENCES Metrics(MetricID)
);

-- Insert data in Employees
INSERT INTO Employees (Name) VALUES
('João'),
('Maria'),
('Carlos');

-- Insert data in DailyCustomers
INSERT INTO DailyCustomers (EmployeeID, CustomersServed, Date) VALUES
(1, 8, '2023-12-01'),
(2, 10, '2023-12-01'),
(1, 20, '2023-12-02'),
(2, 25, '2023-12-02'),
(3, 18, '2023-12-02');

-- Insert data in DailyReceipts
INSERT INTO DailyReceipts (EmployeeID, ReceiptsIssued, Date) VALUES
(1, 5, '2023-12-01'),
(2, 7, '2023-12-01'),
(1, 10, '2023-12-02'),
(2, 8, '2023-12-02'),
(3, 7, '2023-12-02');

-- Insert data in UnitsSold
INSERT INTO UnitsSold (EmployeeID, UnitsSold, Date) VALUES
(1, 17, '2023-12-01'),
(2, 15, '2023-12-01'),
(1, 25, '2023-12-02'),
(2, 14, '2023-12-02'),
(3, 11, '2023-12-02');

-- Insert data in SalesByEmployee
INSERT INTO SalesByEmployee (EmployeeID, ValueInEuros, Date) VALUES
(1, 1500.50, '2023-12-01'),
(2, 1200.75, '2023-12-01'),
(1, 2300.30, '2023-12-02'),
(2, 2600.20, '2023-12-02'),
(3, 2500.80, '2023-12-02');

-- Insert data in DailyObjectives
INSERT INTO DailyObjectives (EmployeeID, DailyObjective, Date) VALUES
(1, 2000.00, '2023-12-01'),
(2, 1800.00, '2023-12-01'),
(1, 2500.00, '2023-12-02'),
(2, 2000.00, '2023-12-02'),
(3, 2500.00, '2023-12-02');

-- Insert data in Metrics table
INSERT INTO Metrics (MetricName) VALUES
('TotalSalesValue'),
('CustomerEntries'),
('ReceiptsIssued'),
('UnitsSold'),
('DailyTarget'),
('CrossSaleRatio'),
('ServicePercentage'),
('AverageReceiptValue'),
('TargetAchievementPercentage')
AS new_values (MetricName)
ON DUPLICATE KEY UPDATE MetricName = new_values.MetricName;








