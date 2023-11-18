# Human Resource Analysis

### Project Overview

The primary objective of this project is to leverage data analysis and interpretation within the Human Resource dapartment to optimize decision-making processes,streamline operations, and enhance employee satisfaction and performance.

### Data Sources

The primaly dataset used for this analysis is the "hr_data.csv" file with over 22000 rows, containing detailed information about employees from the year 2000 to 2020.

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

# Business Questions To Answer

1.What is the gender breakdown of employees in the country?





