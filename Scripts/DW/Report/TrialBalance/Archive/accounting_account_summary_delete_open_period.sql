select * 
-- select count(*)
from Plex.accounting_account_summary_open_period  -- 313

exec Plex.accounting_account_summary_open_period 
AccountingAccountSummaryOpenPeriod_DW_Import
-- drop procedure Plex.accounting_account_summary_delete_open_period
create procedure Plex.accounting_account_summary_delete_open_period
as
begin
	declare @start_id int;
	declare @end_id int;
	select @start_id = min(id),@end_id = max(id) from Plex.accounting_balance_update_period_range
	-- select * from Plex.accounting_balance_update_period_range
	declare @id int;
	set @id=@start_id;
	-- select @start_id start_id,@end_id end_id,@id id
	-- select * from Plex.accounting_balance_update_period_range
	declare @pcn int;
	declare @period_start int;
	declare @period_end int;
	declare @open_period int;
	declare @max_fiscal_period int;
	-- select * from Plex.accounting_balance_update_period_range
	-- select @pcn=pcn,@period_start=period_start,@period_end=period_end,@open_period=open_period from Plex.accounting_balance_update_period_range where id = 4
	while @id <=@end_id
	begin
		
		select @pcn=pcn,@period_start=period_start,@period_end=period_end,@open_period=open_period from Plex.accounting_balance_update_period_range where id = @id
		
--		print N'pcn=' + cast(@pcn as varchar(6)) + N',open_period=' + cast(@open_period as varchar(6)) 
--		select @pcn pcn,@open_period open_period
		--select distinct pcn,period from Plex.GL_Account_Activity_Summary WHERE pcn = @pcn and period = @open_period
--		select *
--		into Archive.accounting_account_summary_open_period 
--		select count(*) from Plex.accounting_account_summary_open_period
--		from Plex.accounting_account_summary_open_period
		delete from Plex.accounting_account_summary_open_period WHERE pcn = @pcn and period = @open_period
		set @id = @id+1;
	end 
end;
select * from Plex.accounting_account_summary_open_period
select * from Plex.accounting_balance_update_period_range
