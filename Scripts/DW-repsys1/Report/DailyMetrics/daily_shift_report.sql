select *
-- select top(10) * 
-- select distinct pcn
from Plex.Daily_Shift_Report dsr 
where Part_Operation_Key  is NULL 
where Part_Key  is NULL 
where Workcenter_Key  is NULL 
where Report_Date is NULL 

--CREATE SCHEMA DailyMetrics;

-- mgdw.DailyMetrics.daily_shift_report definition

-- Drop table

-- DROP TABLE mgdw.DailyMetrics.daily_shift_report_get;

CREATE TABLE mgdw.DailyMetrics.daily_shift_report (
	pcn int NOT NULL,
	report_date datetime not NULL,
--	department_no int NULL,
--	department_code varchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
--	manager_first_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
--	manager_middle_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
--	manager_last_name varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	workcenter_key int not NULL,
	workcenter_code varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CNC 432 Uplift 6K Knuckle Assembly
	part_key int not NULL,
	part_no varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	part_revision varchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	part_name varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	operation_no int NULL,
	operation_code varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
--	downtime_hours decimal(18,6) NULL,
--	planned_production_hours decimal(18,6) NULL,
	parts_produced int NULL,
	parts_scrapped int NULL,
--	scrap_rate decimal(18,6) NULL,
--	utilization decimal(18,6) NULL,
--	efficiency decimal(18,6) NULL,
--	oee decimal(18,6) NULL,
	earned_hours decimal(18,6) NULL,
	actual_hours decimal(18,6) NULL,
--	labor_efficiency decimal(18,6) NULL,
--	earned_machine_hours decimal(18,6) NULL,
--	actual_machine_hours decimal(18,6) NULL,
	part_operation_key int not NULL,
	quantity_produced int NULL,
--	workcenter_rate decimal(18,6) NULL,
	labor_rate decimal(18,6) NULL,
--	crew_size decimal(18,6) NULL,
--	department_unassigned_hours varchar(1020) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
--	child_part_count int NULL,
--	operators varchar(1020) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
--	note varchar(1020) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
--	accounting_job_nos varchar(1020) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	CONSTRAINT PK_DailyMetrics_daily_shift_report PRIMARY KEY (pcn,report_date,workcenter_key,part_key,part_operation_key)
);


EXEC sp_helpindex 'DailyMetrics.daily_shift_report'


show indexes from DailyMetrics.daily_shift_report 
-- CREATE INDEX idx_dm_daily_shift_report ON DailyMetrics.daily_shift_report(pcn,report_date,workcenter_key,part_key,part_operation_key);
-- delete from DailyMetrics.daily_shift_report
--  insert into DailyMetrics.daily_shift_report 
  (pcn,report_date,workcenter_key,workcenter_code,part_key,part_no,part_revision,
   part_name,operation_no,operation_code,parts_produced,parts_scrapped,
   earned_hours,actual_hours,part_operation_key,quantity_produced,labor_rate)
 -- values ('123681', '08/10/2022 00:00:00', '58321', 'CD4 RH Pack', '2684942', 'H2GC 5K651 AB', '', 'CD4.2 RH', '120', 'Final', '370', '0', '3.854167', '20.65834', '7471212', '370', '48')
   values  ('123681', '2022-08-10 00:00:00', '60958', 'CNC 432 Uplift 6K Knuckle Assembly', '2820236', 
	'10103353CX', 'A', 'P558 6K Knuckle Right Hand', '140', 'Final', '58', '0', '4.264706', '3.472964823', '7961801', '58', '6.8')

-- truncate table DailyMetrics.daily_shift_report
select * from DailyMetrics.daily_shift_report


('123681', '2022-08-10 00:00:00', '60958', 'CNC 432 Uplift 6K Knuckle Assembly', '2820236', 
'10103353CX', 'A', 'P558 6K Knuckle Right Hand', '140', 'Final', '58', '0', '4.264706', '3.472964823', ...)
select * from DailyMetrics.daily_shift_report_debug

-- drop table mgdw.DailyMetrics.daily_shift_report_debug
CREATE TABLE mgdw.DailyMetrics.daily_shift_report_debug (
	pcn int NULL,
	report_date datetime NULL,
	workcenter_key int NULL,
	workcenter_code varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	part_key int NULL,
	part_no varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	part_revision varchar(8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	part_name varchar(100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	operation_no int NULL,
	operation_code varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	parts_produced int NULL,
	parts_scrapped int NULL,
	earned_hours decimal(18,6) NULL,
	actual_hours decimal(18,6) NULL,
	part_operation_key int NULL,
	quantity_produced int NULL,
	labor_rate decimal(18,6) NULL,
--	CONSTRAINT PK_DailyMetrics_daily_shift_report_debug PRIMARY KEY (pcn,report_date,workcenter_key,part_key,part_operation_key)
);


