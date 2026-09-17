USE ROLE movies_reader_role;

SHOW DATABASES;
USE DATABASE movies;

DESCRIBE DATABASE movies;

DESCRIBE SCHEMA staging;

SHOW TABLES staging.netflix;

USE WAREHOUSE dev_wh;

DESC TABLE staging.netflix;
SELECT * FROM staging.netflix LIMIT 10;

SELECT COUNT(*) FROM staging.netflix;