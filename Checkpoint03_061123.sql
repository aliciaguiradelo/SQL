--Alícia Guiradelo - 96960
--Arthur Foschiani - 96525
--Bruna Menegatti - 96848
 
set serveroutput on
 
set verify off
 
DROP TABLE produto CASCADE CONSTRAINTS;
 
CREATE TABLE produto (
    produto_id NUMBER(2) PRIMARY KEY,
    nome VARCHAR2(50),
    quantidade NUMBER(6,2),
    preco NUMBER(6,2)
);
 
INSERT INTO produto VALUES (1, 'Produto A', 10, 50);
INSERT INTO produto VALUES (2, 'Produto B', 5, 30);
INSERT INTO produto VALUES (3, 'Produto C', 8, 40);
 
COMMIT;
 
SELECT * FROM produto;
 
declare
    cod_produto NUMBER(2) := &codigo_produto;
    quant_produto NUMBER(6,2) := &quantidade_produto;
    v_nome VARCHAR2(50);
    v_quantidade NUMBER(6,2);
    v_preco NUMBER(6,2);
    v_compra NUMBER(8,2);
    v_liquido NUMBER(8,2);
    ESTOQUE_INDISPONIVEL exception;
begin
    SELECT nome, quantidade, preco into v_nome, v_quantidade, v_preco from produto where produto_id = cod_produto;
    IF v_quantidade < quant_produto THEN
        RAISE ESTOQUE_INDISPONIVEL;
    END IF;
    UPDATE produto
    SET quantidade = v_quantidade - quant_produto
    WHERE produto_id = cod_produto;
    COMMIT;
    v_compra := v_preco * quant_produto;
    IF v_compra > 500 THEN
        v_liquido := v_compra * 0.9;
        DBMS_OUTPUT.PUT_LINE('Código produto: ' || cod_produto || ' - Quantidade comprada: ' || quant_produto || ' - Desconto: ' || v_compra * 0.1 || ' - Total da compra: R$ ' || v_liquido);
    ELSIF v_compra > 200 THEN
        v_liquido := v_compra * 0.95;
        DBMS_OUTPUT.PUT_LINE('Código produto: ' || cod_produto || ' - Quantidade comprada: ' || quant_produto || ' - Desconto: ' || v_compra * 0.05 || ' - Total da compra: R$ ' || v_liquido);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Código produto: ' || cod_produto || ' - Quantidade comprada: ' || quant_produto || ' - Desconto: Sem desconto - Total da compra: R$ ' || v_compra);
    END IF;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Código inexistente.');
        WHEN ESTOQUE_INDISPONIVEL THEN
            DBMS_OUTPUT.PUT_LINE('Sem estoque.');
end;