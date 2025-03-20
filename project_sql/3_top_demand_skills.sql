SELECT
skills_dim.skills AS skills,

COUNT(job_postings_fact.job_id) AS demandcount

FROM job_postings_fact
INNER JOIN skills_job_dim ON skills_job_dim.job_id = job_postings_fact.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE
job_postings_fact.job_title_short = 'Data Analyst'
AND
job_work_from_home = TRUE
GROUP BY
skills_dim.skills
ORDER BY
demandcount desc

LIMIT 5