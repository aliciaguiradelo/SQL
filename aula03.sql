Aula 03 - 21/08/2023

CP1 - 04/09/2023

set serveroutput on
--Serve para visualizar os dados

set verify off
--Serve para mostrar o resultado direto

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









