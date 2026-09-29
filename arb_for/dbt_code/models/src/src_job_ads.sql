WITH stg_job_ads AS (SELECT * FROM {{ source('job_ads', 'stg_ads') }})

SELECT 
    occupation__label,
    description__text,
    experience_required||driving_license_required||access_to_own_car AS aux_key,
    employer__organization_number,
    number_of_vacancies AS vacancies,
    relevance,
    application_deadline
FROM stg_job_ads
ORDER BY application_deadline