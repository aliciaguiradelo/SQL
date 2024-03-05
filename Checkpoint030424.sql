-- Alicia Guiradelo - rm96960
-- Ana Carolina Dantas Prado - rm96997
-- Arthur Foschiani - rm96525

set serveroutput on
--Serve para visualizar os dados
 
set verify off
--Serve para mostrar o resultado direto
 
DROP TABLE cliente CASCADE CONSTRAINTS;
DROP TABLE pedido CASCADE CONSTRAINTS;
DROP TABLE itens_pedido CASCADE CONSTRAINTS;
 
CREATE TABLE cliente (
    id_cliente NUMBER PRIMARY KEY,
    nome VARCHAR2(50),
    email VARCHAR2(100)
);
 
CREATE TABLE pedido (
    id_pedido NUMBER PRIMARY KEY,
    id_cliente NUMBER,
    data_pedido DATE,
    valor_total NUMBER,
    valor_final_desconto number,
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);
 
CREATE TABLE itens_pedido (
    id_item NUMBER PRIMARY KEY,
    id_pedido NUMBER,
    produto VARCHAR2(50),
    quantidade NUMBER,
    preco_unitario NUMBER,
    FOREIGN KEY (id_pedido) REFERENCES pedido (id_pedido)
);
 
--EXERCÍCIO 01
--crie um bloco de programação PL/SQL que realize a inclusão de dados (4 linhas por tabela) nas 
--três tabelas para representar o cliente, o pedido e alguns itens desse pedido

 
DECLARE
BEGIN
    INSERT INTO cliente VALUES (1, 'Arthur', 'arthur@fiap.com.br');
    INSERT INTO cliente VALUES (2, 'Alícia', 'alicia@fiap.com.br');
    INSERT INTO cliente VALUES (3, 'Bruna', 'bruna@fiap.com.br');
    INSERT INTO cliente VALUES (4, 'Ana Carolina', 'ana@fiap.com.br');
    INSERT INTO pedido VALUES (1, 1, '04-MAR-24', 0, 0);
    INSERT INTO pedido VALUES (2, 1, '04-MAR-24', 0, 0);
    INSERT INTO pedido VALUES (3, 2, '04-MAR-24', 0, 0);
    INSERT INTO pedido VALUES (4, 2, '04-MAR-24', 0, 0);
    INSERT INTO itens_pedido VALUES (1, 1, 'Samsung Galaxy S23', 2, 1500);
    INSERT INTO itens_pedido VALUES (2, 1, 'Iphone 13', 4, 3000);
    INSERT INTO itens_pedido VALUES (3, 3, 'Moto G', 3, 700);
    INSERT INTO itens_pedido VALUES (4, 3, 'Xiaomi', 12, 1200);
    EXCEPTION
        when DUP_VAL_ON_INDEX then
        dbms_output.put_line('Não é permito ID repetido.');
        when others then
        dbms_output.put_line('Cadastro incompleto');
        
END;
 
 
--EXERCÍCIO 02
--Crie um procedimento PL/SQL chamado novo_valor_total que recebe o ID de um pedido como parâmetro e atualiza o valor total do pedido 
com base nos itens associados a esse pedido.
CREATE OR REPLACE PROCEDURE novo_valor_total(p_id_pedido IN number) 
IS 
cursor c_dados is SELECT * from pedido join itens_pedido on pedido.id_pedido = itens_pedido.id_pedido where pedido.id_pedido = p_id_pedido;
v_total number := 0;
BEGIN
    for v_dado in c_dados LOOP
    v_total := v_total + (v_dado.preco_unitario * v_dado.quantidade);
    END LOOP;
    
    update pedido set valor_total = v_total where id_pedido = p_id_pedido;
END novo_valor_total;
 
EXEC novo_valor_total(1);


-- Crie também uma função PL/SQL chamada aplica_desconto que recebe o valor total de um pedido como parâmetro e retorna o valor com um 
--desconto de 15%., gravar na tabela oedido o valor com desconto.
CREATE OR REPLACE FUNCTION aplica_desconto (v_valor_tot_ped IN pedido.valor_total%type) 
RETURN number
IS
    v_tot_descont pedido.valor_total%type; 
BEGIN
    v_tot_descont := v_valor_tot_ped * 0.85;    
RETURN v_tot_descont;
END;
 
 
DECLARE
    v_id pedido.id_pedido%type := &IdPedido;
    v_tot_ped pedido.valor_total%type;
BEGIN
    SELECT valor_total INTO v_tot_ped FROM PEDIDO where id_pedido = v_id;
    UPDATE pedido SET valor_final_desconto = aplica_desconto(v_tot_ped) WHERE id_pedido = v_id;
END;


--RELATÓRIO
select * from pedido;
select * from cliente;
select * from item_pedido;

