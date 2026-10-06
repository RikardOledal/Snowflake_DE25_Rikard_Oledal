WITH
    fct_job_ads AS (SELECT * FROM {{ ref('fct_job_ads') }}),
    dim_occupation AS (SELECT * FROM {{ ref('dim_occupation') }}),
    dim_job_details AS (SELECT * FROM {{ ref('dim_job_details') }})
SELECT
    f.occupation_id,
    o.occupation,
    o.occupation_group,
    o.occupation_field,
    f.vacancies,
    d.salary_type,
    d.scope_of_work_max,
    f.application_deadline
FROM fct_job_ads f
LEFT JOIN dim_occupation o ON f.occupation_id = o.occupation_id
LEFT JOIN dim_job_details d ON f.job_details_id = d.job_details_id