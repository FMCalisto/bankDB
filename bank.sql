
p table borrower cascade;
-- drop table loan cascade;
-- drop table depositor cascade;
-- drop table account cascade;
-- drop table customer cascade;
-- drop table branch cascade;

create table customer
   (customer_name 	varchar(255)	not null unique,
    customer_street 	varchar(255)	not null,
    customer_city 	varchar(255)	not null,
    primary key(customer_name));

create table branch
   (branch_name 	varchar(255)	not null unique,
    branch_city 	varchar(255)	not null,
    assets 		numeric(20,2)		not null,
    primary key(branch_name));

create table account
   (account_number 	varchar(255)	not null unique,
    branch_name		varchar(255)	not null,
    balance 		numeric(20,2)		not null,
    primary key(account_number),
    foreign key(branch_name) references branch(branch_name));

create table depositor
   (customer_name 	varchar(255)	not null,
    account_number 	varchar(255)	not null,
    primary key(customer_name, account_number),
    foreign key(customer_name) references customer(customer_name),
	foreign key(account_number) references account(account_number));

create table loan
   (loan_number 	varchar(255)	not null unique,
    branch_name		varchar(255)	not null,
    amount 		numeric(20,2)		not null,
    primary key(loan_number),
    foreign key(branch_name) references branch(branch_name));

create table borrower
   (customer_name 	varchar(255)	not null,
    loan_number 	varchar(255)	not null,
    primary key(customer_name, loan_number),
    foreign key(customer_name) references customer(customer_name),
    foreign key(loan_number) references loan(loan_number));

/* populate relations */

insert into customer	values ('Jones',	'Main',		'Harrison');
insert into customer	values ('Smith',	'Main',		'Rye');
insert into customer	values ('Hayes',	'Main',		'Harrison');
insert into customer	values ('Curry',	'North',	'Rye');
insert into customer	values ('Lindsay',	'Park',		'Pittsfield');
insert into customer	values ('Turner',	'Putnam',	'Stamford');
insert into customer	values ('Williams',	'Nassau',	'Princeton');
insert into customer	values ('Adams',	'Spring',	'Pittsfield');
insert into customer	values ('Johnson',	'Alma',		'Palo Alto');
insert into customer	values ('Glenn',	'Sand Hill',	'Woodside');
insert into customer	values ('Brooks',	'Senator',	'Brooklyn');
insert into customer	values ('Green',	'Walnut',	'Stamford');
insert into customer	values ('Jackson',	'University',	'Salt Lake');
insert into customer	values ('Majeris',	'First',	'Rye');
insert into customer	values ('McBride',	'Safety',	'Rye');

insert into branch	values ('Downtown',	'Brooklyn',	 900000);
insert into branch	values ('Redwood',	'Palo Alto',	2100000);
insert into branch	values ('Perryridge',	'Horseneck',	1700000);
insert into branch	values ('Mianus',	'Horseneck',	 400200);
insert into branch	values ('Round Hill',	'Horseneck',	8000000);
insert into branch	values ('Pownal',	'Bennington',	 400000);
insert into branch	values ('North Town',	'Rye',		3700000);
insert into branch	values ('Brighton',	'Brooklyn',	7000000);
insert into branch	values ('Central',	'Rye',		 400280);

insert into account	values ('A-101',	'Downtown',	500);
insert into account	values ('A-215',	'Mianus',	700);
insert into account	values ('A-102',	'Perryridge',	400);
insert into account	values ('A-305',	'Round Hill',	350);
insert into account	values ('A-201',	'Perryridge',	900);
insert into account	values ('A-222',	'Redwood',	700);
insert into account	values ('A-217',	'Brighton',	750);
insert into account	values ('A-333',	'Central',	850);
insert into account	values ('A-444',	'North Town',	625);

insert into depositor values ('Johnson','A-101');
insert into depositor values ('Smith',	'A-215');
insert into depositor values ('Hayes',	'A-102');
insert into depositor values ('Hayes',	'A-101');
insert into depositor values ('Turner',	'A-305');
insert into depositor values ('Johnson','A-201');
insert into depositor values ('Jones',	'A-217');
insert into depositor values ('Lindsay','A-222');
insert into depositor values ('Majeris','A-333');
insert into depositor values ('Smith',	'A-444');

insert into loan	values ('L-17',		'Downtown',	1000);
insert into loan	values ('L-23',		'Redwood',	2000);
insert into loan	values ('L-15',		'Perryridge',	1500);
insert into loan	values ('L-14',		'Downtown',	1500);
insert into loan	values ('L-93',		'Mianus',	500);
insert into loan	values ('L-11',		'Round Hill',	900);
insert into loan	values ('L-16',		'Perryridge',	1300);
insert into loan	values ('L-20',		'North Town',	7500);
insert into loan	values ('L-21',		'Central',	570);

insert into borrower values ('Jones',	'L-17');
insert into borrower values ('Smith',	'L-23');
insert into borrower values ('Hayes',	'L-15');
insert into borrower values ('Jackson',	'L-14');
insert into borrower values ('Curry',	'L-93');
insert into borrower values ('Smith',	'L-11');
insert into borrower values ('Williams','L-17');
insert into borrower values ('Adams',	'L-16');
insert into borrower values ('McBride',	'L-20');
insert into borrower values ('Smith',	'L-21');

create table bank_news (
id int primary key,
title varchar(250),
body text,
fulltext ( title , body )
) engine=MyISAM;
insert into bank_news values ( 1 , 'New Perryridge branch' , 'The new Perryridge branch, in the city center, has opened today.');
insert into bank_news values ( 2 , 'Customer feedback' , 'Customers from the Brighton branch, located in the center of the city, have provided a great deal of positive feedback.');
insert into bank_news values ( 3 , 'New focus group' , 'Several Perryridge branch staff have been promoted to a skilled team who are focused on improving customer relations.');
insert into bank_news values ( 4 , 'New staff' , 'Several new staff members have been hired for the Brighton branch.');
insert into bank_news values ( 5 , 'Branch in Redwood' , 'New branch in Redwood is bringing us closer to clients in the area.');


/* TASK 21 */

create table bank_news (
id int primary key, 
title varchar(250),
body text,
fulltext ( title , body )
) engine=MyISAM;

insert into bank_news values ( 1 , 'New Perryridge branch' , 'The new Perryridge branch, in the city center, has opened today.');
insert into bank_news values ( 2 , 'Customer feedback' , 'Customers from the Brighton branch, located in the center of the city, have provided a great deal of positive feedback.');
insert into bank_news values ( 3 , 'New focus group' , 'Several Perryridge branch staff have been promoted to a skilled team who are focused on improving customer relations.');
insert into bank_news values ( 4 , 'New staff' , 'Several new staff members have been hired for the Brighton branch.');
insert into bank_news values ( 5 , 'Branch in Redwood' , 'New branch in Redwood is bringing us closer to clients in the area.');
