/*1. Criando tabela CIDADE*/
create table cidade
(codigo number(4) primary key,
nome varchar(30) not null);

/*2. Criando tabela SOCIO*/
create table socio
(cpf char(11) primary key,
nome varchar (20) not null,
dataNasc date not null,
rg varchar(15) not null,
cidade number references cidade not NULL);

/*3. Alterando tabela CIDADE */
alter table 










