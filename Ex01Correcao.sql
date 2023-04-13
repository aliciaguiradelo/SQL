drop table cidade
drop table socio

create table cidade (codigo number (4) constraint pk_cid_cd primary key,
nome varchar (30) constraint nn_cid_nome not null);

-- exibindo estrutura
desc cidade 

--Inserindo dados
insert into cidade values(1,'São Paulo','SP');
insert into cidade values(2,'Curitiba','CU');

-- validação de dados
commit;

-- exibindo dados
select * from cidade;

create table socio (cpf char(11) constraint pk_soc_cpf primary key,
nome varchar(20) constraint nn_soc_nome not null,
datanasc date constraint nnt_soc_dtnasc not null,
rg VARCHAR(15) constraint nn_soc_rg not null,
cidade number(4) constraint fk_soc_cid references cidade);

-- exibindo estrutura
desc socio

insert into socio values ('11111111111','Joana','04-may-1997','11111111111111',
1,'1111111111','F',10);
insert into socio values ('21111111111','Claudio','14-dec-00','21111111111111',
2,'2111111111','M',20);
commit; -- validação de dados

alter table cidade add uf char(2) constraint nn_cid_uf not null;
alter table socio add (fone varchar(10), sexo char(1) constraint nn_soc_sx not null);

alter table socio modify nome varchar(35);

create table setor (codigo number (3) constraint pk_set_cd primary key,
setnome varchar2(30) constraint nm_set_nome not null);
alter table setor rename column setnome to nome;
desc setor
insert into setor values (10,'Financeiro');
insert into setor values (20,'Informática');
commit;

alter table socio add constraint fk_cod_setor foreign key (cod_setor) references setor (cod_setor);

ALTER TABLE SOCIO ADD SETOR NUMBER(3) not null references setor

--Para visualizar todas as constraints de um banco, SEMPRE EM LETRA MAIÚSCULA
select constraint_name, constraint_type from user_constraints where table_name = 'CIDADE'

create table dependente (socio char(11) not null references socio,
numero number(4) primary key,
nome varchar(30) not null,
datanasc date not null)
desc dependente
insert into dependente values('11111111111',100,'Gustavo','26-feb-00');
insert into dependente values('21111111111',101,'Mariana','06-mar-10');
commit;
-- exibindo o nome das constraints
select constRaint_name, constraint_type from user_constraints
where table_name = 'CIDADE'

select * from cidade;
select * from socio;
select * from setor;
select * from dependente;







