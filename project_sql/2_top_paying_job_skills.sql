with top_paying_jobs as (

    SELECT
        job_id,
        name  company_name,
        job_title,
        salary_year_avg
        
    FROM
        job_postings_fact 
    left join company_dim  
        on job_postings_fact.company_id = company_dim.company_id     
    WHERE
        job_title_short = 'Data Analyst' AND
        job_location = 'Anywhere' AND
        salary_year_avg is not Null

    order by 
    salary_year_avg desc    
    limit 10  )         


select 
    top_paying_jobs.*,
    skills
from top_paying_jobs
Inner join skills_job_dim on top_paying_jobs.job_id=skills_job_dim.job_id
INNER JOIN skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
order BY
    salary_year_avg DESC