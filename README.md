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

6. Coloque o	ficheiro bank.sql na sua	área	pessoal no	cluster	sigma.ist.utl.pt que	está	no	
site	da	cadeira	no	Fenix.		Caso	esteja	a	 fazer	o	download	a	partir	de	um	dos	PCs	 do	
laboratórios	em	Linux,	então	esta	cópia	não	será	necessária	dado	que	o	download	do	
browser	já	deixa	os ficheiros	na	vossa	área	no	sigma.

7. Entre	na	sua	área	do	sigma,	como	explicado	no	passo	2,	e	navegue	até	ao	directório	
onde	guardou	o	ficheiro.

8. Entre	no	MySQL,	como	explicado	no	passo	3	e	4.

9. Uma	vez	dentro	do	MySQL,	utilize	o	comando:	USE	istxxxxx
para	 se	 ligar	 à	 sua	 base	 de	 dados	 com	 o	 nome	 istxxxxx,	 em	 que	 istxxxxx	 deve	 ser	
substituído	pelo seu	nome	de	utilizador.

10. Use	help para	obter	informação	sobre	os	comandos	disponíveis.

11. Se	precisar	de	sair	do	programa,	pode	utilizar	a	qualquer	momento	o	comando: quit

12. Na	lista	de	comandos	terá	notado	a	existência	de	um	comando	nesta	forma:
source				(\.) Execute	an	SQL	script	file.	Takes	a	file	name	as	an	argument.

13. É	este	comando	 que	deverá	utilizar	 para	executar	as	instruções	 no	 ficheiro	bank.sql.	
source	bank.sql
O	sistema produz	algumas	mensagens	à	medida	que	executa	as	instruções	do	ficheiro.

14. Para	listar	as	tabelas	da	base	de	dados,	use	o	comando:	show	tables;

15. Após	a	ligação	à base	de	dados	pode	fazer	algumas	consultas,	nomeadamente:

• ver	a	lista	completa	de	clientes: SELECT	*	FROM	customer;

• ver	a	lista	completa	de	contas:	SELECT	*	FROM	account;

• ver	o	saldo	da	conta	A-101:

```
SELECT balance	FROM	account	WHERE	account_number='A-101';
```

Em	aulas	futuras	verá	como	obter	a	resposta	a	consultas	mais	complexas


## Information about the schema of a database

16. Utilize	o	comando	SHOW	DATABASES; para	obter	informação	sobre	as	bases	de	dados	
existentes	no	sistema.

17. Para	se	ligar	à	sua	base	de	dados,	utilize	o	comando:	USE	istxxxxx (onde	istxxxxx	é	o	
seu	nome	de	utilizador)

18. Para	listar	as	tabelas	da	base	de	dados,	use	o	comando:	SHOW	TABLES;

19. Obtenha	informação	sobre	as	tabelas	de	clientes	e	contas:

```
DESCRIBE customer;
DESCRIBE account;
```

Confirme	que	a estrutura dessas tabelas	está	de	acordo com as	instruções	que	foram	
dadas no	ficheiro	bank.sql.

20. Use	o	comando	quit para	sair	do	sistema	e	voltar	ao	terminal.


## Full-text search in MySQL system

21. Use	 os	 seguintes	 comandos	 para	 criar	 uma	 tabela	 de	 nome	 bank_news,	 e	 para	 lhe	
associar os	 conteúdos	 textuais	 de	 artigos	 noticiosos	 relevantes	 no	 domínio	 de	 um	
banco.	 Note	 que	 a criação	 da	 tabela	 envolve também	 um	 índice	 que suporta a	
execução	de	pesquisas	full-text.

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

22. Após	 proceder	 à	 criação	 da	 tabela,	 pode executar	 consultas	 envolvendo	 restrições	
sobre	os	conteúdos	textuais	dos	artigos noticiosos.

• Encontrar	todos	os	artigos	cujo	conteúdo	se	relacione	com	“city	center”:

```
select	*	
from	bank_news	
where	match(title,	body)	against	('"city	center"' in	boolean	mode);
```

• Encontrar	 todos	 os	 artigos	 relacionados	 com	 Perryridge,	 apresentando	 os	
resultados	ordenados	de	acordo	para	com	a	sua	relevância:

```
select	*,	match(title,	body)	against('perryridge')	as	score
from	bank_news
where match(title,	body)	against('perryridge')
order	by	score	desc;
```


## Developing applications with MySQL database: Example in PHP

23. Edite	 o	 ficheiro	test.php e	 coloque	 o	 seu	nome	 de	 utilizador	 e	 password	 (dada	 pelo
mysql_reset)	nas	variáveis	$user	e	$password,	respectivamente.

24. Usando	um	cliente	de	SCP (“WinSCP”	em	Windows;	“scp”	em	Linux)	coloque	o	ficheiro	
test.php dentro	da	pasta “web”	da	sua	área no	cluster	sigma.ist.utl.pt

25. Abra	o	browser	e	aceda	ao	URL:
http://web.ist.utl.pt/istxxxxx/test.php
onde	istxxxxx é	o	seu	nome	de	utilizador no	sistema	Fénix.

26. Confirme	que	o	script corre	correctamente	e	sem	erros.

27. Abra	 o	 ficheiro	 test.php num	 editor	 e	 localize	 as	 chamadas	 à	 biblioteca	 PHP	 Data	
Objects	 (PDO),	 a	 qual	 é	 utilizada	 como	 forma	 de	 interagir	 com	 uma	 base	 de	 dados	
como	o	MySQL,	a	partir	de	um	script	PHP:

• $db	=	new	PDO(…)
• $db->query(…)

28. No	ficheiro	test.php,	localize	a	consulta	à	base	de	dados:
• SELECT	*	FROM	account;
Compare	 o	 resultado	 desta	 consulta, que	 aparece	 no browser,	 com	 o	 resultado	 que	
obteve	através	da	linha	de	comando.

29. No	ficheiro	test.php,	localize	o	sítio	onde	está	a	ser	construída	uma	tabela	HTML	para	
mostrar	os	resultados:

• <table> e	</table> definem	o	início e	fim	da	tabela	HTML

• <tr>	e	</tr>	definem	o	início	e	fim	de	uma	linha	da	tabela	HTML

• <td>	e	</td>	definem	o	início	e	fim	de	uma	célula	na	tabela	HTML

• Esta	é	a	forma	típica	de	construção	de	tabelas	em	HTML.	Repare	que	a	tabela	está	
a	ser	construída	dentro	de	um	ciclo	que	percorre	os	resultados	de	$db->query(…)

30. No	browser,	abra	o	código	fonte	da	página	e	compare	esse	código	HTML	com	o	código	
PHP	do	ficheiro de	script test.php.


#### Important Notes

This is not a complete solution and is far to be a complete statment.

It's important to read all Introduction and elements abour a Data Base Introduction.
