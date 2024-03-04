SET SERVERPOUTPUT ON


1. FUNÇÕES
passo parametros e me retorna uma informação

CREATE OR REPLACE FUNCTION nome_function
(p_id IN nome_tabela.ID%type)

RETURN nome_tabela.nome_tabela%type

IS 
 v_nome_variavel nome_tabela.nome_tabela%type

BEGIN

    return v_nome_variavel;

END;





2. PROCEDURE
uma caixa preta que passa parâmetros e executa

CREATE PROCEDURE nome_procedure 
(p_nomevariavel IN NUMBER, p_nomevariavel IS VARCHAR2)

IS 

BEGIN

END;

EXECUTE nome_procedure(1, 'conteudo');


3.CURSOR
DECLARE
    V_ID
    V_RAZAO_SOCIAL
    CURSOR C_NOMECURSOR IS SELECT ID, RAZAO_SOCIAL FROM CLIENTE;
BEGIN
    OPEN C_NOMECURSOR;
    LOOP
        FETCH C_NOMECURSOR INTO V_ID, V_RAZAO_SOCIAL;
    
    EXIT WHEN C_NOMECURSOR%NOTFOUND;
    
    END LOOP;
    
END;




DICAS

select * from nome_tabela where UPPER(coluna_descrição) = 'ATACADO'

update nome_tabela set nome_campo = V_descricao where id = v_id;

UPDATE PRODUTO_EXERCICIO SET DESCRICAO = REPLACE(DESCRICAO,'-','>');

delete from nome_tabela where id = v_id;

create or replace ... procedure function



V_DESCRICAO NOME_TABELA.DESCRICAO%TYPE;

SELECT DESCRICAO INTO V_DESCRICAO FROM NOME_TABELA WHERE ID = V_ID
COLOCANDO UMA CONSULTA/QUERY DENTRO DE UMA VARIÁVEL