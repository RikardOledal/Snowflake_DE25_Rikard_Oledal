WITH job_ads AS (SELECT * FROM {{ ref('src_job_ads') }})

SELECT
    {{ dbt_utils.generate_surrogate_key(['occupation__label'])}} AS occupation_id,
    {{dbt_utils.generate_surrogate_key(['description__text'])}} AS job_details_id,
    {{dbt_utils.generate_surrogate_key(['employer__organization_number'])}} AS employer_id,
    {{dbt_utils.generate_surrogate_key(['aux_key'])}} AS auxilliary_attributes_id,
    vacancies,
    relevance,
    application_deadline
FROM job_ads