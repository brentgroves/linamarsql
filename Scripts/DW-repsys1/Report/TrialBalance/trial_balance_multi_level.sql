/*
 * 00
 */

-- Plex.Cost_Gross_Margin_Daily_View source
select top 10 * from Plex.Cost_Gross_Margin_Daily_View
-- drop view Plex.Cost_Gross_Margin_Daily_View
-- drop view Plex.price_list
-- drop view Plex.account_period_low
-- drop view Plex.accounting_account123
-- drop view Plex.accounting_period_low_view
-- drop view Report.daily_metrics_pivot_view
-- drop view Scratch.accounting_period_balance_low
-- drop view Plex.daily_shift_report_data_daily_metrics_criteria_view
create view Plex.Cost_Gross_Margin_Daily_View
as
with all_po
as 
(
	select gm.*
	--select count(*)
	from Plex.Cost_Gross_Margin_View gm 
),
--select * from all_po 
--where valid !=0
part_aggregate  
as 
( 
	select ap.pcn,ap.Plexus_Customer_Code,ap.report_date,ap.Part_No,ap.revision,
	sum(ap.sales_qty) shipped,
	sum(ap.sales_qty*ap.unit_price) total_sales,  -- see validation tab of daily_metrics validation spreadsheet.
	sum(ap.sales_qty*ap.unit_price) --total_sales,  -- see validation tab of daily_metrics validation spreadsheet.
	/
	sum(ap.sales_qty) -- shipped,
	sell_price,		
	count(distinct Unit_Price) price_count,
	count(*) po_count,
	min(Unit_Price) min_price,
	max(Unit_Price) max_price,
	max(ap.valid) max_valid -- most important issue.
	from all_po ap 
	group by ap.pcn,ap.Plexus_Customer_Code,ap.report_date,ap.Part_No,ap.revision

),
-- select * from part_aggregate 
price_diff 
as 
( 
	select *
	--select count(*) 
	from part_aggregate  
	where max_price - min_price > .01
),
-- select * from price_diff 
--select count(*) 
--from price_diff 
po_price_diff 
as 
(
	select 
	ap.* 
	from all_po ap 
	inner join price_diff pd
	on ap.pcn = pd.pcn 
	and ap.report_date = pd.report_date 
	and ap.part_no = pd.part_no 
	and ap.revision = pd.revision 
	
),
-- select * from po_price_diff 
price_list
as 
(
	select main.pcn,main.Plexus_Customer_Code,main.report_date,main.part_no,main.revision,
	left(main.price_list,len(main.price_list)-1) as price_list 
	from 
	(
	
		select distinct pd2.pcn,pd2.Plexus_Customer_Code,pd2.report_date,pd2.part_no,pd2.revision, 
			(
				select 
				case 
				when pd1.po_no = '' and pd1.unit_price is null then 'no-po/no-price;'
				when pd1.po_no = '' and pd1.unit_price is not null then 'no-po/' + cast(pd1.unit_price as varchar) + ';'
				when pd1.po_no != '' and pd1.unit_price is null then pd1.po_no + '/no-price;'
				else pd1.po_no + '/' + cast(pd1.unit_price as varchar) + ';'
				end as [text()]
				from po_price_diff pd1 
				where pd1.pcn = pd2.pcn 
				and pd1.report_date = pd2.report_date 
				and pd1.part_no = pd2.part_no 
				and pd1.revision = pd2.revision 
				order by pd1.pcn,pd1.report_date,pd1.part_no,pd1.revision 
				for xml path (''), type 
			).value('text()[1]','varchar(max)') [price_list]
		from po_price_diff pd2 
	) [main]	
)
-- select * from price_list 
select pa.pcn,pa.plexus_customer_code,pa.report_date,pa.part_no,pa.revision,
shipped,
sell_price,
total_sales, 
case 
when pl.price_list is null then ''
else pl.price_list 
end price_list,
pa.max_valid valid
from part_aggregate pa  
left outer join price_list pl 
on pa.pcn = pl.pcn 
and pa.report_date = pl.report_date 
and pa.part_no = pl.part_no 
and pa.revision = pl.revision;

-- Plex.price_list source
	select top 10 *
	from Plex.Cost_Gross_Margin_Daily_View gm


create view Plex.price_list 
as 
with all_po
as 
(
	select pcn,Plexus_Customer_Code,report_date,Part_No,revision,sell_price,gm.PO_No
	from Plex.Cost_Gross_Margin_Daily_View gm
),
--select * from all_po 
part_aggregate  
as 
( 
	select ap.pcn,ap.Plexus_Customer_Code,ap.report_date,ap.Part_No,ap.revision,
	count(distinct Unit_Price) price_count,
	count(*) po_count,
	min(Unit_Price) min_price,
	max(Unit_Price) max_price
	from all_po ap 
	group by ap.pcn,ap.Plexus_Customer_Code,ap.report_date,ap.Part_No,ap.revision

),
price_diff 
as 
( 
	select *
	--select count(*) 
	from part_aggregate  
	where max_price - min_price > .01
),
--select *
--select count(*) 
--from price_diff 
po_price_diff 
as 
(
	select ap.* 
	from all_po ap 
	inner join price_diff pd
	on ap.pcn = pd.pcn 
	and ap.report_date = pd.report_date 
	and ap.part_no = pd.part_no 
	and ap.revision = pd.revision 
	
),
/*
			select 
			case 
			when pd1.po_no = '' and pd1.unit_price is null then 'no-po/no-price;'
			when pd1.po_no = '' and pd1.unit_price is not null then 'no-po/' + cast(pd1.unit_price as varchar) + ';'
			when pd1.po_no != '' and pd1.unit_price is null then pd1.po_no + '/no-price;'
			else pd1.po_no + '/' + cast(pd1.unit_price as varchar) + ';'
			end as [text()]
			from po_price_diff pd1 
*/		
/*
	select distinct pd2.pcn,pd2.report_date,pd2.part_no,pd2.revision 
	from po_price_diff pd2 	
*/
/*
	select 
		(
			select 
			case 
			when pd1.po_no = '' then 'no-po,'
			else pd1.po_no + ',' 
			end as [text()]
			from po_price_diff pd1 
			order by pd1.pcn,pd1.report_date,pd1.part_no,pd1.revision 
			for xml path (''), type 
		).value('text()[1]','varchar(max)') [prices]
*/
price_list
as 
(
	select main.Plexus_Customer_Code,main.report_date,main.part_no,main.revision,
	left(main.prices,len(main.prices)-1) as prices 
	from 
	(
	
		select distinct pd2.pcn,pd2.Plexus_Customer_Code,pd2.report_date,pd2.part_no,pd2.revision, 
			(
				select 
				case 
				when pd1.po_no = '' and pd1.unit_price is null then 'no-po/no-price;'
				when pd1.po_no = '' and pd1.unit_price is not null then 'no-po/' + cast(pd1.unit_price as varchar) + ';'
				when pd1.po_no != '' and pd1.unit_price is null then pd1.po_no + '/no-price;'
				else pd1.po_no + '/' + cast(pd1.unit_price as varchar) + ';'
				end as [text()]
				from po_price_diff pd1 
				where pd1.pcn = pd2.pcn 
				and pd1.report_date = pd2.report_date 
				and pd1.part_no = pd2.part_no 
				and pd1.revision = pd2.revision 
				order by pd1.pcn,pd1.report_date,pd1.part_no,pd1.revision 
				for xml path (''), type 
			).value('text()[1]','varchar(max)') [prices]
		from po_price_diff pd2 
	) [main]	
)
select * from price_list;

Period,Category Type,Category Name,Sub Category Name,No,Name,Current Debit/(Credit),YTD Debit/(Credit)
"10-2021","Asset","Current Assets","Receivables","10220-000-00000","Accounts Receivable","0","6353429.89999998",
-- drop table Plex.trial_balance_multi_level
create table Plex.trial_balance_multi_level
(
 pcn int null,
 period int null,
 period_display varchar(7),
 category_type VARCHAR(10),
 category_name VARCHAR(50),
 sub_category_name VARCHAR(50) ,
 account_no VARCHAR(20),
 account_name VARCHAR(110),
 current_debit_credit DECIMAL(18,2),
 ytd_debit_credit DECIMAL(18,2)
 primary key (period_display,account_no)  -- when this gets imported there is a period_display but no period.
)
select distinct pcn,period 
from Plex.trial_balance_multi_level order by pcn,period  
select count(*) from Plex.trial_balance_multi_level  -- 689,456
where period = 202203

select * 
-- select count(*)
--select count(*) from Archive.trial_balance_multi_level_01_02_2022  -- 773,536(2024_02_08)#668,436 (200812-202112) -- I deleted 202112 because this period did not close as of 01-07-2022.
 into Archive.trial_balance_multi_level_2024_02_08--693,660
-- into Archive.trial_balance_multi_level_2022_07_23--693,660

--into Archive.trial_balance_multi_level_06_11_2022--689456

--into Archive.trial_balance_multi_level_05_13_2022--685252
--into Archive.trial_balance_multi_level_01_02_2022
from Plex.trial_balance_multi_level  -- 58,856

where period_display like '%Total%'  -- 4204  


/*
 * Decide which TB periods to pull by  
 * each period has 2 records. ordinal 1 is the most recent
 * last update: 02-10-2023
 * If update_date is greater than last update then import that period.
 * goto Main Compare: section and locate the last period to have any differences
 * and import all periods after and including that one.
 * 03-02-2023: Pulled 202212 to 202301
 * 03-09-2023: Pulled 202302 to 202303 since there where no updates on 202301 since 2023-02-27
 */
select pcn,period,add_date,update_date 
from Plex.accounting_period p1  
where pcn = 123681
and ordinal =1
and period between 202201 and 202303
order by period DESC 


/*
 * Must delete ending comma from each line before running TrialBalance ETL script.  regular expression is ',$'
 */
/*
 * Must cleanup Total lines when importing CSV
 */
select * from Plex.trial_balance_multi_level
-- where period = 202207 and account_no ='11010-000-0000'  -2,073,940.64	10,978,886.75
--delete from Plex.trial_balance_multi_level
where period_display='Total'  --4,204  
-- and account_no ='11010-000-0000'  --1,161,012.00

-- update Plex.trial_balance_multi_level -- 4204
--set period = cast (left(period_display,4) + right(period_display,2) as int), -- Albion PCN
 set period = cast (right(period_display,4) + left(period_display,2) as int), -- Southfield
pcn = 123681
where pcn is null

--period_display final format is 01-2009
--In Plex the format has changed from mm-yyyy to yyyy-mm
select * from Plex.trial_balance_multi_level
where pcn is null


select *
--SELECT DISTINCT pcn,period
--SELECT DISTINCT pcn,period_display 
--select count(*)
from Plex.trial_balance_multi_level
--order by pcn,period_display  
where pcn=123681 and period=202406  -- 4204.
where pcn=123681 and period=202405  -- 4204.
where pcn=123681 and period=202404  -- 4204.
where pcn=123681 and period=202403  -- 4204.
where pcn=123681 and period=202402  -- 4204.
where pcn=123681 and period=202401  -- 4204.
where pcn=123681 and period=202312  -- 4204.
where pcn=123681 and period=202311  -- 4204.
where pcn=123681 and period=202310  -- 4204.
where pcn=123681 and period=202309  -- 4204.
where pcn=123681 and period=202308  -- 4204.
where pcn=123681 and period=202307  -- 4204.
where pcn=123681 and period=202306  -- 4204.
where pcn=123681 and period=202305  -- 4204.
-- where pcn=123681 and period=202304  -- 4204.
-- where pcn=123681 and period=202303  -- 4204.
-- where pcn=123681 and period=202302  -- 4204.
-- where pcn=123681 and period=202301  -- 4204.
-- where pcn=123681 and period=202212  -- 4204.
-- where pcn=123681 and period=202212  -- 4204.
-- where pcn=123681 and period=202211  -- 4204.
-- where pcn=123681 and period=202210  -- 4204.
-- where pcn=123681 and period=202209  -- 4204.
-- where pcn=123681 and period=202208  -- 4204.
-- where pcn=123681 and period=202207  -- 4204. 
-- where pcn=123681 and period=202206  -- 4204.
--where pcn=123681 and period=202205  -- 4204.
--where pcn=123681 and period=202204  -- 4204.
--where pcn=123681 and period=202203  -- 4204.
--where pcn=123681 and period=202202  -- 4204.
--where pcn=123681 and period=202201  -- 4204.
--where pcn=123681 and period=202112  -- 4204.
--where pcn=123681 and period=202111  -- 4204
--where pcn=123681 and period=201801  -- 4204
--where pcn=123681 and period=201712  -- 4204
--where pcn=123681 and period=201401  -- 4204
--where pcn=123681 and period=201312  -- 4204
--where pcn=123681 and period=201001  -- 4204
--where pcn=123681 and period=200912  -- 4204
--where pcn=123681 and period=200911  -- 4204
--where pcn=123681 and period=200910  -- 4204
--where pcn=123681 and period=200908  -- 4204
--where pcn=123681 and period=200907  -- 4204
--where pcn=123681 and period=200906  -- 4204
--where pcn=123681 and period=200905  -- 4204
--where pcn=123681 and period=200905  -- 4204
--where pcn=123681 and period=200903  -- 4204
--where pcn=123681 and period=200902  -- 4204
--where pcn=123681 and period=200901  -- 4204
--where pcn=123681 and period=200812  -- 4204
select *
from Plex.trial_balance_multi_level
where account_no like '73250%' --22 73250 
Compare Trial Balance download with Accounting_p_Account_Balances_by_Periods_Get. 
/*
 * How does trial balance multi level calculate the current_debit_credit and ytd_debit_credit values?
 * How can you get the same current_debit_credit and ytd_debit_credit values using the 
 * Accounting_p_Account_Balances_by_Periods_Get procedure?
 */
select s.period,s.account_no,
s.current_debit,s.current_credit,
--s.current_debit-s.current_credit current_debit_minus_credit,
s.Account_Balances_by_Periods_Get_debit_credit, -- Account_Balances_by_Periods_Get
s.trial_balance_debit_credit -- trial_balance_multi_level
--s.calc_debit_credit,s.calc_debit_credit_legacy,
--s.debit_balance,s.debit_balance_legacy
--,p.Current_Debit,p.Current_Credit
--select count(*)
from 
(
	select d.pcn,d.period,d.account_no,
	--a.debit_balance,a.debit_balance_legacy,
	d.current_debit_credit trial_balance_debit_credit,-- trial_balance_multi_level
	p.Current_Debit,p.Current_Credit,
	p.current_debit-p.current_credit Account_Balances_by_Periods_Get_debit_credit 	-- Account_Balances_by_Periods_Get
	/*  THIS IS WRONG YOU ALWAY TAKE p.current_debit-p.current_credit
	case 
	when a.debit_balance = 1 then p.current_debit-p.current_credit
	when a.debit_balance = 0 then p.current_credit - p.current_debit 
	else 999.99
	end calc_debit_credit, 
	case 
	when a.debit_balance_legacy = 1 then p.current_debit-p.current_credit
	when a.debit_balance_legacy = 0 then p.current_credit - p.current_debit 
	else 999.99
	end calc_debit_credit_legacy 
	*/
	-- select distinct pcn,period from Plex.Account_Balances_by_Periods order by pcn,period
	--select distinct pcn,period
	--select count(*)
	from Plex.trial_balance_multi_level d -- 54,652
	--order by pcn,period {200812,200912}
	join Plex.Account_Balances_by_Periods p -- static_calc
	on d.pcn=p.pcn 
	and d.account_no = p.[no]
	and d.period = p.period 
	join Plex.accounting_account a 
	on d.pcn = a.pcn 
	and d.account_no = a.account_no -- 54,652
	--where a.pcn is null  -- 0
	--where d.pcn= 123681 and p.period = 200812  -- 4,204
)s
where s.pcn= 123681 
and s.period between 200812 and 200912 
--and s.trial_balance_debit_credit = s.Account_Balances_by_Periods_Get_debit_credit   -- 54,646
and s.trial_balance_debit_credit != s.Account_Balances_by_Periods_Get_debit_credit   -- 6 All 1 cent OFF 
--and s.period = 200812  -- 4,204

where s.calc_debit_credit = s.current_debit_credit and s.debit_balance = 0 and s.calc_debit_credit != 0 -- 0  
where s.calc_debit_credit = s.current_debit_credit and s.debit_balance = 0 -- 184  
where s.calc_debit_credit = s.current_debit_credit and s.debit_balance = 1 -- 3997  

where s.calc_debit_credit_legacy != s.current_debit_credit  -- 23
where s.calc_debit_credit != s.current_debit_credit  -- 23
where s.calc_debit_credit = s.current_debit_credit  -- 4,181

/*
 * Count of Accounts are the same for periods 200812 through 200912 
 */
select *
--select count(*)
from Plex.trial_balance_multi_level d 
where d.pcn = 123681 
and account_no = '10220-000-00000' and period between 201603 and 201604
and d.period between 200812 and 200912  -- 54,652

select * from Plex.accounting_account where account_no = '10220-000-00000'
select *
--select count(*)
from Plex.Account_Balances_by_Periods p 
where p.pcn = 123681 and p.period = 200812  -- 4204
where p.pcn = 123681 and p.period between 200812 and 200912  -- 54,652

select * 
--select count(*)
--into 
from Plex.calc_ytd_low_view -- 37,970
OPTION (MAXRECURSION 210); 

select count(*)
from Plex.trial_balance_multi_level d 

select count(*)
from Plex.trial_balance_multi_level d 
left outer join Plex.Account_Balances_by_Periods p 
on d.pcn = p.pcn 
and d.account_no = p.[no]
and d.period=p.period
where d.period between 200812 and 200912  -- 54,652
and p.pcn is null -- 0

--where p.period = 200912  -- 4204
--where p.period = 200911  -- 4204
--where p.period = 200910  -- 4204
--where p.period = 200909  -- 4204
--where p.period = 200908  -- 4204
--where p.period = 200907  -- 4204
--where p.period = 200906  -- 4204
--where p.period = 200905  -- 4204
--where p.period = 200904  -- 4204
--where p.period = 200903  -- 4204
--where p.period = 200902  -- 4204
--where p.period = 200901  -- 4204
--where p.period = 200812  -- 4204
where p.pcn is null  -- 0

select count(*)
from Plex.Account_Balances_by_Periods p 
left outer join Plex.trial_balance_multi_level d 
on d.pcn = p.pcn 
and d.account_no = p.[no]
and d.period=p.period  
where p.period between 200812 and 200912  -- 54,652
and d.pcn is NULL -- 0

select count(*)
from Plex.trial_balance_multi_level d 
where d.period between 200812 and 200912  -- 54652

select *
--select count(*)
from Plex.Account_Balances_by_Periods p 
where p.period between 200812 and 200912  -- 54652


