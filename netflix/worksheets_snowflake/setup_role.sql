-- CREATE ROLES
USE ROLE USERADMIN;

CREATE ROLE IF NOT EXISTS movies_dlt_role;
CREATE ROLE IF NOT EXISTS movies_reader_role;

-- GIVE ROLES TO USERS
USE ROLE SECURITYADMIN;

GRANT ROLE movies_dlt_role TO USER extract_loader;
GRANT ROLE movies_reader_role TO USER rikardoled;

-- GRANT PRIVILEGES TO ROLE
GRANT USAGE ON WAREHOUSE dev_wh TO ROLE movies_dlt_role;
GRANT USAGE ON DATABASE movies TO ROLE movies_dlt_role;
GRANT USAGE ON SCHEMA movies.staging TO ROLE movies_dlt_role;
GRANT CREATE TABLE ON SCHEMA movies.staging TO ROLE movies_dlt_role;
GRANT INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA movies.staging TO ROLE movies_dlt_role;
GRANT INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA movies.staging TO ROLE movies_dlt_role;

-- CHECK GRANTS
SHOW GRANTS ON SCHEMA movies.staging;
SHOW FUTURE GRANTS IN SCHEMA movies.staging;
SHOW GRANTS TO ROLE movies_dlt_role;
SHOW GRANTS TO USER extract_loader;

GRANT USAGE ON WAREHOUSE dev_wh TO ROLE movies_reader_role;
GRANT USAGE ON DATABASE movies TO ROLE movies_reader_role;
GRANT USAGE ON SCHEMA movies.staging TO ROLE movies_reader_role;

GRANT SELECT ON ALL TABLES IN SCHEMA movies.staging TO ROLE movies_reader_role;
GRANT SELECT ON FUTURE TABLES IN DATABASE movies TO ROLE movies_reader_role;
