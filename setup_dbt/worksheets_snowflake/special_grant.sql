USE ROLE securityadmin;
USE DATABASE job_ads;
GRANT CREATE SCHEMA ON DATABASE job_ads TO job_ads_dbt_role;

SHOW GRANTS TO ROLE job_ads_dbt_role;