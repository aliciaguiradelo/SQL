create table n_fiscal
(n_nf number(5) primary key,
dt_nf date not null,
total_nf number(10,2));

select constraint_name from user_constraints where table_name = 'N_FISCAL'

desc n_fiscal

create table produto 
(cd_pro number(5) constraint prod_cd_pk primary key,
nm_prod varchar2 (30) constraint prod_mn_nn not null
constraint prod_nm_uk unique,
preco number(10,2))

select constraint_name from user_constraints where table_name = 'PRODUTO'

create table tem
(fk_nota number(5) constraint tem_nf_fk references n_fiscal,
fk_prod number(5) constraint tem_prod_fk references produto)

Inserindo dados
Comando DML - Data Manipulation Language

Novas linhas:
insert into nome_tabela values
(valor1, valor2, ...., valorN)

Obs: campos: char, varchar ou varchar2 e date precisam de ap�strofe

Exemplo 1
conhecendo ou visualizando a estrutura
desc n_fiscal
inserindo uma linha
insert into n_fiscal values (1,'10-Jan-00',5000);
varificando a inser��o 
select * from n_fiscal

descobrindo o padr�o da data
select sysdate from dual

gravando os dados fisicamente
commit;


