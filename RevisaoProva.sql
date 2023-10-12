set serveroutput on
set serveroutput on

declare
    num number(3) := &DigiteUmNumero;
begin
    FOR V_CONTADOR IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE(V_CONTADOR||' X '||num||' = '||v_contador * num);
    END LOOP;
end;

declare
    n_inicio number(3) := &ValorInicio;
    n_fim n_inicio%type := &ValorFim;
begin
    
    
    
    
    