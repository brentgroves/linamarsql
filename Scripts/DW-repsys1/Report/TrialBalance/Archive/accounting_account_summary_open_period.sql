-- mgdw.Plex.accounting_account_summary_open_period  definition

-- Drop table

-- DROP TABLE mgdw.Plex.accounting_account_summary_open_period ;

CREATE TABLE mgdw.Plex.accounting_account_summary_open_period  (
	pcn int NOT NULL,
	period int NOT NULL,
	account_no varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	debit decimal(19,5) NULL,
	credit decimal(19,5) NULL,
	balance decimal(19,5) NULL,
	CONSTRAINT PK_accounting_account_summary_open_period PRIMARY KEY (pcn,period,account_no)
);

select *
-- select count(*) 
from Plex.accounting_account_summary_open_period  -- 313

