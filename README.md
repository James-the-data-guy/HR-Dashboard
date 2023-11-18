# Human Resource Analysis

### Project Overview

The primary objective of this project is to leverage data analysis and interpretation within the Human Resource dapartment to optimize decision-making processes,streamline operations, and enhance employee satisfaction and performance.

### Data Sources

The primaly dataset used for this analysis is the "**hr_data.csv**" file with over 22000 rows, containing detailed information about employees from the year 2000 to 2020.

### Tools
- MySQL Workbench - Data Cleaning & Analysis
- Power BI - Data Visualization

### Approach Used

1.Data Wrangling: This is the first step where inspection of data is done to make sure null values and missing values are detected and are replaced.
- Create table and insert the data
- Select columns having null values.

2.Feature Engineering: This will heip use by generating some new columns from existing ones.
 
  1. Changed the column name from unknown character into emp_id, thus making the column the unique identifier or primary key.
  2. Changed the date format and datatype of birthdate column.
  3. Changed the date format and datatype of hiredate column.
  4. Add a new columns named date and age that enable to analyse the available data.

3.Exploratory Data Analysis(EDA) is dome to answer the listed questions.

## Business Questions To Answer

1. What is the gender breakdown of employees in the country?
2. What is the race/ethnicity breakdown of employees in the company?
3. What is the age distribution of employees in the company?
4. How many employees work at headquarters versus remote locations?
5. What is the average length of employment for employees who have been terminated?
6. How does the gender distribution vary across departments and job titles?
7. What is the distribution of job titles across the company?
8. Which department has the highest turnover rate?
9. What is the distribution of employees across locations by state?
10. How has the company's employee count changed over time based on hire and term dates?
11. What is the tenure distribution for each department?

## Summary of Findings

 - There are more male employees
 - White race is the most dominant while Native Hawaiian and American Indian are the least dominant.
 - The youngest employee is 20 years old and the oldest is 57 years old
 - 5 age groups were created (18-24, 25-34, 35-44, 45-54, 55-64). A large number of employees were between 25-34 followed by 35-44 while the smallest group was 55-64.
 - A large number of employees work at the headquarters versus remotely.
 - The average length of employment for terminated employees is around 7 years.
 - The gender distribution across departments is fairly balanced but there are generally more male than female employees.
 - The Marketing department has the highest turnover rate followed by Training. The least turn over rate are in the Research and development, Support and Legal departments.
 - A large number of employees come from the state of Ohio.
 - The net change in employees has increased over the years.
 - The average tenure for each department is about 8 years with Legal and Auditing having the highest and Services, Sales and Marketing having the lowest.

## Limitations

 - Some records had negative ages and these were excluded during querying(967 records). Ages used were 18 years and above.
 - Some termdates were far into the future and were not included in the analysis(1599 records). The only term dates used were those less than or equal to the current date.

