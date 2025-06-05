select count(*) from Plex.account_period_balance apb -- 157,283,148,998/140,713/100,365 132,428,123,659,131,900, 123,615
select count(*) 
from Plex.account_period_balance apb 
where pcn=123681
and period = 202207  -- 4,617
and period = 202206  -- 4,617



-- select distinct pcn,period from Scratch.account_period_balance order by pcn,period  -- 41,293
select distinct pcn,period from Plex.account_period_balance order by pcn,period  -- 41,293
select * FROM Plex.accounting_balance_update_period_range 

exec Plex.account_period_balance_delete_open_period 123681
-- delete from Plex.account_period_balance where period = 202207 
--drop procedure Plex.account_period_balance_delete_open_period
create procedure Plex.account_period_balance_delete_open_period
(
	@pcn int
)
as 
begin
	-- debug variable;
--	declare @pcn int;
--	set @pcn = 123681;
	declare @open_period int;
	
	select @open_period=open_period  from Plex.accounting_balance_update_period_range where pcn = @pcn; 

-- select @pcn pcn,@open_period open_period;
	delete from Plex.account_period_balance 
	where pcn = @pcn and period = @open_period;
end; -- Plex.account_period_balance_delete_open_period
