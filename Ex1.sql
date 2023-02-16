create table categoria
(cod_categ number(4) primary key,
descricao varchar(50) not null);

create table cliente
(cod_cli number(4) primary key,
pre_nome varchar(50) not null,
sobrenome varchar(50),
endereco varchar(70),
telefone varchar(20));

create table ator
(cod_ator number(4) primary key,
nome_popular varchar(50) not null,
nome_artistico varchar(50),
datanasc date);

create table filme 
(cod_filme number(4) primary key,
titulo varchar(70) not null);

create table dvd
(num_dvd number(4) primary key,
tipo char(1));

select constraint_name from user_constraints where table_name = 'CLIENTE'

create table aluga
(data_ret data,
data_dev data,
cod_cli primary key,


