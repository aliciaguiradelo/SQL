drop table produto CASCADE CONSTRAINTS

create table produto(
id_pro number(3) primary key,
ds_pro varchar(40) not null unique,
pr_pro number(8,2) not null,
estoque number(10,2)
);

create table venda(
id_venda number(3) primary key,
dt_venda date not null,
total_venda number(10,2) not null,
fk_vendedor NUMBER(3) NOT NULL,
FOREIGN KEY (fk_vendedor) REFERENCES vendedor(id_vendedor)
);

create table item_venda(
fk_pro NUMBER(3) NOT NULL,
FOREIGN KEY (fk_pro) REFERENCES produto(id_pro),
fk_venda NUMBER(3) NOT NULL,
FOREIGN KEY (fk_venda) REFERENCES venda(id_venda),
total_pro number(10,2)
);

drop table vendedor

create table vendedor(
id_vendedor number(3) primary key,
nm_vendedor varchar(40) not null unique,
salario number(8,2)
);

insert into produto(id_pro,ds_pro,pr_pro,estoque) values (01,'descri��o produto um',55,10);
insert into produto(id_pro,ds_pro,pr_pro,estoque) values (02,'descri��o produto dois',155,1);
insert into produto(id_pro,ds_pro,pr_pro,estoque) values (03,'descri��o produto tr�s',550,5);
insert into produto(id_pro,ds_pro,pr_pro,estoque) values (04,'descri��o produto quatro',50,2);
insert into produto(id_pro,ds_pro,pr_pro,estoque) values (05,'descri��o produto cinco',05,100);

insert into vendedor(id_vendedor,nm_vendedor,salario) values (01,'alicia',5510);
insert into vendedor(id_vendedor,nm_vendedor,salario) values (02,'larah',5510);
insert into vendedor(id_vendedor,nm_vendedor,salario) values (03,'arthur',5510);
insert into vendedor(id_vendedor,nm_vendedor,salario) values (04,'ana',5510);
insert into vendedor(id_vendedor,nm_vendedor,salario) values (05,'bruno',5510);

insert into venda(id_venda,dt_venda,total_venda,fk_vendedor) values (01, TO_DATE('2024-02-05', 'YYYY-MM-DD'), 100,01);
insert into venda(id_venda,dt_venda,total_venda,fk_vendedor) values (02, TO_DATE('2023-07-05', 'YYYY-MM-DD'), 200,02);
insert into venda(id_venda,dt_venda,total_venda,fk_vendedor) values (03, TO_DATE('2021-09-05', 'YYYY-MM-DD'), 450,03);
insert into venda(id_venda,dt_venda,total_venda,fk_vendedor) values (04, TO_DATE('2014-05-05', 'YYYY-MM-DD'), 18,04);
insert into venda(id_venda,dt_venda,total_venda,fk_vendedor) values (05, TO_DATE('2015-08-05', 'YYYY-MM-DD'), 9,05);

insert into item_venda(fk_pro,fk_venda,total_pro) values (05,01,5510);
insert into item_venda(fk_pro,fk_venda,total_pro) values (02,02,10);
insert into item_venda(fk_pro,fk_venda,total_pro) values (03,03,55);
insert into item_venda(fk_pro,fk_venda,total_pro) values (04,04,510);
insert into item_venda(fk_pro,fk_venda,total_pro) values (01,04,51);

set serveroutput on
set verify off

declare
    v_id_vendedor number(3) := &IdVendedor;
    v_nm_vendedor varchar(40) := &NomeVendedor;
    salario number(8,2) := &Salario;
    cursor c_exibe is select id_vendedor from vendedor;
    v_exibe c_exibe%rowtype;
    
begin   
    open c_exibe;
    loop
        fetch c_exibe into v_exibe;
    exit when c_exibe%notfound;
    
    dbms_output.put_line('Nome: '||v_exibe.nm_fun||' - Sal�rio: '||v_exibe.salario);
    end loop;
    close c_exibe;
    
end;



-------------------------------GABARITO-------------------------------------------

drop table vendedor cascade constraints
drop table venda cascade constraints
drop table produto cascade constraints
drop table item_venda cascade constraints

create table vendedor
(id_vendedor number(4) primary key,
nm_vendedor varchar(30) unique not null,
sl_vendedor number(10,2));

create table venda
(nr_venda number(4) primary key,
dt_venda date not null,
tt_venda number(10,2) not null,
fk_vendedor references vendedor not null);

create table produto
(cd_produto number(4) primary key,
ds_produto varchar(30) not null unique,
pr_unit number(10,2),
estoque number(10,2));

create table item_venda
(fk_produto references produto not null,
fk_venda references venda not null,
qtd_produto number(10,2) not null,
tt_item number(10,2) not null);

begin
    insert into vendedor values (&Codigo,'&Nome',&sal�rio);
    commit;
    dbms_output.put_line('Dados inseridos com sucesso');
    exception
    when dup_val_on_index then
    dbms_output.put_line('Codigo j� cadastrado');
    when others then
    dbms_output.put_line('Cadastro incompleto');
end;
 
Usando updade e delete
begin
    update vendedor set nm_vendedor = '&nome'
    where id_vendedor = &c�digo;
    commit;
    dbms_output.put_line('Dados atualizados com sucesso');
    exception
    when others then
    dbms_output.put_line('Atualiza��o n�o realizada');
end;
begin
    delete from vendedor
    where id_vendedor = &c�digo;
    commit;
    dbms_output.put_line('Dados atualizados com sucesso');
    exception
    when others then
    dbms_output.put_line('Atualiza��o n�o realizada');
end;

declare
    v_nome varchar(30);
    begin
    select nm_vendedor into v_nome from venda where nr_venda = &c�digo;
    dbms_output.put_line('Nome do vendedor: '||v_nome);
    exception
    when no_data_found then
    dbms_output.put_line('C�digo inexistente');
    when too_many_rows then
    dbms_output.put_line('Aten��o pesquisa retorna mais de uma linha');
end;

select * from vendedor



begin
    insert into venda values (&Codigo,TO_DATE('&DATE', 'YYYY-MM-DD'),&total,&codvend);
    commit;
    dbms_output.put_line('Dados inseridos com sucesso');
    exception
    when dup_val_on_index then
    dbms_output.put_line('Codigo j� cadastrado');
    when others then
    dbms_output.put_line('Cadastro incompleto');
end;

declare
    v_vendedor varchar(30);
    begin
    select fk_vendedor into v_vendedor from vendedor where nr_venda = &c�digo;
    dbms_output.put_line('Nome do vendedor: '||v_vendedor);
    exception
    when no_data_found then
    dbms_output.put_line('C�digo inexistente');
    when too_many_rows then
    dbms_output.put_line('Aten��o pesquisa retorna mais de uma linha');
end;

select * from venda

DECLARE
    CURSOR C_exibe IS select nr_venda, nm_vendedor from venda
    inner join vendedor on id_vendedor = fk_vendedor;
BEGIN
FOR V_exibe IN C_exibe LOOP
dbms_output.put_line('N venda: '||v_exibe.nr_venda||' - Nome: '||v_exibe.nm_vendedor);
END LOOP;
END;


Aula 03 

cp1 -> fun��o procedure exception cursor

--TEORIA
CREATE OR REPLACE FUNCTION nome_fun��o (p1 in/out ou in/out, p2...)
RETURN tipo_dados;
IS
    variaveis locais
BEGIN
    programa��o    
RETURN nome_fun��o;
END;
 
IN (padr�o): Passa um valor do ambiente chamador para procedure e este
valor n�o pode ser alterado dentro dela (passagem de par�metro por valor).
OUT: Passa um valor da procedure para o ambiente chamador (passagem de
par�metro por refer�ncia).
IN OUT: Passa um valor do ambiente chamador para a procedure. Esse valor
pode ser alterado dentro da procedure e retornar com o valor atualizado para
o ambiente chamador (passagem de par�metro por refer�ncia).
Nota: As palavras-chave IS ou AS (ap�s a declara��o dos par�metros) podem ser
utilizadas, pois nesse contexto s�o equivalentes.
 
Chamada, passagem de par�metros, sa�da de dados
 
SELECT nome_fun��o(valor1,valorn) FROM dual;


quando usarmos IN (se eu n�o colocar nada vai ser o padr�o IN) n�o permite altera��o do valor. deve ser usado apenas para visualiza��o
OUT recebe um valor pode processar e mandar para fora tamb�m
IN/OUT recebe e processa

create or replace function nome_fun��o (p1 in/out o in/out, p2)
return tipo_dado;
is 
    VARIAVEIS LOCAIS
begin
    programa��o
return nome_fun��o;
END;
--EXEMPLO
CREATE OR REPLACE FUNCTION soma (p1 in number, p2 in number)
  RETURN number
IS
  total number(4);
BEGIN
    total := p1 + p2;
RETURN total;
END;

select soma(1,1) from dual;

DECLARE
    nota1 number(3) := &Numero1;
    nota2 nota1%type := &Numero2;
    resul nota1%type;
BEGIN
    resul := soma(nota1, nota2);
    dbms_output.put_line('Resultado: ' || resul);
END;

--EXERC�CIOS

--FUN��O 01
criar uma fun��o que receba o valor do sal�rio m�nimo atual, atribua um aumento de 25% e exiba o novo valor.

CREATE OR REPLACE FUNCTION salario_novo (p1 in number)
  RETURN number
IS
  total number(14,2);
BEGIN
    total := p1 * 1.25;
RETURN total;
END;

select salario_novo(2000) from dual;

DECLARE
    v_salario number(14,2) := &Salario;
    resul v_salario%type;
BEGIN
    resul := salario_novo(v_salario);
    dbms_output.put_line('Resultado: ' || resul);
END;

--FUN��O 02
declare
    cursor c_aumenta is select * from vendedor;
    resul number(10,2);
begin
    for v_aumenta in c_aumenta loop
        resul := v_aumenta.sl_vendedor * 1.25;
        dbms_output.put_line(v_aumenta.nm_vendedor||' - '||resul);
        update vendedor set sl_vendedor = resul where id_vendedor = v_aumenta.id_vendedor;
    end loop;
end;

select * from vendedor




--Procedimento
drop table aluno cascade constraints;

create table aluno ( ra char(2) primary key,

                     nome varchar(20));

insert into aluno values('1','Marcel');

insert into aluno values('2','Silmara');

commit;

select * from aluno;
 
set serveroutput on
 
CREATE OR REPLACE PROCEDURE PROC_NOME_ALUNO (P_RA IN CHAR) 

IS

V_NOME VARCHAR2(50);

BEGIN

SELECT NOME INTO V_NOME FROM ALUNO WHERE RA = P_RA;

DBMS_OUTPUT.PUT_LINE (V_NOME);

END PROC_NOME_ALUNO;
 
Chamada, execu��o:

EXEC PROC_NOME_ALUNO(1);


--criar uma procedure que mostre os dados do produto a partir da digita��o do c�digo do mesmo.



CREATE OR REPLACE PROCEDURE PROC_DADOS_PROD (P_ID IN NUMBER) IS V_descri varchar(40);

BEGIN
    SELECT ds_pro INTO V_descri FROM PRODUTO WHERE id_pro = P_ID;
    DBMS_OUTPUT.PUT_LINE (V_descri);
END PROC_DADOS_PROD;
 
EXEC PROC_DADOS_PROD(2);

SELECT * FROM PRODUTO

INSERT INTO PRODUTO VALUES (1,'PRODUTO UM',100,5);
INSERT INTO PRODUTO VALUES (2,'PRODUTO DOIS',200,0);
INSERT INTO PRODUTO VALUES (3,'PRODUTO TR�S',300,0);
INSERT INTO PRODUTO VALUES (4,'PRODUTO QUATRO',4500,5);

CORRETO!!!!!

--crie uma proc que mostre a descri��o do produto com estoque maior que 5.


CREATE OR REPLACE PROCEDURE PROC_DADOS_PROD (P_ID IN NUMBER) IS V_descri varchar(40);

BEGIN
    SELECT ds_pro,ESTOQUE INTO V_descri, V_ESTOQUE FROM PRODUTO WHERE id_pro = P_ID;
    IF ESTOQUE > 5 LOOP
        DBMS_OUTPUT.PUT_LINE (V_descri);
    END LOOP;
END PROC_DADOS_PROD;
 
EXEC PROC_DADOS_PROD(2);


FALTA ATUALIZAR COM A CORRE��O!!!!




