select skills,
    round(avg(salary_hour_avg), 0) as avg_salary
from job_postings_fact
    inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_dim.skill_id = skills_job_dim.skill_id
    where job_postings_fact.job_title = 'Data Analyst'
    and salary_hour_avg is not null
GROUP BY skills 
ORDER BY avg_salary DESC
limit 25