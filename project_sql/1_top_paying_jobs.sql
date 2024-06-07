SELECT
    job_id,
    name  company_name,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
    
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
limit 10           
