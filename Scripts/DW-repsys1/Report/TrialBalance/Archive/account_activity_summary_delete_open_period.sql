select * 
-- select count(*)
from Plex.account_activity_summary  -- 8282
-- where pcn = 123681
where pcn = 300758  -- 3668
exec Plex.account_activity_summary_delete_open_period 123681
-- drop procedure Plex.account_activity_summary_delete_open_period 
create procedure Plex.account_activity_summary_delete_open_period 
(
	@pcn int
)
as
begin
	declare @open_period int;
	select @open_period=open_period from Plex.accounting_balance_update_period_range where pcn = @pcn
		
--	select @pcn pcn,@open_period open_period
	delete from Plex.account_activity_summary WHERE pcn = @pcn and period = @open_period
end;
select * from Plex.accounting_account_summary
select * from Plex.accounting_period_ranges
