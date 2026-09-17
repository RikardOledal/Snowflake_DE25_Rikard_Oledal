USE ROLE SYSADMIN;

CREATE DATABASE IF NOT EXISTS job_ads;

CREATE SCHEMA IF NOT EXISTS job_ads.staging;

GRANT USAGE ON WAREHOUSE dev_wh TO ROLE job_ads_dlt_role;
GRANT USAGE ON DATABASE job_ads TO ROLE job_ads_dlt_role;
GRANT USAGE ON SCHEMA job_ads.staging TO ROLE job_ads_dlt_role;
GRANT CREATE TABLE ON SCHEMA job_ads.staging TO ROLE job_ads_dlt_role;

GRANT SELECT ON ALL TABLES IN SCHEMA job_ads.staging TO ROLE job_ads_dlt_role;
GRANT SELECT ON FUTURE TABLES IN DATABASE job_ads TO ROLE job_ads_dlt_role;