select *
from Plex.account_period_balance
where account_no in ('40060-000-0100','65100-100-0100','68400-000-0100')
and pcn = 123681 and period between 202401 and 202405
order by period, account_no


select *
from Plex.account_period_balance
where account_no in ('40060-000-0100','65100-100-0100','68400-000-0100')
and pcn = 123681 and period between 202312 and 202312
order by period, account_no