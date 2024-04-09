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


AULA 11/03/2024

TRIGGERS E GATILHOS

S�o blocos PLSQL disparados de forma autom�tcia e implicitamente sempre que ocorrer um evento associado a uma tabela
(INSET,UPDATE,DELETE)

Observe a seguir algumas das principais alplica��es para as triggers:
Manuten��o das tabelas
Implementa��o de niveis de seguran�a mais complexos
Gera��o de valores de colunas

A sintaxe b�sica para cria��o de uma triggr � a seguinte

CREATE OR REPLACE TRIGGER NOME_TRIGGER
{BEFORE | AFTER} {INSERT | UPDATE | DELETE} OF {NOME_COLUNA1, NOME_COLUNA2, ...} ON NOME_TABELA
FOR EACH ROW
REFERENCING OLD AS ANTIGO NEW AS NOVO
WHEN <CONDI��O>
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
A cl�usula REFERENCING est� substituindo as �reas de mem�ria 
OLD e NEW por ANTIGO e NOVO
 
LINHA: acionada uma vez para cada linha afetada pelo comando ao qual a 
trigger estiver associada. Permite o uso dos prefixos
:OLD e :NEW no corpo da trigger e das cl�usulas REFERENCING e 
WHEN em seu cabe�alho. 
Deve-se incluir a cl�usula FOR EACH ROW no cabe�alho
 
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



EXERC�CIO: CRIAR UM GATILHO QUE GRAVE AS ALTERA��ES REALIZADAS EM UMA SENHA

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


GERENCIAR EM UMA CONTA CORRENTE OS PROCESSAMENTOS DE SAQUE E DEP�SITO ATRAV�S DE GATILHOS, GRAVANDO SE FOI SAQUE OU DEP�SITO E SEU VALOR,
COM ISSO O SALDO DA CONTA DEVER� SER ATUALIZADO

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
        V_OPERACAO := 'DEP�SITO';
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


Aula 18/03

RESUMO de gatilhos

- BEFORE: Este gatilho � acionado antes que a a��o que o disparou (inser��o, 
             atualiza��o, exclus�o) seja efetivamente realizada na tabela.
- AFTER: Este gatilho � acionado ap�s a a��o ter sido conclu�da na tabela. 
   
Objetivo Prim�rio:
- BEFORE: Geralmente usado para validar ou modificar os dados antes que eles sejam
         inseridos, atualizados ou exclu�dos.
- AFTER: Geralmente usado para realizar a��es que dependem do resultado da a��o j� 
        ter sido executada, como registro de log, notifica��o por e-mail ou c�lculos
        adicionais. 
        
Uso em Cen�rios Espec�ficos:    
- BEFORE: �til quando � necess�rio garantir a integridade dos dados antes que eles
         sejam persistidos na tabela.
- AFTER: �til quando a a��o a ser executada depende do registro j� ter sido inserido,
        atualizado ou exclu�do. 
        
Manipula��o dos Dados:    
- BEFORE: Permite modificar os dados que est�o prestes a ser inseridos, atualizados 
         ou exclu�dos.
- AFTER: Pode ser usado para realizar opera��es adicionais que n�o afetam diretamente
        os dados da transa��o original. 
        
Efici�ncia e Performance:    
- BEFORE: Pode melhorar o desempenho em compara��o com AFTER, pois qualquer valida��o
         ou modifica��o ocorre antes da transa��o real ser conclu�da.
- AFTER: Pode ser menos eficiente em termos de desempenho, especialmente se houver 
        opera��es adicionais envolvidas ap�s a transa��o original. 
        
Exemplo de Gatilho BEFORE: 

Suponha que voc� tenha uma tabela chamada funcionario e deseje garantir que o sal�rio
de um novo funcion�rio n�o seja inserido como um valor negativo. Voc� pode usar um 
gatilho BEFORE INSERT para validar isso. 

CREATE OR REPLACE TRIGGER validar_salario
BEFORE INSERT ON funcionarios
FOR EACH ROW
BEGIN
    IF :NEW.salario < 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'O sal�rio n�o pode ser um valor negativo.');
    END IF;
END; 

Neste exemplo, o gatilho BEFORE INSERT garante que o sal�rio fornecido para um novo
funcion�rio n�o seja negativo. Se for, ele gera um erro. 

Exemplo de Gatilho AFTER: 

Suponha que voc� queira manter um registro de auditoria sempre que um novo pedido for
inserido na tabela pedidos. Voc� pode usar um gatilho AFTER INSERT para realizar essa a��o. 

CREATE OR REPLACE TRIGGER registrar_auditoria_pedido
AFTER INSERT ON pedidos
FOR EACH ROW
BEGIN
    INSERT INTO auditoria_pedidos (id_pedido, data_insercao, usuario_insercao)
    VALUES (:NEW.id_pedido, SYSDATE, USER);
END; 

Neste exemplo, o gatilho AFTER INSERT � acionado sempre que um novo pedido � inserido na
tabela. Ele insere um registro na tabela `auditoria_pedidos`, registrando o ID do pedido,
a data de inser��o e o usu�rio que fez a inser��o. 

Gatilho FOR EACH ROW
   - Esse tipo de gatilho � usado principalmente em tabelas.
   - Ele � acionado uma vez para cada linha afetada pela opera��o DML (Data Manipulation
     Language), como INSERT, UPDATE ou DELETE.
   - Os gatilhos FOR EACH ROW s�o usados para aplicar l�gica de neg�cios em n�vel de linha
     ou para validar/modificar os dados de cada linha individualmente.
Uso
  - Validar dados em n�vel de linha antes de uma inser��o, atualiza��o ou exclus�o.
  - Modificar os dados em n�vel de linha antes de serem persistidos na tabela.
  - Auditoria de altera��es em n�vel de linha (por exemplo, registro de quem alterou
    uma determinada linha e quando).


AULA PACOTES 08/04/2024

set serveroutput on
--Serve para visualizar os dados
 
set verify off
--Serve para mostrar o resultado direto
 
CREATE OR REPLACE PACKAGE teste1
AS
disciplina VARCHAR(20) := 'DB Application';
unidade VARCHAR(30) := 'FIAP - Paulista _ Manh�';
END teste1;
 
DECLARE
concatena VARCHAR(100);
BEGIN
concatena := teste1.disciplina || ', on FIAP';
DBMS_OUTPUT.PUT_LINE(concatena);
END;


drop table emp;
create table emp (empno number(3),
                  sal number(8,2));
insert into emp values (1,1000);

create or replace package rh
as 
function descobrir_salario (p_id in emp.empno%TYPE)
return number;
procedure reajuste(v_codigo_emp in emp.empno%TYPE,
                    v_porcentagem in number DEFAULT 25);
end rh;


create or replace package body rh
as 
function descobrir_salario (p_id in emp.empno%TYPE)
return number
is
v_salario emp.sal%TYPE := 0;
begin
select sal into v_salario from emp where empno = p_id;
return v_salario;
end descobrir_salario;
procedure reajuste(v_codigo_emp in emp.empno%TYPE,
                    v_porcentagem in number DEFAULT 25)
is
begin
update emp set sal = sal + (sal * (v_porcentagem/100))
where empno = v_codigo_emp;
COMIT;
end reajuste;
end rh;

declare v_sal number(8,2);
begin
v_sal := rh.descobrir_salario(1);
dbms_output.put_line (v_sal);
end;

select rh.descobrir_salario(1) from dual;

declare v_sal number(8,2);
begin
v_sal := rh.descobrir_salario(1);
dbms_output.put_line('Salario atual - ' || v_sal);
rh.reajuste(1);


TEORIA COMPLETA PROFESSOR


set serveroutput on
set verify off
 
CREATE OR REPLACE PACKAGE teste1 
AS 
disciplina VARCHAR2(20) :='DB Application';
unidade VARCHAR2(30) :='FIAP - Paulista - Manh�';
END teste1;
 
DECLARE
concatena VARCHAR2(100);
BEGIN
concatena := teste1.disciplina || ', on FIAP';
dbms_output.put_line(concatena);
END;
 
*****************************
drop table emp
create table emp (empno number(3),
                  sal number(8,2));
insert into emp values (1,1000);
 
CREATE OR REPLACE PACKAGE rh 
as
FUNCTION descobrir_salario (p_id IN emp.empno%TYPE) 
RETURN NUMBER;
PROCEDURE reajuste(v_codigo_emp IN emp.empno%type,
                   v_porcentagem IN number DEFAULT 25);
END rh;
 
CREATE OR REPLACE PACKAGE BODY rh
AS
FUNCTION descobrir_salario(p_id IN emp.empno%TYPE)
RETURN NUMBER
IS
v_salario emp.sal%TYPE := 0;
BEGIN
SELECT sal INTO v_salario FROM emp WHERE empno = p_id;
RETURN v_salario;
END descobrir_salario;
 
PROCEDURE reajuste(v_codigo_emp IN emp.empno%type,
                   v_porcentagem IN number DEFAULT 25)
IS
BEGIN
UPDATE emp SET sal = sal + (sal *( v_porcentagem / 100 ) )
where empno = v_codigo_emp;
COMMIT;
END reajuste;
END rh;
 
DECLARE
v_sal NUMBER(8,2);
BEGIN
v_sal := rh.descobrir_salario(1);
DBMS_OUTPUT.PUT_LINE(v_sal);
END;
 
SELECT rh.descobrir_salario(1)FROM dual;
 
DECLARE
v_sal NUMBER(8,2);
BEGIN
v_sal := rh.descobrir_salario(1);
DBMS_OUTPUT.PUT_LINE ('Salario atual - ' || v_sal);
rh.reajuste(1);
v_sal := rh.descobrir_salario(1);
DBMS_OUTPUT.PUT_LINE ('Salario atualizado - ' || v_sal);
END;
 
 
Exerc�cio 1
 
CREATE OR REPLACE PACKAGE pct_media 
AS 
nota1 number(3,1) := 10;
nota2 number(3,1) := 3;
nota3 number(3,1) := 10;
END pct_media;
 
DECLARE
    cal_media number(3,1);
BEGIN
    cal_media := (pct_media.nota1 + pct_media.nota2 + pct_media.nota3) / 3;
dbms_output.put_line(cal_media);
END;
 
****************************************
 
Exerc�cio 2
 
CREATE OR REPLACE PACKAGE pct_media1 
as
FUNCTION calcular_media (n1 IN number, n2 in number, n3 in number) 
RETURN NUMBER;
END pct_media1;
 
CREATE OR REPLACE PACKAGE BODY pct_media1
AS
FUNCTION calcular_media (n1 IN number, n2 in number, n3 in number) 
RETURN NUMBER
IS
v_media number:= 0;
BEGIN
v_media := (n1 + n2 + n3) / 3;
RETURN v_media;
END calcular_media;
END pct_media1;
 
SELECT round(pct_media1.calcular_media(10,3,10),1) FROM dual;
 
 
Exerc�cio 3
 
create or replace package notas
as
function calcularMedia(nota1 number, nota2 number, nota3 number)
return number;
procedure mostrarResultado(media number);
end notas;
 
 
create or replace package body notas
as
function calcularMedia(nota1 number, nota2 number, nota3 number)
return number
is
v_media number(3,1);
begin
v_media := (nota1+nota2+nota3)/3;
return v_media;
end calcularMedia;
procedure mostrarResultado(media number)
is
begin
    if (media >= 6) then
        dbms_output.put_line('Aprovado');
    else
        dbms_output.put_line('Reprovado');
    end if;
end mostrarResultado;
end notas;
 
 
DECLARE
    media number(3,1);
BEGIN
    media := notas.calcularmedia(&nota1, &nota2, &nota3);
    dbms_output.put_line('M�dia: '|| media);
    notas.mostrarresultado(media);
END;




























































