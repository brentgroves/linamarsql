--Backup
-- select * 
into Archive.account_period_balance_01_11_2024 -- 258,790
-- into Archive.account_period_balance_11_30_2023 -- 249,495
--into Archive.account_period_balance_08_24_2023 -- 235,644
-- into Archive.account_period_balance_08_09_2023 -- 231,027
-- into Archive.account_period_balance_05_09_2023 -- 217,176
--into Archive.account_period_balance_04_11_2023 -- 212,559
from Plex.account_period_balance b -- 43,630

select * from Plex.accounting_period_ranges -- 202105/202204
where pcn = 123681
select *
--select count(*) cnt
-- delete 
from Plex.account_period_balance 
WHERE pcn = 123681 
--and account_no = '11055-000-9806' 
and period between 202301 and 202311 -- 50,842/50,831
order by period 
--select * 
---- delete
from Plex.accounting_account_year_category_type 
where account_no = '11055-000-9806' and [year] in (2022,2023)

create procedure Plex.account_period_balance_delete_period_range
(
	@pcn int
)
as
begin
	declare @start_period int;
	declare @end_period int;
	select @start_period=start_period,@end_period=end_period 
	from Plex.accounting_period_ranges where pcn = @pcn
--	SELECT @pcn pcn, @start_period start_period, @end_period end_period
	delete from Plex.account_period_balance WHERE pcn = @pcn and period between @start_period and @end_period
end;