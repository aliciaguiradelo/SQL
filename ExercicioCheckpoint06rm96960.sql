set serveroutput on
set verify off

drop table fornecedor cascade constraints;
create table fornecedor(
n_for number(5) primary key,
nome varchar(15) not null,
endereco varchar(30),
cpf varchar(11) not null,
estrelas varchar2(1) not null,
dt_atualiza date not null,
vendas number(11,2) not null,
comissoes number(11,2) not null,
valor_desconto number(11,2) not null,
valor_juros number(11,2) not null,
lucro number(12,2) not null
);

drop table conta cascade constraints;
create table conta(
n_conta number(5) primary key,
n_for number(5), FOREIGN KEY (n_for) REFERENCES fornecedor(n_for) ,
tipo varchar(1) not null,
bloqueada varchar(1),
saldo number(10,2),
dt_ult_lanc date
);

drop table movimentacao cascade constraints;
create table movimentacao(
dt_mov date not null,
n_conta number(5) not null , FOREIGN KEY (n_conta) REFERENCES conta(n_conta) ,
n_mov number(5) primary key,
valor number(12,2) not null,
num_titulo number(5), FOREIGN KEY (num_titulo) REFERENCES titulo(num_titulo)
);

drop table cliente cascade constraints;
create table cliente(
nome varchar(15),
endereco varchar(30),
estado char(2),
cep varchar(8),
codigo number(5) primary key,
data_nasc date
);

drop table titulo cascade constraints;
create table titulo(
cod_clie number(5) not null,  FOREIGN KEY (cod_clie) REFERENCES cliente(codigo),
num_titulo number(5) primary key,
valor_titulo number(11,2) not null,
valor_juros number(11,2) not null,
valor_desconto number(11,2) not null,
valor_pago number(11,2) not null,
data_emissao date,
data_vencto date,
data_pagto date
);

insert into fornecedor values(01, 'alicia', 'rua javorau 90','43849634833',5, sysdate, 100, 100, 55, 10,1000); 
insert into fornecedor values(02, 'arthur', 'rua tutu','43849634833',5, sysdate, 100, 100, 55, 10,1000);
insert into fornecedor values(03, 'gui', 'rua angelica razzi','43849634833',4, sysdate, 100, 100, 55, 10,1000);
insert into fornecedor values(04, 'fernando', '15th street','43849634833',3, sysdate, 100, 100, 55, 10,1000);
insert into fornecedor values(05, 'bella', '20th street','43849634833',5, sysdate, 100, 100, 55, 10,1000);

insert into conta values(01, 01,'C','N', 100000, sysdate);
insert into conta values(02, 01,'P','N', 256000, sysdate);
insert into conta values(03, 02,'P','S', 5000, sysdate);
insert into conta values(04, 04,'C','N', 6000, sysdate);
insert into conta values(05, 05,'C','S', 25000, sysdate);

insert into cliente values('amanda', 'rua antonieta', 'SP', 01234567,01, TO_DATE('1980-02-05', 'YYYY-MM-DD'));
insert into cliente values('marcia', 'av paulista', 'MG', 03333567,02, TO_DATE('1990-09-09', 'YYYY-MM-DD'));
insert into cliente values('luiz', 'rua recife', 'PA', 01255557,03, TO_DATE('1999-10-05', 'YYYY-MM-DD'));
insert into cliente values('nathalia', 'rua do cruzeiro', 'SP', 09994567,04, TO_DATE('2001-02-24', 'YYYY-MM-DD'));
insert into cliente values('rose', 'rua javorau', 'RJ', 0199955,05, TO_DATE('1967-02-18', 'YYYY-MM-DD'));

insert into titulo values(01, 01, 5000, 50, 20, 2500, TO_DATE('2024-02-18', 'YYYY-MM-DD'),TO_DATE('2024-03-18', 'YYYY-MM-DD'),TO_DATE('2024-04-18', 'YYYY-MM-DD'));

select * from cliente where codigo = 01