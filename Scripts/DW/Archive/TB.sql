SELECT *
-- INTO Archive.account_period_balance_2023_01_28  -- 198,708
from Plex.account_period_balance  

select top 10 * from Archive.account_period_balance_2023_01_28  -- 198,708

select distinct pcn,period -- 202201 - 202212
from Archive.account_period_balance_2023_01_28  -- 198,708
where pcn = 123681
order by pcn,period 