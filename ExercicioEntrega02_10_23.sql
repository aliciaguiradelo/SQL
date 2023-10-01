set serveroutput on
set verify off
 
 CREATE TABLE Cliente ( 
 cliente_id NUMBER(3) PRIMARY KEY, 
 nome VARCHAR2(100) 
 ); 
 
 CREATE TABLE ContaCorrente ( 
 conta_id NUMBER(3) PRIMARY KEY, 
 cliente_id NUMBER(3), 
 tipo_conta VARCHAR2(20), 
 saldo NUMBER(10, 2), 
 CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES Cliente (cliente_id) 
 ); 
 
 CREATE TABLE Movimentacao ( 
 movimentacao_id NUMBER(3) PRIMARY KEY, 
 conta_id NUMBER(3), 
 tipo_movimentacao VARCHAR2(1), 
 valor NUMBER(10, 2), 
 data_movimentacao DATE DEFAULT SYSDATE, 
 CONSTRAINT fk_conta FOREIGN KEY (conta_id) REFERENCES ContaCorrente (conta_id) 
 ); 

DECLARE 
    v_cliente_id NUMBER := &IdCliente; 
    v_nome_cliente VARCHAR2(100) := '&NomeCliente'; 
    v_conta_id NUMBER := &IdConta; 
    v_tipo_conta VARCHAR2(20) := '&TipoConta'; 
BEGIN 
    INSERT INTO Cliente (cliente_id, nome) VALUES (v_cliente_id, v_nome_cliente); 
    INSERT INTO ContaCorrente (conta_id, cliente_id, tipo_conta, saldo) VALUES (v_conta_id, v_cliente_id, v_tipo_conta, 0); 
    DBMS_OUTPUT.PUT_LINE('Cliente e conta cadastrados com sucesso.'); 
    DBMS_OUTPUT.PUT_LINE('Cliente ID: ' || v_cliente_id || ' - Cliente NOME: ' || v_nome_cliente); 
    DBMS_OUTPUT.PUT_LINE('Conta ID: ' || v_conta_id || ' - Cliente ID: ' || v_cliente_id || ' - Tipo conta: ' || v_tipo_conta); 
END; 

DECLARE 
    v_conta_id NUMBER := &IdConta; 
    v_valor_saque NUMBER := &ValorSaque; 
    v_saldo_atual NUMBER; 
    v_tipo_conta VARCHAR2(20); 
BEGIN 
    SELECT tipo_conta, saldo INTO v_tipo_conta, v_saldo_atual FROM ContaCorrente WHERE conta_id = v_conta_id; 
    IF v_tipo_conta = 'Especial' AND v_valor_saque <= (v_saldo_atual * 0.5) THEN 
        v_saldo_atual := v_saldo_atual - v_valor_saque; 
        DBMS_OUTPUT.PUT_LINE('Saque realizado com sucesso.'); 
    ELSIF v_tipo_conta = 'B�sica' AND v_valor_saque <= v_saldo_atual THEN 
        v_saldo_atual := v_saldo_atual - v_valor_saque; 
        DBMS_OUTPUT.PUT_LINE('Saque realizado com sucesso.'); 
    ELSE DBMS_OUTPUT.PUT_LINE('Saque n�o permitido'); 
    END IF; 
    
    UPDATE ContaCorrente SET saldo = v_saldo_atual WHERE conta_id = v_conta_id; 
    DBMS_OUTPUT.PUT_LINE('Saldo ap�s o saque: ' || v_saldo_atual); 
END;

DECLARE 
    v_cliente_id NUMBER := &IdCliente; 
    v_conta_id NUMBER := &IdConta; 
    v_tipo_movimentacao VARCHAR2(1) := '&TipoMovimentacao'; 
    v_valor NUMBER := &ValorMovimentacao; v_saldo_atual NUMBER; 
    v_tipo_conta VARCHAR2(20); 
BEGIN 
    SELECT tipo_conta, saldo INTO v_tipo_conta, v_saldo_atual FROM ContaCorrente WHERE conta_id = v_conta_id; 
    IF v_tipo_movimentacao = 'C' THEN 
        v_saldo_atual := v_saldo_atual + v_valor; 
        DBMS_OUTPUT.PUT_LINE('Cr�dito registrado com sucesso.'); 
    ELSIF v_tipo_movimentacao = 'D' THEN 
        IF v_tipo_conta = 'e' OR (v_tipo_conta = 'b' AND v_valor <= v_saldo_atual) THEN 
            v_saldo_atual := v_saldo_atual - v_valor; 
            DBMS_OUTPUT.PUT_LINE('D�bito registrado com sucesso.'); 
        ELSE 
            DBMS_OUTPUT.PUT_LINE('Movimenta��o de d�bito n�o permitida.'); 
        END IF; 
    ELSE DBMS_OUTPUT.PUT_LINE('Tipo de movimenta��o inv�lido. Use "C" para cr�dito ou "D" para d�bito.'); 
    END IF; 
    
    UPDATE ContaCorrente SET saldo = v_saldo_atual WHERE conta_id = v_conta_id; 
    
    DBMS_OUTPUT.PUT_LINE('Saldo atual: ' || v_saldo_atual); 
    
    COMMIT; 
    
    EXCEPTION 
        WHEN DUP_VAL_ON_INDEX THEN
            DBMS_OUTPUT.PUT_LINE('Erro: Valor duplicado encontrado em um campo de chave �nica.');
        
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Nenhum dado encontrado.');
    
      WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Erro: Muitas linhas retornadas.');
END;

select * from cliente;
select * from contacorrente;
select * from movimentacao;