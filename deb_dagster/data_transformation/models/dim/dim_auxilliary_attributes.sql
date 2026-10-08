WITH scr_auxilliary_attributes AS (SELECT * FROM {{ ref('scr_auxilliary_attributes') }})

SELECT
    {{dbt_utils.generate_surrogate_key(['aux_key'])}} AS auxilliary_attributes_id,
    MAX(experience_required) AS experience_required,
    MAX(driving_license_required) AS driving_license_required,
    MAX(access_to_own_car) AS access_to_own_car
FROM scr_auxilliary_attributes
GROUP BY auxilliary_attributes_id