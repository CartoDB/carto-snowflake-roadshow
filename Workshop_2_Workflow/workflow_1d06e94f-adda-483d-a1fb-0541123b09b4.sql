-- WARNING: This procedure requires the Analytics Toolbox and assumes it will be located
-- at the following path: CARTO.CARTO. If you want to deploy and
-- run it in a different location, you will need to update the code accordingly.
CREATE OR REPLACE PROCEDURE
  CARTO.WORKFLOWS_TEMP.wfproc_a33845aea9fa025d(
  )
  RETURNS VARCHAR
  LANGUAGE SQL
  AS
  $$
  /*
   {"versionId":"c80c4f8e1d1ad5de","paramsId":"97d170e1550eee4a","isImmutable":true,"diagramJson":"{\"title\":\"Live flood warnings and river flow\",\"description\":\"\",\"nodes\":[{\"id\":\"799307a3-5434-4167-975f-0ddbbac8c398\",\"data\":{\"name\":\"native.importurl\",\"type\":\"generic\",\"label\":\"Import from URL\",\"inputs\":[{\"name\":\"url\",\"type\":\"String\",\"title\":\"Source URL\",\"placeholder\":\"E.g.: https://storage.googleapis.com/carto_test_tables/places.zip\",\"description\":\"Source URL\",\"value\":\"https://environment.data.gov.uk/flood-monitoring/id/floods.csv\"},{\"name\":\"autoguessing\",\"type\":\"Boolean\",\"title\":\"Automatically guess column data types in the imported table\",\"default\":true,\"description\":\"Automatically guess column data types in the imported table\",\"value\":true}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":80,\"y\":288},\"selected\":false},{\"id\":\"c51e8c81-bc5d-46a9-ad64-ffd8293bf657\",\"data\":{\"id\":\"UNIQUE_PROPERTY_REFERENCE_NUMBERS__GREAT_BRITAIN_OPEN_UPRN.PRS_OPEN_UPRN_SCH.PRS_OPEN_UPRN_TBL\",\"name\":\"ReadTable\",\"size\":1818557440,\"type\":\"table\",\"label\":\"PRS_OPEN_UPRN_TBL\",\"nrows\":40972229,\"inputs\":[{\"name\":\"source\",\"type\":\"String\",\"title\":\"Source table\",\"value\":\"UNIQUE_PROPERTY_REFERENCE_NUMBERS__GREAT_BRITAIN_OPEN_UPRN.PRS_OPEN_UPRN_SCH.PRS_OPEN_UPRN_TBL\",\"description\":\"Read Table\"}],\"schema\":[{\"name\":\"LATITUDE\",\"type\":\"number\"},{\"name\":\"X_COORDINATE\",\"type\":\"number\"},{\"name\":\"LONGITUDE\",\"type\":\"number\"},{\"name\":\"Y_COORDINATE\",\"type\":\"number\"},{\"name\":\"GEOGRAPHY\",\"type\":\"geometry\"},{\"name\":\"UPRN\",\"type\":\"number\"}],\"enriched\":true,\"provider\":\"snowflake\",\"geomField\":\"GEOGRAPHY\",\"lastModified\":1742402187841,\"optimization\":{\"actions\":[{\"type\":\"search optimization\",\"enabled\":false}],\"actionAvailable\":{\"msg\":\"<b>This table isn't optimized.</b> Enabling Snowflake Search Optimization and cluster on geospatial data may improve performance.\",\"type\":\"createTable\",\"query\":\"BEGIN CREATE TABLE {newTableName} AS SELECT * FROM UNIQUE_PROPERTY_REFERENCE_NUMBERS__GREAT_BRITAIN_OPEN_UPRN.PRS_OPEN_UPRN_SCH.PRS_OPEN_UPRN_TBL ORDER BY ST_GEOHASH(GEOGRAPHY); ALTER TABLE {newTableName} ADD SEARCH OPTIMIZATION ON GEO(GEOGRAPHY); END;\"}},\"originalSchema\":[{\"name\":\"LATITUDE\",\"type\":\"NUMBER\"},{\"name\":\"X_COORDINATE\",\"type\":\"NUMBER\"},{\"name\":\"LONGITUDE\",\"type\":\"NUMBER\"},{\"name\":\"Y_COORDINATE\",\"type\":\"NUMBER\"},{\"name\":\"GEOGRAPHY\",\"type\":\"GEOGRAPHY\"},{\"name\":\"UPRN\",\"type\":\"NUMBER\"}]},\"type\":\"source\",\"zIndex\":2,\"position\":{\"x\":-128,\"y\":0},\"selected\":false},{\"id\":\"7df8f679-5de5-42a1-a901-db68a5c14aca\",\"data\":{\"name\":\"native.join\",\"type\":\"generic\",\"label\":\"Join\",\"inputs\":[{\"name\":\"maintable\",\"type\":\"Table\",\"title\":\"Main table\",\"description\":\"Main table\"},{\"name\":\"secondarytable\",\"type\":\"Table\",\"title\":\"Secondary table\",\"description\":\"Secondary table\"},{\"name\":\"maincolumn\",\"type\":\"Column\",\"title\":\"Column in main table\",\"parent\":\"maintable\",\"dataType\":[\"boolean\",\"date\",\"datetime\",\"time\",\"timestamp\",\"number\",\"string\"],\"description\":\"Column in main table\",\"value\":\"FLOODAREAID\"},{\"name\":\"secondarycolumn\",\"type\":\"Column\",\"title\":\"Column in secondary table\",\"parent\":\"secondarytable\",\"dataType\":[\"boolean\",\"date\",\"datetime\",\"time\",\"timestamp\",\"number\",\"string\"],\"description\":\"Column in secondary table\",\"value\":\"PARENT\"},{\"name\":\"jointype\",\"type\":\"Selection\",\"title\":\"Join type\",\"options\":[\"Inner\",\"Left\",\"Right\",\"Full outer\"],\"default\":\"Inner\",\"description\":\"Join type\",\"value\":\"Inner\"}],\"version\":\"1.2\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":256,\"y\":336},\"selected\":false},{\"id\":\"5d15f064-2a37-458d-956b-1862c462541b\",\"data\":{\"id\":\"CARTO.WORKFLOWS_TEMP.IMPORTED_A33845AEA9FA025D_FLOOD_WARNING_AREAS\",\"name\":\"ReadTable\",\"size\":88349696,\"type\":\"table\",\"label\":\"FLOOD_WARNING_AREAS\",\"nrows\":3418,\"inputs\":[{\"name\":\"source\",\"type\":\"String\",\"title\":\"Source table\",\"value\":\"CARTO.WORKFLOWS_TEMP.IMPORTED_A33845AEA9FA025D_FLOOD_WARNING_AREAS\",\"description\":\"Read Table\"}],\"schema\":[{\"name\":\"FWS_TACODE\",\"type\":\"string\"},{\"name\":\"DESCRIP\",\"type\":\"string\"},{\"name\":\"PARENT\",\"type\":\"string\"},{\"name\":\"AREA\",\"type\":\"string\"},{\"name\":\"TA_NAME\",\"type\":\"string\"},{\"name\":\"RIVER_SEA\",\"type\":\"string\"},{\"name\":\"QDIAL\",\"type\":\"number\"},{\"name\":\"GDB_GEOMATTR_DATA\",\"type\":\"string\"},{\"name\":\"LA_NAME\",\"type\":\"string\"},{\"name\":\"ID\",\"type\":\"string\"},{\"name\":\"GEOM\",\"type\":\"geometry\"}],\"enriched\":true,\"provider\":\"snowflake\",\"geomField\":\"GEOM\",\"importUrl\":null,\"autoguessing\":true,\"lastModified\":1742553366313,\"optimization\":{\"actions\":[{\"type\":\"search optimization\",\"enabled\":true}]},\"originalSchema\":[{\"name\":\"FWS_TACODE\",\"type\":\"TEXT\"},{\"name\":\"DESCRIP\",\"type\":\"TEXT\"},{\"name\":\"PARENT\",\"type\":\"TEXT\"},{\"name\":\"AREA\",\"type\":\"TEXT\"},{\"name\":\"TA_NAME\",\"type\":\"TEXT\"},{\"name\":\"RIVER_SEA\",\"type\":\"TEXT\"},{\"name\":\"QDIAL\",\"type\":\"NUMBER\"},{\"name\":\"GDB_GEOMATTR_DATA\",\"type\":\"TEXT\"},{\"name\":\"LA_NAME\",\"type\":\"TEXT\"},{\"name\":\"ID\",\"type\":\"TEXT\"},{\"name\":\"GEOM\",\"type\":\"GEOGRAPHY\"}],\"fromImportedFile\":true},\"type\":\"source\",\"zIndex\":2,\"position\":{\"x\":-32,\"y\":416},\"selected\":false},{\"id\":\"f26bdb27-c842-429b-8768-190f198cb189\",\"data\":{\"name\":\"native.spatialjoin\",\"type\":\"generic\",\"label\":\"Spatial Join\",\"inputs\":[{\"name\":\"maintable\",\"type\":\"Table\",\"title\":\"Main table\",\"description\":\"Main table\"},{\"name\":\"secondarytable\",\"type\":\"Table\",\"title\":\"Secondary table\",\"description\":\"Secondary table\"},{\"name\":\"maincolumn\",\"type\":\"Column\",\"title\":\"Geo column in main table\",\"parent\":\"maintable\",\"dataType\":[\"geography\"],\"description\":\"Geo column in main table\",\"value\":\"GEOGRAPHY\"},{\"name\":\"secondarycolumn\",\"type\":\"Column\",\"title\":\"Geo column in secondary table\",\"parent\":\"secondarytable\",\"dataType\":[\"geography\"],\"description\":\"Geo column in secondary table\",\"value\":\"GEOM_JOINED\"},{\"name\":\"predicate\",\"type\":\"Selection\",\"title\":\"Spatial predicate\",\"default\":\"intersects\",\"optional\":true,\"options\":[\"intersects\",\"contains\",\"covers\"],\"description\":\"Spatial predicate\",\"value\":\"intersects\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":560,\"y\":320},\"selected\":false},{\"id\":\"dc3f2a71-d102-4a1f-836a-5b1f41cac95e\",\"data\":{\"id\":\"WATERCOURSES_WATER_BODIES_RIVERS__GREAT_BRITAIN_OPEN_RIVERS.PRS_OPENRIVERS_SCH.PRS_WATERCOURSE_LINK_TBL\",\"name\":\"ReadTable\",\"size\":93190144,\"type\":\"table\",\"label\":\"PRS_WATERCOURSE_LINK_TBL\",\"nrows\":192408,\"inputs\":[{\"name\":\"source\",\"type\":\"String\",\"title\":\"Source table\",\"value\":\"WATERCOURSES_WATER_BODIES_RIVERS__GREAT_BRITAIN_OPEN_RIVERS.PRS_OPENRIVERS_SCH.PRS_WATERCOURSE_LINK_TBL\",\"description\":\"Read Table\"}],\"schema\":[{\"name\":\"FICTITIOUS\",\"type\":\"number\"},{\"name\":\"FID\",\"type\":\"number\"},{\"name\":\"ID\",\"type\":\"string\"},{\"name\":\"FLOW_DIRECTION\",\"type\":\"string\"},{\"name\":\"END_NODE\",\"type\":\"string\"},{\"name\":\"WATERCOURSE_NAME_ALTERNATIVE\",\"type\":\"string\"},{\"name\":\"START_NODE\",\"type\":\"string\"},{\"name\":\"GEOGRAPHY\",\"type\":\"geometry\"},{\"name\":\"LENGTH\",\"type\":\"number\"},{\"name\":\"FORM\",\"type\":\"string\"},{\"name\":\"WATERCOURSE_NAME\",\"type\":\"string\"}],\"enriched\":true,\"provider\":\"snowflake\",\"geomField\":\"GEOGRAPHY\",\"lastModified\":1742489427892,\"optimization\":{\"actions\":[{\"type\":\"search optimization\",\"enabled\":false}],\"actionAvailable\":{\"msg\":\"<b>This table isn't optimized.</b> Enabling Snowflake Search Optimization and cluster on geospatial data may improve performance.\",\"type\":\"createTable\",\"query\":\"BEGIN CREATE TABLE {newTableName} AS SELECT * FROM WATERCOURSES_WATER_BODIES_RIVERS__GREAT_BRITAIN_OPEN_RIVERS.PRS_OPENRIVERS_SCH.PRS_WATERCOURSE_LINK_TBL ORDER BY ST_GEOHASH(GEOGRAPHY); ALTER TABLE {newTableName} ADD SEARCH OPTIMIZATION ON GEO(GEOGRAPHY); END;\"}},\"originalSchema\":[{\"name\":\"FICTITIOUS\",\"type\":\"NUMBER\"},{\"name\":\"FID\",\"type\":\"NUMBER\"},{\"name\":\"ID\",\"type\":\"TEXT\"},{\"name\":\"FLOW_DIRECTION\",\"type\":\"TEXT\"},{\"name\":\"END_NODE\",\"type\":\"TEXT\"},{\"name\":\"WATERCOURSE_NAME_ALTERNATIVE\",\"type\":\"TEXT\"},{\"name\":\"START_NODE\",\"type\":\"TEXT\"},{\"name\":\"GEOGRAPHY\",\"type\":\"GEOGRAPHY\"},{\"name\":\"LENGTH\",\"type\":\"NUMBER\"},{\"name\":\"FORM\",\"type\":\"TEXT\"},{\"name\":\"WATERCOURSE_NAME\",\"type\":\"TEXT\"}]},\"type\":\"source\",\"zIndex\":2,\"position\":{\"x\":-128,\"y\":-96},\"selected\":false},{\"id\":\"9b702b3c-7bf0-4464-b8b8-046a00b4c5cb\",\"data\":{\"name\":\"native.customsql\",\"type\":\"generic\",\"label\":\"Custom SQL Select\",\"inputs\":[{\"name\":\"sourcea\",\"type\":\"Table\",\"title\":\"Source table a\",\"optional\":true,\"description\":\"Source table a\"},{\"name\":\"sourceb\",\"type\":\"Table\",\"title\":\"Source table b\",\"optional\":true,\"description\":\"Source table b\"},{\"name\":\"sourcec\",\"type\":\"Table\",\"title\":\"Source table c\",\"optional\":true,\"description\":\"Source table c\"},{\"name\":\"sql\",\"type\":\"StringSql\",\"title\":\"SQL SELECT statement\",\"mode\":\"multiline\",\"placeholder\":\"SELECT ST_Centroid(geom) AS geom,\\n  AVG(value) AS average_value,\\n  category\\nFROM $a\\nGROUP BY category\",\"allowExpressions\":false,\"description\":\"SQL SELECT statement\",\"value\":\"SELECT a.WATERCOURSE_NAME\\n, ST_UNION_AGG(a.GEOGRAPHY) AS geom\\nFROM $a a\\nJOIN $b b\\nON a.start_node = b.end_node\\nWHERE \\na.WATERCOURSE_NAME = b.WATERCOURSE_NAME\\nAND \\na.ID != b.ID\\nGROUP BY a.WATERCOURSE_NAME\"}],\"version\":\"2.0.0\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":464,\"y\":16},\"selected\":false},{\"id\":\"0cda91b4-9757-400b-b1e0-6cacbfe7d747\",\"data\":{\"name\":\"native.importurl\",\"type\":\"generic\",\"label\":\"Import from URL\",\"inputs\":[{\"name\":\"url\",\"type\":\"String\",\"title\":\"Source URL\",\"placeholder\":\"E.g.: https://storage.googleapis.com/carto_test_tables/places.zip\",\"description\":\"Source URL\",\"value\":\"https://environment.data.gov.uk/flood-monitoring/data/readings.csv?parameter=flow&_view=full&latest\"},{\"name\":\"autoguessing\",\"type\":\"Boolean\",\"title\":\"Automatically guess column data types in the imported table\",\"default\":true,\"description\":\"Automatically guess column data types in the imported table\",\"value\":true}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":256,\"y\":-224},\"selected\":false},{\"id\":\"231ea791-9095-4430-8602-e9ef3086d442\",\"data\":{\"name\":\"native.importurl\",\"type\":\"generic\",\"label\":\"Import from URL\",\"inputs\":[{\"name\":\"url\",\"type\":\"String\",\"title\":\"Source URL\",\"placeholder\":\"E.g.: https://storage.googleapis.com/carto_test_tables/places.zip\",\"description\":\"Source URL\",\"value\":\"https://environment.data.gov.uk/flood-monitoring/id/stations.csv?parameter=flow\"},{\"name\":\"autoguessing\",\"type\":\"Boolean\",\"title\":\"Automatically guess column data types in the imported table\",\"default\":true,\"description\":\"Automatically guess column data types in the imported table\",\"value\":true}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":256,\"y\":-112},\"selected\":false},{\"id\":\"7ef404b4-65ad-46c3-9455-0401cb81dd34\",\"data\":{\"name\":\"native.join\",\"type\":\"generic\",\"label\":\"Join\",\"inputs\":[{\"name\":\"maintable\",\"type\":\"Table\",\"title\":\"Main table\",\"description\":\"Main table\"},{\"name\":\"secondarytable\",\"type\":\"Table\",\"title\":\"Secondary table\",\"description\":\"Secondary table\"},{\"name\":\"maincolumn\",\"type\":\"Column\",\"title\":\"Column in main table\",\"parent\":\"maintable\",\"dataType\":[\"boolean\",\"date\",\"datetime\",\"time\",\"timestamp\",\"number\",\"string\"],\"description\":\"Column in main table\",\"value\":\"STATIONREFERENCE\"},{\"name\":\"secondarycolumn\",\"type\":\"Column\",\"title\":\"Column in secondary table\",\"parent\":\"secondarytable\",\"dataType\":[\"boolean\",\"date\",\"datetime\",\"time\",\"timestamp\",\"number\",\"string\"],\"description\":\"Column in secondary table\",\"value\":\"STATIONREFERENCE\"},{\"name\":\"jointype\",\"type\":\"Selection\",\"title\":\"Join type\",\"options\":[\"Inner\",\"Left\",\"Right\",\"Full outer\"],\"default\":\"Inner\",\"description\":\"Join type\",\"value\":\"Inner\"}],\"version\":\"1.2\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":432,\"y\":-160},\"selected\":false},{\"id\":\"d7786c97-66a4-43b6-9ae5-93ca0a1e9d4a\",\"data\":{\"name\":\"native.buffer\",\"type\":\"generic\",\"label\":\"ST Buffer\",\"inputs\":[{\"name\":\"source\",\"type\":\"Table\",\"title\":\"Source table\",\"description\":\"Source table\"},{\"name\":\"geo\",\"type\":\"Column\",\"title\":\"Geo column\",\"parent\":\"source\",\"dataType\":[\"geography\"],\"description\":\"Geo column\",\"value\":\"GEOM_JOINED\"},{\"name\":\"distance\",\"type\":\"Number\",\"title\":\"Distance\",\"optional\":true,\"default\":10,\"description\":\"Distance\",\"value\":500},{\"name\":\"units\",\"type\":\"Selection\",\"title\":\"Units\",\"options\":[\"Meters\",\"Miles\"],\"default\":\"Meters\",\"description\":\"Units\",\"value\":\"Meters\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":560,\"y\":-160},\"selected\":false},{\"id\":\"9d02b5fb-4d0a-46ad-a032-0b78072f5e82\",\"data\":{\"name\":\"native.spatialjoin\",\"type\":\"generic\",\"label\":\"Spatial Join\",\"inputs\":[{\"name\":\"maintable\",\"type\":\"Table\",\"title\":\"Main table\",\"description\":\"Main table\"},{\"name\":\"secondarytable\",\"type\":\"Table\",\"title\":\"Secondary table\",\"description\":\"Secondary table\"},{\"name\":\"maincolumn\",\"type\":\"Column\",\"title\":\"Geo column in main table\",\"parent\":\"maintable\",\"dataType\":[\"geography\"],\"description\":\"Geo column in main table\",\"value\":\"GEOM\"},{\"name\":\"secondarycolumn\",\"type\":\"Column\",\"title\":\"Geo column in secondary table\",\"parent\":\"secondarytable\",\"dataType\":[\"geography\"],\"description\":\"Geo column in secondary table\",\"value\":\"GEOM_JOINED_BUFFER\"},{\"name\":\"predicate\",\"type\":\"Selection\",\"title\":\"Spatial predicate\",\"default\":\"intersects\",\"optional\":true,\"options\":[\"intersects\",\"contains\",\"covers\"],\"description\":\"Spatial predicate\",\"value\":\"intersects\"}],\"version\":\"1\"},\"type\":\"generic\",\"zIndex\":2,\"position\":{\"x\":736,\"y\":-80},\"selected\":false},{\"id\":\"ad63ea31-cca9-4d1c-a72b-4afc6b8cb304\",\"data\":{\"name\":\"Note\",\"color\":\"#F6CF71\",\"genAi\":false,\"label\":\"\",\"width\":655.996,\"height\":367.998,\"inputs\":[],\"markdown\":\"---\\nlabel: Environment Agency Live Flood API\\n---\\n## Current Flood Warnings\\nHere we integrate the Environment Agency flood warning areas with an API call to find out which are currently active.\",\"position\":{\"x\":-304,\"y\":144}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":-304,\"y\":144}},{\"id\":\"e9099722-a896-4efc-9276-9132242c9f01\",\"data\":{\"name\":\"Note\",\"color\":\"#9EB9F3\",\"genAi\":false,\"label\":\"\",\"width\":297.90163934426226,\"height\":239.83606557377047,\"inputs\":[],\"markdown\":\"---\\nlabel: Affected Buildings\\n---\\nThis Spatial Join calculates the number of UPRNs (or bBuidldings that are currently within an active flood warning area.\"},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":448,\"y\":176}},{\"id\":\"2f4d668a-4eff-4203-929c-ac91d11d4a1e\",\"data\":{\"name\":\"Note\",\"color\":\"#FE88B1\",\"genAi\":false,\"label\":\"\",\"width\":447.99899999999997,\"height\":399.994,\"inputs\":[],\"markdown\":\"---\\nlabel: Snowflake Marketplace Datasets\\n---\\n## Ordnance Survey Open Data\\nHere we are utilising the Ordnance Survey Open Rivers and Open UPRN (Unique Property Reference Number) datasets directly from the Snowflake Marketplace.\",\"position\":{\"x\":-256,\"y\":-276.869}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":-256,\"y\":-272}},{\"id\":\"ef8e83be-0d29-4ebb-b804-b43aa8b2c009\",\"data\":{\"name\":\"Note\",\"color\":\"#8BE0A4\",\"genAi\":false,\"label\":\"\",\"width\":639.998,\"height\":511.998,\"inputs\":[],\"markdown\":\"---\\nlabel: Calculate current flow rates.\\n---\\n## Environment Agency API integration\\nHere we join the Ordnance Survey river segments together based on their start and end nodes before finding the current flow rates from the Environment Agency API and joining for display\\n\",\"position\":{\"x\":208,\"y\":-384.016}},\"type\":\"note\",\"zIndex\":-1,\"position\":{\"x\":208,\"y\":-352}}],\"edges\":[{\"id\":\"799307a3-5434-4167-975f-0ddbbac8c398result-7df8f679-5de5-42a1-a901-db68a5c14acamaintable\",\"source\":\"799307a3-5434-4167-975f-0ddbbac8c398\",\"target\":\"7df8f679-5de5-42a1-a901-db68a5c14aca\",\"className\":\"\",\"sourceHandle\":\"result\",\"targetHandle\":\"maintable\",\"animated\":false},{\"id\":\"8bd7f027-ce4f-426d-afc9-669ae9b5f2ec\",\"type\":\"default\",\"source\":\"5d15f064-2a37-458d-956b-1862c462541b\",\"target\":\"7df8f679-5de5-42a1-a901-db68a5c14aca\",\"sourceHandle\":\"out\",\"targetHandle\":\"secondarytable\",\"animated\":false},{\"id\":\"7df8f679-5de5-42a1-a901-db68a5c14acaresult-f26bdb27-c842-429b-8768-190f198cb189secondarytable\",\"source\":\"7df8f679-5de5-42a1-a901-db68a5c14aca\",\"target\":\"f26bdb27-c842-429b-8768-190f198cb189\",\"className\":\"\",\"sourceHandle\":\"result\",\"targetHandle\":\"secondarytable\",\"animated\":false},{\"id\":\"6b92a348-0c85-46e1-9d24-e536eee7e7eb\",\"type\":\"default\",\"source\":\"c51e8c81-bc5d-46a9-ad64-ffd8293bf657\",\"target\":\"f26bdb27-c842-429b-8768-190f198cb189\",\"sourceHandle\":\"out\",\"targetHandle\":\"maintable\",\"animated\":false},{\"id\":\"dc3f2a71-d102-4a1f-836a-5b1f41cac95eout-9b702b3c-7bf0-4464-b8b8-046a00b4c5cbsourceb\",\"source\":\"dc3f2a71-d102-4a1f-836a-5b1f41cac95e\",\"target\":\"9b702b3c-7bf0-4464-b8b8-046a00b4c5cb\",\"className\":\"\",\"sourceHandle\":\"out\",\"targetHandle\":\"sourceb\",\"animated\":false},{\"id\":\"7df46299-e1ce-407e-a4f2-10c1a99f11ab\",\"type\":\"default\",\"source\":\"dc3f2a71-d102-4a1f-836a-5b1f41cac95e\",\"target\":\"9b702b3c-7bf0-4464-b8b8-046a00b4c5cb\",\"sourceHandle\":\"out\",\"targetHandle\":\"sourcea\",\"animated\":false},{\"id\":\"231ea791-9095-4430-8602-e9ef3086d442result-7ef404b4-65ad-46c3-9455-0401cb81dd34secondarytable\",\"source\":\"231ea791-9095-4430-8602-e9ef3086d442\",\"target\":\"7ef404b4-65ad-46c3-9455-0401cb81dd34\",\"className\":\"\",\"sourceHandle\":\"result\",\"targetHandle\":\"secondarytable\",\"animated\":false},{\"id\":\"4a48df76-8262-4187-a257-c94cc6dc4453\",\"type\":\"default\",\"source\":\"0cda91b4-9757-400b-b1e0-6cacbfe7d747\",\"target\":\"7ef404b4-65ad-46c3-9455-0401cb81dd34\",\"sourceHandle\":\"result\",\"targetHandle\":\"maintable\",\"animated\":false},{\"id\":\"7ef404b4-65ad-46c3-9455-0401cb81dd34result-d7786c97-66a4-43b6-9ae5-93ca0a1e9d4asource\",\"source\":\"7ef404b4-65ad-46c3-9455-0401cb81dd34\",\"target\":\"d7786c97-66a4-43b6-9ae5-93ca0a1e9d4a\",\"className\":\"\",\"sourceHandle\":\"result\",\"targetHandle\":\"source\",\"animated\":false},{\"id\":\"70d7bfb1-8529-4ec6-b711-676ce5015558\",\"type\":\"default\",\"source\":\"9b702b3c-7bf0-4464-b8b8-046a00b4c5cb\",\"target\":\"9d02b5fb-4d0a-46ad-a032-0b78072f5e82\",\"sourceHandle\":\"result\",\"targetHandle\":\"maintable\",\"animated\":false},{\"id\":\"0cedbd6c-1854-443e-a50a-e130d6085842\",\"type\":\"default\",\"source\":\"d7786c97-66a4-43b6-9ae5-93ca0a1e9d4a\",\"target\":\"9d02b5fb-4d0a-46ad-a032-0b78072f5e82\",\"sourceHandle\":\"result\",\"targetHandle\":\"secondarytable\",\"animated\":false}],\"variables\":null,\"procedure\":{},\"schedule\":{},\"viewport\":{\"x\":443.181818181818,\"y\":331.8545454545455,\"zoom\":0.7922077922077922},\"schemaVersion\":\"1.0.0\",\"connectionProvider\":\"snowflake\",\"useCache\":true}"}
  */
  DECLARE
    __outputtable STRING;
    __outputtablefqn STRING;
  BEGIN
    __outputtable := 'wfproc_a33845aea9fa025d_out_' || SUBSTRING(MD5(''), 1, 16);
    __outputtablefqn := 'CARTO.WORKFLOWS_TEMP.wfproc_a33845aea9fa025d_out_' || SUBSTRING(MD5(''), 1, 16);
    BEGIN
      CREATE OR REPLACE TEMPORARY TABLE CARTO.WORKFLOWS_TEMP.WORKFLOW_A33845AEA9FA025D_4AA5F3FAD6B2D6BA_RESULT
      AS
       SELECT a.WATERCOURSE_NAME
       , ST_UNION_AGG(a.GEOGRAPHY) AS geom
       FROM WATERCOURSES_WATER_BODIES_RIVERS__GREAT_BRITAIN_OPEN_RIVERS.PRS_OPENRIVERS_SCH.PRS_WATERCOURSE_LINK_TBL a
       JOIN WATERCOURSES_WATER_BODIES_RIVERS__GREAT_BRITAIN_OPEN_RIVERS.PRS_OPENRIVERS_SCH.PRS_WATERCOURSE_LINK_TBL b
       ON a.start_node = b.end_node
       WHERE 
       a.WATERCOURSE_NAME = b.WATERCOURSE_NAME
       AND 
       a.ID != b.ID
       GROUP BY a.WATERCOURSE_NAME;
    END;
    BEGIN
      CALL CARTO.CARTO.IMPORT_URL(
        'https://environment.data.gov.uk/flood-monitoring/data/readings.csv?parameter=flow&_view=full&latest',
        'snowflake',
        'CARTO.WORKFLOWS_TEMP.WORKFLOW_A33845AEA9FA025D_F1952699ED688DD6_RESULT',
        '{"autoguessing": true}',
        'https://gcp-europe-west1.api.carto.com',
        'eyJhbGciOiJIUzI1NiJ9.eyJhIjoiYWNfazUzNGQxZnQiLCJqdGkiOiIzYTVmMTMzOSJ9.abPkkxz_8KAxd9Lq6mKiIdbQkb23qorpyLDtQcLxpC8'
      );
    END;
    BEGIN
      CALL CARTO.CARTO.IMPORT_URL(
        'https://environment.data.gov.uk/flood-monitoring/id/stations.csv?parameter=flow',
        'snowflake',
        'CARTO.WORKFLOWS_TEMP.WORKFLOW_A33845AEA9FA025D_1F246CE5B9C8B663_RESULT',
        '{"autoguessing": true}',
        'https://gcp-europe-west1.api.carto.com',
        'eyJhbGciOiJIUzI1NiJ9.eyJhIjoiYWNfazUzNGQxZnQiLCJqdGkiOiIzYTVmMTMzOSJ9.abPkkxz_8KAxd9Lq6mKiIdbQkb23qorpyLDtQcLxpC8'
      );
    END;
    BEGIN
      DECLARE
        alias STRING;
      BEGIN
        CREATE TABLE CARTO.WORKFLOWS_TEMP.table_63139385_a61f_47dc_881b_2b6e23bc8981 AS
        SELECT * FROM CARTO.WORKFLOWS_TEMP.WORKFLOW_A33845AEA9FA025D_1F246CE5B9C8B663_RESULT
        WHERE 1=0;
        LET res resultset := (EXECUTE IMMEDIATE '
          with __alias AS(
            SELECT CONCAT(
              ''_joined.'', column_name, '' AS '', column_name, ''_joined''
            ) col_alias
            FROM CARTO.INFORMATION_SCHEMA.COLUMNS
            WHERE table_name = ''TABLE_63139385_A61F_47DC_881B_2B6E23BC8981'' and
              table_schema = ''WORKFLOWS_TEMP'' and
              table_catalog = ''CARTO''
          )
          SELECT LISTAGG(col_alias, '', '') aliases
          FROM __alias
        ');
        LET cur_res CURSOR FOR res;
        OPEN cur_res;
        FETCH cur_res INTO alias;
        DROP TABLE CARTO.WORKFLOWS_TEMP.table_63139385_a61f_47dc_881b_2b6e23bc8981;
        EXECUTE IMMEDIATE
          REPLACE(
            'CREATE OR REPLACE TEMPORARY TABLE CARTO.WORKFLOWS_TEMP.WORKFLOW_A33845AEA9FA025D_EE238ECCD01A67B8_RESULT
      AS
       SELECT
         _main.*,
         %s
       FROM
         CARTO.WORKFLOWS_TEMP.WORKFLOW_A33845AEA9FA025D_F1952699ED688DD6_RESULT AS _main
       INNER JOIN
         CARTO.WORKFLOWS_TEMP.WORKFLOW_A33845AEA9FA025D_1F246CE5B9C8B663_RESULT AS _joined
       ON
         _main.STATIONREFERENCE = _joined.STATIONREFERENCE;',
            '%s',
            alias
          );
      END;
    END;
    BEGIN
      CREATE OR REPLACE TEMPORARY TABLE CARTO.WORKFLOWS_TEMP.WORKFLOW_A33845AEA9FA025D_A00C6DEF0349C3EE_RESULT
      AS
       SELECT CARTO.CARTO.ST_BUFFER(GEOM_JOINED, 500) AS GEOM_JOINED_buffer, *
       FROM CARTO.WORKFLOWS_TEMP.WORKFLOW_A33845AEA9FA025D_EE238ECCD01A67B8_RESULT;
    END;
    BEGIN
      DECLARE alias STRING;
      BEGIN
        CREATE TABLE CARTO.WORKFLOWS_TEMP.table_49749f2c_6d89_40bc_8831_fe5ba6b498fc AS
        SELECT * FROM CARTO.WORKFLOWS_TEMP.WORKFLOW_A33845AEA9FA025D_A00C6DEF0349C3EE_RESULT
        WHERE 1=0;
        LET res resultset := (EXECUTE IMMEDIATE '
          with __alias AS(
          SELECT CONCAT(''_joined.'', column_name, '' AS '', column_name, ''_joined'') col_alias
          FROM CARTO.INFORMATION_SCHEMA.COLUMNS
          WHERE table_name = ''TABLE_49749F2C_6D89_40BC_8831_FE5BA6B498FC'' and
          table_schema = ''WORKFLOWS_TEMP'' and
          table_catalog = ''CARTO''
          )
          SELECT LISTAGG(col_alias, '', '') aliases
          FROM __alias
        ');
        LET cur_res CURSOR FOR res;
        OPEN cur_res;
        FETCH cur_res INTO alias;
        DROP TABLE CARTO.WORKFLOWS_TEMP.table_49749f2c_6d89_40bc_8831_fe5ba6b498fc;
        EXECUTE IMMEDIATE
          REPLACE(
            'BEGIN
              CREATE OR REPLACE TEMPORARY TABLE CARTO.WORKFLOWS_TEMP.WORKFLOW_A33845AEA9FA025D_3AFEB96452125CBE_RESULT
              AS
               SELECT
               _main.*, %s
               FROM
                 CARTO.WORKFLOWS_TEMP.WORKFLOW_A33845AEA9FA025D_4AA5F3FAD6B2D6BA_RESULT AS _main,
                 CARTO.WORKFLOWS_TEMP.WORKFLOW_A33845AEA9FA025D_A00C6DEF0349C3EE_RESULT AS _joined
               WHERE ST_INTERSECTS(
                 _main.GEOM,
                 _joined.GEOM_JOINED_BUFFER
               );
            END;',
            '%s',
            alias
          );
      END;
    END;
    BEGIN
      CALL CARTO.CARTO.IMPORT_URL(
        'https://environment.data.gov.uk/flood-monitoring/id/floods.csv',
        'snowflake',
        'CARTO.WORKFLOWS_TEMP.WORKFLOW_A33845AEA9FA025D_8B1DE32ACB07B5BE_RESULT',
        '{"autoguessing": true}',
        'https://gcp-europe-west1.api.carto.com',
        'eyJhbGciOiJIUzI1NiJ9.eyJhIjoiYWNfazUzNGQxZnQiLCJqdGkiOiIzYTVmMTMzOSJ9.abPkkxz_8KAxd9Lq6mKiIdbQkb23qorpyLDtQcLxpC8'
      );
    END;
    BEGIN
      DECLARE
        alias STRING;
      BEGIN
        CREATE TABLE CARTO.WORKFLOWS_TEMP.table_b7f6c406_36b4_4524_afc2_cd6c5cd1d217 AS
        SELECT * FROM CARTO.WORKFLOWS_TEMP.IMPORTED_A33845AEA9FA025D_FLOOD_WARNING_AREAS
        WHERE 1=0;
        LET res resultset := (EXECUTE IMMEDIATE '
          with __alias AS(
            SELECT CONCAT(
              ''_joined.'', column_name, '' AS '', column_name, ''_joined''
            ) col_alias
            FROM CARTO.INFORMATION_SCHEMA.COLUMNS
            WHERE table_name = ''TABLE_B7F6C406_36B4_4524_AFC2_CD6C5CD1D217'' and
              table_schema = ''WORKFLOWS_TEMP'' and
              table_catalog = ''CARTO''
          )
          SELECT LISTAGG(col_alias, '', '') aliases
          FROM __alias
        ');
        LET cur_res CURSOR FOR res;
        OPEN cur_res;
        FETCH cur_res INTO alias;
        DROP TABLE CARTO.WORKFLOWS_TEMP.table_b7f6c406_36b4_4524_afc2_cd6c5cd1d217;
        EXECUTE IMMEDIATE
          REPLACE(
            'CREATE OR REPLACE TEMPORARY TABLE CARTO.WORKFLOWS_TEMP.WORKFLOW_A33845AEA9FA025D_5AACBEA91F571533_RESULT
      AS
       SELECT
         _main.*,
         %s
       FROM
         CARTO.WORKFLOWS_TEMP.WORKFLOW_A33845AEA9FA025D_8B1DE32ACB07B5BE_RESULT AS _main
       INNER JOIN
         CARTO.WORKFLOWS_TEMP.IMPORTED_A33845AEA9FA025D_FLOOD_WARNING_AREAS AS _joined
       ON
         _main.FLOODAREAID = _joined.PARENT;',
            '%s',
            alias
          );
      END;
    END;
    BEGIN
      DECLARE alias STRING;
      BEGIN
        CREATE TABLE CARTO.WORKFLOWS_TEMP.table_5282d882_35d5_481b_badf_e10f99bdff9c AS
        SELECT * FROM CARTO.WORKFLOWS_TEMP.WORKFLOW_A33845AEA9FA025D_5AACBEA91F571533_RESULT
        WHERE 1=0;
        LET res resultset := (EXECUTE IMMEDIATE '
          with __alias AS(
          SELECT CONCAT(''_joined.'', column_name, '' AS '', column_name, ''_joined'') col_alias
          FROM CARTO.INFORMATION_SCHEMA.COLUMNS
          WHERE table_name = ''TABLE_5282D882_35D5_481B_BADF_E10F99BDFF9C'' and
          table_schema = ''WORKFLOWS_TEMP'' and
          table_catalog = ''CARTO''
          )
          SELECT LISTAGG(col_alias, '', '') aliases
          FROM __alias
        ');
        LET cur_res CURSOR FOR res;
        OPEN cur_res;
        FETCH cur_res INTO alias;
        DROP TABLE CARTO.WORKFLOWS_TEMP.table_5282d882_35d5_481b_badf_e10f99bdff9c;
        EXECUTE IMMEDIATE
          REPLACE(
            'BEGIN
              CREATE OR REPLACE TEMPORARY TABLE CARTO.WORKFLOWS_TEMP.WORKFLOW_A33845AEA9FA025D_DB8D87752DF62164_RESULT
              AS
               SELECT
               _main.*, %s
               FROM
                 UNIQUE_PROPERTY_REFERENCE_NUMBERS__GREAT_BRITAIN_OPEN_UPRN.PRS_OPEN_UPRN_SCH.PRS_OPEN_UPRN_TBL AS _main,
                 CARTO.WORKFLOWS_TEMP.WORKFLOW_A33845AEA9FA025D_5AACBEA91F571533_RESULT AS _joined
               WHERE ST_INTERSECTS(
                 _main.GEOGRAPHY,
                 _joined.GEOM_JOINED
               );
            END;',
            '%s',
            alias
          );
      END;
    END;
    EXECUTE IMMEDIATE
    REPLACE(
      'CREATE OR REPLACE TRANSIENT TABLE ##TABLENAME##
      AS
       SELECT 1 as dummy',
      '##TABLENAME##',
      __outputtablefqn
    );
  END;
  $$