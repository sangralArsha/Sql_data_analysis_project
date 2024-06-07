/*
Answer: what are the most optimal skills to learn (aka it's in high demad and a high-pYING SKILL)?
*/


Select 
        skills_dim.skill_id,
        skills_dim.skills,
        count(skills_job_dim.job_id) as demand_count,
        round(avg(job_postings_fact.salary_year_avg) ,0) as avg_salary    
from job_postings_fact
Inner join skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where 
            job_title_short = 'Data Analyst' and
            salary_year_avg is not null and
            job_work_from_home=True
GROUP BY
            skills_dim.skill_id
HAVING
            count(skills_job_dim.job_id) >10

order BY

        avg_salary desc,
        demand_count DESC
limit 25;

    




