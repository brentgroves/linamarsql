
select p1.pcn,p1.period,p1.update_date prev_update_date,p2.update_date cur_update_date 
from Plex.accounting_period p1  
join Plex.accounting_period p2
on p1.pcn=p2.pcn 
and p1.period_key=p2.period_key
and p1.ordinal = 0
and p2.ordinal = 1
where p1.pcn = 123681 
and p1.update_date <> p2.update_date 

select * from Plex.accounting_balance_update_period_range r 
-- exec Plex.sp_accounting_balance_update_start_period;
-- drop procedure sp_accounting_balance_update_start_period;

create procedure Plex.sp_accounting_balance_update_start_period
as
begin 
	declare @period_start int;
	declare @pcn int;
	declare @id int;
	declare @min_id int;
	declare @max_id int;
	select @min_id = min(id),@max_id=max(id) from Plex.accounting_balance_update_period_range r 
	set @id = @min_id;

	-- select @id id, @min_id min_id, @max_id max_id;
	while @id <= @max_id
	BEGIN

		select @pcn = pcn 
		from Plex.accounting_balance_update_period_range r
		where id = @id;
	
		with account_period_diff 
		as 
		(
			select p1.pcn,p1.period,p1.update_date prev_update_date,p2.update_date cur_update_date 
			from Plex.accounting_period p1  
			join Plex.accounting_period p2
			on p1.pcn=p2.pcn 
			and p1.period_key=p2.period_key
			and p1.ordinal = 0
			and p2.ordinal = 1
			where p1.pcn = @pcn 
			and p1.update_date <> p2.update_date 
		)
		-- select * from account_period_diff;
		,new_start_period
		as 
		( 
			select min(period) period_start 
			from account_period_diff 
			group by pcn 
		)
		-- select * from new_start_period;
		select @period_start=period_start from new_start_period;
		if @period_start is not null 
		begin 
			update Plex.accounting_balance_update_period_range
			set no_update = 0,
			period_start = @period_start
			where pcn = @pcn
--			select 'update Plex.accounting_balance_update_period_range';
		end
		else 
		begin
			update Plex.accounting_balance_update_period_range
			set no_update = 1
			where pcn = @pcn
--			select 'no updates';
		
		end;
	
--		select @pcn pcn,@period_start period_start,@id id, @min_id min_id, @max_id max_id;
		set @id = @id + 1;
	end; 
end;


select * from Plex.accounting_balance_update_period_range
EXEC sp_helpindex 'Plex.accounting_period'

select *
from Plex.accounting_period_2 ap 
