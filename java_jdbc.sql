CREATE TABLE TB_USUARIO(
  ID   INT          NOT NULL PRIMARY KEY,
 NOME VARCHAR(255) NOT NULL
);

CREATE TABLE TB_ALUNO(
  ID   NUMBER(5)          NOT NULL PRIMARY KEY,
  NOME VARCHAR (255)    NOT NULL,
  RA   NUMBER(5)          NOT NULL,
  CURSO VARCHAR(255)   NOT NULL
);

select * from tb_aluno

select max(id) as id from tb_aluno

--banco temporário para 4 sprint do challenge
create table tb_categoria(
id_cat varchar (10) not null primary key,
descricao varchar(500) not null);

select * from tb_categoria

create table tb_setor(
id_set varchar (10) not null primary key,
descricao varchar(20) not null);
