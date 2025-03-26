/*

This script is used to install the CARTO Analytics Toolbox within your Snowflake Trial.

Before running this script, please be sure to replace MY_API_BASE_URL and MY_API_ACCESS_TOKEN 
at the bottom of the script, following the instruction guide provided.

*/

-- Set admin permissions
USE ROLE ACCOUNTADMIN;

-- Create the carto database
CREATE DATABASE CARTO;

-- Create the carto schema
CREATE SCHEMA CARTO.CARTO;

-- Grant all to sysadmin role
GRANT ALL ON SCHEMA CARTO.CARTO TO ROLE SYSADMIN;

-- Set create function and procedure permissions
GRANT USAGE ON DATABASE CARTO TO APPLICATION CARTO_ANALYTICS_TOOLBOX;
GRANT USAGE, CREATE FUNCTION, CREATE PROCEDURE ON SCHEMA CARTO.CARTO TO APPLICATION CARTO_ANALYTICS_TOOLBOX;

-- Generate the installer procedure in the specified location
CALL CARTO_ANALYTICS_TOOLBOX.CARTO.GENERATE_INSTALLER('CARTO.CARTO');

-- Update ownership of the install procedure
GRANT OWNERSHIP ON PROCEDURE CARTO.CARTO.INSTALL(STRING, STRING) TO ROLE ACCOUNTADMIN REVOKE CURRENT GRANTS;

-- Grant usage to public role
GRANT USAGE ON DATABASE CARTO TO ROLE PUBLIC;
GRANT USAGE ON SCHEMA CARTO.CARTO TO ROLE PUBLIC;
GRANT SELECT ON FUTURE TABLES IN SCHEMA CARTO.CARTO TO ROLE PUBLIC;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA CARTO.CARTO TO ROLE PUBLIC;
GRANT USAGE ON FUTURE FUNCTIONS IN SCHEMA CARTO.CARTO TO ROLE PUBLIC;
GRANT USAGE ON FUTURE PROCEDURES IN SCHEMA CARTO.CARTO TO ROLE PUBLIC;

-- Install the Analytics Toolbox in CARTO.CARTO
CALL CARTO.CARTO.INSTALL('CARTO_ANALYTICS_TOOLBOX', 'CARTO.CARTO');


/* ------------------------------------------------------------------- 
Setup Location Data Services 
*/ -------------------------------------------------------------------

-- Set admin permissions
USE ROLE ACCOUNTADMIN;

-- Create the api integration - this is presuming that you are using the AWS Europe (Ireland) eu-west-1 AWS region Snowflake.
CREATE OR REPLACE API INTEGRATION CARTO_API
  API_PROVIDER = AWS_API_GATEWAY
  API_AWS_ROLE_ARN = 'arn:aws:iam::000955892807:role/CartoFunctionsRole'
  ENABLED = TRUE
  API_ALLOWED_PREFIXES = ('https://01wzfofw1l.execute-api.eu-west-1.amazonaws.com/production/at-gateway');

-- Run the SETUP procedure. THIS NEEDS TO BE CONFIGURED.
CALL CARTO.CARTO.SETUP('{
  "api_integration": "CARTO_API",
  "endpoint": "https://01wzfofw1l.execute-api.eu-west-1.amazonaws.com/production/at-gateway",
  "api_base_url": "MY_API_BASE_URL",
  "api_access_token": "MY_API_ACCESS_TOKEN"
}');