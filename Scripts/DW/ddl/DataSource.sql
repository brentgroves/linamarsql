-- DROP SCHEMA DataSource;

CREATE SCHEMA DataSource;
-- mgdw.DataSource.base_source definition

-- Drop table

-- DROP TABLE mgdw.DataSource.base_source;

CREATE TABLE mgdw.DataSource.base_source (
	base_source_key int NOT NULL,
	datasource_type_key int NULL,
	ds_endpoint_key int NULL,
	ds_database_key int NULL,
	CONSTRAINT PK_base_source PRIMARY KEY (base_source_key)
);


-- mgdw.DataSource.data_warehouse definition

-- Drop table

-- DROP TABLE mgdw.DataSource.data_warehouse;

CREATE TABLE mgdw.DataSource.data_warehouse (
	data_warehouse_key int NOT NULL,
	dw_schema_key int NULL,
	object_type_key int NULL,
	name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK__data_war__5AD2034DB28ACC56 PRIMARY KEY (data_warehouse_key)
);


-- mgdw.DataSource.datasource definition

-- Drop table

-- DROP TABLE mgdw.DataSource.datasource;

CREATE TABLE mgdw.DataSource.datasource (
	datasource_key int NOT NULL,
	name varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	base_source_key int NOT NULL,
	note varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_datasource PRIMARY KEY (datasource_key)
);


-- mgdw.DataSource.datasource_datum definition

-- Drop table

-- DROP TABLE mgdw.DataSource.datasource_datum;

CREATE TABLE mgdw.DataSource.datasource_datum (
	datasource_datum_key int NOT NULL,
	datasource_key int NOT NULL,
	name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_datasource_datum PRIMARY KEY (datasource_datum_key)
);


-- mgdw.DataSource.datasource_datum_column definition

-- Drop table

-- DROP TABLE mgdw.DataSource.datasource_datum_column;

CREATE TABLE mgdw.DataSource.datasource_datum_column (
	datasource_datum_column_key int NOT NULL,
	datasource_datum_key int NOT NULL,
	dw_column_key int NOT NULL,
	CONSTRAINT PK_datasource_datum_column PRIMARY KEY (datasource_datum_column_key)
);


-- mgdw.DataSource.datasource_datum_column_issue definition

-- Drop table

-- DROP TABLE mgdw.DataSource.datasource_datum_column_issue;

CREATE TABLE mgdw.DataSource.datasource_datum_column_issue (
	datasource_datum_column_issue_key int NOT NULL,
	datasource_datum_column_key int NOT NULL,
	name varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	descr varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	issue_view varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	issue_severity_key int NULL,
	filter_issue tinyint NOT NULL,
	filter_regex varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	highlight tinyint NOT NULL,
	highlight_color varchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_datasource_datum_column_issue PRIMARY KEY (datasource_datum_column_issue_key)
);


-- mgdw.DataSource.datasource_mobex_procedure definition

-- Drop table

-- DROP TABLE mgdw.DataSource.datasource_mobex_procedure;

CREATE TABLE mgdw.DataSource.datasource_mobex_procedure (
	datasource_key int NOT NULL,
	mobex_procedure_key int NOT NULL,
	CONSTRAINT PK_datasource_mobex_procedure PRIMARY KEY (datasource_key,mobex_procedure_key)
);


-- mgdw.DataSource.datasource_plex_procedure definition

-- Drop table

-- DROP TABLE mgdw.DataSource.datasource_plex_procedure;

CREATE TABLE mgdw.DataSource.datasource_plex_procedure (
	datasource_key int NOT NULL,
	plex_procedure_key int NOT NULL,
	CONSTRAINT PK_datasource_plex_procedure PRIMARY KEY (datasource_key,plex_procedure_key)
);


-- mgdw.DataSource.datasource_script definition

-- Drop table

-- DROP TABLE mgdw.DataSource.datasource_script;

CREATE TABLE mgdw.DataSource.datasource_script (
	datasource_key int NOT NULL,
	script_key int NOT NULL,
	CONSTRAINT PK_datasource_script PRIMARY KEY (datasource_key,script_key)
);


-- mgdw.DataSource.datasource_type definition

-- Drop table

-- DROP TABLE mgdw.DataSource.datasource_type;

CREATE TABLE mgdw.DataSource.datasource_type (
	datasource_type_key int NOT NULL,
	datasource_type varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK__datasour__FBD150CBFA9B6030 PRIMARY KEY (datasource_type_key)
);


-- mgdw.DataSource.datasource_warehouse definition

-- Drop table

-- DROP TABLE mgdw.DataSource.datasource_warehouse;

CREATE TABLE mgdw.DataSource.datasource_warehouse (
	datasource_warehouse_key int NULL,
	datasource_key int NOT NULL,
	data_warehouse_key int NOT NULL,
	CONSTRAINT PK_datasource_warehouse PRIMARY KEY (datasource_key,data_warehouse_key)
);


-- mgdw.DataSource.datasource_web_service definition

-- Drop table

-- DROP TABLE mgdw.DataSource.datasource_web_service;

CREATE TABLE mgdw.DataSource.datasource_web_service (
	datasource_key int NOT NULL,
	web_service_key int NOT NULL,
	CONSTRAINT PK_datasource_web_service PRIMARY KEY (datasource_key,web_service_key)
);


-- mgdw.DataSource.ds_database definition

-- Drop table

-- DROP TABLE mgdw.DataSource.ds_database;

CREATE TABLE mgdw.DataSource.ds_database (
	ds_database_key int NOT NULL,
	ds_server_key int NOT NULL,
	name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	note varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_ds_database PRIMARY KEY (ds_database_key)
);


-- mgdw.DataSource.ds_endpoint definition

-- Drop table

-- DROP TABLE mgdw.DataSource.ds_endpoint;

CREATE TABLE mgdw.DataSource.ds_endpoint (
	ds_endpoint_key int NOT NULL,
	name varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	definition_url varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	soap_action varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	operation varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	end_point varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	username varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	note varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_dw_endpoint PRIMARY KEY (ds_endpoint_key)
);


-- mgdw.DataSource.ds_server definition

-- Drop table

-- DROP TABLE mgdw.DataSource.ds_server;

CREATE TABLE mgdw.DataSource.ds_server (
	dw_server_key int NOT NULL,
	name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	host varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	port int NULL,
	service_data_source varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	customer_properties varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	encrypted bit NOT NULL,
	username varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	note varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_dw_server PRIMARY KEY (dw_server_key)
);


-- mgdw.DataSource.dw_column definition

-- Drop table

-- DROP TABLE mgdw.DataSource.dw_column;

CREATE TABLE mgdw.DataSource.dw_column (
	dw_column_key int NOT NULL,
	dw_table_key int NOT NULL,
	name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	note varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_dw_column PRIMARY KEY (dw_column_key)
);


-- mgdw.DataSource.dw_schema definition

-- Drop table

-- DROP TABLE mgdw.DataSource.dw_schema;

CREATE TABLE mgdw.DataSource.dw_schema (
	dw_schema_key int NOT NULL,
	dw_database_key int NOT NULL,
	name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	note varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_dw_schema PRIMARY KEY (dw_schema_key)
);


-- mgdw.DataSource.dw_table definition

-- Drop table

-- DROP TABLE mgdw.DataSource.dw_table;

CREATE TABLE mgdw.DataSource.dw_table (
	dw_table_key int NOT NULL,
	dw_schema_key int NOT NULL,
	name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	note varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_dw_table PRIMARY KEY (dw_table_key)
);


-- mgdw.DataSource.etl_script_type definition

-- Drop table

-- DROP TABLE mgdw.DataSource.etl_script_type;

CREATE TABLE mgdw.DataSource.etl_script_type (
	etl_script_type_key int NOT NULL,
	script_type varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK__etl_scri__FE438352C36A2DE4 PRIMARY KEY (etl_script_type_key)
);


-- mgdw.DataSource.issue_severity definition

-- Drop table

-- DROP TABLE mgdw.DataSource.issue_severity;

CREATE TABLE mgdw.DataSource.issue_severity (
	issue_severity_key int NOT NULL,
	name varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK_issue_severity PRIMARY KEY (issue_severity_key)
);


-- mgdw.DataSource.issue_type definition

-- Drop table

-- DROP TABLE mgdw.DataSource.issue_type;

CREATE TABLE mgdw.DataSource.issue_type (
	issue_type_key int NOT NULL,
	name varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	issue_type_view varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	issue_type_severity_key int NULL,
	filter_issue tinyint NOT NULL,
	filter_regex varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	highlight tinyint NOT NULL,
	highlight_color varchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK__issue_ty__7D64E5F8EBB6C6BC PRIMARY KEY (issue_type_key)
);


-- mgdw.DataSource.issue_type_severity definition

-- Drop table

-- DROP TABLE mgdw.DataSource.issue_type_severity;

CREATE TABLE mgdw.DataSource.issue_type_severity (
	issue_type_severity_key int NOT NULL,
	name varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	CONSTRAINT PK__issue_ty__69F64D63B7DF124A PRIMARY KEY (issue_type_severity_key)
);


-- mgdw.DataSource.mobex_procedure definition

-- Drop table

-- DROP TABLE mgdw.DataSource.mobex_procedure;

CREATE TABLE mgdw.DataSource.mobex_procedure (
	mobex_procedure_key int NOT NULL,
	system_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	friendly_name varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	source_control_repo_key int NULL,
	CONSTRAINT PK__mobex_pr__1C0F502D6013D27B PRIMARY KEY (mobex_procedure_key)
);


-- mgdw.DataSource.object_type definition

-- Drop table

-- DROP TABLE mgdw.DataSource.object_type;

CREATE TABLE mgdw.DataSource.object_type (
	object_type_key int NOT NULL,
	name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK__object_t__EF52FE0A544C29AD PRIMARY KEY (object_type_key)
);


-- mgdw.DataSource.web_service definition

-- Drop table

-- DROP TABLE mgdw.DataSource.web_service;

CREATE TABLE mgdw.DataSource.web_service (
	web_service_key int NOT NULL,
	name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	datasource_key int NULL,
	soap_request varchar(MAX) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	source_control_repo_key int NULL,
	CONSTRAINT PK_web_service PRIMARY KEY (web_service_key)
);


-- DataSource.datasource_view source

create view DataSource.datasource_view 
as 
select
ds.name datasource_name,
--mpr.*,
mp.friendly_name mobex_procedure,
mpr.name mobex_procedure_repo,
--mpp.*,
mpp.name mobex_project,
es.name etl_script, 
--es.*,
--et.*,

--esr.*,
esr.name etl_script_repo,
--scp.*,
esp.name etl_project
--ws.*,
--mp.*,
--dst.*,
--ob.*,
--sc.*,
--dw.*,
--dsw.*,
--bt.*,
--b.*,
--ds.*
from DataSource.datasource ds 
join DataSource.datasource_type dst 
on ds.datasource_type_key = dst.datasource_type_key 
join DataSource.base_source b 
on ds.base_source_key = b.base_source_key 
join DataSource.base_source_type bt
on b.base_source_type_key = bt.base_source_type_key 
join DataSource.datasource_warehouse dsw 
on ds.datasource_key = dsw.datasource_key 
join DataSource.data_warehouse dw 
on dsw.data_warehouse_key = dw.data_warehouse_key 
join DataSource.dw_schema sc 
on dw.dw_schema_key = sc.dw_schema_key 
join DataSource.object_type ob 
on dw.object_type_key = ob.object_type_key 
left outer join DataSource.mobex_procedure mp 
on ds.mobex_procedure_key = mp.mobex_procedure_key 
left outer join DataSource.web_service ws 
on ds.web_service_key = ws.web_service_key 
left outer join DataSource.etl_script es 
on ds.etl_script_key = es.elt_script_key  
left outer join DataSource.etl_script_type et 
on es.etl_script_type_key = et.etl_script_type_key 

left outer join DataSource.source_control_repo esr  
on es.source_control_repo_key = esr.source_control_repo_key  
left outer join DataSource.source_control_project esp   
on esr.source_control_project_key = esp.source_control_project_key  

left outer join DataSource.source_control_repo mpr  
on mp.source_control_repo_key = mpr.source_control_repo_key  
left outer join DataSource.source_control_project mpp   
on mpr.source_control_project_key = mpp.source_control_project_key;