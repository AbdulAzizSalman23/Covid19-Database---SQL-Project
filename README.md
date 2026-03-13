# COVID-19 Data Analysis (SQL Project)

## Project Goal
The objective of this project is to analyze global COVID-19 datasets using SQL to derive insights into infection trends, mortality rates, and vaccination progress across different countries and continents.

## Problem Statement
The COVID-19 pandemic generated large volumes of global health data. Extracting meaningful insights from this data requires efficient querying, aggregation, and analytical techniques.

This project uses SQL queries to explore pandemic trends and analyze how infection rates, death rates, and vaccination progress vary across different regions.

## Tools & Technologies Used
+ SQL  
+ Microsoft SQL Server  
+ Window Functions  
+ Common Table Expressions (CTE)  
+ Data Views  

## Data Analysis Performed

### Infection and Mortality Analysis
SQL queries were used to calculate:

+ Total cases vs total deaths  
+ Death percentage for different countries  
+ Total cases relative to population size  

This helps analyze the severity of the pandemic across regions.

### Global Trend Analysis
Global metrics were calculated by aggregating daily cases and deaths across all countries to understand global pandemic progression over time.

### Country-Level Infection Rate Analysis
Countries were compared based on:

+ Maximum infection count  
+ Percentage of population affected  

This allowed identification of regions most impacted by the pandemic.

### Vaccination Progress Analysis
Vaccination datasets were joined with death datasets to analyze vaccination progress.

A **window function** was used to compute cumulative vaccination counts for each country over time.

### Common Table Expression (CTE)
A CTE was created to calculate vaccination percentage relative to population size.

### SQL Views for Visualization
Two SQL views were created for downstream visualization and analysis:

+ Total Population vs Vaccination  
+ Countries with Highest Death Rate  

## Key Insights
+ Infection rates varied significantly across countries relative to population size  
+ Global death percentages fluctuated over time as the pandemic progressed  
+ Vaccination campaigns significantly increased cumulative vaccination coverage across many countries  

## Business Impact
This project demonstrates how SQL-based analytics can be used to process large datasets and generate meaningful insights for data-driven decision making. The techniques used in this project are applicable to fields such as healthcare analytics, policy planning, and large-scale data analysis.
