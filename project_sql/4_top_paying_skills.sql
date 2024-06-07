/*
answer: What are the top skilss based on Salary?
*/

Select 
    skills,
    round(avg(salary_year_avg) ,0) as avg_salary
from job_postings_fact
Inner join skills_job_dim on job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
where 
    job_title_short = 'Data Analyst' and
    salary_yaer_avh is not null
    --job_work_from_home=True
GROUP BY
    skills
order by
    avg_salary desc   
limit 25;