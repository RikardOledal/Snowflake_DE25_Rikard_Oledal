SELECT 
    headline,
    employer__name,
    workplace_address__street_address,
    application_details__email,
    employer__url
FROM job_ads.staging.data_field_job_ads  