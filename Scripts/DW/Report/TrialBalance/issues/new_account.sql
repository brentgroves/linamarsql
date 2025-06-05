--Do not fear my son I am with you.  This issue is in my hands and is no suprise to me.  Trust me that it IS 
--for your good that you work on this problem now.  Remember also that the results are in my hand.  If it is good 
--for you and the community I will see that it is resolved.  But no matter what trust me that everything will be ok 
--and I would like you to enjoy working on this problem my son.

-- select *
-- select count(*)
-- select top 10 *
FROM Plex.accounting_balance 
where pcn = 123681 
and account_no = '11055-000-9806'  -- new account
--The account is not in Plex.accounting_balance

select count(*)
from Plex.trial_balance_multi_level
--order by pcn,period_display  
where pcn=123681 
and account_no = '11055-000-9806'  -- new account
--No records with the new account_no 

-- select *
-- select count(*)
from Plex.account_activity_summary  
where pcn=123681
--where account_no = '10110-000-00000'
and account_no = '11055-000-9806'  -- new account

--pcn	    period	account_no	    beginning_balance	debit		credit			balance			ending_balance
--123681	202311	11055-000-9806	0.00000	            0.00000		0.00000			0.00000			0.00000
--123681	202312	11055-000-9806	0.00000				95934.43000	872657.96000	-776723.53000	-776723.53000
--123681	202401	11055-000-9806	-776723.53000		0.00000		95934.43000		-95934.43000	-872657.96000

-- select *
-- select count(*)
-- select top 10 *
FROM Plex.account_period_balance  
where pcn = 123681 
and account_no = '11055-000-9806'  -- new account

pcn		account_no		period	period_display	debit	ytd_debit	credit	ytd_credit	balance	ytd_balance
123681	11055-000-9806	202212	12-2022			0.00000	0.00000		0.00000	0.00000		0.00000	0.00000
123681	11055-000-9806	202311	11-2023			0.00000	0.00000		0.00000	0.00000		0.00000	0.00000

--Why is there a record for 202212 instead of 202312?
--Maybe there is a problem in Plex.account_period_balance_recreate_open_period_range