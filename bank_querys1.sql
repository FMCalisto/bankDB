SELECT DISTINCT d.customer_name, a.balance
	FROM account AS a, depositor AS d
		WHERE a.account_number = d.account_number
			AND balance > 500;

SELECT DISTINCT c.customer_city
	FROM customer AS c, borrower AS b, loan AS l
		WHERE l.amount >= 1000
			AND l.amount <= 2000;

SELECT a.branch_name, a.balance * 1.1
	FROM account AS a
		WHERE a.branch_name = 'Downtown';

SELECT a.balance FROM account as a WHERE a.account_number in 
	(select dd.account_number from depositor as dd where dd.customer_name in 
		(select distinct b.customer_name from borrower as b, depositor as ddd where b.loan_number = 'L-15'));
