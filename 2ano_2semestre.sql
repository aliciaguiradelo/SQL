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

insert into produto(id_pro,ds_pro,pr_pro,estoque) values (01,'descrição produto um',55,10);
insert into produto(id_pro,ds_pro,pr_pro,estoque) values (02,'descrição produto dois',155,1);
insert into produto(id_pro,ds_pro,pr_pro,estoque) values (03,'descrição produto três',550,5);
insert into produto(id_pro,ds_pro,pr_pro,estoque) values (04,'descrição produto quatro',50,2);
insert into produto(id_pro,ds_pro,pr_pro,estoque) values (05,'descrição produto cinco',05,100);

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
    
    dbms_output.put_line('Nome: '||v_exibe.nm_fun||' - Salário: '||v_exibe.salario);
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
    insert into vendedor values (&Codigo,'&Nome',&salário);
    commit;
    dbms_output.put_line('Dados inseridos com sucesso');
    exception
    when dup_val_on_index then
    dbms_output.put_line('Codigo já cadastrado');
    when others then
    dbms_output.put_line('Cadastro incompleto');
end;
 
Usando updade e delete
begin
    update vendedor set nm_vendedor = '&nome'
    where id_vendedor = &código;
    commit;
    dbms_output.put_line('Dados atualizados com sucesso');
    exception
    when others then
    dbms_output.put_line('Atualização não realizada');
end;
begin
    delete from vendedor
    where id_vendedor = &código;
    commit;
    dbms_output.put_line('Dados atualizados com sucesso');
    exception
    when others then
    dbms_output.put_line('Atualização não realizada');
end;

declare
    v_nome varchar(30);
    begin
    select nm_vendedor into v_nome from venda where nr_venda = &código;
    dbms_output.put_line('Nome do vendedor: '||v_nome);
    exception
    when no_data_found then
    dbms_output.put_line('Código inexistente');
    when too_many_rows then
    dbms_output.put_line('Atenção pesquisa retorna mais de uma linha');
end;

select * from vendedor



begin
    insert into venda values (&Codigo,TO_DATE('&DATE', 'YYYY-MM-DD'),&total,&codvend);
    commit;
    dbms_output.put_line('Dados inseridos com sucesso');
    exception
    when dup_val_on_index then
    dbms_output.put_line('Codigo já cadastrado');
    when others then
    dbms_output.put_line('Cadastro incompleto');
end;

declare
    v_vendedor varchar(30);
    begin
    select fk_vendedor into v_vendedor from vendedor where nr_venda = &código;
    dbms_output.put_line('Nome do vendedor: '||v_vendedor);
    exception
    when no_data_found then
    dbms_output.put_line('Código inexistente');
    when too_many_rows then
    dbms_output.put_line('Atenção pesquisa retorna mais de uma linha');
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

cp1 -> função procedure exception cursor

--TEORIA
CREATE OR REPLACE FUNCTION nome_função (p1 in/out ou in/out, p2...)
RETURN tipo_dados;
IS
    variaveis locais
BEGIN
    programação    
RETURN nome_função;
END;
 
IN (padrão): Passa um valor do ambiente chamador para procedure e este
valor não pode ser alterado dentro dela (passagem de parâmetro por valor).
OUT: Passa um valor da procedure para o ambiente chamador (passagem de
parâmetro por referência).
IN OUT: Passa um valor do ambiente chamador para a procedure. Esse valor
pode ser alterado dentro da procedure e retornar com o valor atualizado para
o ambiente chamador (passagem de parâmetro por referência).
Nota: As palavras-chave IS ou AS (após a declaração dos parâmetros) podem ser
utilizadas, pois nesse contexto são equivalentes.
 
Chamada, passagem de parâmetros, saída de dados
 
SELECT nome_função(valor1,valorn) FROM dual;


quando usarmos IN (se eu não colocar nada vai ser o padrão IN) não permite alteração do valor. deve ser usado apenas para visualização
OUT recebe um valor pode processar e mandar para fora também
IN/OUT recebe e processa

create or replace function nome_função (p1 in/out o in/out, p2)
return tipo_dado;
is 
    VARIAVEIS LOCAIS
begin
    programação
return nome_função;
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

--EXERCÍCIOS

--FUNÇÃO 01
criar uma função que receba o valor do salário mínimo atual, atribua um aumento de 25% e exiba o novo valor.

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

--FUNÇÃO 02
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
 
Chamada, execução:

EXEC PROC_NOME_ALUNO(1);


--criar uma procedure que mostre os dados do produto a partir da digitação do código do mesmo.



CREATE OR REPLACE PROCEDURE PROC_DADOS_PROD (P_ID IN NUMBER) IS V_descri varchar(40);

BEGIN
    SELECT ds_pro INTO V_descri FROM PRODUTO WHERE id_pro = P_ID;
    DBMS_OUTPUT.PUT_LINE (V_descri);
END PROC_DADOS_PROD;
 
EXEC PROC_DADOS_PROD(2);

SELECT * FROM PRODUTO

INSERT INTO PRODUTO VALUES (1,'PRODUTO UM',100,5);
INSERT INTO PRODUTO VALUES (2,'PRODUTO DOIS',200,0);
INSERT INTO PRODUTO VALUES (3,'PRODUTO TRÊS',300,0);
INSERT INTO PRODUTO VALUES (4,'PRODUTO QUATRO',4500,5);

CORRETO!!!!!

--crie uma proc que mostre a descrição do produto com estoque maior que 5.


CREATE OR REPLACE PROCEDURE PROC_DADOS_PROD (P_ID IN NUMBER) IS V_descri varchar(40);

BEGIN
    SELECT ds_pro,ESTOQUE INTO V_descri, V_ESTOQUE FROM PRODUTO WHERE id_pro = P_ID;
    IF ESTOQUE > 5 LOOP
        DBMS_OUTPUT.PUT_LINE (V_descri);
    END LOOP;
END PROC_DADOS_PROD;
 
EXEC PROC_DADOS_PROD(2);


AULA 11/03/2024

TRIGGERS E GATILHOS

São blocos PLSQL disparados de forma automátcia e implicitamente sempre que ocorrer um evento associado a uma tabela
(INSET,UPDATE,DELETE)

Observe a seguir algumas das principais alplicações para as triggers:
Manutenção das tabelas
Implementação de niveis de segurança mais complexos
Geração de valores de colunas

A sintaxe básica para criação de uma triggr é a seguinte

CREATE OR REPLACE TRIGGER NOME_TRIGGER
{BEFORE | AFTER} {INSERT | UPDATE | DELETE} OF {NOME_COLUNA1, NOME_COLUNA2, ...} ON NOME_TABELA
FOR EACH ROW
REFERENCING OLD AS ANTIGO NEW AS NOVO
WHEN <CONDIÇÃO>
DECLARE
...
BEGIN
...
END;
 
Tempo
Os tempos de uma trigger podem ser:
BEFORE - antes do evento
AFTER - depois do evento
 
Evento
Os eventos de uma trigger podem ser:
INSERT
UPDATE
DELETE
A cláusula REFERENCING está substituindo as áreas de memória 
OLD e NEW por ANTIGO e NOVO
 
LINHA: acionada uma vez para cada linha afetada pelo comando ao qual a 
trigger estiver associada. Permite o uso dos prefixos
:OLD e :NEW no corpo da trigger e das cláusulas REFERENCING e 
WHEN em seu cabeçalho. 
Deve-se incluir a cláusula FOR EACH ROW no cabeçalho
 
Exemplificando:

DROP TABLE PRODUTO CASCADE CONSTRAINTS;
CREATE TABLE PRODUTO (
CODIGO NUMBER(4),
VALOR NUMBER(7,2));

INSERT INTO PRODUTO VALUES(1001, 2.55);
INSERT INTO PRODUTO VALUES(1002, 3.25);
INSERT INTO PRODUTO VALUES(1003, 2.85);
SELECT * FROM PRODUTO;

DROP TABLE VALOR_PRODUTO CASCADE CONSTRAINTS;
CREATE TABLE VALOR_PRODUTO (
CODIGO NUMBER(4),
VALOR_ANTERIOR NUMBER(7,2),
VALOR_NOVO NUMBER(7,2));

CREATE OR REPLACE TRIGGER VERIFICA_VALOR
before UPDATE
OF VALOR
ON PRODUTO
FOR EACH ROW
BEGIN
INSERT INTO VALOR_PRODUTO
VALUES (:OLD.CODIGO, :OLD.VALOR, :NEW.VALOR);
END;

SELECT * FROM PRODUTO;
SELECT * FROM VALOR_PRODUTO;

UPDATE PRODUTO SET VALOR = 2 WHERE CODIGO = 1001;



EXERCÍCIO: CRIAR UM GATILHO QUE GRAVE AS ALTERAÇÕES REALIZADAS EM UMA SENHA

DROP TABLE USUARIO CASCADE CONSTRAINTS;
CREATE TABLE USUARIO (
CODIGO NUMBER(4),
NOME VARCHAR(7),
SENHA NUMBER(5));

INSERT INTO USUARIO VALUES (01, 'ALICIA', 253);

DROP TABLE HISTORICO_SENHA CASCADE CONSTRAINTS;
CREATE TABLE HISTORICO_SENHA (
CODIGO NUMBER(4),
SENHA_ANTIGA NUMBER(7,2),
SENHA_NOVA NUMBER(5),
DATA DATE);

CREATE OR REPLACE TRIGGER ATUALIZA_SENHA
before UPDATE
OF SENHA
ON USUARIO
FOR EACH ROW
BEGIN
INSERT INTO HISTORICO_SENHA
VALUES (:OLD.CODIGO, :OLD.SENHA, :NEW.SENHA, SYSDATE);
END;

SELECT * FROM USUARIO;
SELECT * FROM HISTORICO_SENHA;

UPDATE USUARIO SET SENHA = 2 WHERE CODIGO = 01;

SELECT * FROM HISTORICO_SENHA;


GERENCIAR EM UMA CONTA CORRENTE OS PROCESSAMENTOS DE SAQUE E DEPÓSITO ATRAVÉS DE GATILHOS, GRAVANDO SE FOI SAQUE OU DEPÓSITO E SEU VALOR,
COM ISSO O SALDO DA CONTA DEVERÁ SER ATUALIZADO

DROP TABLE CONTA_CORRENTE CASCADE CONSTRAINTS;
CREATE TABLE CONTA_CORRENTE (
CODIGO NUMBER(4),
NOME VARCHAR(7),
SALDO NUMBER(15,2));

INSERT INTO CONTA_CORRENTE VALUES (01, 'ALICIA', 20000);

DROP TABLE EXTRATO CASCADE CONSTRAINTS;
CREATE TABLE EXTRATO (
CODIGO NUMBER(4),
SALDO_ANTIGO NUMBER(7,2),
SALDO_NOVO NUMBER(5),
DATA DATE,
HORA TIMESTAMP);


CREATE OR REPLACE TRIGGER MOVIMENTACAO_BANCARIA
BEFORE UPDATE OF SALDO
ON CONTA_CORRENTE
FOR EACH ROW
DECLARE
    V_OPERACAO VARCHAR2(8);
BEGIN
    IF :OLD.SALDO < :NEW.SALDO THEN
        V_OPERACAO := 'DEPÓSITO';
    ELSE
        V_OPERACAO := 'SAQUE';
    END IF;

    INSERT INTO EXTRATO (CODIGO, OPERACAO, VALOR, DATA, HORA)
    VALUES (:OLD.CODIGO, V_OPERACAO, ABS(:OLD.SALDO - :NEW.SALDO), SYSDATE, SYSTIMESTAMP);
END;

SELECT * FROM CONTA_CORRENTE;
SELECT * FROM EXTRATO;

UPDATE CONTA_CORRENTE SET SALDO = 10000 WHERE CODIGO = 01;

SELECT * FROM EXTRATO;



