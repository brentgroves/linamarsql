-- mgdw.Validation.Detailed_Production_History definition

-- Drop table

-- DROP TABLE mgdw.Validation.Detailed_Production_History;
--select top 5 itemnumber,itemgroup from items
-- mgdw.Validation.restrictions2 definition

-- Drop table

-- DROP TABLE mgdw.Validation.restrictions2;

CREATE TABLE mgdw.Validation.restrictions2 (
	R_USER nvarchar(50) NOT NULL,
	R_JOB nvarchar(50) NOT NULL,
--	R_MACHINE nvarchar(50) NOT NULL,
--	D_CONSUMER nvarchar(50) NOT NULL,
	R_ITEM nvarchar(50) NOT NULL,
--	D_ITEM nvarchar(50) NOT NULL,
--	R_AUX1 nvarchar(32) NOT NULL,
--	R_AUX2 nvarchar(32) NOT NULL,
--	R_AUX3 nvarchar(32) NOT NULL
--	CONSTRAINT PK_RESTRICTIONS2 PRIMARY KEY (R_USER,R_JOB,R_MACHINE,R_AUX1,R_AUX2,R_AUX3,D_CONSUMER,R_ITEM,D_ITEM)
);


-- TRUNCATE table Validation.restrictions2
insert into Validation.restrictions2 (R_USER,R_JOB,R_ITEM) values('user1', 'job1','item1')
--insert into Validation.Detailed_Production_History (pcn,production_no,part_no,part_key,record_date)
--values (306766, 12,'42712520', '2913697', '4/28/2022 8:32:15 AM')
select count(*) cnt from Validation.restrictions2 
select * from Validation.restrictions2 


