# Data Base Introduction

### Data Base Enviroment Approach

Introduction to MySQL and SBGDs.


## Resume

This introduction was made by acessing the Istituto Superior Técnico hostname server and by using the SSH remote client.


## Configurations

To start using the MySQL system available infrastructure the IST should take the following steps: 

1. To be able to do what is requested in this lab, you must first access the page 
self-service CIIST:

https://ciist.ist.utl.pt/servicos/self_service/index.php

and activate the shell services, web and cgi 

2. To access the sigma.ist.utl.pt, you must use a program called generically 
By "Secure Shell". In Windows you can use one of the "SSH Secure Shell" programs 
or "PuTTY"; Linux or Mac must use the "ssh" command. You have to use your 
Fenix ​​credentials (user name and password of the Phoenix system) to enter the 
his account of sigma. 

3. To obtain the password of your MySQL account, and after being connected to the cluster sigma, 
run the command: mysql_reset 

4. To log in to the MySQL session use the command: mysql -h db.ist.utl.pt -u 
istxxxxx istxxxxx where p should be replaced by your username on the system 
Phoenix and should enter the password obtained in the previous command 

5. To copy files from your PC to your area of sigma.ist.utl.pt should use a 
specific program for Secure Copy, ("WinSCP" for Windows, "scp" on Linux).


## Using the Command Line

6. Place the file in your home bank.sql area in sigma.ist.utl.pt cluster that is in 
Chair site in Phoenix. If you are downloading from one of the PCs 
laboratories in Linux, then this copy is not required since the download 
browser gets files already in your area in sigma. 

7. Between sigma in your area, as explained in step 2, and navigate to the directory 
where you saved the file. 

8. Between in MySQL, as explained in step 3 and 4. 

9. Once in MySQL, use the command: USE istxxxxx 
to connect to your database with istxxxxx name where istxxxxx should be 
replaced by your username. 

10. Use help for information about the available commands. 

11. If you need to exit the program, you can use any time the command: quit 

In the command list 12 will have noticed the existence of a command in this manner: 
source (\.) Execute an SQL script file. Takes a file name to an argument. 

13. It is this command you should use to execute the instructions in bank.sql file. 
bank.sql source 
The system produces some messages as it executes instructions file. 

14. To list the tables of the database, use the command: show tables; 

15. After connecting to the database can make some queries, such as:

• a complete list of clients: SELECT * FROM customer; 

• a complete list of accounts: SELECT * FROM account; 

• see the account balance A-101:

```
SELECT balance	FROM	account	WHERE	account_number='A-101';
```

In future classes will see how to get the answer more complex queries


## Information about the schema of a database

16. Use the command SHOW DATABASES; for information about the databases 
in the system. 

17. To connect to your database, use the command: USE istxxxxx (where is the istxxxxx 
Your username) 

18. To list the tables of the database, use the command: SHOW TABLES; 

19. Get information about tables and accounts:

```
DESCRIBE customer;
DESCRIBE account;
```

Confirm the structure of these tables is in accordance with the instructions which were 
given in bank.sql file. 

20. Use the quit command to exit the system and return to the terminal.


## Full-text search in MySQL system

21. Use the following commands to create a table of bank_news name, and you 
associate the textual content of relevant news articles in the field of a 
bank. Note that the table creation also involves an index that supports 
execution of full-text search.

```
create table bank_news (
  id int primary key, 
  title varchar(250),
  body text,
  fulltext ( title , body )
) engine=MyISAM;

insert into bank_news values ( 1 , 'New Perryridge branch' , 'The
new Perryridge branch, in the city center, has opened today.');

insert into bank_news values ( 2 , 'Customer feedback' , 'Customers 
from the Brighton branch, located in the center of the city, have 
provided a great deal of positive feedback.');

insert into bank_news values ( 3 , 'New focus group' , 'Several 
Perryridge branch staff have been promoted to a skilled team who 
are focused on improving customer relations.');

insert into bank_news values ( 4 , 'New staff' , 'Several new staff 
members have been hired for the Brighton branch.');

insert into bank_news values ( 5 , 'Branch in Redwood' , 'New 
branch in Redwood is bringing us closer to clients in the area.');
```

22. After undertaking the creation of the table, you can execute queries involving restrictions 
on the textual contents of news articles. 

* Find all the articles whose content relates to "city center":

```
select	*	
from	bank_news	
where	match(title,	body)	against	('"city	center"' in	boolean	mode);
```

* Find all related articles Perryridge, presenting the 
results ordered according to their relevance to:

```
select	*,	match(title,	body)	against('perryridge')	as	score
from	bank_news
where match(title,	body)	against('perryridge')
order	by	score	desc;
```


## Developing applications with MySQL database: Example in PHP

23. Edit the test.php file and put your username and password (given by 
mysql_reset) in the variables $ user and $ password respectively. 

24. Using an SCP client ("WinSCP" for Windows, "scp" on Linux) put the file 
test.php inside its area "web" folder in sigma.ist.utl.pt cluster 

25. Open the browser and enter the URL: 
http://web.ist.utl.pt/istxxxxx/test.php 
istxxxxx where is your username in the Phoenix system. 

26. Confirm that the script runs correctly and without errors. 

27. Open the test.php file in an editor and locate the calls to library PHP Date 
Objects (PDO), which is used as a way of interacting with a database 
how MySQL from a PHP script: 

```
$ db = new PDO (...) 
$ db> query (...) 
```

28. In test.php file, locate the query to the database: 

```
SELECT * FROM account; 
```

Compare the result of this consultation, which appears in the browser, with the result that 
obtained via the command line. 

29. In test.php file, locate the site where it is being built to an HTML table 
show the results:

• ```<table>``` and ```</ table>``` define the start and end of the HTML table 

• ```<tr>``` and ```</ tr>``` define the start and end of an HTML table row 

• ```<td>``` and ```</ td>``` define the beginning and end of a cell in HTML table 

• This is the typical way of building HTML tables. Note that the table is 
to be built within a loop that runs through the results of $ db> query (...) 

30. In the browser, open the page source and compare this with the HTML code 
PHP script from test.php file.


#### Important Notes

This is not a complete solution and is far to be a complete statment.

It's important to read all Introduction and elements abour a Data Base Introduction.
