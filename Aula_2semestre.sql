AULA 01 (07/08) - Introdução blocos anônimos

1o comando a ser executado é um comando de ambiente

set serveroutput on
set verify off

A) Estrutura
Declare - opcional
begin - obrigatória
exception - opcional
end; obrigatória

1o programa
--exemplo 1
begin
    dbms_output.put_line('Bloco Ok!');
end;
--exemplo 2
begin
    dbms_output.put_line(12+45);
end;


B) Trabalhando com variáveis
--exemplo 3 com variáveis
declare
    --quando vamos atribuir um valor de número para uma variável, é opcional usar aspas duplas ou simples
    v1 number(2) := 10;
    v2 number(2) := 10;
    re number(3);
begin
    re := v1 + v2;
    dbms_output.put_line('Resultado: '||re);
end;
--exemplo 4 refatorando o anterior
declare
    v1 number(2) := 10;
    v2 number(2) := 10;
    re number(3) := v1 + v2;
begin
    dbms_output.put_line('resultado: '||re);
end;

C) Usando herança
declare 
--declarando variaveis
    n1 number(2) := 10;
    n2 n1%type := 10;
    re n1%type := n1 + n2;
--inicio do prg
begin
--saida de dados
    dbms_output.put_line('Resultado: '||re);
--finalizando
end;

D) Entrada de dados via teclado

declare
--declaração de vm (variável de memória)
-- uso de variáveis de substituição
    v1 number(2) := &Valor_1;
    v2 v1%type := &Valor_2;
--processamento
    re v1%type := v1 + v2;
begin
--saída de dados
    dbms_output.put_line('resultado: '||re);
end;

--Exercício 01
declare
    vSalMin number(10,2) := &Valor_1;
--processamento
    re number (10,2) := 1.25*vSalMin;
begin
--saída de dados
    dbms_output.put_line('resultado: '||re);
    --
end;
--correção 01
begin
    dbms_output.put_line('Salário mínimo - R$1320,00');
    dbms_output.put_line('Acréscimo de 25%');
    dbms_output.put_line('Novo salário R$ '||1320*1.25||',00');
end;

declare
    sal_atual number(8,2) := 1320;
    
--iniciando programa
begin
--exibindo resultado
dbms_output.put_line('* 25% de acréscimo no mínimo');
dbms_output.put_line('R$ :'||sal_atual * 1.25);
--finalizando programa
end;

--Exercício 02
declare
    vCotacao number(10,2) := &Valor_1;
--processamento
    vValReal number (10,2) := 45*vCotacao;
begin
--saída de dados
    dbms_output.put_line('resultado: '||vValReal);
end;
--correção 02
declare
    v_real number(8,2) := 45;
    v_cota v_real%type := 4.90;
    v_dolar v_real%type;
begin
    v_dolar := v_real / v_cota;
    dbms_output.put_line('R$ '||v_real||' convertido em Dólar: '||v_dolar);
end;

--Exercício 03
declare
    vCotacao number(10,2) := &Valor_1;
    vValDol number(10,2) := &Valor_2;
--processamento
    vValReal number (10,2) := vCotacao*vValDol;
begin
    dbms_output.put_line('resultado: '||vValReal);
end;
--correção03
declare
    v_dolar number(8,2) := 9.18;
    v_cota v_dolar%type := 4.90;
    v_real v_dolar%type;
begin
    v_real := v_dolar * v_cota;
    dbms_output.put_line('US$ '||v_dolar||' convertido em Real: '||v_real);
end;

--Exercício 04
declare
    vCarro number(10,2) := &Valor_1;
    vTotal number (10,2) := vCarro*1.03;
    vParcela number (10,2) := vTotal/10;
begin
    dbms_output.put_line('resultado: '||vParcela);
end;
--correção 04
declare
    v_bem number(10,2) := &valor_bem;
    v_parc v_bem%type:= v_bem * 1.03 / 10;
begin
    dbms_output.put_line('Valor do bem R$ '||v_bem);
    dbms_output.put_line('Em 10x com 3% de juros - R$ '||v_parc);
end;


--Exercício 05
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
--correção05


Aula 02 - 14/08/2023 - Breve revisão blocos anônimos
--A herança é feita em tipo de variável e tamanho
set  verify off
set serveroutput on

--Estrutura de decisão
if - then - elsif - else - end if

If <condição> then <instruções>;
Elsif <condição> then <instruções>;
Else <instruções>;
End if;


--Exercício 06
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

--Exercício 07
declare
    v_carro numbver(10,2) := 10000 * 0.8;
    v_presta v_carro%type := &prestacao;
begin
    if v_presta = 6 then
        v_presta := (v_carro *1.1)/6;
        dbms_output.put_line('Valor da prestação em 6x: ' || v_presta);
        

--Exercício 08
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

    -- Calcular a média das duas maiores notas
    if nota1 = menor then
        media := (nota2 + nota3) / 2;
    elsif nota2 = menor then
        media := (nota1 + nota3) / 2;
    else
        media := (nota1 + nota2) / 2;
    end if;
    
    media_semestre := (media * 0.2) + (challenge*0.2) + (global*0.6);
    
    dbms_output.put_line('Média dos cps: ' || media);
    dbms_output.put_line('Média semestral: ' || media_semestre);

end;


Aula 03 - 21/08/2023

CP1 - 04/09/2023 - estrutura de decisão
                    carga de dados - bloco tabela
                    carga de dados - tabela bloco

set serveroutput on
--Serve para visualizar os dados

set verify off
--Serve para mostrar o resultado direto

desc produto;

drop table produto cascade constraints;

create table TB_ALUNO3 (
ra char(9),
nome varchar2(50),
constraint aluno_pk primary key (ra));

insert into TB_ALUNO3 (ra,nome) values ('111222333','Antonio Aves');
insert into TB_ALUNO3 (ra,nome) values ('444555666','Clara Aves');
insert into TB_ALUNO3 (ra,nome) values ('777888999','Fernanda Aves');

begin
    insert into TB_ALUNO3 (ra,nome) values ('123123123','Antonio Aves');
    insert into TB_ALUNO3 (ra,nome) values ('456456456','Clara Aves');
    insert into TB_ALUNO3 (ra,nome) values ('789789789','Fernanda Aves');

end;


declare
    v_ra char(9) := '123123123';
    v_nome varchar2(50);
begin
    select nome into v_nome from TB_ALUNO3 where ra=v_ra;
    dbms_output.put_line ('O nome do aluno é:' || v_nome);
end;


declare
    v_ra char(9) := '789452365';
    v_nome varchar2(50):= 'Daniela Dorneles';
begin
    insert into TB_ALUNO3(ra,nome) values (v_ra,v_nome);
end;

SELECT * FROM TB_ALUNO3


declare
    v_ra char(9) := '111222333';
    v_nome varchar2(50) := 'Arthur Foschiani';
begin
    update TB_ALUNO3 set nome=v_nome where ra=v_ra;
end;

declare
    v_ra char(9) := '777888999';
begin
    delete from TB_ALUNO3 where ra=v_ra;
end;


create table tb_produto3(
id_pro number(3) primary key,
ds_pro varchar2(30)not null unique,
pr_pro number(8,2) not null,
qtd_pro number(8,2) not null);


begin
    insert into tb_produto3 values (1, 'Pneu', 350.56, 100);
    insert into tb_produto3 values (2, 'Multimidia', 2380.6, 5);
    insert into tb_produto3 values (3, 'Chaveiro', 12.4, 150);
    commit;
end;

declare
    v_opcao varchar2(1) := '&Opcao1vender2comprar';
    v_idpro number(3) := &cd_produto;
    v_compra number(10,2) := &qtd_compra;
    v_dspro  varchar2(30);
    v_prpro  number(10,2);
    v_total  number(12,2);
    v_qtdpro number(10,2);
begin
    select ds_pro, pr_pro, qtd_pro into v_dspro, v_prpro, v_qtdpro
    from tb_produto3 where id_pro = v_idpro;
    v_total := v_compra * v_prpro;
    
    if v_opcao = '1' then
        update tb_produto3 set qtd_pro = qtd_pro + v_compra
        where id_pro = v_idpro;
        
        dbms_output.put_line('Descrição do produto: '||v_dspro);
        dbms_output.put_line('Preço do produto: '||v_prpro);
        dbms_output.put_line('Qtd comprada: '||v_compra);
        dbms_output.put_line('Total da compra - R$: '||v_total);
    
    elsif v_opcao = '2' then
        if v_compra <= v_qtdpro then
            update tb_produto3 set qtd_pro = qtd_pro - v_compra
            where id_pro = v_idpro;
            
            dbms_output.put_line('Descrição do produto: '||v_dspro);
            dbms_output.put_line('Preço do produto: '||v_prpro);
            dbms_output.put_line('Qtd comprada: '||v_compra);
            dbms_output.put_line('Total da compra - R$: '||v_total);
        else
            dbms_output.put_line('Não há saldo suficiente em estoque');
        end if;
        
    else
        dbms_output.put_line('Opção inválida');
    end if;
end;


Aula 04 - 28/08/2023 - Estrutura de repetição

set serveroutput on
set verify off

ESTRUTURA DE REPETIÇÃO => LOOP

Declare
    v_contador number(2):=1;
Begin
    LOOP
        dbms_output.put_line(v_contador);
        v_contador := v_contador + 1;
        exit when v_contador > 20;
    END LOOP;
end;

WHILE

declare
    v_contador number(2):=1

FOR

--estrutura

for <contador> in <valor inicial> .. <valor final>
loop
    <instruções>
end loop;

--exemplo

Begin 
    for v_contador in 1..20 loop
        dbms_output.put_line(v_contador);
    end loop;
end;

Begin 
    for v_contador in reverse 1..20 loop
        dbms_output.put_line(v_contador);
    end loop;
end;

--tabuada
declare 
    v_tabu number(3) := &tabuada;
    v_cont number(2) := 0;
begin
    loop
        dbms_output.put_line(v_tabu||' X '||v_cont||' = '||(v_tabu * v_cont));
        v_cont := v_cont + 1;
        exit when v_cont > 10;
    end loop;
end;

declare 
    v_tabu number(3) := &tabuada;
    v_cont number(2) := 0;
begin
    while v_cont <= 10 loop
        dbms_output.put_line(v_tabu||' X '||v_cont||' = '||(v_tabu * v_cont));
        v_cont := v_cont + 1;
    end loop;
end;

declare
    v_tabu number(3) := &tabuada;
begin
    for v_cont in 0..10 loop
        dbms_output.put_line(v_tabu||' X '||v_cont||' = '||(v_tabu * v_cont));
    end loop;
end;

--exercício 02
declare
    v_menor number(3) := &menor;
    v_maior v_menor%type := &maior;
    v_par v_menor%type := 0;
    v_impar v_menor%type := 0;
begin
    for v_conta in v_inicio..v_fim loop
        if mod(v_conta,2) = 0 then
            v_par := v_par + 1;
        else
            v_impar := v_impar + 1;
        end if;
    end loop;
dbms_output.put_line('Total par(es): '|| v_par);
dbms_output.put_line('Total impar(es): '|| v_impar);
end;
    

declare
    v_menor number(3) := &menor;
    v_maior v_menor%type := &maior;
    v_par v_menor%type := 0;
    v_impar v_menor%type := 0;
begin
    for v_conta in v_inicio..v_fim loop
        if mod(v_conta,2) = 0 then
            v_par := v_par + 1;
        else
            v_impar := v_impar + 1;
        end if;
    end loop;
dbms_output.put_line('Total par(es): '|| v_par);
dbms_output.put_line('Total impar(es): '|| v_impar);
end
    
    
    
REVISÃO
Declare - opcional
begin - obrigatória
exception - opcional
end; obrigatória

v1 number(2) := &Valor_1;
v2 v1%type := &Valor_2;

If – then - elsif – then – else – end if
IF <condição> THEN
<instruções>;
ELSIF <condição> THEN
<instruções>;
ELSE
<instruções>;
END IF;
    
--select    
DECLARE
V_RA CHAR(9) := '333444555';
V_NOME VARCHAR2(50);
BEGIN
SELECT NOME INTO V_NOME FROM ALUNO WHERE RA = V_RA;
DBMS_OUTPUT.PUT_LINE ('O nome do aluno é: ' || V_NOME);
END;    
--insert
DECLARE
V_RA CHAR(9) := ‘444555666’;
V_NOME VARCHAR2(50) := ‘Daniela Dorneles’;
BEGIN
INSERT INTO ALUNO (RA,NOME) VALUES (V_RA,V_NOME);
END;
--update
DECLARE
V_RA CHAR(9) := ‘111222333’;
V_NOME VARCHAR2(50) := ‘Antonio Rodrigues’;
BEGIN
UPDATE ALUNO SET NOME = V_NOME WHERE RA = V_RA;
END;
--delete
DECLARE
V_RA CHAR(9) := ‘444555666’;
BEGIN
DELETE FROM ALUNO WHERE RA = V_RA;
END;

--loop
Loop
< instrução(ões) >
Exit when < condição >
End loop;
--while
WHILE < condição> LOOP
< instrução(ões) >;
END LOOP;
--for
FOR < contador> IN <valor inicial> .. <valor final>
LOOP
< instrução (ões) >;
END LOOP;
BEGIN
FOR V_CONTADOR IN 1..20 LOOP
DBMS_OUTPUT.PUT_LINE(V_CONTADOR);
END LOOP;
END;
--for reverse
Estrutura de repetição: for - reverse
BEGIN
FOR V_CONTADOR IN REVERSE 1..20 LOOP
DBMS_OUTPUT.PUT_LINE(V_CONTADOR);
END LOOP;
END;
    
    
AULA 06 - 11/09/2023 - Cursores

--teoria


--exercício 01
create table tb_func(
cd_fun number(5),
nm_fun varchar(30),
salario number (8,2),
dt_adm date);

insert into tb_func values (1, 'Marcel', 1000,  TO_DATE('2000-04-17', 'YYYY-MM-DD'));
insert into tb_func values (2, 'Claudia', 1600,  TO_DATE('1998-10-02', 'YYYY-MM-DD'));
insert into tb_func values (3, 'Joaquim', 5500,  TO_DATE('2010-07-10', 'YYYY-MM-DD'));
insert into tb_func values (4, 'Valeria', 7300,  TO_DATE('2015-06-08', 'YYYY-MM-DD'));

select * from tb_func

--exercício 02

declare
    v_id number(5) := &IdFunc;
    v_nome VARCHAR2(30);
    v_salario number (8,2);
begin
    select nm_fun, salario into v_nome, v_salario from tb_func where cd_fun = v_id;
    dbms_output.put_line('NOME: '||v_nome||' SALARIO: '|| v_salario);
end;

declare
    cursor c_exibe is select nm_fun, salario from tb_func;
    v_exibe c_exibe%rowtype;
begin
    open c_exibe;
    loop
        fetch c_exibe into v_exibe;
    exit when c_exibe%notfound;
    dbms_output.put_line('NOME: '||v_exibe.nm_fun||' SALARIO: '|| v_exibe.salario);
    end loop;
    close c_exibe;
end;
    
declare
    cursor c_exibe is select nm_fun, salario from tb_func;
begin
    for v_exibe in c_exibe loop
        dbms_output.put_line('NOME: '||v_exibe.nm_fun||' SALARIO: '|| v_exibe.salario);
    end loop;
end;
    

--exercício 03
ALTER TABLE tb_func ADD tempo NUMBER;

DECLARE
    CURSOR c_exibe IS
        SELECT * FROM tb_func;
BEGIN
    FOR v_exibe IN c_exibe LOOP
        update tb_func set tempo = sysdate - v_exibe.dt_adm where cd_fun = v_exibe.cd_fun;
    END LOOP;
END;

--exercício 04
DECLARE
    CURSOR c_exibe IS
        SELECT * FROM tb_func;
BEGIN
    FOR v_exibe IN c_exibe LOOP
        IF v_exibe.tempo >= 150 THEN
            -- Atualiza o salário multiplicando por 1.1
            UPDATE tb_func
            SET salario = salario * 1.1
            WHERE CURRENT OF c_exibe;
        END IF;
        dbms_output.put_line('NOME: '||v_exibe.nm_fun||' SALARIO: '|| v_exibe.salario, ' TEMPO: '|| v_exibe.tempo);
    END LOOP;
END;

--exercício 05
DECLARE
    CURSOR c_exibe IS
        SELECT * FROM tb_func;
    n_meses number(5);
BEGIN
    FOR v_exibe IN c_exibe LOOP
    select months_between(sysdate, dt_adm) into n_meses from tb_func
    where cd_fun = v_exibe.cd_fun;
    if n_meses >= 150 then
    update tb_func set salario = salario * 1.1 where cd_fun = v_exibe.cd_fun; 
    else
    update tb_func set salario = salario * 1.05 where cd_fun = v_exibe.cd_fun;
    end if;
    end loop;
end;
    


AULA 07 - 18/09/2023 - Cursores

CHECKPOINT 02 - 09/10/2023











