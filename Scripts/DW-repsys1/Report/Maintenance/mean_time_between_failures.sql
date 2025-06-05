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
--select tuple from #list;

--select workcenter_status_key,description,production_status,idle_status,downtime_status,maintenance_status,planned_production_time,* from part_v_Workcenter_Status
--select workcenter_status_key,description from part_v_Workcenter_Status
create table #mtbf
(
  workcenter_key	int, 
  mtbf decimal(19,5)
)
create table #production_status 
( 
  workcenter_status_key int
)


insert into #production_status 
values 
(219);  -- albion
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
assumptions: 'uptime' includes only statuses in which we are making parts.
1. workcenter_log set: all workcenter log records
2. next_failure set: for each production workcenter log record find the next failure workcenter log record.
3. start_uptime set: group next_failure set by log_date of next_failure and record first production log_date for set.
4. time_diff set: record time between consecutive records in start_uptime set.

*/
/* 
-- Informational Queries
select * from part_v_Workcenter_Status_e ws 
where plexus_customer_no = 300758
*/

create table #failure_status 
( 
  workcenter_status_key int
)
insert into #failure_status 
values 
(222);  -- albion 'Unplanned Downtime'
-- What about 'machine crash'
--select * from #failure_status;
/*
Create a while loop to loop through each workcenter
*/

-- create tabel #total_prod_hours

create table #workcenter
(
  row_number int,
  workcenter_key int
);


with distinct_workcenter 
as 
( 
  select distinct wl.workcenter_key 
  from part_v_workcenter_log_e wl  -- many records
  join part_v_workcenter_e wc 
  on wl.plexus_customer_no=wc.plexus_customer_no
  and wl.workcenter_key=wc.workcenter_key
  join  part_v_Workcenter_Status_e ws
  on wl.plexus_customer_no=ws.plexus_customer_no
  and wl.workcenter_status_key=ws.workcenter_status_key
  where wl.plexus_customer_no = @pcn
  and ws.workcenter_status_key in
  (
    select workcenter_status_key 
    from #production_status
    union
    select workcenter_status_key
    from #failure_status
  )  
)
-- select count(*) from distinct_workcenter  -- 117
,workcenter
as 
(
  select 
  row_number() over(order by workcenter_key) row_number,
  workcenter_key
  from distinct_workcenter
)
-- select top(100) * from workcenter
insert into #workcenter 
select * from workcenter;
-- select count(*) from #workcenter;  -- 248
-- select top(100) * from #workcenter;  -- 248

declare @row_number int
set @row_number = 1
declare @workcenter_key int 
declare @mtbf_count int
while @row_number < 10
begin
  -- select @row_number
  set @row_number=@row_number+1;
  select @workcenter_key=workcenter_key
  from #workcenter 
  where row_number = @row_number;
  with workcenter_log
  as 
  ( 
  
  -- Create a view of the Workcenter log records we are interested in.
    select 
    row_number() over(partition by wc.plexus_customer_no,wc.workcenter_key order by wl.log_date asc) as row_number
    ,wl.workcenter_key
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
    
  --  join Plexus_Control_v_Customer_Group_Member cg 
  --  on wl.plexus_customer_no=cg.plexus_customer_no
    where wl.plexus_customer_no = @pcn
    and wl.workcenter_key = @workcenter_key
    and wl.log_date between @Start_Date and @End_Date 
    -- '06/22/2022'
    and ws.workcenter_status_key in
    (
      select workcenter_status_key 
      from #production_status
      union
      select workcenter_status_key
      from #failure_status
    )
  )
  -- select top(100) * from workcenter_log
  -- select count(*) from workcenter_log  -- 23,026
,production_log 
as
(
  select wl.row_number,wl.workcenter_key 
  from workcenter_log wl
  join #production_status ps 
  on wl.workcenter_status_key = ps.workcenter_status_key
  and wl.workcenter_key = @workcenter_key
)
-- select count(*) from production_log -- 22,415
,failure_log
as
(
  select wl.row_number,wl.workcenter_key  
  from workcenter_log wl
  join #failure_status fs 
  on wl.workcenter_status_key=fs.workcenter_status_key
  and wl.workcenter_key = @workcenter_key
)
-- select count(*) from failure_log  --611
,failures_after_production
as 
( 
  select 
  fl.workcenter_key,pl.row_number prod_row_number,fl.row_number gt_fail_row_number
  from failure_log fl 
  join production_log pl
  on fl.workcenter_key=pl.workcenter_key
  and fl.workcenter_key = @workcenter_key
  and fl.row_number > pl.row_number
)
-- select count(*) from failures_after_production  -- 15,285 .3sec
,next_failure
as 
( 
  select 
  fap.workcenter_key,fap.prod_row_number,min(gt_fail_row_number) next_fail_row_number
  from failures_after_production fap
  group by fap.workcenter_key,fap.prod_row_number
)
-- select * from next_failure
--select count(*) from next_failure  -- 4,825 .4sec
,failures_before_production
as 
( 
  select 
  fl.workcenter_key,pl.row_number prod_row_number,fl.row_number lt_fail_row_number
  from failure_log fl 
  join production_log pl
  on fl.workcenter_key=pl.workcenter_key
  and fl.row_number < pl.row_number
  where fl.workcenter_key = @workcenter_key

)
-- select count(*) from failures_before_production  -- 16,180 .2sec
,prev_failure
as 
( 
  select 
  fap.workcenter_key,fap.prod_row_number,max(lt_fail_row_number) prev_fail_row_number
  from failures_before_production fap
  group by fap.workcenter_key,fap.prod_row_number
)
-- select count(*) from prev_failure  -- 4,483 .3sec
-- select * from prev_failure;
,prev_and_next_failure
as 
(
  select pf.*,nf.next_fail_row_number 
  from prev_failure pf 
  join next_failure nf 
  on pf.workcenter_key=nf.workcenter_key 
  and pf.prod_row_number=nf.prod_row_number
)
-- select count(*) from prev_and_next_failure  -- 60
--  select * from prev_and_next_failure
,prod_hours
as 
(
  select pan.workcenter_key,pan.prev_fail_row_number,pan.next_fail_row_number,wl.log_hours prod_hours
  from prev_and_next_failure pan
  join workcenter_log wl 
  on pan.workcenter_key=wl.workcenter_key
  and pan.prod_row_number=wl.row_number
)
-- select * from prod_hours
-- select count(*) from prod_hours --2,245 .9
,total_prod_hours
as 
(
  select ph.workcenter_key,ph.prev_fail_row_number,ph.next_fail_row_number,sum(ph.prod_hours) total_prod_hours
  from prod_hours ph 
  group by ph.workcenter_key,ph.prev_fail_row_number,ph.next_fail_row_number
)
--select count(*) from tot_prod_hours -- 90 4 sec
--select distinct tph.workcenter_key,tph.prev_fail_row_number,tph.next_fail_row_number,tph.total_prod_hours 
--from total_prod_hours tph 
--join workcenter_log wl 
--on tph.workcenter_key=wl.workcenter_key
,mtbf_prod_hours 
as 
(
  select workcenter_key,sum(total_prod_hours) mtbf_prod_hours 
  from total_prod_hours -- 90 4 sec
  group by workcenter_key
)
-- select * from mtbf_prod_hours
,mtbf_count
as 
(
  select workcenter_key, count(*) mtbf_count 
  from total_prod_hours 
  group by workcenter_key
)
-- select mtbf_count from mtbf_count 
,mtbf
as
(
  select h.workcenter_key,
  case 
  when c.mtbf_count = 0 then -1
  else h.mtbf_prod_hours / c.mtbf_count
  end mtbf
  from mtbf_prod_hours h
  join mtbf_count c 
  on h.workcenter_key = c.workcenter_key
)
-- select * from mtbf  
insert into #mtbf
select * from mtbf

end;

select * from #mtbf

/*
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

*/