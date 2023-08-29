AULA 01 (07/08) - Introdu��o blocos an�nimos

1o comando a ser executado � um comando de ambiente
Habilitando a sa�da de dados de um bloco pl (n�o quero imprimir em pdf, que ver na tela, por exemplo)

set serveroutput on

1o programa

begin
    dbms_output.put_line('Bloco Ok!');
end;

Trabalhando com vari�veis

declare
    --quando vamos atribuir um valor de n�mero para uma vari�vel, � opcional usar aspas duplas ou simples
    v1 number(2) := 10;
    v2 number(2) := 10;
    re number(3);
begin
    re := v1 + v2;
    dbms_output.put_line(re);
end;

declare
    v1 number(2) := 10;
    v2 number(2) := 10;
    re number(3) := v1 + v2;
begin
    dbms_output.put_line('resultado: '||re);
end;

Entrada de dados via teclado

declare
--declara��o de vm (vari�vel de mem�ria)
-- uso de vari�veis de substitui��o
    v1 number(2) := &Valor_1;
    v2 number(2) := &Valor_2;
--processamento
    re number(3) := v1 + v2;
begin
--sa�da de dados
    dbms_output.put_line('resultado: '||re);
end;

--Exerc�cio 01
declare
    vSalMin number(10,2) := &Valor_1;
--processamento
    re number (10,2) := 1.25*vSalMin;
begin
--sa�da de dados
    dbms_output.put_line('resultado: '||re);
    --
end;
--corre��o 01
begin
    dbms_output.put_line('Sal�rio m�nimo - R$1320,00');
    dbms_output.put_line('Acr�scimo de 25%');
    dbms_output.put_line('Novo sal�rio R$ '||1320*1.25||',00');
end;

--Exerc�cio 02
declare
    vCotacao number(10,2) := &Valor_1;
--processamento
    vValReal number (10,2) := 45*vCotacao;
begin
--sa�da de dados
    dbms_output.put_line('resultado: '||vValReal);
end;
--corre��o 02
declare
    v_real number(8,2) := 45;
    v_cota v_real%type := 4.90;
    v_dolar v_real%type;
begin
    v_dolar := v_real / v_cota;
    dbms_output.put_line('R$ '||v_real||' convertido em D�lar: '||v_dolar);
end;

--Exerc�cio 03
declare
    vCotacao number(10,2) := &Valor_1;
    vValDol number(10,2) := &Valor_2;
--processamento
    vValReal number (10,2) := vCotacao*vValDol;
begin
    dbms_output.put_line('resultado: '||vValReal);
end;
--corre��o03
declare
    v_dolar number(8,2) := 9.18;
    v_cota v_dolar%type := 4.90;
    v_real v_dolar%type;
begin
    v_real := v_dolar * v_cota;
    dbms_output.put_line('US$ '||v_dolar||' convertido em Real: '||v_real);
end;

--Exerc�cio 04
declare
    vCarro number(10,2) := &Valor_1;
    vTotal number (10,2) := vCarro*1.03;
    vParcela number (10,2) := vTotal/10;
begin
    dbms_output.put_line('resultado: '||vParcela);
end;
--corre��o 04
declare
    v_bem number(10,2) := &valor_bem;
    v_parc v_bem%type:= v_bem * 1.03 / 10;
begin
    dbms_output.put_line('Valor do bem R$ '||v_bem);
    dbms_output.put_line('Em 10x com 3% de juros - R$ '||v_parc);
end;


--Exerc�cio 05
declare
    vCarro number(10,2) := &Valor_1;
    vAdian number (10,2) := vCarro - (vCarro*0.2);
    vParc6 number (10,2) := (vAdian*1.10)/6;
    vParc12 number (10,2) := (vAdian*1.15)/12;
    vParc18 number (10,2) := (vAdian*1.20)/18;
begin
    dbms_output.put_line('Parcela em 6x: '||vParc6);
    dbms_output.put_line('Parcela em 12x: '||vParc12);
    dbms_output.put_line('Parcela em 18x: '||vParc18);
end;
--corre��o05


Aula 02 - 14/08/2023
--A heran�a � em tipo e3 tamanho
set  verify off

--Estrutura de decis�o
if - then - elsif - else - end if

If <condi��o> then <instru��es>;
Elsif <condi��o> then <instru��es>;
Else <instru��es>;
End if;


--Exerc�cio 06
declare
    v_sexo varchar(1) :=upper('&Informe_Seu_Sexo');
begin
    if v_sexo = 'F' then 
        dbms_output.put_line('Feminino');
    elsif v_sexo = 'M' then 
            dbms_output.put_line('Masculino');
    else 
        dbms_output.put_line('Outros');
    end if;
end;

set serveroutput on

--Exerc�cio 07
declare
    v_carro numbver(10,2) := 10000 * 0.8;
    v_presta v_carro%type := &prestacao;
begin
    if v_presta = 6 then
        v_presta := (v_carro *1.1)/6;
        dbms_output.put_line('Valor da presta��o em 6x: ' || v_presta);
        

--Exerc�cio 08
declare
    nota1 number := &Informe_Nota1;
    nota2 number := &Informe_Nota2;
    nota3 number := &Informe_Nota3;
    global number := &Informe_global;
    challenge number := &Informe_challenge;
    menor number;
    media number;
    media_semestre number;
begin
    -- Encontrar a menor nota
    if nota1 <= nota2 and nota1 <= nota3 then
        menor := nota1;
    elsif nota2 <= nota1 and nota2 <= nota3 then
        menor := nota2;
    else
        menor := nota3;
    end if;

    -- Calcular a m�dia das duas maiores notas
    if nota1 = menor then
        media := (nota2 + nota3) / 2;
    elsif nota2 = menor then
        media := (nota1 + nota3) / 2;
    else
        media := (nota1 + nota2) / 2;
    end if;
    
    media_semestre := (media * 0.2) + (challenge*0.2) + (global*0.6);
    
    dbms_output.put_line('M�dia dos cps: ' || media);
    dbms_output.put_line('M�dia semestral: ' || media_semestre);

end;






