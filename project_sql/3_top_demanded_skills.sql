select skills,
    count(skills_job_dim.job_id) as demand_count
from job_postings_fact
    inner join skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim on skills_dim.skill_id = skills_job_dim.skill_id
    where job_postings_fact.job_title = 'Data Analyst'
GROUP BY skills 
ORDER BY demand_count DESC
limit 5