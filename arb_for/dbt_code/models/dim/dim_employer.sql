WITH scr_employer AS (SELECT * FROM {{ ref('scr_employer') }})

SELECT
    {{dbt_utils.generate_surrogate_key(['employer_organization_number'])}} AS employer_id,
    MAX(employer_name) AS employer_name,
    MAX(employer_workplace) AS employer_workplace,
    employer_organization_number,
    MAX(workplace_street_address) AS workplace_street_address,
    MAX(workplace_region) AS workplace_region,
    MAX(workplace_postcode) AS workplace_postcode,
    MAX(workplace_city) AS workplace_city,
    MAX(workplace_country) AS workplace_country,
FROM scr_employer
GROUP BY employer_organization_number