select count(*) from Plex.account_period_balance apb -- 157,283,148,998/140,713/100,365 132,428,123,659,131,900, 123,615
select count(*) 
from Plex.account_period_balance apb 
where pcn=123681
and period = 202207  -- 4,617
and period = 202206  -- 4,617



-- select distinct pcn,period from Scratch.account_period_balance order by pcn,period  -- 41,293
select distinct pcn,period from Plex.account_period_balance order by pcn,period  -- 41,293
select * FROM Plex.accounting_balance_update_period_range 

exec Plex.account_period_balance_delete_open_period
delete from Plex.account_period_balance where period = 202207 
--drop procedure Plex.account_period_balance_delete_open_period
create procedure Plex.account_period_balance_delete_open_period
as 
begin
declare @pcn int;
declare @id int;
declare @min_id int;
declare @max_id int;
declare @open_period int;
declare @cnt int;

select @min_id = min(id),@max_id=max(id) from Plex.accounting_balance_update_period_range r 
set @id = @min_id;


select @pcn pcn,@min_id min_id,@max_id max_id,@open_period open_period;

while @id <= @max_id
BEGIN
	SELECT @pcn=pcn,@open_period=open_period 
	FROM Plex.accounting_balance_update_period_range 
	where id=@id;
	
	delete from Plex.account_period_balance 
	where pcn = @pcn and period = @open_period;
	set @id=@id+1;
end;
end; -- Plex.account_period_balance_delete_open_period
