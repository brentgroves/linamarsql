-- populate from accounting_balance_update_period_range_dw_import
-- drop table Plex.accounting_balance_update_period_range
CREATE TABLE mgdw.Plex.accounting_balance_update_period_range (
	id int IDENTITY(1,1) NOT NULL,
	pcn int NULL,
	period_start int NULL,
	period_end int NULL,
	open_period int null,
	no_update bit null,
	PRIMARY KEY (id)
);
EXEC sp_helpindex 'Plex.accounting_balance_update_period_range'
select * from Plex.accounting_balance_update_period_range
-- delete from Plex.accounting_balance_update_period_range


--update Plex.accounting_balance_update_period_range
set period_start = 202103,
period_end = 202202


