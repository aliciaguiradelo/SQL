--Alicia Guiradelo da Silva 96960 2TDSPR

set serveroutput on
set verify off

--criando tabelas

drop table pedido cascade constraints;
create table pedido(
id_ped number(3) primary key,
dt_ped date,
total_ped number(8,2)
);

INSERT INTO pedido VALUES (01,TO_DATE('2024-02-05', 'YYYY-MM-DD'),0);
INSERT INTO pedido VALUES (02,TO_DATE('2023-01-02', 'YYYY-MM-DD'),0);
INSERT INTO pedido VALUES (03,TO_DATE('2010-05-05', 'YYYY-MM-DD'),0);

drop table item_ped cascade constraints;
create table item_ped(
id_ped number(3),
id_mus number(3)
);

INSERT INTO item_ped VALUES (01, 01);
INSERT INTO item_ped VALUES (01, 02);
INSERT INTO item_ped VALUES (01, 03);
INSERT INTO item_ped VALUES (02, 01);
INSERT INTO item_ped VALUES (02, 03);
INSERT INTO item_ped VALUES (03, 03);


drop table musica cascade constraints;
create table musica(
id_mus number(3) primary key,
tit_mus varchar(40),
valor_mus number(8,2)
);

INSERT INTO musica VALUES (01, 'tempo perdido', 50);
INSERT INTO musica VALUES (02, 'faroeste caboclo', 80);
INSERT INTO musica VALUES (03, 'será', 30);
INSERT INTO musica VALUES (04, 'eduardo e monica', 10);
INSERT INTO musica VALUES (05, 'indios', 90);


--EXERCíCIO 01
--Criando função
CREATE OR REPLACE FUNCTION func_calcula_tot_ped (p_id_ped in number)
RETURN number
IS
    cursor c_dados is SELECT * from item_ped join musica on item_ped.id_mus = musica.id_mus where item_ped.id_ped = p_id_ped;
    v_total_ped number := 0;

BEGIN
    for v_dado in c_dados LOOP
    v_total_ped := v_total_ped + (v_dado.valor_mus);
    END LOOP;
    
    
RETURN v_total_ped;
    
END;

--Criando bloco para executar função e update automaticamente de uma vez só
DECLARE
    V_id_ped number := &IdPedido;
    v_total_func number;
    
BEGIN 
    v_total_func := func_calcula_tot_ped(V_id_ped);
    update pedido set total_ped = v_total_func where id_ped = V_id_ped;
    dbms_output.put_line('Resultado: ' || v_total_func);
END;


select * from pedido;
select * from item_ped;
select * from musica;

--EXERCÍCIO 02
--Criando procedure
CREATE OR REPLACE PROCEDURE PROC_DADOS_PED (P_ID_PED IN NUMBER)
IS 
    V_titulo varchar(40);
    V_dt_ped date;
    V_total_ped number(8,2);
    cursor c_dados is SELECT * from item_ped join musica on item_ped.id_mus = musica.id_mus where item_ped.id_ped = p_id_ped;

BEGIN
    SELECT total_ped, dt_ped INTO V_total_ped, V_dt_ped  FROM pedido WHERE id_ped = P_ID_PED;
    DBMS_OUTPUT.PUT_LINE ('Total pedido: ' || V_total_ped);
    DBMS_OUTPUT.PUT_LINE ('Data: ' || V_dt_ped);
    for v_dados in c_dados loop
        dbms_output.put_line('Titulo: ' || v_dados.tit_mus);
    END LOOP;
END PROC_DADOS_PED;
--executando
EXEC PROC_DADOS_PED(01);


--EXERCICIO 03
drop table controle_musica cascade constraints;
create table controle_musica(
id_mus number(3),
valor_old number(8,2),
valor_new number(8,2)
);

CREATE OR REPLACE TRIGGER gat_atualiza_val_mus
before UPDATE
OF valor_mus
ON musica
FOR EACH ROW
BEGIN
INSERT INTO controle_musica
VALUES (:OLD.id_mus, :OLD.valor_mus, :NEW.valor_mus);
END;

SELECT * FROM pedido;
SELECT * FROM musica;
SELECT * FROM controle_musica;

UPDATE musica SET valor_mus = 5 WHERE id_mus = 01;















