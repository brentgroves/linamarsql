-- select top 10 *
-- select count(*)
from Plex.account_period_balance -- 318,504 / 305,544 on 12/03/24
--order by pcn,period desc
where pcn = 123681 -- 255,354 on 6/4/25 | 250,360 on 5/2/25 | 245,450 on 4/3/25 | 235,474 before 3/4/25 | 230,538 before 2/4/25 | 225,644 on Dec 6,2024 | 220,506 on Dec 5,2024 | 217,578 on Dec 4,2024
and period = 202501 -- 4,894 
--and period = 202412 -- 4,894 
--and period = 202404 -- 4,894 
--and period = 202401 -- 4,894 
and period = 202311 -- 4,894 
and period = 202310 -- 4,650 

--and period = 202504 -- 4,916 
--and period = 202503 -- 4,916 |4,910 
--and period = 202502 -- 4,916 |4,910 
--and period = 202406 -- 4,916 |4,910 | 4,897 | 4,894 before 2/4/25
--and period = 202405 -- 4,916 |4,910 | 4,897 | 4,894 before 2/4/25
--and period = 202404 -- 4,910 | 4,897 | 4,894 before 2/4/25
--and account_no in ('12450-000-0000','77300-850-0055','90300-850-0000')  -- new account
and period between 202405 and 202504  -- 58,992
and period between 202405 and 202503  -- 54,076 | 54,010
and period between 202404 and 202503  -- 58,920
and period between 202404 and 202502  -- 54,010
and period between 202403 and 202502  -- 58,920
and period between 202403 and 202501  -- 54,010
and period between 202403 and 202412  -- 49,080 | 48,970 before 4/2/25 | 48,940 before 2/4/25
and period between 202402 and 202411  -- 48,970 | 48,940 before 2/4/25
and period between 202312 and 202410  -- 53,834 (12/06/24) | 51,150 (12/03/24)
and period between 202311 --4650

select top 10 *
--select count(*) 
from Plex.accounting_account_year_category_type aayct  
where pcn = 123681 -- 33,476 | 33,410
-- and year = 2026 -- 4916 | 4897  
-- and year = 2025 -- 4916 | 4910 | 4908(04/02/2025)|4897 | 4894 
and year = 2024 -- 4916 | 4984
and year = 2023 -- 4894 


select top 10 s.Name, sh.*
from ETL.script_history sh 
join ETL.script s 
on sh.script_key=s.Script_Key 
where sh.script_key in (117)
order by start_time desc


--There were over 200 new accounts added this period, 12/3/24
/*
 * Backup tables
 */
select * 
--select count(*) cnt
--into Archive.account_activity_summary_12_03_24 -- 12/3/24 cnt=156,166
from Plex.account_activity_summary -- 156,166
where pcn = 123681 -- 134,401
/*
 * Check backup
 */
select top 10 *
--select count(*) cnt 
from Archive.account_activity_summary_12_03_24 -- 156,166

select *
--delete
from ETL.script_history  
where script_key = 6
and start_time between '2025-06-13 00:00:00' and '2025-06-14 00:00:00' 
order by start_time desc

select s.Name, sh.*
from ETL.script_history sh 
join ETL.script s 
on sh.script_key=s.Script_Key 
--where sh.script_key in (1,3,4,5,6,7,9,10,11,116)
where sh.script_key in (1,3,4,5,6,7,8,9,10,11,116,117)
and start_time between '2025-06-13 00:00:00' and '2025-06-14 00:00:00' 
order by start_time desc


/*
AccountingYearCategoryType:    
It is used to keep track of if an account is classified as an expense or revenue for each year.   
This is needed in YTD calculations which checks if an account  
is a revenue/expense to determine whether to reset YTD values to 0 for every year. 
*/

select top 10 *
-- select count(*) 
from Plex.accounting_account_year_category_type aayct  
where pcn = 123681 -- 33,476 | 33,410
 and year = 2026 -- 4916 | 4897  
 and category_type <> 'Asset'
-- and year = 2025 -- 4916 | 4910 | 4908(04/02/2025)|4897 | 4894 
and year = 2024 -- 4916 | 4984
and year = 2023 -- 4894 
 and aayct.revenue_or_expense = 1

--accounting_year_category_type_count says 4,893 the day after I ran the scripts and got 4,885

/*
 * Try to find any new accounts by comparing Plex.account_period_balance to Plex.accounting_account_year_category_type 
 * after the AccountingYearCategoryType.sh script and before the AccountPeriodBalanceRecreatePeriodRange.sh script 
 */

--select top 10 b.pcn,b.account_no, c.pcn,c.[year],c.account_no 
--select top 300 b.pcn,b.account_no, c.pcn, c.account_no 
--There are 244 new accounts on 12/03/24

select top 10 *
--select c.account_no 
from Plex.accounting_account_year_category_type c 
left outer join Plex.account_period_balance b
on c.pcn = b.pcn 
and c.account_no = b.account_no 
where c.pcn = 123681 -- 23,063
and c.[year] = 2025
and b.pcn is NULL
order by c.account_no 

id      |pcn   |account_no    |year|category_type|revenue_or_expense|p
--------+------+--------------+----+-------------+------------------+-
17794388|123681|40060-000-0100|2025|Revenue      |                 1| 
17795603|123681|65100-100-0100|2025|Expense      |                 1| 
17796026|123681|68400-000-0100|2025|Expense      |                 1| 

select top 10 *
-- select count(*) 
from Plex.accounting_account_year_category_type -- 55,968 | 55,922
--where year = 2025 and pcn = 123681-- 4916 | 4910
where year = 2024 and pcn = 123681-- 4910

-- select count(*) 

select t25.account_no
from
(
select account_no
from Plex.accounting_account_year_category_type -- 55,968 | 55,922
where year = 2025 and pcn = 123681-- 4908
) t25
left outer join 
(
select account_no
from Plex.accounting_account_year_category_type -- 55,968 | 55,922
where year = 2024 and pcn = 123681-- 4908
) t24
on t25.account_no = t24.account_no
where t24.account_no is null 

|account_no    |
|--------------|
|65100-100-0070|
|68400-000-0070|

/*
Accounting_account ETL script calls the accounting_account_DW_Import plex sproc.  
This is used to determine the current accounts needed in the account_period_balance table. It has 
additional fields such as the category account and sub category account that are no longer supported by 
Plex. I believe the Multi-Level in the Plex Multi-Level report has to do with an account that used the 
category and sub-category account.  Not supporting the category and sub-category account linkage is 
the reason Southfield's Plex Multi-Level report does not show many of the accounts.

-- select count(*)
-- select *
from accounting_v_account_e  a
join accounting_v_category_type act -- This is the value used by the new method of configuring plex accounts. 
on a.category_type=act.category_type  -- 36,636
-- Category numbers linked to an account by the a category_account record will no longer be supported by Plex
left outer join accounting_v_category_account_e ca  --
on a.plexus_customer_no=ca.plexus_customer_no
and a.account_no=ca.account_no
left outer join accounting_v_category_e c  --
on ca.plexus_customer_no=c.plexus_customer_no
and ca.category_no=c.category_no
left outer join accounting_v_category_type t -- This is the value used by the old method of configuring plex accounts. 
on c.category_type=t.category_type
-- sub category numbers linked to an account by the sub category_account record will no longer be supported by Plex
left outer JOIN accounting_v_sub_category_account_e AS sca
--JOIN accounting_v_Sub_Category_Account_e AS SCA -- 4,204 for 123681
ON a.plexus_customer_no = sca.plexus_customer_no
and a.account_no = sca.account_no
left outer join accounting_v_sub_category_e sc  --
on sca.plexus_customer_no=sc.plexus_customer_no
and sca.sub_category_no=sc.sub_category_no
left outer join accounting_v_category_e c2  --
on sc.plexus_customer_no=c2.plexus_customer_no
and sc.category_no=c2.category_no
left outer join accounting_v_category_type t2 -- This is another value used by the old method of configuring plex accounts. 
on c2.category_type=t2.category_type
left outer join account_balance_start b 
on a.plexus_customer_no = b.pcn
and a.account_key=b.account_key

*/

select s.Name,sh.*
from ETL.script_history sh 
join ETL.script s 
on sh.script_key=s.Script_Key 
where sh.script_key in (1,3,4,5,6,7,8,9,10,11,116,117)
and start_time between '2025-06-13 00:00:00' and '2025-06-14 00:00:00' 
order by script_history_key desc

select top 10 * 
-- select count(*) 
from Plex.accounting_account  -- 19,827/19,286,19,176
where pcn=123681 -- 4916 on 6/7/25 | 4984
order by account_no 
--where account_no = '10110-000-00000'
--accounting_account_DW_count = 4893 on 12/3/24
|account_no    |
|--------------|
|65100-100-0070|
|68400-000-0070|

/*
Accounting_period ETL script: accounting_period_dw_import
Is used to refresh the DW accounting_period table containing 
start and end period dates, and add_date and update_date which well help us determine if  
there has been updates to the period since the last time these scripts were ran. 
The add_date is calculated by taking the max(add_date) for each pcn,period from the accounting_v_balance period view
,ad.add_date add_date 
,pu.updated_date updated_date -- this gotten directly from the accounting_v_period view.
We keep 2 records for each period. Ordinal 1 containss the most current information.

Note:   This script converts Plex format to datetime with 3 precision second decimal
If DW column was datetime2 no conversion would be necessary
*/

select s.Name, sh.*
from ETL.script_history sh 
join ETL.script s 
on sh.script_key=s.Script_Key 
--where sh.script_key in (1,3,4,5,6,7,9,10,11,116)
 where sh.script_key in (1,3,4,5,6,7,8,9,10,11,116,117)
and start_time between '2025-06-13 00:00:00' and '2025-06-14 00:00:00' 
order by start_time desc

select top 10 *
-- select count(*)
from Plex.accounting_period p  -- 2080 | 2,032
where pcn = 123681 --  1180 | 1132
order by p.begin_date desc
--and ordinal = 0  -- 590 | 566
and ordinal = 1 -- 590 | 566
--and period > 202101 -- 718/694/670
and period between 202401 and 202412

--Noticed that period 202410 was updated on 2024-11-19 and that explained why some account balances had 
--different values than the ones showing in the DW which were last updated early in Nov.
|pcn    |period_key|period |fiscal_order|begin_date             |end_date               |period_display|quarter_group|period_status|add_date               |update_date            |ordinal|
|-------|----------|-------|------------|-----------------------|-----------------------|--------------|-------------|-------------|-----------------------|-----------------------|-------|
|123,681|45,984    |202,410|10          |2024-10-01 00:00:00.000|2024-10-31 23:59:59.000|10-2024       |4            |0            |2024-11-19 10:47:49.690|2024-11-19 10:48:00.000|0      |
|123,681|45,984    |202,410|10          |2024-10-01 00:00:00.000|2024-10-31 23:59:59.000|10-2024       |4            |0            |2024-11-19 10:47:49.690|2024-11-19 10:48:00.000|1      |



/* 
  AccountingPeriodRanges:
  accounting_period_ranges_dw_import,sproc123681_11728751_2112421
  The period range is min open period to year before it
  Pushed the min open period to one period back from the actual min open period
  in case the period was recently opened/closed, so the calculation is 
  based on the account activity summary web service which will have the 
  most up-to-date values because it accesses the production database.
 */
select * from Plex.accounting_period_ranges -- 202105/202204
where pcn = 123681

|id   |pcn    |start_period|end_period|start_open_period|end_open_period|no_update|
|-----|-------|------------|----------|-----------------|---------------|---------|
|1,720|123,681|202,406     |202,504   |202,505          |202,506        |0        |

--# backup state
|id   |pcn    |start_period|end_period|start_open_period|end_open_period|no_update|
|-----|-------|------------|----------|-----------------|---------------|---------|
|1,719|123,681|202,401     |202,410   |202,411          |202,501        |0        |


select s.Name, sh.*
from ETL.script_history sh 
join ETL.script s 
on sh.script_key=s.Script_Key 
--where sh.script_key in (1,3,4,5,6,7,9,10,11,116)
 where sh.script_key in (1,3,4,5,6,7,8,9,10,11,116,117)
and start_time between '2025-06-13 00:00:00' and '2025-06-14 00:00:00' 
order by start_time desc

/*
The AccountingBalanceAppendPeriodRange ETL script calls accounting_balance_append_period_range_dw_import
sproc300758_11728751_2000117 (pcn,start_period,end_period) to pull the most recent accounting_balance records from Plex.
It then runs Plex.accounting_balance_delete_period_range to delete the outdated accounting_balance records in the DW. 
It then inserts the data returned from the accounting_balance_append_period_range_dw_import SPROC 
into the DW accounting_balance table.

The AccountingBalanceAppendPeriodRange ETL script originally called a SPROC that retrieved data from the 
MySQL DW accounting_period_ranges table. Which had the advantage of the developer being able to change values 
of that table if desired for debugging purposes.

*/

|id   |pcn    |start_period|end_period|start_open_period|end_open_period|no_update|
|-----|-------|------------|----------|-----------------|---------------|---------|
|1,739|123,681|202,406     |202,504   |202,505          |202,506        |0        |

--# backup state
|id   |pcn    |start_period|end_period|start_open_period|end_open_period|no_update|
|-----|-------|------------|----------|-----------------|---------------|---------|
|1,719|123,681|202,401     |202,410   |202,411          |202,501        |0        |


-- select count(*)
-- select top 10 *
FROM Plex.accounting_balance -- 55,008
where pcn = 123681 -- 51,187 on 6/11/25 | 50,878 on 5/1/25 | 50,568 on 4/3/25 |50,245 on 4/2/25 | 49,613 on Mar 4, 25 | 49,326 on Dec 5,24 | 49,022/49,021
--and period = 202504  -- 0/309 
--and period = 202503  -- 0/310 
--and period = 202502  -- 0/323 
--and period = 202501  -- 0/332 
--and period = 202412  -- 0/300 
-- and period = 202411  -- 0/287 
--and period between 202411 and 202504  -- 1861 on 6/4/25 

 -- backup
-- and period = 202410  -- 304 nothing added on 2/4/25
-- and period = 202409  -- 235 
-- and period = 202408  -- 218 
-- and period = 202407  -- 235 
-- and period = 202406  -- 227 
--and period between 202406 and 202410  -- 1219 

--  and period = 202405  -- 231 
-- and period = 202404  -- 230 
-- and period = 202403  -- 224 
-- and period = 202402  -- 230 
and period between 202406 and 202504  -- 3080 on 6/4/25 

and period between 202405 and 202504  -- 3311 on 6/4/25 
and period between 202405 and 202503  -- 3002 on 5/4/25 
and period between 202404 and 202503  -- 3232 on 5/4/25 
and period between 202404 and 202502  -- 2922 on 4/3/25 
and period between 202403 and 202501  -- 2823 on 04/02/25 | 2491 | 2191 before 3/4/25 
and period between 202403 and 202412  -- 2491 | 2191 before 3/4/25 
and period between 202402 and 202411  -- 2421 | 2134 before 2/4/25 
and period between 202312 and 202410  -- 2585 on Dec 5 | 2281/2280 on Dec 2
and period between 202312 and 202409  -- 2281/2280 on Dec 2
and period between 202308 and 202405  -- 2324 on Aug 6
and period between 202307 and 202404  -- 2327 on july 5th
and period between 202306 and 202404  -- 2560
and period between 202305 and 202403  -- 2578
and period between 202305 and 202402  -- 2354
and period between 202304 and 202402  -- 2597
and period between 202303 and 202401  -- 2607
and period between 202302 and 202312  -- 2625
and period between 202301 and 202311  -- 2642
and period between 202301 and 202310  -- 2410
and period between 202212 and 202310  -- 2659
and period between 202212 and 202309  -- 2423
and period between 202211 and 202309  -- 2676
and period between 202211 and 202308  -- 2417
and period between 202210 and 202308  -- 2651
and period between 202209 and 202307  -- 2654

|account_no    |
|--------------|
|65100-100-0070|
|68400-000-0070|
in ('65100-100-0070','65100-100-0070')
/*
AccountActivitySummaryGetOpenPeriodRange
Takes the open period range from Plex.accounting_period_ranges and calls the Account_Activity_Summary_xPCN_Get web service 
twice for each period. We use the start and end account_no SOAP parameters when calling this web service to reduce the 
number of records returned to prevent a timeout from occurring. 
This gives the most up-to-date totals for each account. 
The Plex.account_activity_summary records for this
range are then deleted and re-added using the uptodate web service data.
*/

select s.Name,sh.*
from ETL.script_history sh 
join ETL.script s 
on sh.script_key=s.Script_Key 
where sh.script_key in (1,3,4,5,6,7,8,9,10,11,116,117)
and start_time between '2025-06-13 00:00:00' and '2025-06-14 00:00:00' 
order by script_history_key desc
--if (rec[0][0] = '123681') { "Adult" } else { "Minor" }
--if (rec[0][2] = '63300-200-0000'):
--   test = test + 1

-- vscode debug window 
/* 
for i in list:
  if i.Columns.Column[1].Value == '11010-000-0000':
    print(i.Columns.Column[4].Value)
    print(i.Columns.Column[5].Value)
    print(i.Columns.Column[6].Value)
    print(str(round(float(i.Columns.Column[5].Value)-float(i.Columns.Column[6].Value),5)))
    print(i.Columns.Column[7].Value)

for i in list:
  if i.Columns.Column[1].Value == '71100-200-0000':
    print(i.Columns.Column[4].Value)
    print(i.Columns.Column[5].Value)
    print(i.Columns.Column[6].Value)
    print(str(round(float(i.Columns.Column[5].Value)-float(i.Columns.Column[6].Value),5)))
    print(i.Columns.Column[7].Value)
*/

/*
 * Backup tables
 */
--create schema Archive
select * 
--select distinct period 
--select count(*) cnt
--into Archive.account_activity_summary_12_03_24 -- 12/3/24 cnt=156,166
from Plex.account_activity_summary -- 156,166
where pcn = 123681
order by period desc
--|period |
--|-------|
--|202,506|
--|202,505|
--|202,501|
--|202,412|
--|202,411|
--|202,410|
--|202,409|
--|202,408|


--at the time of the last MI backup we only have upto 202501.
--202501
--202412
--202411
--202410
--202409
--202408

where account_no in ('65100-100-0070','65100-100-0070')

|pcn    |period |account_no    |beginning_balance|debit   |credit|balance |ending_balance|
|-------|-------|--------------|-----------------|--------|------|--------|--------------|
|123,681|202,502|65100-100-0070|0                |0       |0     |0       |0             |
|123,681|202,503|65100-100-0070|0                |4,979.95|0     |4,979.95|4,979.95      |
|123,681|202,504|65100-100-0070|4,979.95         |0       |0     |0       |4,979.95      |


/*
 * Check backup
 */
select top 10 *
--select count(*) cnt 
from Archive.account_activity_summary_12_03_24 -- 156,166

select s.Name, sh.*
from ETL.script_history sh 
join ETL.script s 
on sh.script_key=s.Script_Key 
where sh.script_key in (1,3,4,5,6,7,8,9,10,11,116,117)
and start_time between '2025-06-13 00:00:00' and '2025-06-14 00:00:00' 
order by start_time desc

select * from Plex.accounting_period_ranges -- 202105/202204
where pcn = 123681

|id   |pcn    |start_period|end_period|start_open_period|end_open_period|no_update|
|-----|-------|------------|----------|-----------------|---------------|---------|
|1,739|123,681|202,406     |202,504   |202,505          |202,506        |0        |

select top 10 *
--select count(*) cnt 
from Plex.account_activity_summary -- 166,441
where pcn = 123681 -- 144,433 from backup | 164,079|139539|139537|134401/134,401
--and period = 202506 -- 4,916 
and period = 202505 -- 4916 | 4,910 
order by pcn,account_no 
and period = 202504 -- 0 | 4916 | 4,910 | 4897

--and period = 202503 -- 4,910 | 4,908 | 4897
--and period = 202502 -- 4,910 | 4,908 | 4897| 0
--and period = 202501 -- 4897 | 4894
--and period = 202412 -- 4897 | 4894|4893
and period between 202505 and 202506 -- 9832 on 6/11/25 
--and period between 202504 and 202505 -- 9820 on 5/1/25

--and period between 202503 and 202505 -- 14,730 on 5/2/25
--and period between 202503 and 202504 -- 9820 on 4/3/25
--and period between 202502 and 202504 -- 14,730 on 4/2/25
--and period between 202501 and 202503 -- 14,713 on 4/2/25 before AccountPeriodBalanceRecreatePeriodRange | 14691
--and period between 202412 and 202502 -- 14691

--and period = 202411 -- 4894|4893 | 4,650 before running script on 12/4/24 
--and period = 202410 -- 4893 | 4,650 before running script on 12/4/24
--and period = 202409 -- 4,650 before running script on 12/4/24
--and account_no BETWEEN '00000-000-00000' and  '66666-666-66666' -- 2209/2140
and account_no BETWEEN '66666-666-66667' and  '99999-999-99999' -- 2685/2684/2510


select top 10 *
--select count(*) cnt
from Plex.account_activity_summary 
WHERE pcn = 123681 
and period = 202412
--and account_no = '11010-000-0000' 
and account_no = '71100-200-0000' 
--and account_no BETWEEN '10000-000-00000' and  '10030-000-00000'

|pcn    |period |account_no    |beginning_balance|debit        |credit       |balance     |ending_balance|
|-------|-------|--------------|-----------------|-------------|-------------|------------|--------------|
|123,681|202,410|11010-000-0000|8,012,674.8      |18,530,321.66|17,092,807.77|1,437,513.89|9,450,188.69  |
|123,681|202,410|71100-200-0000|43,523.99        |1,853.29     |369.88       |1,483.41    |45,007.4      |

--Recent Soap query shows an increase on credit for 10/2024 since the Oct TB report
11010-000-0000
8012674.8
18530321.66 - debit
18511489.3 - credit increased from 17,092,807.77 on 10-2024	10/31/24	JE: Group BS Clean Up Adjustment by 1,418,681.53
8031507.16

select s.Name, sh.*
from ETL.script_history sh 
join ETL.script s 
on sh.script_key=s.Script_Key 
where sh.script_key in (1,3,4,5,6,7,8,9,10,11,116,117)
and start_time between '2025-06-13 00:00:00' and '2025-06-14 00:00:00' 
order by start_time desc


/*
AccountPeriodBalanceRecreatePeriodRange
The AccountPeriodBalanceRecreatePeriodRange ETL Script runs the Plex.account_period_balance_recreate_period_range procedure 
It calculates the Forever-to-date and YTD account totals by adding the accounting_balance totals for the period to the previous
periods values starting from the period previous to the start_period stored in the Plex.accounting_period_ranges table.
When accounts are added they are added to previous periods with 0 balance
*/
/*
 * Backup tables
 */
select * 
--select count(*) cnt
--into Archive.account_period_balance_2025_06_12 -- 318564
--into Archive.account_period_balance_2024_04_05 -- 268,047
from Plex.account_period_balance b 

/*
 * Check backup
 */
select top 10 *
-- select count(*) cnt 
from Archive.account_period_balance_2025_06_12 -- 318564
where pcn = 123681 and period = 202405
order by period desc, account_no

select s.Name, sh.*
from ETL.script_history sh 
join ETL.script s 
on sh.script_key=s.Script_Key 
where sh.script_key in (1,3,4,5,6,7,8,9,10,11,116,117)
and start_time between '2025-06-13 00:00:00' and '2025-06-14 00:00:00' 
order by start_time desc

/*
 * How many records should be in the account_period_balance table for each period
 */
-- select count(*) 
from Plex.accounting_account  -- 19,287/19,286,19,176
where pcn=123681 -- 4,897 on 2/4/25 | 4,894 on 12/05/24 | 4,893 on 12/04/24 ### 4,885 on 12/3/24 ### 4,642 3 accounts were added on July 5th, 2024# 4,639 1 account added on Jun 2024 /4,638/4,622/4,621/4,617

select * from Plex.accounting_period_ranges -- 202105/202204
where pcn = 123681

|id   |pcn    |start_period|end_period|start_open_period|end_open_period|no_update|
|-----|-------|------------|----------|-----------------|---------------|---------|
|1,739|123,681|202,406     |202,504   |202,505          |202,506        |0        |



select distinct pcn,period 
-- select top 200 *
-- select count(*)
from Plex.account_period_balance -- 318,504 / 305,544 on 12/03/24
--order by pcn,period desc -- 202501 waw the last period on MI import
where pcn = 123681 -- 230,598 on MI import | 255,354 on 6/4/25 | 250,360 on 5/2/25 | 245,450 on 4/3/25 | 235,474 before 3/4/25 | 230,538 before 2/4/25 | 225,644 on Dec 6,2024 | 220,506 on Dec 5,2024 | 217,578 on Dec 4,2024
--and period = 202501 
--and period = 202412 
--and period = 202411 
--and period = 202410 
--and period = 202409 
--and period = 202408 
--and period = 202407 
--and period = 202504 -- 4916
--order by account_no desc  
--and period = 202405 -- 4916 after manually adding accounts from current MI | 4,894 
--and period = 202404 -- 4910 after manually adding accounts from current MI | 4,894
--and period = 202403 -- 4910 after manually adding accounts from current MI
--and period = 202402 -- 4,897 after manually adding accounts from current MI
--and period = 202401 -- 4,897 after manually adding accounts from current MI
--and period = 202312 -- 4,894 
--and period = 202312 -- 4,894 
--and period = 202310 -- 4650

--and period = 202504 -- 4,916 
--and period = 202503 -- 4,916 |4,910 
--and period = 202502 -- 4,916 |4,910 
--and period = 202406 -- 4,916 |4,910 | 4,897 | 4,894 before 2/4/25
--and period = 202405 -- 4,916 |4,910 | 4,897 | 4,894 before 2/4/25
--and period = 202404 -- 4,910 | 4,897 | 4,894 before 2/4/25
--and account_no in ('12450-000-0000','77300-850-0055','90300-850-0000')  -- new account
--and period between 202502 and 202504  -- 0
--and period between 202406 and 202501  -- 39152
--and period between 202406 and 202504  -- 39152
--and period between 202405 and 202504  -- 58,992 | 44,068
and period between 202405 and 202506  -- 58,992 | 44,068
and period between 202405 and 202503  -- 54,076 | 54,010
and period between 202404 and 202503  -- 58,920
and period between 202404 and 202502  -- 54,010
and period between 202403 and 202502  -- 58,920
and period between 202403 and 202501  -- 54,010
and period between 202403 and 202412  -- 49,080 | 48,970 before 4/2/25 | 48,940 before 2/4/25
and period between 202402 and 202411  -- 48,970 | 48,940 before 2/4/25
and period between 202312 and 202410  -- 53,834 (12/06/24) | 51,150 (12/03/24)
and period between 202311 --4650

select s.Name, sh.*
from ETL.script_history sh 
join ETL.script s 
on sh.script_key=s.Script_Key 
where sh.script_key in (1,3,4,5,6,7,8,9,10,11,116,117)
and start_time between '2025-06-13 00:00:00' and '2025-06-15 00:00:00' 
order by start_time desc

select count(*) cnt -- 92,093
from ETL.Script_History
/*
AccountPeriodBalanceRecreateOpenPeriodRange
The AccountPeriodBalanceRecreateOpenPeriodRange ETL Script runs the Plex.account_period_balance_recreate_open_period_range procedure 
It calculates the Forever-to-date and YTD account totals by adding the accounting_balance totals for the period to the previous
periods values starting from the period previous to the end_period stored in the Plex.accounting_period_ranges table.
*/

select * from Plex.accounting_period_ranges -- 202105/202204
where pcn = 123681

|id   |pcn    |start_period|end_period|start_open_period|end_open_period|no_update|
|-----|-------|------------|----------|-----------------|---------------|---------|
|1,739|123,681|202,406     |202,504   |202,505          |202,506        |0        |

select distinct pcn,period 
-- select top 200 *
-- select count(*)
from Plex.account_period_balance 
where pcn = 123681 -- 255,354
and period = 202506 -- 4916
order by account_no   

--and period = 202505 -- 4,916 | 4910
--and period = 202504 -- 4916 | 4,910
--and period = 202503 -- 4,910 | 4,908 | 4897 before 4/2/25 | 0
--and period = 202502 -- 4,910 | 4,908 | 4897 | 0
--and period = 202501 -- 4,910 | 4,908 | 4897 | before 2/4/25 4,894
and period between 202504 and 202506  -- 14748
and period between 202504 and 202505  -- 9832 | 9,820
and period between 202503 and 202505  -- 14730
and period between 202503 and 202504  -- 9,820
and period between 202501 and 202503  -- 14,730 | 14,724 | 14,691
and period between 202412 and 202502  -- 14,691

--and period = 202411 -- 4,894
--and period = 202410 -- 4,894
--and period = 202312 -- 4,894 on 12/5/24 | 4,650
--and period = 202311 -- 4,894 on 12/5/24 | 4,650
and period between 202311 and 202411  -- 63,622
-- order by pcn,period desc

select s.Name, sh.*
from ETL.script_history sh 
join ETL.script s 
on sh.script_key=s.Script_Key 
where sh.script_key in (1,3,4,5,6,7,8,9,10,11,116,117)
and start_time between '2025-06-13 00:00:00' and '2025-06-14 00:00:00' 
order by start_time desc


select * 
-- into Archive.trial_balance_multi_level_01_03_2024 -- 765,128
-- into Archive.trial_balance_multi_level_09_11_2023 -- 748,312
-- select count(*) cnt
from Plex.trial_balance_multi_level -- 794,556

/*
 * Main Compare
 * Are there any accounts that have different values?
 */
select * from ETL.script
select count(*) cnt 
from Plex.trial_balance_multi_level d
where pcn = 123681 and period = 202308  -- should be 0 for the last period because we have not ran the ETL script yet 

select * from Plex.accounting_period_ranges -- 202303/202304
where pcn = 123681

-- is new account in trial_balance_multi_level
select *
from Plex.trial_balance_multi_level d
where pcn = 123681  
and account_no = '11030-000-0000' -- not found in tbml on 6/7/2024
order by period

--New account was created in account_period_balance on 6/7/2024
select * from Plex.account_period_balance apb 
where account_no = '11030-000-0000' -- not found in tbml on 6/7/2024

|pcn    |account_no    |period |period_display|debit    |ytd_debit|credit|ytd_credit|balance  |ytd_balance|
|-------|--------------|-------|--------------|---------|---------|------|----------|---------|-----------|
|123,681|11030-000-0000|202,404|04-2024       |0        |0        |0     |0         |0        |0          |
|123,681|11030-000-0000|202,405|05-2024       |16,666.36|16,666.36|0     |0         |16,666.36|16,666.36  |
|123,681|11030-000-0000|202,406|06-2024       |4,316.25 |20,982.61|0     |0         |4,316.25 |20,982.61  |

declare @pcn int;
set @pcn= 123681;
declare @period_start int;
set @period_start = 202308;
declare @period_end int;
set @period_end = 202408;
--set @period_end = 202407; -- TB-202307_to_202407_on_08-06_DM_HL 
--set @period_end = 202406; -- TB-202306_to_202406_on_07-07_DM_HL --3 new accounts added this month
--set @period_end = 202406; -- TB-202306_to_202406_on_07-07_DM_HL --no changes in 202305 to 202405
    
--set @period_end = 202405; -- TB-202305_to_202405_on_06-07_DM -- passed but new account is not   
--set @period_end = 202404; -- TB-202305_to_202405_on_06-07_DM -- no changes in 202304 to 202404  

--set @period_end = 202404; --TB-202304_to_202404_on_05-07_DM -- no changes in 202403 
--set @period_end = 202403; --TB-202303_to_202403_on_04-05_DM -- 2 account balances changed in 202401 so needed to pull 202401-202403
--set @period_end = 202402; -- TB-202302_to_202402_on_03-08_DM 
--set @period_end = 202401; -- TB-202302_to_202402_on_03-08_DM -- no change in 202401
--set @period_end = 202401; -- TB-202301_to_202401_on_02-08_DM -- was one change in 202312
--set @period_end = 202312; -- TB-202301_to_202401_on_02-08_DM -- was one change in 202312
--set @period_end = 202311; -- TB-202212_to_202312_on_01-18_BG -- after bug fix reran scripts 
--set @period_end = 202312; -- TB-202212_to_202312_on_01-18_BG -- after bug fix reran scripts
--set @period_end = 202401; -- TB-202212_to_202312_on_01-18_BG -- after bug fix reran scripts

--set @period_end = 202311; -- TB-202212_to_202312_on_01-11_DM -- after bug fix did not rerun scripts 
--set @period_end = 202312; -- TB-202212_to_202312_on_01-11_DM
--set @period_end = 202401; -- TB-202212_to_202312_on_01-11_DM

--set @period_end = 202311; -- TB-202212_to_202312_on_01-09_DM -- no changes when compared to the last TB excel 
--set @period_end = 202312; -- TB-202212_to_202312_on_01-09_DM -- plex changes in 202312 there was 1 account addition
--set @period_end = 202401; -- TB-202212_to_202312_on_01-09_DM -- 202401 is open and 3 account differences

--set @period_end = 202401; -- TB-202212_to_202312_on_01-09_DM
--set @period_end = 202401; -- TB-202212_to_202312_on_01-04_DM_LR 
--set @period_end = 202312; -- TB-202212_to_202312_on_01-03_DM_LR 
--set @period_end = 202311; -- TB-202212_to_202312_on_01-03_DM_LR -- 7 changes
--set @period_end = 202311; -- TB-202211_to_202311_on_12-12_DM_LR_JS no plex accessible account changes in 202310 
--set @period_end = 202310; -- TB-202211_to_202311_on_12-12_DM_LR_JS no plex accessible account changes in 202310 
--set @period_end = 202311; -- TB-202211_to_202311_on_12-08_DM_LR_JS (12/08) no plex accessible account changes in 202310 
--set @period_end = 202310; -- TB-202211_to_202311_on_12-08_DM_LR_JS no plex accessible account changes in 202310 
--/ time: 15:00, period 202311 was not closed
--set @period_end = 202310; -- TB-202211_to_202310_on_11-21_LR_DM_GP 1 plex TB account changes in 202310 
--set @period_end = 202309; -- TB-202211_to_202310_on_11-21_LR_DM_GP no plex accessible account changes in 202309

--set @period_end = 202310; -- TB-202211_to_202310_on_11-20_LR_DM_GP no plex accessible account changes in 202310 
-- set @period_end = 202309; -- TB-202211_to_202310_on_11-20_LR_DM_GP no plex accessible account changes in 202309
--set @period_end = 202310; -- TB-202210_to_202310_on_11-13_LR_DM_GP no plex accessible account changes in 202309 
--set @period_end = 202309; -- TB-202210_to_202310_on_11-13_LR_DM_GP no plex accessible account changes in 202309 
--set @period_end = 202310; -- TB-202210_to_202310_on_11-07_DM_GP no plex accessible account changes in 202309 
--set @period_end = 202309; -- TB-202210_to_202310_on_11-07_DM_GP no plex accessible account changes in 202309 
--set @period_end = 202309; -- TB-202209_to_202309_on_10-24_DM_GP  no account changes from 2209 to 202308;
-- set @period_end = 202309; -- TB-202209_to_202309_on_10-18_DM_GP  
--set @period_end = 202309; -- TB-202209_to_202309_on_10-17_DM there was 1 account that changed 
--set @period_end = 202308; -- TB-202209_to_202309_on_10-17_DM there was 1 account that changed 
--set @period_end = 202308; -- TB-202209_to_202309_on_10-10_DM 
--set @period_end = 202309; -- TB-202208_to_202308_on_09-18_DM 
--set @period_end = 202308; -- TB-202208_to_202308_on_09-13_DM
-- set @period_end = 202308; -- TB-202208_to_202308_on_09-11_DM
-- set @period_end = 202307; -- TB-202207_to_202307_on_08-24_DM
-- set @period_end = 202307; -- TB-202207_to_202307_on_08-09_DM
-- set @period_end = 202306; -- TB-202207_to_202307_on_08-09_DM
-- set @period_end = 202306; -- TB-202206_to_202306_on_07-11_DM

select b.pcn,b.period, count(*)
---- select distinct b.period
from Plex.account_period_balance b 
group by b.pcn,b.period 
having b.pcn = @pcn
and b.period between @period_start and @period_end -- 64,708
order by period DESC 

-- select b.period,b.account_no 
-- ,b.balance b_balance, d.current_debit_credit d_balance
-- ,b.ytd_balance, d.ytd_debit_credit 
 select count(*)
-- select distinct b.period
from Plex.account_period_balance b 
-- where b.pcn = @pcn
-- and b.period between @period_start and @period_end -- 96,891/99,891/202101-202209/,234
join Plex.accounting_period ap
on b.pcn =ap.pcn 
and b.period = ap.period  
and ap.ordinal = 1
-- where b.pcn = @pcn
-- and b.period between @period_start and @period_end -- 96,891
join Plex.trial_balance_multi_level d -- TB download does not show the plex period for a multi period month, you must link to period_display
on b.pcn=d.pcn
and ap.period_display = d.period_display 
and b.account_no = d.account_no  -- 16,816
where b.pcn = @pcn
and b.period between @period_start and @period_end -- 54,652# 50,448/202307-202407#54,652/202306-202406#54,652/202305-202405#54,652/202304-202404# -- 54,652/202304-202403#50,448/202303-202402#202302-202402#46,244/202303-202401#54,652/202301-202401#50,448/202301-202312#58,856/202212-202401#54,652/202212-202312#50,448/202212-202311#58,856/202212-202401#54,652/202212-202312#50,448/202212-202311 (01/03/24)#54,652/202211-202310 (12/12)/54,652/202211-202310 (12/8)/50,448/202211-202310 (21st),46,244/202211-202309,50,448/202211-202310,54,652/202210-202310,54,652/202209-202309,54,652,50,448/202208-202308, 54,652/202207-202307, 54,652/202206-202306,54,652/202205-202305,117,712/202101-202304,109,304/202101-202302, 105,100/202101-202301,100,896/202101-202212,96,692/202101-202211,92,488/202101-202210/88,284/202101-202209/8,408/202208-202209,4,562/2021-01 to 2022-07,3,953/2021-01 to 2022-04
-- and b.balance  = d.current_debit_credit -- 54,625/202306-202406#54,626/202305-202405# 54,626/202304-202404#54,624/202304-202403#50,419/202302-202402#54,620/202302-202402#46,219/202303-202401#54,618/202301-202401#50,416/202301-202312#58,817/202212-202401#54,616/202212-202312#50,413/202212-202311#54,616/202212-202312#58,821/202212-202401#54,613/202212-202312#54,614/202211-202310 (12/12)/54,614/202211-202310 (12/8)/50,411/202211-202310,54,614/202210-202310,54,611/202209-202309,54,614/202207-202307,54,617/202206-202306,54,618/202205-202305,117,117,645/202101-202304,109,242/202101-202302,/105,043/202101-202301,100,843/202101-202212,96,643/202101-202211,92,442/202101-202210,
--and b.balance  != d.current_debit_credit -- 27/202306-202406#26/202305-202405#26/202304-202404#28/202304-202403#20/202302-202402#32/202302-202402#25/202303-202401#34/202301-202401#32/202301-202312#39/202212-202401#36/202212-202312#35/202212-202311#36/202212-202312#35/202212-202401#39/202212-202312#38/202211-202310 (12/12)#38/202211-202310 (12/8)/37/202211-202310,38/202210-202310,41/202209-202309,38/202207-202307,35/202206-202306,34/202205-202305,62/202101-202302,57/202101-202301,53/202101-202212,49/202101-202211,46//202101-202210
--and abs(b.balance - d.current_debit_credit) >  0.01  -- 0 
--and (b.ytd_balance = d.ytd_debit_credit)  -- 54,481/202306-202406#54,484/202305-202405#54,484/202304-202404#54,485/202303-202403#/202302-202402#46,104/202303-202401#54,485/202301-202401#50,298/202301-202312#54,490/202212-202312#50,300/202212-202311#54,490/202212-202312#58,678/202212-202401#54,489/202211-202311 (12/12)#54,490/202211-202310 (12/8)/50,299/202211-202310 (20th),50,299/202211-202310 (13th),54,492/202210-202310 (7th),54,490/202209-202309 (17th),54,489/202209-202309(10th),54,491/202207-202307,54491/202206-202306,54,490/202205-202305,117,349/202101-202304,108,967/202101-202302,104,777/202101-202301,100,586/202101-202212,96,394/202101-202211,92,204/202101-202210
--and (b.ytd_balance != d.ytd_debit_credit)  --  171/202306-202406#168/202305-202405#168/202304-202404#167/202304-202403#202302-202402#168/202302-202402#167/202301-202401#150/202301-202312#162/202212-202312#148/202212-202311#162/202212-202312#178/202212-202401#163/202211-202311 (12/12) #162/202211-202310 (12/8)/149/202211-202310(13th),160/202210-202310(7th),162/202209-202309(17th),163/202209-202309(10th),161/202207-202307,161/202206-202306,162/202205-202305,363/202101-202304,337/202101-202302,323/202101-202301,310/202101-202212,298/202101-202211,284/202101-202210
and abs(b.ytd_balance - d.ytd_debit_credit) > .01 -- 13/202304-202404# 13/202302-202402#13/202301-202401#12/202301-202312#17/202212-202401#13/202212-202312#13/202211-202310 (12/8)/12/202211-202310 (20th),13/202210-202310,13/202209-202309,13/202207-202307,13/202206-202306,13/202205-202305,16/202101-202304,15/202101-202303,14/202101-202302,17/202101-202302,13/202101-202301,12/202101-202212,11/202101-202211,-- 10/202101-202210 (73100-000-0000)
and d.account_no != '73100-000-0000' -- 0/202304-202404#4/202304-202402#3/202212-202401#0/202207-202307,0/202206-202306,0/202205-202305,0/202101-202304,0/202101-202303,16,816

--Since 202401 changed balance I needed to pull both 202401 and 202402 for updated ytd values
--period  account         my_balance  plex_balance  my_ytd        plex_ytd
--202402	68200-860-0000	2051.50000	2051.50	      3104.45000	2051.50
--202402	75400-860-0000	0.00000		0.00		  0.00000	    1052.95
--order by b.period asc 
-- ISSUE: 1 ACCOUNT IS NOT THE SAME
-- See issue section at the bottom of this procedure and the Mobex Plex procedure: accounting_year_category_type_issue 
-- 73100-000-0000 has different category_types in accounting_v_account it is an Expense and in accounting_v_category_type it is a liability
-- Conclusion: The Plex TB report and Plex authored procedure is wrong to not reset YTD values.

/* These values are not equal
202401	68200-860-0000	1052.95000	0.00	1052.95000	0.00
202401	75400-860-0000	0.00000	1052.95	0.00000	1052.95
202402	68200-860-0000	2051.50000	2051.50	3104.45000	2051.50
202402	75400-860-0000	0.00000	0.00	0.00000	1052.95
*/

/* These values are not equal
202401	18900-000-9806	12111520.41000	11587913.71	26260759.93000	25737153.23
 */

--From Plex download trial balance multi level report from the determined period range
--TrialBalance ssis ETL script that takes as input the Plex Trial Balance CSV file.   
--select distinct pcn,period from Plex.trial_balance_multi_level order by pcn,period desc


Optional: Add or update Plex.Account_Balances_by_Periods using the AccountBalancesByPeriod  ETL script.  If you are sure there have been no changes 
to previous period values then just run the script for the current period. 
select distinct pcn,period from Plex.Account_Balances_by_Periods order by pcn,period

Optional: Add or update Plex.GL_Account_Activity_Summary using the GLAccountActivitySummary  ETL script.  If you are sure there have been no changes 
to previous period values then just run the script for the current period. 
select distinct pcn,period from Plex.GL_Account_Activity_Summary order by pcn,period

Optional: Go to the Plex Account Activity by Period screen to check bookings that happened after the Plex snapshot.
Use the Plex AccountingAccountSummaryOpenPeriodDetail procedure to show the bookings for a single account.

/*
 * Backup
 */
--select * 
--into Archive.account_period_balance_04_11_2023 -- 212,559
from Plex.account_period_balance b -- 43,630
--select count(*) from Archive.account_period_balance_2022_06_04 -- 140,713

/*
 * Are there any accounts that we are not showing in our report?
 */
select * from Plex.accounting_period_ranges

declare @pcn int;
set @pcn= 123681;
declare @period_start int;
set @period_start = 202201;
declare @period_end int;
set @period_end = 202307;

select count(*)
from Plex.trial_balance_multi_level t -- 714,680,685,252
--left outer join Scratch.account_period_balance b -- 123,615
left outer join Plex.account_period_balance b -- 123,615
on b.pcn=t.pcn
and b.account_no = t.account_no
and b.period = t.period -- 688,665
where t.period between @period_start and @period_end -- 67,264/2021-01 to 2022-04
and b.pcn is null -- 0
--123681	202206	2022-07-11 18:17:30.473	2022-07-11 18:18:00.000

/*
 * Are there any accounts that we are not showing in our report?
 */
select * from Plex.accounting_period_ranges

declare @pcn int;
set @pcn= 123681;
declare @period_start int;
set @period_start = 202207;
declare @period_end int;
set @period_end = 202307;

select count(*)
from Plex.Account_Balances_by_Periods p -- 705,481/701,277
--left outer join Scratch.account_period_balance b -- 123,615
left outer join Plex.account_period_balance b -- 123,615
on b.pcn=p.pcn
and b.account_no = p.[no]
and b.period = p.period -- 688,665
where p.period between @period_start and @period_end -- 83,289/2021-01 to 2022-07,70,677/2021-01 to 2022-04
and b.pcn is null -- 0

select top 10 *
-- select count(*) 
from mgdw.Plex.Account_Balances_by_Periods -- 705,481
/*
 * Are there any accounts that we are not showing in our report?
 */
select * from Plex.accounting_period_ranges

declare @pcn int;
set @pcn= 123681;
declare @period_start int;
set @period_start = 202101;
declare @period_end int;
set @period_end = 202209;

select count(*)
from Plex.GL_Account_Activity_Summary s -- 40,221
--left outer join Scratch.account_period_balance b -- 123,615
left outer join Plex.account_period_balance b -- 123,615
on b.pcn=s.pcn
and b.account_no = s.account_no
and b.period = s.period -- 39,612
where s.period between @period_start and @period_end -- 4,562/2021-01 to 2022-07,3,953/2021-01 to 2022-04
and b.pcn is null -- 0

/*
 * Are there any accounts that we are not showing in our report?
 */
select * from Plex.accounting_period_ranges

declare @pcn int;
set @pcn= 123681;
declare @period_start int;
set @period_start = 202208;
declare @period_end int;
set @period_end = 202209;

select count(*)
from Plex.GL_Account_Activity_Summary s -- 40,221
--left outer join Scratch.account_period_balance b -- 123,615
left outer join Plex.account_activity_summary b -- 123,615
on b.pcn=s.pcn
and b.account_no = s.account_no
and b.period = s.period -- 39,612
where s.period between @period_start and @period_end -- 4,562/2021-01 to 2022-07,3,953/2021-01 to 2022-04
and b.pcn is null -- 0

/*
 * Main Compare:
 * Are there any accounts that have different values?
 */
select * from Plex.accounting_period_ranges
select distinct period from Plex.trial_balance_multi_level where period >= 202204 order by period
select distinct period from Plex.account_activity_summary where period between 202307 and 202308 order by period 

select * from plex.accounting_period_ranges apr 
where pcn = 123681

/*
 * Are there any accounts that have different values?
 */

declare @pcn int;
set @pcn= 123681;
declare @period_start int;
set @period_start = 202101;
declare @period_end int;
set @period_end = 202303; -- plex.accounting_period_ranges.end_open_perid-1

-- select b.period,b.account_no 
 --,b.balance b_balance, d.current_debit_credit d_balance
 --,b.ytd_balance, d.ytd_debit_credit 
-- select count(*)
select distinct b.period
from Plex.account_period_balance b 
-- where b.pcn = @pcn
-- and b.period between @period_start and @period_end -- 96,891/99,891/202101-202209/,234
join Plex.accounting_period ap
on b.pcn =ap.pcn 
and b.period = ap.period  
and ap.ordinal = 1
-- where b.pcn = @pcn
-- and b.period between @period_start and @period_end -- 96,891
join Plex.trial_balance_multi_level d -- TB download does not show the plex period for a multi period month, you must link to period_display
on b.pcn=d.pcn
and ap.period_display = d.period_display 
and b.account_no = d.account_no  -- 16,816
where b.pcn = @pcn
and b.period between @period_start and @period_end -- 109,304/202101-202302, 105,100/202101-202301,100,896/202101-202212,96,692/202101-202211,92,488/202101-202210/88,284/202101-202209/8,408/202208-202209,4,562/2021-01 to 2022-07,3,953/2021-01 to 2022-04
-- and b.balance  = d.current_debit_credit -- 109,242/202101-202302,/105,043/202101-202301,100,843/202101-202212,96,643/202101-202211,92,442/202101-202210,
-- and b.balance  != d.current_debit_credit -- 62/202101-202302,57/202101-202301,53/202101-202212,49/202101-202211,46//202101-202210
-- and abs(b.balance - d.current_debit_credit) >  0.01  -- 0 
-- and (b.ytd_balance = d.ytd_debit_credit)  -- 108,967/202101-202302,104,777/202101-202301,100,586/202101-202212,96,394/202101-202211,92,204/202101-202210
-- and (b.ytd_balance != d.ytd_debit_credit)  -- 337/202101-202302,323/202101-202301,310/202101-202212,298/202101-202211,284/202101-202210
and abs(b.ytd_balance - d.ytd_debit_credit) > .01 -- 15/202101-202303,14/202101-202302,17/202101-202302,13/202101-202301,12/202101-202212,11/202101-202211,-- 10/202101-202210 (73100-000-0000)
and d.account_no != '73100-000-0000' -- 0/202101-202303,16,816
order by b.period asc 
-- ISSUE: 1 ACCOUNT IS NOT THE SAME
-- See issue section at the bottom of this procedure and the Mobex Plex procedure: accounting_year_category_type_issue 
-- 73100-000-0000 has different category_types in accounting_v_account it is an Expense and in accounting_v_category_type it is a liability
-- Conclusion: The Plex TB report and Plex authored procedure is wrong to not reset YTD values.


declare @pcn int;
set @pcn= 123681;
declare @period_start int;
set @period_start = 202304;  -- plex.accounting_period_ranges.start_open_perid
declare @period_end int;
set @period_end = 202305; -- plex.accounting_period_ranges.end_open_perid-1


--select b.period ,b.account_no
--,b.balance,d.current_debit_credit  
-- s.debit s_debit, b.debit b_debit
-- s.credit s_credit, b.credit b_credit 
-- s.debit - s.credit s_debit_credit, b.balance b_balance
-- select count(*)
select distinct b.period 
from Plex.account_activity_summary b -- 33,140
join Plex.accounting_period p
on b.pcn =p.pcn 
and b.period = p.period  -- 33,140
and p.ordinal = 1
join Plex.trial_balance_multi_level d -- TB download does not show the plex period for a multi period month, you must link to period_display
on b.pcn=d.pcn
and p.period_display = d.period_display 
and b.account_no = d.account_no  
where b.pcn = @pcn
and b.period between @period_start and @period_end -- 25,224,21,030,16,816
-- and b.balance  = d.current_debit_credit -- 25,203,25,207, 21,007, 16,806
-- and b.balance  != d.current_debit_credit -- 21/202101-202212,17/202101-202211,13/202101-202211,10/2021-10/2022 to 10/8/10/2/4
and abs(b.balance - d.current_debit_credit) > .01 -- 0
order by period asc 
-- 4 accounts have changed - but the not in the open period range 
202212	20100-000-0000	-1312618.79000	-1313468.79
202212	27800-000-9804	-4281131.52000	-4158537.09
202212	53100-200-0000	899954.25000	777359.82
202212	73100-200-0000	1415911.10000	1416761.10

these accounts changed since 12/19 so i redownloaded the TB from plex.
202211	12400-000-0000
202211	12500-000-0000
202211	12600-000-0000
202211	12900-000-0000
202211	53400-200-0000
202211	53700-200-0000

/*
 * Question about 202301 retained earnings account,39100-000-0000, not being rolled over from 202201
 * Is ok now. 
 */
select *
from Plex.account_period_balance b 
where b.pcn = 123681
and account_no = '39100-000-0000'
order by period desc
/*
 * Are there any accounts that have different values?
 */

declare @pcn int;
set @pcn= 123681;
declare @period_start int;
set @period_start = 202101;
declare @period_end int;
set @period_end = 202303; -- plex.accounting_period_ranges.end_open_perid-1

-- select b.period,b.account_no 
 --,b.balance b_balance, d.current_debit_credit d_balance
 --,b.ytd_balance, d.ytd_debit_credit 
-- select count(*)
select distinct b.period
from Plex.account_period_balance b 
-- where b.pcn = @pcn
-- and b.period between @period_start and @period_end -- 96,891/99,891/202101-202209/,234
join Plex.accounting_period ap
on b.pcn =ap.pcn 
and b.period = ap.period  
and ap.ordinal = 1
-- where b.pcn = @pcn
-- and b.period between @period_start and @period_end -- 96,891
join Plex.trial_balance_multi_level d -- TB download does not show the plex period for a multi period month, you must link to period_display
on b.pcn=d.pcn
and ap.period_display = d.period_display 
and b.account_no = d.account_no  -- 16,816
where b.pcn = @pcn
and b.period between @period_start and @period_end -- 109,304/202101-202302, 105,100/202101-202301,100,896/202101-202212,96,692/202101-202211,92,488/202101-202210/88,284/202101-202209/8,408/202208-202209,4,562/2021-01 to 2022-07,3,953/2021-01 to 2022-04
-- and b.balance  = d.current_debit_credit -- 109,242/202101-202302,/105,043/202101-202301,100,843/202101-202212,96,643/202101-202211,92,442/202101-202210,
-- and b.balance  != d.current_debit_credit -- 62/202101-202302,57/202101-202301,53/202101-202212,49/202101-202211,46//202101-202210
-- and abs(b.balance - d.current_debit_credit) >  0.01  -- 0 
-- and (b.ytd_balance = d.ytd_debit_credit)  -- 108,967/202101-202302,104,777/202101-202301,100,586/202101-202212,96,394/202101-202211,92,204/202101-202210
-- and (b.ytd_balance != d.ytd_debit_credit)  -- 337/202101-202302,323/202101-202301,310/202101-202212,298/202101-202211,284/202101-202210
and abs(b.ytd_balance - d.ytd_debit_credit) > .01 -- 15/202101-202303,14/202101-202302,17/202101-202302,13/202101-202301,12/202101-202212,11/202101-202211,-- 10/202101-202210 (73100-000-0000)
and d.account_no != '73100-000-0000' -- 0/202101-202303,16,816
order by b.period asc 
-- ISSUE: 1 ACCOUNT IS NOT THE SAME
-- See issue section at the bottom of this procedure and the Mobex Plex procedure: accounting_year_category_type_issue 
-- 73100-000-0000 has different category_types in accounting_v_account it is an Expense and in accounting_v_category_type it is a liability
-- Conclusion: The Plex TB report and Plex authored procedure is wrong to not reset YTD values.


/*
 * Full Validation includes the trial balance multi-level,
 * Plex.Account_Balances_by_Periods, and Plex.GL_Account_Activity_Summary s 
 * comparisons.
 */

declare @pcn int;
set @pcn= 123681;
declare @period_start int;
set @period_start = 202101;
declare @period_end int
set @period_end = 202207;

/*
SElect 
b.period,b.account_no
-- ,b.credit our_credit, p.current_credit pp_credit
 ,b.balance our_balance, p.Current_Debit - p.Current_Credit PP_balance, d.current_debit_credit TB_balance 
-- ,s.debit gl_debit, b.debit our_debit
-- ,b.ytd_credit our_ytd_credit,p.Ytd_Credit pp_ytd_credit
-- ,b.ytd_debit our_ytd_debit,p.Ytd_Debit  pp_ytd_debit
--,b.ytd_balance our_ytd_balance, p.Ytd_Debit - p.Ytd_Credit pp_ytd_balance, d.ytd_debit_credit tb_ytd_debit_credit 
*/
select count(*) 
from Plex.account_period_balance b -- 157,283,140,713/123,615
-- where b.period = 202206  -- 8,285
-- where b.period = 202205  -- 8,285
--where b.period between 202101 and 202203
--and b.pcn = 123681 -- 4595*15=45950+22975 = 68925
inner join Plex.accounting_account a 
on b.pcn=a.pcn 
and b.account_no=a.account_no -- 766,413
--LEFT OUTER JOIN Scratch.account_period_balance ab 
--ON b.pcn=ab.pcn 
--AND b.account_no=ab.account_no 
--AND b.period=ab.period
left outer join Plex.trial_balance_multi_level d -- TB download does not show the plex period for a multi period month, you must link to period_display
on b.pcn=d.pcn
and b.account_no = d.account_no
and b.period_display = d.period_display 
-- select * from Plex.Account_Balances_by_Periods p 
--select distinct pcn,period from Plex.Account_Balances_by_Periods p order by pcn,period -- 123,681 (200812-202110)
--select * from Plex.Account_Balances_by_Periods p where pcn=123681
-- select  
--select top(10) *
--into Scratch.Account_Balances_by_Periods
--select *
--into Archive.Account_Balances_by_Periods_2022_01_11  -- 667,645
--from Plex.Account_Balances_by_Periods p
left outer join Plex.Account_Balances_by_Periods p -- 43,620
on b.pcn=p.pcn
and b.account_no = p.[no]
and b.period = p.period 
--inner join 
left outer join 
(
	select s.pcn,s.period, s.account_no,s.debit,s.credit,s.debit-s.credit balance
	--select count(*)
--select distinct pcn,period from Plex.GL_Account_Activity_Summary s order by pcn,period -- 123,681 (200812-202203)
--select * from Plex.GL_Account_Activity_Summary s where pcn=123681 and period = 202111  -- dont know when this was imported probably in early december
	from Plex.GL_Account_Activity_Summary s  --(),(221,202010)
--	where s.pcn = 123681 
--	and s.period between 202101 and 202201  -- 2,462/2,718/2,975
) s
on b.pcn=s.pcn 
and b.account_no=s.account_no
and b.period=s.period  
-- where b.pcn=@pcn and b.period between @period_start and @period_end  --87,657/92,274/87,657/202207,83,040/2022-06/78,423/2021-01 to 2022-05, 73,806/2021-01 to 2022-04/68,925/2021-01 to 2022-03 -- 69,189
-- where b.pcn=@pcn and b.period=202201 and b.account_no = '73100-000-0000'
--DEBUG ONLY where b.pcn=@pcn and b.period between @period_start and @period_end and b.account_no like '4%' and b.period = 202201 and b.credit  > 0
-- where b.pcn=@pcn and b.period between @period_start and @period_end and p.pcn is not null -- 79,876/84,080/79,876/202207,75,672/2022-06,71,468/2021-01 to 2022-05, 67,264/2021-01 to 2022-04, 63,060/2021-01 to 2022-03
-- where b.pcn=@pcn and b.period between @period_start and @period_end and p.pcn is null and s.pcn is not null  --64/202207,60/2022-06,56/2021-01 to 2022-05, 53/2021-01 to 2022-04 --5/2021-01 to 2022-03 -- 47/2021-01 to 2022-03 --42/2021-01 to 2022-01 -- 38/2021-01 to 2021-12  account periods with activity not on the TB report.
-- where b.pcn=@pcn and b.period between @period_start and @period_end and s.pcn is not null  -- 4,666/202207/4,625/202207,4,562/202207,4,433/2022-06, 4,190/2021-01 to 2022-05-pulled-06-14,--4,186/2021-01 to 2022-05-pulled-06-04 --4,177/2021-01 to 2022-05--3,953/2021-01 to 2022-04 --3,696/2021-01 to 2022-03 --3,446/2021-01 to 2022-02-- 3,217/2021-01 to 2022-01 -- 2,975/2021-01 to 2021-12
-- where b.pcn=@pcn and b.period between @period_start and @period_end and b.debit=s.debit  --4,666/202207/4,625/202207,4,433/2022-06,4,190/2021-01 to 2022-05-pulled-06-14--4,186/2021-01 to 2022-05-pulled-06-04--4,177/2021-01 to 2022-05--3,953/2021-01 to 2022-04 --3,696/2021-01 to 2022-03 --3,446/2021-01 to 2022-02-- 3,217/2021-01 to 2022-01 -- 2,975/2021-01 to 2021-12
-- where b.pcn=@pcn and b.period between @period_start and @period_end and (s.debit != b.debit) -- 0/2021-01 to 2022-07 -- 0/2021-01 to 2022-03 -- 0/2021-01 to 2021-12
-- where b.pcn=@pcn and b.period between @period_start and @period_end and b.credit = s.credit  --4,666/202207/4,625/202207,4,433/2022-06,4,190/2021-01 to 2022-05-pulled-06-14--4,186/2021-01 to 2022-05-pulled-06-04--4,177/2021-01 to 2022-05--3,953/2021-01 to 2022-04 -- 3,696/2021-01 to 2022-03 -- 2,975/2021-01 to 2021-12
-- where b.pcn=@pcn and b.period between @period_start and @period_end and b.credit != s.credit -- 0/2022-06,0/2021-01 to 2022-05 -- 0/2021-01 to 2022-04 -- 0/2021-01 to 2022-03 
-- where b.pcn=@pcn and b.period between @period_start and @period_end and b.balance =s.balance  --4,666/202207/4,625/202207,4,433/2022-06,4,190/2021-01 to 2022-05-pulled-06-14--4,186/2021-01 to 2022-05-pulled-06-04--4,177/2021-01 to 2022-05--3,953/2021-01 to 2022-04 -- 3,696/2021-01 to 2022-03 -- 2,975/2021-01 to 2021-12
-- where b.pcn=@pcn and b.period between @period_start and @period_end and b.balance !=s.balance -- 0

-- where b.pcn=@pcn and b.period between @period_start and @period_end and b.balance = d.current_debit_credit  --79,837/202207/79,840/79,838/202207,75,636/2022-6,71,432/2021-01 to 2022-05 --67,228/2021-01 to 2022-04 --63,028/2021-01 to 2022-03 --50,423/2021-01 to 2021-12
-- where b.pcn=@pcn and b.period between @period_start and @period_end and b.balance != d.current_debit_credit  -- 39/202207/36/202208,38/202207, 36/2022-06,36/2021-01 to 2022-05 -- 36/2021-01 to 2022-04 -- 32/2021-01 to 2022-03 -- 25/2021-01 to 2021-12
-- where b.pcn=@pcn and b.period between @period_start and @period_end and (b.balance - d.current_debit_credit) >  0.01 --0/202208, 0/202207,0/2022-06,0/2021-01 to 2022-05-- 0/2021-01 to 2022-04 -- 0/2021-01 to 2022-03 -- 0/2021-01 to 2021-12

-- where b.pcn=@pcn and b.period between @period_start and @period_end and b.credit = p.current_credit  -- 79,876/202207,75,672/0,71,468/2021-01 to 2022-05-- 67,264/2021-01 to 2022-04 -- 63,060/2021-01 to 2022-03 --50,448/2021-01 to 2021-12
-- where b.pcn=@pcn and b.period between @period_start and @period_end and b.credit != p.current_credit  -- 0/2021-01 to 2022-05 -- 0/2021-01 to 2022-04 -- 0/2021-01 to 2022-03 --0/0 
-- where b.pcn=@pcn and b.period between @period_start and @period_end and b.debit = p.current_debit  -- 79,876/202207,75,672/2022-06,71,468/2021-01 to 2022-05-- 67,264/2021-01 to 2022-04-- 63,060/2021-01 to 2022-03 -- 50,448/2021-01 to 2021-12
-- where b.pcn=@pcn and b.period between @period_start and @period_end and b.debit != p.current_debit  -- 0/202207/ 0/2022-06,0/2021-01 to 2022-01 -- 0 
-- where b.pcn=@pcn and b.period between @period_start and @period_end and (b.balance = p.Current_Debit - p.Current_Credit)  -- 79,876/202207,75,672/2022-06,71,468/2021-01 to 2022-05-- 67,264/2021-01 to 2022-04 -- 63,056/2021-01 to 2022-03 -- 50,448/2021-01 to 2021-12
-- where b.pcn=@pcn and b.period between @period_start and @period_end and (b.balance != p.Current_Debit - p.Current_Credit)   -- 0/2021-01 to 2022-01 --0/2021-01 to 2021-12

-- where b.pcn=@pcn and b.period between @period_start and @period_end and b.ytd_credit = p.ytd_credit  -- 79,869/202207, 75,666/2022-06,71,463/2021-01 to 2022-05-- 67,260/2021-01 to 2022-04-- 63,057/2021-01 to 2022-03 -- 50,448/2021-01 to 2021-12--
-- where b.pcn=@pcn and b.period between @period_start and @period_end and b.ytd_credit != p.ytd_credit  -- 7/202207, 6/2022-06
-- ISSUE: 1 ACCOUNT,73100-000-0000, IS NOT THE SAME
-- See issue section at the bottom of this procedure and the Mobex Plex procedure: accounting_year_category_type_issue 
-- 73100-000-0000 has different category_types in accounting_v_account it is an Expense and in accounting_v_category_type it is a liability
-- Conclusion: The Plex TB report and Plex authored procedure is wrong to not reset YTD values.

-- where b.pcn=@pcn and b.period between @period_start and @period_end and b.ytd_debit = p.ytd_debit  -- 79,869/202207,75,666/2022-06,71,463/2021-01 to 2022-05-- 67,260/2021-01 to 2022-04--63,053/2021-01 to 2022-03 -- 50,448/2021-01 to 2021-12
-- where b.pcn=@pcn and b.period between @period_start and @period_end and b.ytd_debit != p.ytd_debit  -- 7/202207, 6/2022-06,5/2021-01 to 2022-05-- 4/2021-01 to 2022-04 -- 3/2021-01 to 2022-03 -- 0/2021-01 to 2021-12
-- ISSUE: 1 ACCOUNT IS NOT THE SAME
-- See issue section at the bottom of this procedure and the Mobex Plex procedure: accounting_year_category_type_issue 
-- 73100-000-0000 has different category_types in accounting_v_account it is an Expense and in accounting_v_category_type it is a liability
-- Conclusion: The Plex TB report and Plex authored procedure is wrong to not reset YTD values.

-- WHere b.pcn=@pcn and b.period between @period_start and @period_end and (d.ytd_debit_credit = (p.ytd_debit-p.ytd_credit))  --79,637/202207/79,638/202207,75,443/2022-06,71,248/2021-01 to 2022-05-pulled-06-14--71,250/2021-01 to 2022-05-pulled-06-04--71,249/2021-01 to 2022-05--67,056/2021-01 to 2022-04 --62,861/2021-01 to 2022-01 -- 50,286/2021-01 to 2021-12
-- where b.pcn=@pcn and b.period between @period_start and @period_end and (d.ytd_debit_credit != (p.ytd_debit-p.ytd_credit))  --239/202207/238/202207,229/2022-06,220/2021-01 to 2022-05-pulled-06-14--218/2021-01 to 2022-05-pulled-06-04--219/2021-01 to 2022-05--208/2021-01 to 2022-04 --199/2021-01 to 2022-01 -- 162/2021-01 to 2021-12
-- where b.pcn=@pcn and b.period between @period_start and @period_end and (((p.ytd_debit-p.ytd_credit) - d.ytd_debit_credit) > 0.01 or ((p.ytd_debit-p.ytd_credit) - d.ytd_debit_credit) < -0.01)   -- 0/202207/2/202207,0/2022-06,0/2021-01 to 2022-04 -- 0/2021-01 to 2022-03 

-- where b.pcn=@pcn and b.period between @period_start and @period_end and (b.ytd_balance = d.ytd_debit_credit) --79,630/202207/79,628/202208,79,631/202207,75,437/2022-06,71,243/2021-01 to 2022-05-pulled-06-14--71,245/2021-01 to 2022-05-pulled-06-04 --71,244/2021-01 to 2022-04--67,052/2021-01 to 2022-04 67,052/2021-01 to 2022-03-- 62,860/2021-01 to 2022-03 -- 50,286/2021-01 to 2021-12
-- where b.pcn=@pcn and b.period between @period_start and @period_end and (b.ytd_balance != d.ytd_debit_credit) --246/202207/246/248/202208,245/202207,235/2022-06,225/2021-01 to 2022-05-pulled-06-14--223/2021-01 to 2022-05-pulled-06-04-- 224/2021-01 to 2022-05-- 212/2021-01 to 2022-04-- 200/2021-01 to 2022-01 -- 162/2021-01 to 2021-12

 where b.pcn=@pcn and b.period between @period_start and @period_end and abs(b.ytd_balance - d.ytd_debit_credit) > 0.01 -- 7/202207/7/202208,7/202207,6/2022-06, 5/2021-01 to 2022-05 -- 4/2021-01 to 2022-04-- 3/2021-01 to 2022-03
 -- ISSUE: 1 ACCOUNT IS NOT THE SAME
-- See issue section at the bottom of this procedure and the Mobex Plex procedure: accounting_year_category_type_issue 
-- 73100-000-0000 has different category_types in accounting_v_account it is an Expense and in accounting_v_category_type it is a liability
-- Conclusion: The Plex TB report and Plex authored procedure is wrong to not reset YTD values.


/*
 * 'Revenue' or 'Expense' low accounts have no credit/debit values. 
 */
--where b.pcn=@pcn and b.period between @period_start and @period_end and a.category_type in ('Revenue','Expense') and left(b.account_no,1) < 4  -- 22*15=330/2021-01 to 2022-03, 22*13=286/2021-01 to 2022-01  -- 22*12=264/2021-01 to 2021-12
--and ((b.credit = 0) and (b.debit = 0) and (b.balance =0))  -- 22*15=330/2021-01 to 2022-03, 22*13=286/2021-01 to 2022-01  -- 264/2021-01 to 2021-12
--where b.pcn=@pcn and b.period between @period_start and @period_end and a.category_type in ('Revenue','Expense') and left(b.account_no,1) < 4  -- 22*13=286/2021-01 to 2022-01  -- 22*12/2021-01 to 2021-12
--and ((b.credit != 0) or (b.debit != 0) or (b.balance !=0))  -- 0/2021-01 to 2022-01  --0/2021-01 to 2021-12
-- See issue section at the bottom of this procedure and the Mobex Plex procedure: accounting_year_category_type_issue 
-- 73100-000-0000 has different category_types in accounting_v_account it is an Expense and in accounting_v_category_type it is a liability


-- reset all Plex.account_period_balance for this account
-- UPDATE Plex.account_period_balance !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11
-- update Plex.account_period_balance set ytd_debit=18912.67,ytd_credit=18912.67 where account_no = '73100-000-0000'

/*
 * Do any new accounts show up on the TB report? Not as of Jan 7 for period 2021-11
 */
select * 
from Archive.accounting_new_accounts_01_07 a 
inner join Plex.trial_balance_multi_level d
on a.pcn=d.pcn 
and a.account_no = d.account_no 

/*
 * Validate the non debit/credit fields
 * Period display as Period
 * category type as 'Category Type'
 * category name as 'Category Name'
 * sub category name as 'Sub Category Name'
 * account no as 'No'
 * account name as 'Name'
 * balance as 'Current Debit/(Credit)'
 * ytd_balance as 'YTD Debit/(Credit)'
 */

select top 10 *
-- select count(*) 
from mgdw.Plex.trial_balance_multi_level_py -- 4,204



declare @pcn int;
set @pcn= 123681;
declare @period_start int;
set @period_start = 202101;
declare @period_end int;
--set @period_end = 202101;
set @period_end = 202203;



select count(*)
--select distinct b.pcn,b.account_no,b.category_type,a.active,a.revenue_or_expense,a.category_type_legacy,a.sub_category_name_legacy 
--into Archive.tb_missing_accounts_after_new_accounts_added_01_2022
from 
(
	select b.pcn,b.period,b.period_display,b.account_no,a.account_name, 
	a.category_type,
	a.category_type_legacy, 
	a.category_name_legacy,
	a.sub_category_name_legacy,
	b.balance,
	b.ytd_balance
	-- select count(*)
	--from Archive.account_period_balance_01_03_2022 b -- 43,630 
	from Plex.account_period_balance b -- 4,595 
	--select * from Plex.accounting_account a
	inner join Plex.accounting_account a
	on b.pcn=a.pcn 
	and b.account_no=a.account_no 
--	where category_type = ''  -- 0
--	where category_type_legacy = ''  -- 1,590
--	where category_name_legacy = ''  -- 1,590
--	where sub_category_name_legacy = ''  -- 1,590
)b 
--order by b.pcn,b.period_display,b.account_no

-- select count(*) from Plex.trial_balance_multi_level d where pcn = 123681 and d.period between 202101 and 202110  -- 42,040
-- select * from Plex.trial_balance_multi_level d where pcn = 123681 and d.period between 202101 and 202110  -- 42,040
left outer join Plex.trial_balance_multi_level d -- TB download does not show the plex period for a multi period month, you must link to period_display
--inner join Plex.trial_balance_multi_level d -- TB download does not show the plex period for a multi period month, you must link to period_display
on b.pcn=d.pcn
and b.account_no = d.account_no
and b.period_display = d.period_display 
-- select * from Plex.accounting_account a where a.account_no = '73100-000-0000'
left outer join Plex.accounting_account a
on b.pcn = a.pcn 
and b.account_no=a.account_no 
--where b.account_no = '73100-000-0000'
-- select * from Plex.missing_accounts_2021_09  -- 158
--where b.pcn=@pcn and b.period between @period_start and @period_end and b.category_type_legacy = ''  --5,865/2021-01 to 2022-03 -- 4,692/2021-01 to 2021-12
--where b.pcn=@pcn and b.period between @period_start and @period_end and b.category_name_legacy = ''  --5,865/2021-01 to 2022-03 -- 4,692/2021-01 to 2021-12
--where b.pcn=@pcn and b.period between @period_start and @period_end and b.category_type = ''  -- 0/2021-01 to 2022-03 -- 0/2021-01 to 2021-12

--where b.pcn=@pcn and b.period between @period_start and @period_end and b.period_display = d.period_display  -- 63,060/2021-01 to 2022-03 -- 50,448/2021-01 to 2021-12
--where b.pcn=@pcn and b.period between @period_start and @period_end and b.period_display != d.period_display  --0/2021-01 to 2022-03 --  0/2021-01 to 2021-12
--where b.pcn=@pcn and b.period between @period_start and @period_end and b.category_type != d.category_type  -- 60/2021-01 to 2022-03 -- 48/2021-01 to 2021-12  -- TB report uses the category type linked to the sub_category
--where b.pcn=@pcn and b.period between @period_start and @period_end and b.category_type_legacy = d.category_type  -- 63,060/2021-01 to 2022-02 -- 50,448/2021-01 to 2021-12
--where b.pcn=@pcn and b.period between @period_start and @period_end and b.category_type_legacy != d.category_type  -- 0/2021-01 to 2022-01 -- 0/2021-01 to 2021-12

--where b.pcn=@pcn and b.period between @period_start and @period_end and b.category_name_legacy = d.category_name  -- 63,060/2021-01 to 2022-03 -- 50,448/2021-01 to 2021-12
--where b.pcn=@pcn and b.period between @period_start and @period_end and b.sub_category_name_legacy != d.sub_category_name  -- 0/2021-01 to 2022-03 -- 0/2021-01 to 2021-12
--where b.pcn=@pcn and b.period between @period_start and @period_end and b.sub_category_name_legacy = d.sub_category_name  -- 63,060/2021-01 to 2022-01 -- 50,448/2021-01 to 2021-12
--where b.pcn=@pcn and b.period between @period_start and @period_end and b.account_name != d.account_name  -- 0/2021-01 to 2022-03 -- 0/2021-01 to 2021-12
where b.pcn=@pcn and b.period between @period_start and @period_end and b.account_name = d.account_name -- 63,060/2021-01 to 2022-03 -- 50,448/2021-01 to 2021-12

/*
 * What category_type is being used on the new chart of accounts multiple level?
 */
select * 
select count(*)
from Plex.accounting_account a 
where a.pcn = 123681 
and a.category_type != a.category_type_legacy -- 396  -- 73100-000-0000,40591-300-00000 (5 digit old account)
-- 73100-000-0000 category_type = Expense (ytd resets yearly), category_type_legacy=Liability
/*
 * How is the TB Itreport treating 73100-000-0000
 * In 2019 there were debits far exceeded credit values
 * In 2020 debit/credit values where equal.
 * TB is treating it as an Expense since it's YTD values match our procedures values.
 * So TB is using the accounting_v_account category_type YTD reset purposes.
 * But it seems to be using the category linked to the accounting_v_category_account view
 * for the category_type in the CSV file download.
 * Chart of Accounts plex screen lists this account as an Expense so it must
 * also be using the accounting_v_account category_type column.
 * The classic Chart of Accounts plex screen no longer works so I can't test 
 * its category type for that account.
 * So I decided to use the accounting_v_account category_type column for both the
 * YTD reset condition and the CSV category name since I thought that would be 
 * less confusing even though 40 account_period_balance records will have different category types 
 * shown on our report compared to the actual Plex TB CSV download.
 */

select * 
from Plex.accounting_balance b
--from Plex.account_period_balance_high b
where b.account_no = '73100-000-0000'
order by b.period 


select * from Plex.accounting_account a 
where a.pcn = 123681 
and left(a.account_no,1) < '4' 
and a.category_type in ('Revenue','Expense')  -- 22

select * from Plex.accounting_account a 
where a.pcn = 123681 
and left(a.account_no,1) > 3 
and a.category_type not in ('Revenue','Expense')  -- 0


/*
 * Format to be like CSV download
 */
--select * from Plex.accounting_account a where a.account_no = '10220-000-00000' 
declare @pcn int;
set @pcn= 123681;
declare @period_start int;
set @period_start = 202205;
declare @period_end int;
--set @period_end = 202101;
set @period_end = 202205;

select 
--b.period,
b.period_display,
a.category_type,
-- b.category_type_legacy category_type,  -- use legacy category type for the report.
/*
 * The Plex TB report uses the category type of the category linked to the account via the  category_account view. 
 * I believe Plex now mostly uses the account category located directly on the accounting_v_account view so I used 
 * this column instead of the one linked via the account_category view. 
 */
-- select category_name from Plex.accounting_account aa -- no category_name 
a.category_name_legacy category_name,
a.sub_category_name_legacy sub_category_name,
a.account_no,
a.account_name,
b.balance current_debit_credit,
b.ytd_balance ytd_debit_credit
--select count(*)
from Plex.account_period_balance b -- 43,620
inner join Plex.accounting_account a -- 43,620
on b.pcn=a.pcn 
and b.account_no=a.account_no 
--order by b.period_display,a.account_no 
--where a.category_type != a.category_type_legacy 
--where b.period_display is not NULL -- 40,940
--where b.period_display is NULL -- 40,940
where b.pcn = @pcn 
AND b.period BETWEEN @period_start AND @period_end 
order by b.period,b.account_no 
a.account_no = '10220-000-00000' 

/*
 * Backup
 */
select * 
-- select count(*) from Archive.account_period_balance_12_30  -- 43,630
--into Archive.account_period_balance_12_30
from Plex.account_period_balance b -- 43,630


/* ISSUE SECTION
 * 
Question: Why is Plex and Mobex Authored procedures differ in YTD. Credit/Debit/Balance values in 2022-01 for 73100-000-0000 only? 
Note: 73100-000-0000 changed to a 'Revenue' or 'Expense' but the Plex Authored procedure is still not resetting this value in 2022-01.  
It was a liability account before it changed. 
Account Details: Plexus_customer_no=123681/Southfield and account_no = '73100-000-0000' 
Name: Freight - In Machining-General-General 
Created: 1/16/2019 12:23:28 PM 
Update: 2/18/2020 11:53:42 AM 
Testing Details: Mobex authored procedure: accounting_year_category_type_issue 
Research: Shows that account 73100-000-0000 has different category_types. 
In accounting_v_account it is an Expense and in accounting_v_category_type it is a liability.  
There are 4 accounts with this same issue but none of the others had any activity.  
Conclusion: Since this account is an Expense account and not a liability account, we should go with the YTD calculation of the Mobex authored procedure 

 
select 
a.plexus_customer_no pcn,a.account_key,a.account_no,a.account_name,a.active,
a.category_type category_type,  --  This is new way of identifying the category type.  The old method used the following views category_account->category->category_type

case 
when c.plexus_customer_no is null then 0
else c.category_no
end category_no_legacy, -- legacy method of categorizing accounts
case
when c.plexus_customer_no is null then ''
else c.category_name
end category_name_legacy, -- legacy method of categorizing accounts
case
when t.category_type is null then ''
else t.category_type 
end category_type_legacy, -- legacy method of categorizing accounts
case
when sc.sub_category_no is null then 0
else sc.sub_category_no
end sub_category_no_legacy, -- legacy method of categorizing accounts
case
when sc.sub_category_name is null then ''
else sc.sub_category_name
end sub_category_name_legacy, -- legacy method of categorizing accounts

case
when t2.category_type is null then ''
else t2.category_type 
end sub_category_type_legacy, -- legacy method of categorizing accounts
-- select distinct [in] from accounting_v_category_type -- Credit/Debit
-- select count(*) from accounting_v_category_type where [in] = 'Credit' -- 3
-- select count(*) from accounting_v_category_type where [in] = 'Debit' -- 2
case
when a.category_type in ('Revenue','Expense') then 1
else 0
end revenue_or_expense

--ca.*,
--ca.category_name,
--b.*,
--sa.*,
--cc.*,
--t.*,
--a.*
-- select count(*)
-- select *
from accounting_v_account_e  a -- 36,636
--where a.plexus_customer_no=123681  -- 4362 
join accounting_v_category_type act -- This is the value used by the new method of configuring plex accounts. 
on a.category_type=act.category_type  -- 36,636

-- Category numbers linked to an account by the a category_account record will no longer be supported by Plex
left outer join accounting_v_category_account_e ca  --
on a.plexus_customer_no=ca.plexus_customer_no
and a.account_no=ca.account_no
--where a.plexus_customer_no=123681  -- 4204 

left outer join accounting_v_category_e c  --
on ca.plexus_customer_no=c.plexus_customer_no
and ca.category_no=c.category_no

left outer join accounting_v_category_type t -- This is the value used by the old method of configuring plex accounts. 
on c.category_type=t.category_type
--where a.plexus_customer_no=123681  -- 4204
--and t.[in] = 'Debit' -- 3998
--and t.[in] = 'Credit' -- 206

-- sub category numbers linked to an account by the sub category_account record will no longer be supported by Plex
left outer JOIN accounting_v_sub_category_account_e AS sca
--JOIN accounting_v_Sub_Category_Account_e AS SCA -- 4,204 for 123681
ON a.plexus_customer_no = sca.plexus_customer_no
and a.account_no = sca.account_no

left outer join accounting_v_sub_category_e sc  --
on sca.plexus_customer_no=sc.plexus_customer_no
and sca.sub_category_no=sc.sub_category_no

left outer join accounting_v_category_e c2  --
on sc.plexus_customer_no=c2.plexus_customer_no
and sc.category_no=c2.category_no

left outer join accounting_v_category_type t2 -- This is another value used by the old method of configuring plex accounts. 
on c2.category_type=t2.category_type


where a.plexus_customer_no = 123681
and a.account_no = '73100-000-0000'

select b.pcn,b.period,b.account_no,
d.category_type DL_category_type,p.category_type PP_category_type,a.category_type MP_category_type,
p.current_credit,b.credit, 
p.ytd_credit PP_ytd_credit,b.ytd_credit,
b.* 
from Plex.account_period_balance b 
join Plex.accounting_account a 
on b.pcn=a.pcn
and b.account_no=a.account_no
join Plex.Account_Balances_by_Periods p -- 43,620
on b.pcn=p.pcn
and b.account_no = p.[no]
and b.period = p.period 
join Plex.trial_balance_multi_level d 
on b.pcn=d.pcn
and b.account_no = d.account_no
and b.period_display = d.period_display 
where b.period in (202112,202201) and b.account_no = '73100-000-0000'
*/


/*
 * Archive
For 2022-01 PP current_credit is 0 but PP_YTD_credit is 18,912.67 
In this procedure the account is shown to be a revenue_or_expense type.
And in our procedure we would reset the YTD_credit to zero at the beginning of the year.
What is PP_YTD_credit and account_period_balance ytd_credit in 2021-12? 18,912.67
select d.*,p.current_credit,b.credit, 
p.ytd_credit PP_ytd_credit,b.ytd_credit,
b.* 
from Plex.account_period_balance b 
join Plex.Account_Balances_by_Periods p -- 43,620
on b.pcn=p.pcn
and b.account_no = p.[no]
and b.period = p.period 
join Plex.trial_balance_multi_level d 
on b.pcn=d.pcn
and b.account_no = d.account_no
and b.period_display = d.period_display 
where b.period = 202112 and b.account_no = '73100-000-0000'

The Plex Authored procedure treated this account as a non revenue_or_expense and did NOT reset the YTD_credit on 2022-01.
Why?
How does our Mobex authored procedure determine if an account is a revenue_or_expense? 
Looks at the account category_type value from the end of the previous year.

--From the Plex.accounting_account_year_category_type account record for the previous year. 

How does the Plex.accounting_account_year_category_type account determine if the account is a revenue_or_expense?
From the our Plex procedure accounting_year_category_type_dw_import?
How? a.category_type in ('Revenue','Expense') then 1

Did the category_type change from previous years? Yes. 73100-000-0000 changed to a 'Revenue' or 'Expense'
Created: 1/16/2019 12:23:28 PM
Update: 2/18/2020 11:53:42 AM - I believe this was when the category_type was changed to an Expense.

Plexus_customer_no=123681 and account_no = '73100-000-0000'
Created: 1/16/2019 12:23:28 PM
Update: 2/18/2020 11:53:42 AM

Are there any diffences between 73100-000-0000 and another expense category_type account that would cause 
Plex authored stored procedure to not treat it as other revenue_or_expense accounts and reset it's 
YTD values at the beginning of each year? Compare to an account which has a current credit 
value in 2022-01: 47100-000-0000	Chip and Scrap Sales
Differences: Price_Component	is True for 47100-000-0000 and false for 73100-000-0000
Conclusion: The price_component differenced does not appear to be significant.  
where plexus_customer_no = 123681
--and Price_Component = 0 and left(account_no,1) > '3'  -- 991
--and Price_Component = 0 and left(account_no,1) < '4'  -- 358

--and Price_Component = 1 and category_type in ('Revenue','Expense') -- 2942
--and Price_Component = 0 and category_type in ('Revenue','Expense') -- 1013
--and Price_Component = 0 and category_type in ('Revenue','Expense') and left(account_no,1) > '3'  -- 991
--and Price_Component = 1 and category_type in ('Revenue','Expense') and left(account_no,1) > '3'  -- 2,942
--and Price_Component = 0 and category_type in ('Revenue','Expense') and left(account_no,1) < '4'  -- 22
--and Price_Component = 1 and category_type in ('Revenue','Expense') and left(account_no,1) < '4'  -- 0

select * from Plex.accounting_account_year_category_type
where pcn=123681 and account_no = '73100-000-0000'/73100-000-0000
*/