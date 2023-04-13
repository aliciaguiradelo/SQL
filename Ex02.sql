--3 alterando tabela cidade
alter table cidade add (uf char(2) not null);

--4 adicionando coluna na tabela
alter table socio add (fone varchar(10));
alter table socio add (sexo char(1) not null);

--5 alterando tipo da coluna -- OK
alter table socio modify nome varchar(35);

--6 criando tabela setor
create table setor
(cod_setor number (3) primary key,
nome_setor varchar(30) not null);

--7 adicionando fk na tabela
alter table socio add constraint fk_cod_setor foreign key (cod_setor) references setor (cod_setor);

--8 criando tabela dependente !!!
create table dependente
(nome varchar (35) not null,
CONSTRAINT fk_NomeSocio FOREIGN KEY (nome) REFERENCES socio (nome),
numero number(4) primary key,
nome_depend varchar(30) not null,
dataNasc date not null);

--9 inserir dados nas tabelas

