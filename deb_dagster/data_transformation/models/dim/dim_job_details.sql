WITH scr_details AS (SELECT * FROM {{ ref('scr_details') }})

SELECT
    {{dbt_utils.generate_surrogate_key(['description_text'])}} AS job_details_id,
    headline,
    description_text,
    description_html,
    employment_type,
    duration,
    salary_type,
    scope_of_work_min,
    scope_of_work_max
FROM scr_details