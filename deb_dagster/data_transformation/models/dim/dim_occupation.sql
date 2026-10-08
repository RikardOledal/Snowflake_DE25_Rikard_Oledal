WITH scr_occupation AS (SELECT * FROM {{ ref('scr_occupation') }})

SELECT
    {{dbt_utils.generate_surrogate_key(['occupation'])}} AS occupation_id,
    occupation,
    MAX(occupation_group) AS occupation_group,
    MAX(occupation_field) AS occupation_field
FROM scr_occupation
GROUP BY occupation