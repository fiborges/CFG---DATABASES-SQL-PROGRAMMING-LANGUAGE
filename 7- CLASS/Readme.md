# Perfect World Scenarios
## Disaster Strikes - Real-Life Scenarios
In the world of data management, unexpected disasters can happen. Here are some real-life scenarios you might encounter:

### I Accidentally Dropped a DB Table!
Learn how to recover from the dreaded moment when you accidentally drop a database table.

### I Need to Audit an Old DB!
Discover methods for auditing and examining an old database to ensure data integrity.

### I Have a Backup, But It Does Not Restore!
Troubleshoot issues related to database backup restoration.

### I Spilled Coffee on My Laptop, It Is Dead!
Prepare for hardware failures and data recovery challenges.

## MYSQLDUMP
We can back up one database or multiple ones simultaneously.
Back up a single table from a database.
Back up not just the database but also the logic encapsulated in Triggers, Stored Procedures, etc.
We will use CMD (Linux command line window) to perform the backup.

## SCENARIO SET UP

Imagine a scenario where London and Paris bakeries need to analyze end-of-month sales and pay franchise royalties to the Bakery brand in France. Pierre asks Margaret to take a backup of the London bakery database, capturing all activities, including sales figures, and send it over to him.

### Task:

Take a backup of a single database.
Store it in a new folder.


### SELF-STUDY TASK

Explore multiple scenarios in the reference materials section for additional challenges in backing up multiple tables within one DB or even multiple DBs.
Review and complete the study cases on DB backup.

## DATABASE RESTORE
A successful restore is equally valuable as a successful backup.
A disaster recovery strategy is never complete without testing a database restore.
Always test your backup by restoring it on a test server or another machine.

## CREATING BACKUP
### Syntax:

```
mysqldump options > backup_filename.sql

```
### EXAMPLE:

```css

mysqldump --user=username --password=password database_name > backup.sql
```

Following our scenario, Pierre receives the backup and needs to restore the database on a server.

### Task:

Restore a single database.
Store it in a new folder.

## QUICK SUMMARY
mysqldump is a client utility that performs a logical backup.
You can back up a database, a table, a schema, any stored routines, and various other objects with mysqldump.
mysql is a client utility that restores a logical backup.
mysqldump is useful for taking a backup, while the mysql command is useful for restoring the backup.

# Tableau
## Introduction
Tableau is a robust data visualization tool widely used in the business intelligence industry. It simplifies raw data into easily understandable formats, facilitating fast data analysis. The visualizations created can be in the form of dashboards and worksheets, making data comprehension accessible at all levels within an organization.

### Features
Tableau boasts an array of impressive features:

#### Data Blending: 
  Easily blend data from various sources.
#### No Need for Technical Knowledge: 
  No coding expertise required.
#### Real-time Analysis: 
  Perform data analysis in real-time.
#### Data Collaboration and Notifications: 
  Collaborate on data and receive notifications.
#### DAX Analysis Function: 
  Use Data Analysis Expressions (DAX) for advanced analysis.
#### Patented Technology: 
  Powered by technology from Stanford University.
#### Drag-and-drop Interface: 
  Create visuals with ease.
#### Native Data Connectors: 
  Connect to various data sources.
#### Highlight and Filter Data: 
  Focus on specific data points.
#### Share Dashboards: 
  Collaborate and share insights.
#### Mobile-ready Dashboards: 
  Access dashboards on mobile devices.
#### Tableau Reader: 
  View data with Tableau Reader.
#### Dashboard Commenting: 
  Add comments to dashboards.
#### No-code Data Queries: 
  Build queries without coding.
#### Translate Queries to Visualizations: 
  Convert queries into visual representations.
#### Import All Data Sizes: 
  Manage data of any range and size.

## Interesting Facts
Tableau offers a drag-and-drop feature for creating interactive visuals quickly.
Tableau offers various products, including Tableau Desktop, Tableau Server, Tableau Online, Tableau Vizable, Tableau Public, and Tableau Reader.
Tableau Software was founded in 2003, with Tableau Desktop 1.0 released in 2004.
Tableau software tends to be more expensive compared to Power BI.

# Power BI
## Introduction
Power BI is another influential Business Intelligence and Data Visualization tool. It excels at converting data from diverse sources into interactive dashboards and BI reports. Microsoft Power BI effectively handles data integration, cleaning, and visualization. It also supports ad hoc report generation for in-depth data analysis.

## Features
Power BI offers a comprehensive set of features:

#### Customizable Dashboards: 
  Create dashboards tailored to your needs.
#### Datasets: 
  Work with datasets from multiple sources.
#### Reports: 
  Generate informative reports.
#### Navigation Pane: 
  Easy navigation through the interface.
#### Q&A Question Box: 
  Ask questions in natural language.
#### Ad Hoc Reporting and Analysis: 
  Perform real-time analysis.
#### Online Analytical Processing (OLAP): 
  Utilize OLAP for advanced analytics.
#### Trend Indicators: 
  Identify trends in your data.
#### Interactive Reports Authoring: 
  Author interactive reports effortlessly.
#### Complete Reporting & Data Visualization Tools: 
  All tools required for effective reporting.
#### Real-time Dashboards: 
  Monitor and solve problems in real-time.
#### Power BI Embedded: 
  Integrate Power BI into your applications.
#### Q&A Feature: 
  Ask questions using natural language for graphical answers.
#### Content Packs: 
  Share dashboards and content with your team.

## Interesting Facts
Power BI offers an intuitive drag-and-drop functionality for easy visualization.
Key components of Power BI include Power BI Desktop, Power Bi Service, Power BI Mobile Apps, Power BI Gateway, and Power BI Report Server.
Power BI was designed in 2010 and made available to the public in July 2011.
Power BI is generally more cost-effective compared to Tableau, with the professional version costing less than $10 per month per user.
Important Note for Power BI
Power BI is part of the Microsoft 365 product family and may not be easily usable on Mac devices.
A work or school email address is required for registration; consumer email services or telecommunication providers' addresses cannot be used.
