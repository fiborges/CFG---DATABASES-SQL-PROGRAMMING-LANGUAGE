# Project
The project is a crucial part of this course. To earn a certificate of completion, you need to create, deliver, and present your database project. It should encompass major learning outcomes from the course modules, including core requirements and advanced options.

## Core Requirements
### Your project must meet the following core requirements:

Create a relational database with at least 5 tables.
Set primary and foreign key constraints to establish relations between tables.
Use various types of joins to create logical views.
Create a stored function within your database.
Prepare a sample query with a subquery to extract data for analysis.
Create a DB diagram illustrating table relations.

### Advanced Options
In addition to core requirements, you should include 2-3 requirements from the advanced options list. These options allow you to fine-tune the complexity of your project and provide valuable learning experiences.

### Project Submission and Assessment
Take a backup copy of your database diagram and save it as a projectname.sql file. Submit it via the designated Slack channel before the deadline.
Instructors will review and assess your project, providing feedback and comments.
A copy of your project file, along with assessment results and comments, will be forwarded to the course administrators to issue your certificate.
During week 8, each student will present and demonstrate their project in class, summarizing the project's purpose and functionality.

### Project Presentations
Group projects are allowed; however, you must meet specific requirements.
Each presentation should last approximately 3 minutes.
Start with the database diagram and explain the project's concept, purpose, and expected usage.
Demonstrate how functions, stored procedures, and other elements work within your database.
Showcase sample data stored in tables to provide a comprehensive overview of your project.

# Retail Sales Database Project
## Overview
This project encompasses a comprehensive relational database designed for a retail sales environment, named RetailSalesDB. It includes a variety of tables, stored procedures, functions, triggers, and views to demonstrate data manipulation, storage, and analysis capabilities within a SQL database. The project is structured to reflect real-world retail operations, tracking employee sales performance, customer interactions, and daily sales metrics.

## Project Structure
### Tables
The database includes the following tables:

#### Employees: 
  Stores employee details.
#### DailyCustomers: 
  Records daily customer interactions per employee.
#### DailyReceipts: 
  Tracks receipts issued by employees each day.
#### UnitsSold: 
  Logs daily units sold by each employee.
#### SalesByEmployee: 
  Contains daily sales figures per employee.
#### DailyObjectives: 
  Holds daily sales objectives for employees.
#### Metrics: 
  Lists different metrics for sales analysis.
#### MetricValues: 
  Stores values for various metrics, associated with employees and dates.

## Relationships
The database employs primary and foreign keys to establish relationships between tables. For example, DailyCustomers, DailyReceipts, UnitsSold, SalesByEmployee, and MetricValues are linked to Employees, ensuring referential integrity and enabling complex queries that span multiple tables.

## Stored Procedures and Functions
### UpdateMetricValues:
  A stored procedure that updates sales metrics for all employees for a given date, demonstrating the database's ability to automate data management tasks.
### CheckSalesPerformance: \  A stored function that evaluates an employee's sales performance over a specified period, offering insights into individual performance levels against set objectives.

## Triggers
### UpdateEmployeeMetrics: 
  A trigger designed to update an EmployeeMetrics table (assumed to be part of the schema) whenever new metric values are inserted, ensuring that employee performance metrics are always up-to-date.

## Views
### EmployeeMetrics: 
  A view that consolidates employee performance data across multiple tables, providing a comprehensive snapshot of sales metrics, targets, and achievements for each employee.

## Sample Query with Subquery
The project includes a sample query featuring a subquery to assess employee target achievement status based on average performance metrics. It exemplifies the database's analytical capabilities, enabling complex data extraction and analysis.

## Usage
To use this database, follow these steps:

### Database Creation: 
  Execute the FINALPROJECT_1PART.sql script to create the database and its tables, and to insert sample data.
### Function and Procedure Execution: 
  Run the FINALPROJECT_FUNCTION.sql and FINALPROJECT_STOREPROCEDURE.sql scripts to create the stored function and procedure, respectively.
### Trigger and View Setup: 
  Use the FINALPROJECT_TRIGGER.sql and FINALPROJECT_VIEW.sql scripts to establish the trigger and view.
### Data Analysis: 
  Utilize the sample query in FINALPROJECT_QUERY:SUBQUERY.sql to perform data analysis and gain insights into employee performance.


## Expected Outputs
### Performance Evaluations: 
  The CheckSalesPerformance function will return a descriptive performance status for each employee for the given period.
### Metric Updates: 
  The UpdateMetricValues procedure dynamically updates sales metrics, reflecting daily operations and performance.
### Real-Time Updates: 
  The UpdateEmployeeMetrics trigger ensures that performance metrics in the EmployeeMetrics table are automatically updated following new metric entries.
### Comprehensive Views: 
  The EmployeeMetrics view offers an aggregated perspective on employee performance, consolidating data from multiple tables into a single, queryable view.

## Conclusion
This project demonstrates the practical application of advanced SQL features to model and manage complex data relationships in a retail sales context. It provides a solid foundation for data-driven decision-making, enabling detailed performance analysis and operational insights.


