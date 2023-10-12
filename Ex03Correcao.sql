--Correção lista 03
create table empregados 
(nome_empregado varchar (50) not null,
rua varchar(100) not null,
cidade varchar (30),
estado_civil varchar(15));

alter table empregados add salario number(11,2);

alter table empregados add data_nascimento date;

alter table empregados modify cidade varchar(110);

desc empregados;

create table companhias 
(nome_companhia varchar(50) primary key,
cidade_companhia varchar(30));

alter table empregados add primary key (nome_empregado);

alter table empregados add constraint emp_nm_pk primary key (nome_empregado);

create table trabalha
(nome_empregado varchar(50) primary key,
nome_companhia varchar(50) not null references companhia,
salario number (9,2) not null);

desc trabalha;

create table gerente (nome_empregado varchar(50) not null references emprregado,
nome_gerente varchar(50) not null references empregados);

drop table empregados cascade constraints;

drop table companhias;












