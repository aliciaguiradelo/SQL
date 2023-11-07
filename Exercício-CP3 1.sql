--Alicia Guiradelo - 96960
--Arthur Foschiani - 96525

set serveroutput on
--Serve para visualizar os dados

set verify off
--Serve para mostrar o resultado direto

DROP TABLE Notas_Faltas CASCADE CONSTRAINTS;

CREATE TABLE Notas_Faltas (
    rm NUMBER(4) PRIMARY KEY,
    nm_aluno VARCHAR(20) NOT NULL,
    nm_disciplina VARCHAR(20) NOT NULL,
    carga_hora NUMBER(3) NOT NULL,
    nota1 NUMBER(3, 1),
    nota2 NUMBER(3, 1),
    nota3 NUMBER(3, 1),
    faltas NUMBER(3),
    media NUMBER(3, 1),
    situacao VARCHAR2(30)
);

INSERT INTO Notas_Faltas (rm, nm_aluno, nm_disciplina, carga_hora, nota1, nota2, nota3, faltas) VALUES
(1, 'Marcel', 'DBA', 120, 10, 10, 10, 0);

INSERT INTO Notas_Faltas (rm, nm_aluno, nm_disciplina, carga_hora, nota1, nota2, nota3, faltas) VALUES
(2, 'Marcel', 'IA', 120, 1.5, 1.5, 1.5, 70);

commit;

SELECT * from Notas_Faltas;


--Exercício 01
DECLARE
    v_rm NUMBER(4) := &rm;
    v_nm_aluno VARCHAR(20) := '&nm_aluno';
    v_nm_disciplina VARCHAR(20) := '&nm_disciplina';
    v_carga_hora NUMBER(3) := &carga_hora;
    v_nota1 NUMBER(3, 1) := &nota1;
    v_nota2 NUMBER(3, 1) := &nota2;
    v_nota3 NUMBER(3, 1) := &nota3;
    v_faltas NUMBER(3) := &faltas;
BEGIN
    INSERT INTO Notas_Faltas (rm, nm_aluno, nm_disciplina, carga_hora, nota1, nota2, nota3, faltas)
    VALUES (v_rm, v_nm_aluno, v_nm_disciplina, v_carga_hora, v_nota1, v_nota2, v_nota3, v_faltas);
    
    EXCEPTION
        when DUP_VAL_ON_INDEX then
        dbms_output.put_line('Não é permito RM repetido.');
END;

--Exercício 02
CREATE OR REPLACE FUNCTION CalcularMedia (p_rm NUMBER) 
    RETURN NUMBER IS
    v_media NUMBER(3,1);
BEGIN
    SELECT (nota1 + nota2 + nota3) / 3 INTO v_media
    FROM Notas_Faltas
    WHERE rm = p_rm;

    UPDATE Notas_Faltas
    SET media = v_media
    WHERE rm = p_rm;

    COMMIT;

    RETURN v_media;
END;

declare
    v_rm_aluno NUMBER(4) := &rm_aluno;
begin
    dbms_output.put_line(CalcularMedia(v_rm_aluno));
end;

--Exercício 03
CREATE OR REPLACE PROCEDURE InserirSituacao (p_rm NUMBER) IS
    v_media NUMBER(3,1);
    v_faltas NUMBER(3);
    v_carga_hora NUMBER(3);
BEGIN
    SELECT media, faltas, carga_hora INTO v_media, v_faltas, v_carga_hora
    FROM Notas_Faltas
    WHERE rm = p_rm;

    IF v_media >= 7 AND v_faltas < 0.25 * v_carga_hora THEN
        UPDATE Notas_Faltas
        SET situacao = 'Aprovado'
        WHERE rm = p_rm;
    ELSIF v_media >= 7 AND v_faltas >= 0.25 * v_carga_hora THEN
        UPDATE Notas_Faltas
        SET situacao = 'Reprovado por faltas'
        WHERE rm = p_rm;
    ELSIF v_media < 4 AND v_faltas < 0.25 * v_carga_hora THEN
        UPDATE Notas_Faltas
        SET situacao = 'Reprovado por notas'
        WHERE rm = p_rm;
    ELSIF v_media >= 4 AND v_media < 7 AND v_faltas < 0.25 * v_carga_hora THEN
        UPDATE Notas_Faltas
        SET situacao = 'Dp'
        WHERE rm = p_rm;
    ELSE
        UPDATE Notas_Faltas
        SET situacao = 'Reprovado por notas e faltas'
        WHERE rm = p_rm;
    END IF;

    COMMIT;
END;

EXEC InserirSituacao(1);

SELECT * from Notas_Faltas;