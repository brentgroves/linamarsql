select count(*) from Plex.account_period_balance apb -- 157,283,148,998/140,713/100,365 132,428,123,659,131,900, 123,615
select count(*) 
from Plex.account_period_balance apb 
where pcn=123681
-- and period = 202207  -- 4,617
and period = 202208  -- 4,617
-- select distinct pcn,period from Scratch.account_period_balance order by pcn,period  -- 41,293
select distinct pcn,period from Plex.account_period_balance order by pcn,period  -- 41,293

select *
-- select count(*)
from Plex.account_activity_summary o  
order by pcn,period,account_no 

select *
from Plex.account_activity_summary;

select * 
-- select count(*)
from Plex.account_period_balance apb 
-- where pcn = 123681 and period = 202206  -- 4617
where pcn = 123681 and period = 202207  -- 4617

-- exec Plex.account_period_balance_delete_open_period_range 123681
-- exec Plex.account_period_balance_recreate_open_period 123681
--drop procedure Plex.account_period_balance_append_open_period
create procedure Plex.account_period_balance_recreate_open_period
	@pcn int
as 
begin
--debug variables
--declare @pcn int;
--set @pcn = 123681;

declare @open_period int;
declare @period_end int;
declare @first_period int;


SELECT @open_period=open_period,@period_end=period_end 
FROM Plex.accounting_balance_update_period_range 
where pcn=@pcn;

if @open_period%100 = 1 
begin
	set @first_period=1;
end 
else 
begin 
	set @first_period=0;
end;
-- select @pcn pcn,@open_period open_period,@period_end period_end,@first_period first_period;

-- Add/Init missing accounting_account_summary_open_period records to 0 values.
with open_period_balance(pcn,account_no,period,debit,credit,balance)
as 
(
select 
a.pcn,
a.account_no,
@open_period period,
case 
when o.debit is null then 0 
else o.debit 
end debit,
case 
when o.credit is null then 0 
else o.credit 
end credit,
case 
when o.balance is null then 0 
else o.balance 
end balance
  -- select count(*) from Plex.accounting_account where pcn = 123681  -- 4,595/4,363
from Plex.accounting_account a   
left outer join Plex.account_activity_summary o 
on a.pcn=o.pcn 
and a.account_no=o.account_no 
and o.period = @open_period
where a.pcn = @pcn 
)
-- select count(*) from open_period_balance;

insert into Plex.account_period_balance
select op.pcn,op.account_no,op.period,ap.period_display,
  op.debit,
  cast(
    case 
    when (@first_period=0) then pb.ytd_debit + op.debit 
    when (@first_period=1) and (a.revenue_or_expense = 1) then op.debit 
    when (@first_period=1) and (a.revenue_or_expense = 0) then pb.ytd_debit + op.debit 
    end as decimal(19,5) 
  ) ytd_debit, 
  op.credit,
  cast(
    case 
    when (@first_period=0) then pb.ytd_credit + op.credit 
    when (@first_period=1) and (a.revenue_or_expense = 1) then op.credit 
    when (@first_period=1) and (a.revenue_or_expense = 0) then pb.ytd_credit + op.credit 
    end as decimal(19,5) 
  ) ytd_credit, 
  op.balance,
  cast(
    case 
    when (@first_period=0) then pb.ytd_balance + op.balance 
    when (@first_period=1) and (a.revenue_or_expense = 1) then op.balance 
    when (@first_period=1) and (a.revenue_or_expense = 0) then pb.ytd_balance + op.balance 
    end as decimal(19,5) 
  ) ytd_balance
  from Plex.account_period_balance pb 
  join open_period_balance op
  on pb.pcn=op.pcn 
  and pb.account_no=op.account_no
  and pb.period=@period_end 
  and op.period=@open_period
  inner join Plex.accounting_period ap 
  on op.pcn=ap.pcn 
  and op.period=ap.period 
  and ap.ordinal=1
  inner join Plex.accounting_account_year_category_type a
  on pb.pcn = a.pcn 
  and pb.account_no =a.account_no
  and a.[year] = @period_end/100
  --where op.account_no in ('73100-200-0000','72400-875-0000','71600-200-0000')
  --and op.pcn = 123681;
  -- where op.debit<>0 or op.credit<>0;
  -- init next pcn
end; 

-- init accounts not in accounting_account_summary_open_period to zero

-- calc ytd totals using period_end
