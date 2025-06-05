/*
--https://en.wikipedia.org/wiki/Mean_time_between_failures
--https://en.wikipedia.org/wiki/Mean_time_between_failures
	PCN
	310507/Avilla
	300758/Albion
	295933/Franklin
	300757/Alabama
	306766/Edon
	312055/ BPG WorkHolding
	1	123681 / Southfield
2	295932 FruitPort
3	295933
4	300757
5	300758
6	306766
7	310507
8	312055
	*/
/*
create PCN table from param
*/
create table #list
(
 tuple int
)
declare @delimiter varchar(1)
set @delimiter = ','
declare @in_string varchar(max)
set @in_string = @PCNList
WHILE LEN(@in_string) > 0
BEGIN
    INSERT INTO #list
    SELECT cast(left(@in_string, charindex(@delimiter, @in_string+',') -1) as int) as tuple

    SET @in_string = stuff(@in_string, 1, charindex(@delimiter, @in_string + @delimiter), '')
end;
--select tuple from #list;

--select workcenter_status_key,description,production_status,idle_status,downtime_status,maintenance_status,planned_production_time,* from part_v_Workcenter_Status
--select workcenter_status_key,description from part_v_Workcenter_Status

create table #production_status 
( 
  pcn int,
  workcenter_status_key int
)
insert into #production_status 
values 
(300758,219);  -- albion
--select * from #production_status

/*
Albion Workcenter status
213	Planned Downtime
219	Production
220	Idle
221	Off
222	Unplanned Downtime
3872	Excess Changeover
4742	Plex Help Needed
4790	Changeover
5363	Machine Crash
5364	Sorting
5437	Manning
5457	Training
*/
/*
Algorithm 
https://en.wikipedia.org/wiki/Mean_time_between_failures
uptime after repair
assumptions: 'uptime after repair' includes only statuses in which we are making parts.
1. production set: all production workcenter log records
2. next_failure set: for each production workcenter log record find the next failure workcenter log record.
3. start_uptime set: group next_failure set by log_date of next_failure and record first production log_date for set.
4. time_diff set: record time between consecutive records in start_uptime set.

*/

create table #failure_status 
( 
  pcn int,
  workcenter_status_key int
)
insert into #failure_status 
values 
(300758,222);  -- albion
--select * from #failure_status;

with workcenter_log
as 
( 
  select 
  row_number() over(partition by wl.plexus_customer_no,wc.workcenter_code order by wl.log_date asc) as row_number
  ,wl.plexus_customer_no,wc.workcenter_code,wl.workcenter_key
  --wl.log_key,wl.workcenter_key
  ,wl.log_date,wl.log_hours
  ,ws.description ws_status
  ,wl.workcenter_event_key
  ,wl.workcenter_status_key
  ,we.description ws_status_type
  ,wl.add_by,wl.update_date,wl.part_key,wl.part_operation_key,wl.shift_key
  ,wl.job_op_key,wl.report_date
--  select count(*)
  from part_v_workcenter_log_e wl  -- many records
  join part_v_workcenter_e wc 
  on wl.plexus_customer_no=wc.plexus_customer_no
  and wl.workcenter_key=wc.workcenter_key
  join  part_v_Workcenter_Status_e ws
  on wl.plexus_customer_no=ws.plexus_customer_no
  and wl.workcenter_status_key=ws.workcenter_status_key
  
  left outer join part_v_Workcenter_Event_e  we -- 32 rows
  on wl.plexus_customer_no=we.plexus_customer_no
  and wl.workcenter_event_key=we.workcenter_event_key
  
  join Plexus_Control_v_Customer_Group_Member cg 
  on wl.plexus_customer_no=cg.plexus_customer_no
  where wl.plexus_customer_no in (
  select tuple from #list
  )
  and wl.log_date > '06/22/2022'
)
--select count(*) from workcenter_log  -- 5,882
--where workcenter_status_key = 219  -- 4,379
/*
Algorithm 
https://en.wikipedia.org/wiki/Mean_time_between_failures
uptime after repair
assumptions: 'uptime after repair' includes only statuses in which we are making parts.
1. production set: all production workcenter log records
2. next_failure set: for each production workcenter log record find the next failure workcenter log record.
3. start_uptime set: group next_failure set by log_date of next_failure and record first production log_date for set.
4. time_diff set: record time between consecutive records in start_uptime set.

*/
,production_log 
as
(
  select * 
  from workcenter_log wl
  where wl.workcenter_status_key
  in 
  (
    select workcenter_status_key from #production_status
  )

)
--select count(*) from production -- 4,379
,failure_log
as
(
  select * from workcenter_log wl
  where wl.workcenter_status_key
  in 
  (
    select workcenter_status_key from #failure_status
  )
)
--select count(*) from failure_log  --110
,failures_after_production
as 
( 
  select 
  pl.plexus_customer_no,pl.workcenter_key,pl.row_number production_row_number,fl.row_number gt_fail_row_number
  from failure_log fl 
  join production_log pl
  on fl.plexus_customer_no=pl.plexus_customer_no
  and fl.workcenter_key=pl.workcenter_key
  and fl.row_number > pl.row_number
)
--select * from failures_after_production
,next_failure
as 
( 
  select 
  fap.plexus_customer_no,fap.workcenter_key,fap.production_row_number,min(gt_fail_row_number) next_fail_row_number
  from failures_after_production fap
  group by fap.plexus_customer_no,fap.workcenter_key,fap.production_row_number
)
--select * from next_failure
,production_hours
as 
( 
  select nf.plexus_customer_no,nf.workcenter_key,nf.production_row_number,wl.log_hours,nf.next_fail_row_number
  from next_failure nf 
  join workcenter_log wl 
  on nf.plexus_customer_no=wl.plexus_customer_no
  and nf.workcenter_key=wl.workcenter_key
  and nf.production_row_number=wl.row_number
  
)
--select * from production_hours
--select count(*) from production_hours  --1187
,total_production_hours
as 
( 
  select ph.plexus_customer_no,ph.workcenter_key,ph.next_fail_row_number,sum(ph.log_hours) total_production_hours
  from production_hours ph
  group by ph.plexus_customer_no,ph.workcenter_key,ph.next_fail_row_number
) 
select tph.plexus_customer_no,wc.workcenter_code
,fl.log_date
,tph.total_production_hours 
from total_production_hours tph
join failure_log fl 
on tph.plexus_customer_no=fl.plexus_customer_no
and tph.workcenter_key=fl.workcenter_key 
and tph.next_fail_row_number=fl.row_number
join part_v_workcenter_e wc
on tph.plexus_customer_no=wc.plexus_customer_no 
and tph.workcenter_key=wc.workcenter_key 
order by tph.plexus_customer_no,wc.workcenter_code,fl.log_date