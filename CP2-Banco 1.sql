--Alicia Guiradelo - 96960
--Arthur Foschiani - 96525

set serveroutput on
--Serve para visualizar os dados

set verify off
--Serve para mostrar o resultado direto

create table Tecnico (
    id_tec number(3) primary key,
    nome_tec varchar(25) not null
);

create table Ordem_Servico (
    id_os number(3) primary key,
    data_abertura date,
    vlr_por_hora number(5,2)
);

create table Aloca (
    dt_fim date,
    dias_trabalhados number(4),
    id_tec number(3) references Tecnico,
    id_os number(3) references Ordem_Servico
);

declare
    v_id_tec number(3) := &id_tec;
    v_nome_tec varchar(25) := '&nome_tec';
    v_id_os number(3) := &id_os;
    v_vlr_hora number(5,2) := &vlr_hora_OS;
    v_data_abertura date := '&dt_abertura_OS';
    v_data_fim date := '&dt_fim';
    v_dias_trabalhados number(8);
    v_id_tec_aloca number(3) := &id_tec_alocado;
    v_id_os_aloca number(3) := &id_os_alocado;
    v_count number(3);
    EXISTE_TEC EXCEPTION;
    EXISTE_OS EXCEPTION;
    EXISTE_ALOCA EXCEPTION;
begin
    select count(id_tec) into v_count from Tecnico where id_tec = v_id_tec;
    if v_count > 0 then
        raise EXISTE_TEC;
    end if;
    insert into Tecnico (id_tec, nome_tec) values (v_id_tec, v_nome_tec);
    
    select count(id_os) into v_count from Ordem_Servico where id_os = v_id_os;
    if v_count > 0 then
        raise EXISTE_OS;
    end if;
    insert into Ordem_Servico (id_os, data_abertura, vlr_por_hora) values (v_id_os, v_data_abertura, v_vlr_hora);
    
    select count(*) into v_count from Aloca where id_os = v_id_os_aloca and id_tec = v_id_tec_aloca;
    if v_count > 0 then
        raise EXISTE_ALOCA;
    end if;
    v_dias_trabalhados := v_data_fim - v_data_abertura;
    insert into Aloca (dt_fim, dias_trabalhados, id_tec, id_os) values (v_data_fim, v_dias_trabalhados, v_id_tec_aloca, v_id_os_aloca);
    commit;
    
    EXCEPTION
	WHEN EXISTE_TEC THEN
		DBMS_OUTPUT.PUT_LINE('Este técnico já existe');
    WHEN EXISTE_OS THEN
		DBMS_OUTPUT.PUT_LINE('Esta Ordem de Serviço já existe');
    WHEN EXISTE_ALOCA THEN
		DBMS_OUTPUT.PUT_LINE('Esta alocação já existe');
    when others then
        DBMS_OUTPUT.PUT_LINE('Aconteceu algum erro');
end;

declare
    v_id_tec number(3) := &Id_tec;
    cursor c_exibe is select * from Aloca where id_tec = v_id_tec ;
    v_exibe c_exibe%rowtype;
    v_salario_tec number(5,2);
    v_nome_tec varchar(50);
    v_status varchar(50);
begin
    FOR V_exibe IN C_exibe LOOP
        if V_exibe.dt_fim >= sysdate then
            v_status := 'Está nessa OS atualmente!!';
        else
            v_status := 'Não atua mais nessa OS!!';
        end if;
        DBMS_OUTPUT.PUT_LINE('Id da OS: '|| V_exibe.id_os ||' dias trabalhados: '|| V_exibe.dias_trabalhados || ' data fim: ' || V_exibe.dt_fim || ' Status Atual OS: ' || v_status);
        select vlr_por_hora into v_salario_tec from Ordem_Servico where id_os = v_exibe.id_os;
        select nome_tec into v_nome_tec from Tecnico where id_tec = v_id_tec;
        DBMS_OUTPUT.PUT_LINE(' Salario mensal: R$'|| v_salario_tec * 8 * 23 || ' Salario por dia: R$'|| v_salario_tec * 8 || ' Salario por hora: R$'|| v_salario_tec);
        DBMS_OUTPUT.PUT_LINE(' Nome Técnico: '|| v_nome_tec);
    END LOOP;
END;

declare
    v_id_os number(3) := &Id_OS;
    cursor c_exibe is select * from Aloca where id_os = v_id_os ;
    v_exibe c_exibe%rowtype;
    v_salario_tec number(5,2);
    v_nome_tec varchar(50);
    v_status varchar(50);
begin
    FOR V_exibe IN C_exibe LOOP
        if V_exibe.dt_fim >= sysdate then
            v_status := 'Está nessa OS atualmente!!';
        else
            v_status := 'Não atua mais nessa OS!!';
        end if;
        DBMS_OUTPUT.PUT_LINE('Id do técnico: '|| v_exibe.id_tec ||' | Dias tarbalhados: '|| v_exibe.dias_trabalhados || ' Status Atual OS: ' || v_status );
        select vlr_por_hora into v_salario_tec from Ordem_Servico where id_os = V_exibe.id_os;
        select nome_tec into v_nome_tec from Tecnico where id_tec = V_exibe.id_tec;
        DBMS_OUTPUT.PUT_LINE(' Salario mensal: R$'|| v_salario_tec * 8 * 23 || ' Salario por dia: R$'|| v_salario_tec * 8 || ' Salario por hora: R$'|| v_salario_tec);
        DBMS_OUTPUT.PUT_LINE(' Nome Técnico: '|| v_nome_tec);
    END LOOP;
END;