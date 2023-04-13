--1 criando tabela empregado
create table empregado
(nome_empregado varchar(50) not null,
rua varchar(100) not null,
cidade varchar(30),
estadocivil varchar(15));

--2,3 e 4 adicionando colunas/atributos
alter table empregado add (salario number(11,2));
alter table empregado add (data_nasc date);
alter table empregado modify (cidade varchar(110));
desc empregado

--5 criando tabela companhia
create table companhia
(nome_comp varchar(50),
cidade_comp varchar(30));

--6 adicionando chave primaria





