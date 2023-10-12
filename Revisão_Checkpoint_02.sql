--CURSOR

cursor nome_cursor is select nome_coluna_1, nome_coluna2 from nome_tabela;

variavel_cursor nome_cursor%rowtype

nome_cursor%FOUND T quando fetch retorna alguma linha

nome_cursor%NOTFOUND F quando fetch retorna alguma linha

nome_cursor%ROWCOUNT número de linhas já processadas

nome_cursor%ISOPEN T caso o cursor esteja aberto, F fechado
--LOOP
DECLARE
    CURSOR <NOME-CURSOR> IS <CONSULTA>;
    <VARIAVEL-REGISTRO> <NOME-CURSOR>%ROWTYPE;
BEGIN
    open nome_cursor;
    LOOP
        FETCH nome_cursor into variavel_cursor;
    EXIT WHEN nome_cursor%NOTFOUND;
    
    --
    
    END LOOP;
    CLOSE nome_cursor;
end;

--FOR
DECLARE
    CURSOR <NOME-CURSOR> IS <CONSULTA>;
    <VARIAVEL-REGISTRO> <NOME-CURSOR>%ROWTYPE;
BEGIN
    FOR variavel_cursor in nome_cursor LOOP
        --
    END LOOP;
END;
