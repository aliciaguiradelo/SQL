--1 criar tabelas -- aluguel, add constraints
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
titulo varchar(70) not null,
cod_categ number(4),
CONSTRAINT fk_CodCateg FOREIGN KEY (cod_categ) REFERENCES categoria (cod_categ)
);

/./

create table dvd
(num_dvd number(4) primary key,
tipo char(1));

alter table dvd add constraint  cod_filme foreign key (cod_filme) references filme (cod_filme);

create table aluguel
(cod_aluguel number(5) primary key,
dataret date,
datadev date,
constraint cod_cli_fk foreign key (cod_cli) references cliente(cod_cli),
constraint num_dvd_fk foreign key (num_dvd) references dvd(num_dvd));

ALTER TABLE filme
ADD CONSTRAINT fk_cod_categ
FOREIGN KEY (cod_categ)
REFERENCES categoria(cod_categ);

drop table filme;

--2 inserindo valores  --
insert into filme(cod_filme, titulo, cod_categ)values(1,'Sai pra lá',1);
insert into filme(cod_filme, titulo, cod_categ)values(2,'Ajuda Eterna ',2);
insert into filme(cod_filme, titulo, cod_categ)values(3,'Anjos Malditos',2);
insert into filme(cod_filme, titulo, cod_categ)values(4,'Pânico II',4);
insert into filme(cod_filme, titulo, cod_categ)values(5,'Um dia de furia',3);
insert into filme(cod_filme, titulo, cod_categ)values(6,'Lente Cega',3);
insert into filme(cod_filme, titulo, cod_categ)values(7,'Sinais do Tempo',2);
insert into filme(cod_filme, titulo, cod_categ)values(8,'A melodia da vida',1);

insert into categoria(cod_categ, descricao)values(1,'Comédia');
insert into categoria(cod_categ, descricao)values(2,'Drama');
insert into categoria(cod_categ, descricao)values(3,'Aventura');
insert into categoria(cod_categ, descricao)values(4,'Terror');

insert into cliente(cod_cli, pre_nome, sobrenome, endereco, telefone)values(1,'João','Silva', 'Rua da Cruz sem Pé','4444-1111');
insert into cliente(cod_cli, pre_nome, sobrenome, endereco, telefone)values(2,'Antônio','Ferreira', 'Av. da Vila Velha','6660-9333');
insert into cliente(cod_cli, pre_nome, sobrenome, endereco, telefone)values(3,'Fabio','Dias', 'Rua Antonio Vieira','2337-0393');
insert into cliente(cod_cli, pre_nome, sobrenome, endereco, telefone)values(4,'Andreia','Melo', 'Rua da Praia Bonita','8989-7777');
insert into cliente(cod_cli, pre_nome, sobrenome, endereco, telefone)values(5,'Murilo','Fontes', 'Av. dos Autonomistas','9090-9090');


insert into dvd(num_dvd, cod_filme, tipo)values(1,1,'S');
insert into dvd(num_dvd, cod_filme, tipo)values(2,1,'S');
insert into dvd(num_dvd, cod_filme, tipo)values(3,1,'S');
insert into dvd(num_dvd, cod_filme, tipo)values(4,2,'D');
insert into dvd(num_dvd, cod_filme, tipo)values(5,3,'S');

--3 alterando/atualizando dados da tabela --
update categoria set cod_categ = 8 where descricao = 'Comédia';

--4 adicionando coluna na tabela  -- ok!
alter table filme add (sinopse varchar(300));

--5 inserir dados
insert into categoria(cod_categ, descricao)values(5,'FICÇÃO');

--6 apagar dados da tabela -- ok!
delete from filme where titulo='Anjos Malditos' or titulo='A melodia da vida';