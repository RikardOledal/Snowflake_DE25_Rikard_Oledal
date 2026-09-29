WITH
    fct_job_ads AS (SELECT * FROM {{ ref('fct_job_ads') }}),
    dim_occupation AS (SELECT * FROM {{ ref('dim_occupation') }})
SELECT
    f.occupation_id,
    o.occupation,
    o.occupation_group,
    o.occupation_field,
    f.application_deadline
FROM fct_job_ads f
LEFT JOIN dim_occupation o ON f.occupation_id = o.occupation_id