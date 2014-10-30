# 2.a.v1)

SELECT DISTINCT c.customer_name, c.customer_street, c.customer_city
	FROM customer AS c, depositor AS d
		WHERE c.customer_name = d.customer_name
			AND c.customer_name NOT IN
				(SELECT customer_name
					FROM borrower)


# --------------------------------------------------------------------------- #


# 2.a.v2)

SELECT DISTINCT c.customer_name, c.customer_street, c.customer_city
	FROM customer_city
		WHERE EXISTS(SELECT * FROM depositor
			WHERE depositor.customer_name = custormer.customer_name)
		AND NOT EXISTS(SELECT * FROM borrower
			WHERE borrower.customer_name = customer.costumer_name)
		


# --------------------------------------------------------------------------- #


# 2.b)

SELECT customer_name, AVG(Balance)
	FROM depositor NATURAL JOIN account NATURAL JOIN branch
		WHERE branch_city = 'brooklyn'
			GROUP BY costumer_name;

			
# --------------------------------------------------------------------------- #


# 2.c)

SELECT COUNT(DISTINCT d.customer_name)
	FROM customer NATURAL JOIN depositor NATURAL JOIN account NATURAL JOIN branch
		WHERE customer_city = branch_city;

		
# --------------------------------------------------------------------------- #


# 2.d)

SELECT SUM(balance)
	FROM account
		WHERE branch_name IN
			(SELECT branch_name
				FROM branch
					WHERE branch_city = 'brooklyn')
	
	
# --------------------------------------------------------------------------- #


# 2.f)

SELECT customer_name, customer_street, customer_city
	FROM customer
		WHERE customer_name IN
			(SELECT customer_name FROM borrower NATURAL JOIN loan
				GROUP BY customer_name
					HAVING SUM(amount) >= ALL
						(SELECT SUM(amount)
							FROM loan NATURAL JOIN borrower
								GROUP BY customer_name))
								
								
# --------------------------------------------------------------------------- #


# 2.h)

SELECT branch_name
	FROM account
		GROUP BY branch_name
			HAVING (account(account_numbe) >= ALL
				(SELECT COUNT(account_number) FROM account GROUP BY branch_name))
				
				
# --------------------------------------------------------------------------- #


2.i)

SELECT customer_name
	FROM customer
		WHERE NOT EXISTS
			(SELECT * FROM branch
				WHERE NOT EXISTS
					(SELECT * FROM
						FROM depositor NATURAL JOIN account
							WHERE customer_name > costumer.customer_name
								AND branch_name = branch.branch_name))
