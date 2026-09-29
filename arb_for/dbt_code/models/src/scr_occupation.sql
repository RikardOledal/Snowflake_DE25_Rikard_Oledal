WITH stg_job_ads AS (SELECT * FROM {{ source('job_ads', 'stg_ads') }})

SELECT
    occupation_group__concept_id AS occupation_group_id,
    occupation_field__concept_id AS occupation_field_id,
    occupation__label AS occupation,
    occupation_group__label AS occupation_group,
    occupation_field__label AS occupation_field
FROM stg_job_ads
ORDER BY application_deadline