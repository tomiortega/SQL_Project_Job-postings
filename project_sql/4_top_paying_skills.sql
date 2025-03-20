SELECT
skills_dim.skills AS skills,

ROUND(AVG(job_postings_fact.salary_year_avg),0) AS salary

FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE
job_postings_fact.job_title_short = 'Data Analyst'
AND
job_work_from_home = TRUE
AND
job_postings_fact.salary_year_avg is NOT NULL
GROUP BY
skills_dim.skills
ORDER BY
salary desc

LIMIT 25