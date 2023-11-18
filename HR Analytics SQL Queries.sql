SELECT * 
FROM 
	hr;

-- data cleaning and preprocessing.

ALTER TABLE hr
CHANGE COLUMN ï»¿id emp_id VARCHAR(20) NULL;
    
DESCRIBE hr;

SET sql_safe_updates=0;

UPDATE hr
SET birthdate = CASE
	WHEN birthdate LIKE'%/%'THEN date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
    WHEN birthdate LIKE'%-%'THEN date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
    ELSE null
END;

ALTER TABLE hr
MODIFY COLUMN birthdate DATE;

-- change the data format and datatype of hire_date column.

UPDATE hr
SET hire_date = CASE
	WHEN hire_date LIKE'%/%'THEN date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
    WHEN hire_date LIKE'%-%'THEN date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
    ELSE null
END;

ALTER TABLE hr
MODIFY COLUMN hire_date DATE;

-- change the date format and datatype of termdate column.

UPDATE hr
SET termdate=date(str_to_date(termdate,'%Y-%m-%d %H:%i:%s UTC'))
WHERE termdate IS NOT NULL AND termdate !="";

UPDATE hr
SET termdate = null
WHERE termdate = '';

SELECT termdate FROM hr;

-- create age column
ALTER TABLE hr
ADD column age INT;

UPDATE hr
SET age = timestampdiff(YEAR,birthdate,curdate())

-- 1. what is the gender breakdown of employees in the company.

SELECT * FROM hr;

SELECT
	gender,
    COUNT(*) AS count
FROM 
	hr
WHERE
	age >= 18 AND termdate IS NULL
GROUP BY
	gender;

-- 2. What is the race breakdown of employees in the company?

SELECT
	race,
    COUNT(*) AS count
FROM 
	hr
WHERE
	age >= 18 AND termdate IS NULL
GROUP BY
	race
ORDER BY
	COUNT(*) DESC;
    
-- 3. What is the age distribution of employees in the company?

SELECT
	CASE
		WHEN age>=18 AND age<=24 THEN '18-24'
        WHEN age>=25 AND age<=34 THEN '25-34'
        WHEN age>=35 AND age<=44 THEN '35-44'
        WHEN age>=45 AND age<=54 THEN '45-54'
        WHEN age>=55 AND age<=64 THEN '55-64'
        ELSE '65+'
	END AS age_group,
    COUNT(*) AS count
FROM
	hr
WHERE
	age >= 18 AND termdate IS NULL
GROUP BY
	age_group
ORDER BY
	age_group;
    
SELECT
	CASE
		WHEN age>=18 AND age<=24 THEN '18-24'
        WHEN age>=25 AND age<=34 THEN '25-34'
        WHEN age>=35 AND age<=44 THEN '35-44'
        WHEN age>=45 AND age<=54 THEN '45-54'
        WHEN age>=55 AND age<=64 THEN '55-64'
        ELSE '65+'
	END AS age_group,gender,
    COUNT(*) AS count
FROM
	hr
WHERE
	age >= 18 AND termdate IS NULL
GROUP BY
	age_group,gender
ORDER BY
	age_group,gender;
    
-- 4. How many employee work at HQ vs remote?

SELECT 
	location,
    COUNT(*) AS count
FROM
	hr
WHERE
	age >= 18 AND termdate IS NULL
GROUP BY
	location;
    
-- 5. What is the average length of employment for employees who have been terminated?

SELECT
	ROUND(AVG(datediff(termdate,hire_date))/365,0) AS avg_length_of_emp
FROM
	hr
WHERE
	age >= 18 AND termdate IS NOT NULL AND termdate <= curdate();

-- 6. How does the gender distribution vary across dept. and job titles.

SELECT
	department,
    gender,
    COUNT(*) AS count
FROM
	hr
WHERE
	age >= 18 AND termdate IS NOT NULL
GROUP BY
	department,
    gender
ORDER BY
	department;

-- 7. How does the gender distribution vary across dept.

SELECT
	department,
    gender,
    COUNT(*) AS count
FROM
	hr
WHERE
	termdate IS NOT NULL
GROUP BY
	department,
    gender
ORDER BY
	department,
    gender;

-- 8. What is the distribution of jobtitles across the company.

SELECT
	jobtitle,
    COUNT(*) AS count
FROM
	hr
WHERE
	age >= 18 AND termdate IS NULL
GROUP BY
	jobtitle
ORDER BY
	jobtitle DESC;
    
-- 9. Which the dept has the higher turnover/termination rate.

SELECT
	department,
    total_count,
    terminated_count,
    terminated_count/total_count AS termination_rate
FROM( 
	SELECT department,
    COUNT(*) AS total_count,
    SUM(CASE
			WHEN termdate IS NOT NULL AND termdate <= curdate() THEN 1 ELSE 0 END) AS terminated_count
	FROM
		hr
    WHERE
		age >= 18
	GROUP BY
		department
    ) AS subquery     
ORDER BY
		termination_rate DESC;
    
-- 10. What is the distribution of employees across location_state?

SELECT
	location_state,
    COUNT(*) AS count
FROM
	hr
WHERE
	age >= 18 AND termdate IS NULL
GROUP BY
	location_state
ORDER BY
	count DESC;
    
-- 11. What is the distribution of employees across location_city?

SELECT
	location_city,
    COUNT(*) AS count
FROM
	hr
WHERE
	age >= 18 AND termdate IS NULL
GROUP BY
	location_city
ORDER BY
	count DESC;
    
-- 12. How has the company's employee count changed over time based on hire and termination date?

SELECT
	year,
    hires,
    terminations,
    hires - terminations AS net_change,
    round((hires - terminations)/hires*100,2) AS net_change_percent
FROM (
		SELECT year(hire_date) AS year,
        COUNT(*) AS hires,
        SUM(CASE
				WHEN termdate IS NOT NULL AND termdate <= curdate() THEN 1 ELSE 0
			END) AS terminations
            FROM hr
            WHERE age >= 18
            GROUP BY year(hire_date)
		)AS subquery
ORDER BY year ASC;
  
-- 13. What is the tenure distribution for each dept.

SELECT
	department,
    round(avg(datediff(termdate,hire_date)/365),0) AS avg_tenure
FROM
	hr
WHERE
	age >= 18 AND termdate IS NOT NULL AND termdate <= curdate()
GROUP BY
	department;
	
	









