set serveroutput on
set verify off

-- Criação da tabela
drop table Notas_Faltas cascade constraints;
create table Notas_Faltas(
    rm number(4) primary key,
    nm_aluno varchar(20) not null,
    nm_disciplina varchar(20) not null,
    carga_hora number(3) not null,
    nota1 number(2,1),
    nota2 number(2,1),
    nota3 number(2,1),
    faltas number(3),
    media number(2,1),
    situacao varchar(20)
);

-- Exercício 01
declare
    v_rm number(4) := &Rm;
    v_nm_aluno varchar(20) := '&NomeAluno';
    v_nm_disciplina varchar(20) := '&NomeDisciplina';
    v_carga_hora number(3) := &CargaHoraria;
    v_nota1 number(2,1) := &Nota1;
    v_nota2 number(2,1) := &Nota2;
    v_nota3 number(2,1) := &Nota3;
    v_faltas number(3) := &Faltas;
    cursor c_existe_rm is select rm from Notas_Faltas where rm = v_rm;
    v_rm_exists v_rm%type;
begin  
    open c_existe_rm;
    fetch c_existe_rm into v_rm_exists;
    if c_existe_rm%found then
        dbms_output.put_line('RM já registrado. Não é possível inserir.');
    else
        INSERT INTO Notas_Faltas (rm, nm_aluno, nm_disciplina, carga_hora, nota1, nota2, nota3, faltas)
        VALUES (v_rm, v_nm_aluno, v_nm_disciplina, v_carga_hora, v_nota1, v_nota2, v_nota3, v_faltas);
    end if;
    close c_existe_rm;
END;

select * from notas_faltas;

-- Definição da função
CREATE OR REPLACE FUNCTION CalcularMedia (v_rm_aluno NUMBER) 
    RETURN NUMBER IS 
    v_media NUMBER(2,1);
BEGIN
    SELECT (nota1 + nota2 + nota3) / 3 INTO v_media FROM Notas_Faltas WHERE rm = v_rm_aluno;
    UPDATE Notas_Faltas SET media = v_media WHERE rm = v_rm_aluno;

    RETURN v_media;
END;

DECLARE
    v_rm_aluno NUMBER(4) := &Rm;
    v_media_result NUMBER(2,1);
BEGIN
    CalcularMedia(v_rm_aluno);
    dbms_output.put_line('ok');
END;


create or replace function Calcula_Media (param_rm NUMBER) 
    RETURN NUMBER IS v_media NUMBER(3,1);
BEGIN
    SELECT (nota1 + nota2 + nota3) / 3 INTO v_media FROM Notas_Faltas WHERE rm = param_rm;

    UPDATE Notas_Faltas SET media = v_media WHERE rm = param_rm;

    RETURN v_media;
END;

declare
    v_rm_aluno NUMBER(4) := &rm_aluno;
begin
    dbms_output.put_line(Calcula_Media(v_rm_aluno));
end;


--Exercício 03
create or replace procedure AtualizaStatus (param_rm number) 
    is v_media number(3,1);
    v_faltas number(3);
    v_carga_hora number(3);
BEGIN
    SELECT media, faltas, carga_hora INTO v_media, v_faltas, v_carga_hora FROM Notas_Faltas WHERE rm = param_rm;
    
    IF v_media >= 7 AND v_faltas < 0.25 * v_carga_hora THEN
        UPDATE Notas_Faltas SET situacao = 'Aprovado' WHERE rm = param_rm;
    ELSIF v_media >= 7 AND v_faltas >= 0.25 * v_carga_hora THEN
        UPDATE Notas_Faltas SET situacao = 'Reprovado por faltas' WHERE rm = param_rm;
    ELSIF v_media < 4 AND v_faltas < 0.25 * v_carga_hora THEN
        UPDATE Notas_Faltas SET situacao = 'Reprovado por notas' WHERE rm = param_rm;
    ELSIF v_media >= 4 AND v_media < 7 AND v_faltas < 0.25 * v_carga_hora THEN
        UPDATE Notas_Faltas SET situacao = 'Dp' WHERE rm = param_rm;
    ELSE
        UPDATE Notas_Faltas SET situacao = 'Reprovado por notas e faltas' WHERE rm = param_rm;
    END IF;
END;

exec AtualizaStatus(1);
