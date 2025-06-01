-- =============================================================
-- 📊 Data Science Salaries 2025 — SQL Insight Project
-- 📅 Date: June 2025
-- 👤 Author: Denys Aralov
-- 🧠 Description: SQL-based exploratory analysis of the 2025
--     Data Science Salaries dataset using PostgreSQL.
--     Includes insights by job title, country, experience level,
--     company size, employment type, and remote ratio.
-- =============================================================
-- 🔹 1. Top 10 job titles by average salary (USD)
SELECT job_title, 
       ROUND(AVG(salary_in_usd)) AS avg_salary_usd, 
	   COUNT(*) AS job_count
FROM salaries
GROUP BY job_title
ORDER BY avg_salary_usd DESC
LIMIT 10;

-- 🔹 2. Average salary by company location (Top 10 countries)
SELECT company_location, 
       ROUND(AVG(salary_in_usd)) AS avg_salary_usd, 
	   COUNT(*) AS job_count
FROM salaries
GROUP BY company_location
ORDER BY avg_salary_usd DESC
LIMIT 10;

-- 🔹 3. Average salary by experience level
SELECT exp_level, 
       ROUND(AVG(salary_in_usd)) AS avg_salary_usd, 
       COUNT(*) AS job_count
FROM salaries
GROUP BY exp_level
ORDER BY avg_salary_usd DESC;

-- 🔹 4. Average salary by employment type
SELECT emp_type, 
       ROUND(AVG(salary_in_usd)) AS avg_salary_usd, 
	   COUNT(*) AS job_count
FROM salaries
GROUP BY emp_type
ORDER BY avg_salary_usd DESC;

-- 🔹 5. Average salary by remote work ratio
SELECT remote_ratio,
       CASE
           WHEN remote_ratio = 100 THEN 'Fully Remote'
           WHEN remote_ratio = 50 THEN 'Hybrid'
           WHEN remote_ratio = 0 THEN 'On-site'
           ELSE 'Other'
       END AS work_mode,
       ROUND(AVG(salary_in_usd)) AS avg_salary_usd,
       COUNT(*) AS job_count
FROM salaries
GROUP BY remote_ratio
ORDER BY avg_salary_usd DESC;

-- 🔹 6. Most common job titles (Top 10)
SELECT job_title, 
       COUNT(*) AS job_count
FROM salaries
GROUP BY job_title
ORDER BY job_count DESC
LIMIT 10;

-- 🔹 7. Average salary by company size
SELECT company_size, 
       ROUND(AVG(salary_in_usd)) AS avg_salary_usd, 
	   COUNT(*) AS job_count
FROM salaries
GROUP BY company_size
ORDER BY avg_salary_usd DESC;

-- ✅ End of file