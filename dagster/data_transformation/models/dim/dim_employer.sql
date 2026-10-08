WITH scr_employer AS (SELECT * FROM {{ ref('scr_employer') }})

SELECT
    {{dbt_utils.generate_surrogate_key(['employer_workplace', 'workplace_address__municipality'])}} AS employer_id,
    MAX(COALESCE(employer_organization_number, 'saknar organizationnummer')) AS employer_organization_number,
    MAX(COALESCE(employer_name, 'namn ej angiven')) AS employer_name,
    MAX(COALESCE(employer_workplace, 'plats ej angiven')) AS employer_workplace,
    MAX(COALESCE(workplace_street_address, 'gata ej angiven')) AS workplace_street_address,
    MAX(COALESCE(workplace_region, 'region ej angiven')) AS workplace_region,
    MAX(COALESCE(workplace_postcode, 'postnummer ej angiven')) AS workplace_postcode,
    MAX(COALESCE(workplace_city, 'stad ej angiven')) AS workplace_city,
    MAX(COALESCE(workplace_country, 'land ej angivet')) AS workplace_country,
    MAX(COALESCE(workplace_address__municipality, 'kommun ej angiven')) AS workplace_municipality
FROM scr_employer
GROUP BY employer_id