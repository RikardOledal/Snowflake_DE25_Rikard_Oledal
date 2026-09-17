USE ROLE USERADMIN;

CREATE ROLE IF NOT EXISTS job_ads_dlt_role;

USE ROLE SECURITYADMIN;

GRANT ROLE job_ads_dlt_role TO USER extract_loader;
GRANT ROLE job_ads_dlt_role TO USER rikardoled;
GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA job_ads.staging TO ROLE job_ads_dlt_role;
GRANT SELECT ON ALL TABLES IN SCHEMA job_ads.staging TO ROLE job_ads_dlt_role;
GRANT SELECT ON FUTURE TABLES IN SCHEMA job_ads.staging TO ROLE job_ads_dlt_role;

SHOW GRANTS ON SCHEMA job_ads.staging;
SHOW FUTURE GRANTS IN SCHEMA job_ads.staging;
SHOW GRANTS TO ROLE job_ads_dlt_role;
SHOW GRANTS TO USER rikardoled;
