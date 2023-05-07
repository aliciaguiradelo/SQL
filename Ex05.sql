create table cliente5
(cpf_clie number(11) primary key,
nm_clie varchar(200) not null,
email_clie varchar(200) not null)

create table funcionario5
(id_fun number(7) primary key,
nm_fun varchar(200) not null,
salario number(10,2) not null)

create table servico5
(id_servico number(7) primary key,
locar_serv varchar(200) not null,
dt_serv date not null)

create table quarto5
(id_quarto number(7) primary key,
diaria number(10,2) not null,
ds_quarto number(10,2) not null)

create table estadia5
(id_estadia number(7) primary key,
dt_entr date not null,
dt_said date not null)

CREATE TABLE pertence5 (
  id_pertence NUMBER(7) PRIMARY KEY,
  id_estadia NUMBER(7),
  id_quarto NUMBER(7),
  CONSTRAINT fk_estadia FOREIGN KEY (id_estadia) REFERENCES estadia5(id_estadia),
  CONSTRAINT fk_quarto FOREIGN KEY (id_quarto) REFERENCES quarto5(id_quarto)
);




