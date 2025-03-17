SELECT 
job_id, 
job_title,
salary_year_avg,
CASE
WHEN job_title ILIKE  '%Senior%' THEN 'Senior'
WHEN job_title ILIKE  '%Manager%' OR job_title ILIKE  '%Lead%'THEN 'Lead/Manager'
WHEN job_title ILIKE '%Junior%' OR job_title ILIKE '%Entry%' THEN 'Junior/Entry'
ELSE 'Not Specified'
END AS experience_level,
CASE
WHEN job_work_from_home = TRUE THEN 'YES'
ELSE 'NO'
END AS remote_option

FROM job_postings_fact

WHERE 
  salary_year_avg IS NOT NULL 
ORDER BY 
  job_id;

