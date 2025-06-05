declare @PCN integer;
set @PCN = 295932;
DECLARE @R INT, @P VARCHAR(1000);
--EXEC @R=Kors.shifts_get_op @PCN
--SELECT @R
EXEC @R=Kors.shifts_get_op @PCN,@Destinations=@P OUT --OUT is short for OUTPUT, you can use either one
SELECT @R,@P

--  # https://dev.mysql.com/doc/connector-python/en/connector-python-introduction.html
--  # elf-contained driver. Connector/Python does not require the MySQL client library or any Python modules outside the standard library.
--  # https://dev.mysql.com/doc/connector-python/en/connector-python-example-connecting.html
--  conn2 = pyodbc.connect('DSN=dw;UID='+username2+';PWD='+ password2 + ';DATABASE=mgdw')
--  cursor2 = conn2.cursor()
--
--  # DECLARE @out nvarchar(max);
--  # SET NOCOUNT ON;
--  # EXEC [dbo].[storedProcedure] @x = ?, @y = ?, @z = ?,@param_out = @out OUTPUT;
--  # SELECT @out AS the_output;
--
--  sql = """\
--DECLARE @MAX_FISCAL_PERIOD INT;
--EXEC Plex.sp_max_fiscal_period @pcn = ?,@year = ?,@max_fiscal_period=@MAX_FISCAL_PERIOD OUT
--SELECT @MAX_FISCAL_PERIOD
--"""
--
--  # cursor.execute(sql, (x, y, z))
--  # row = cursor.fetchone()
--  # print(row[0])
--
--  cursor2.execute(sql, (pcn, year))
--  row = cursor2.fetchone()
--  max_fiscal_period = row[0]
--
--  print(max_fiscal_period)

--select all lines and press alt-enter
declare @PCN integer;
set @PCN = 123681;
DECLARE @YEAR INT, @MAX_FISCAL_PERIOD INT;
SET @YEAR = 2024;
--EXEC @R=Kors.shifts_get_op @PCN
--SELECT @R
EXEC Plex.sp_max_fiscal_period @PCN,@YEAR,@max_fiscal_period=@MAX_FISCAL_PERIOD OUT --OUT is short for OUTPUT, you can use either one
SELECT @MAX_FISCAL_PERIOD

Plex.sp_max_fiscal_period
create procedure Plex.sp_max_fiscal_period
(
	@pcn int,
	@year int,
	@max_fiscal_period int output
)
as 
BEGIN

WITH fiscal_period(pcn,year,period)
as
(
	select pcn,year(begin_date) year,period 
	from Plex.accounting_period 
	where pcn = @pcn
	and year(begin_date) = @year 
)
-- select * from fiscal_period;
,max_fiscal_period(pcn,year,max_fiscal_period)
as
(
  SELECT pcn,year,max(period) max_fiscal_period
  FROM fiscal_period
  group by pcn,[year]
)
--select * from max_fiscal_period
select @max_fiscal_period = max_fiscal_period from max_fiscal_period;
	
end


-- Plex.max_fiscal_period_view source
-- drop view Plex.max_fiscal_period_view
create view Plex.max_fiscal_period_view(pcn,year,max_fiscal_period)
	as
	WITH fiscal_period(pcn,year,period)
	as
	(
		select pcn,year(begin_date) year,period from Plex.accounting_period --where pcn = 123681
	),
	--select * from fiscal_period
	max_fiscal_period(pcn,year,max_fiscal_period)
	as
	(
	  SELECT pcn,year,max(period) max_fiscal_period
	  FROM fiscal_period
	  group by pcn,year
	)
--	select count(*) cnt from max_fiscal_period
	select * from max_fiscal_period;

select * from Plex.max_fiscal_period_view order by pcn,year

select * from Plex.accounting_period order by pcn,period
select distinct pcn from Plex.accounting_period