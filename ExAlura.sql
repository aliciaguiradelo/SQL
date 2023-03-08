/*Criando uma tabela
Após o comando create table, abrimos parênteses para colocar as informações 
sobre as colunas/campos dessa tabela*/
/*Para criar uma coluna eu coloco o nome dela, o tipo de dados e o tipo de chave se houver*/
create table tb_clientes
(
cpf varchar2(11),
nome varchar2(100),
endereco1 varchar2(150),
endereco2 varchar2(150),
bairro varchar2(50),
estado varchar2(2),
cep VARCHAR2 (8),
data_nascimento date,
idade integer,
sexo varchar2(1),
limite_cartao number (15,2),
volume_compra number,
primeira_compra number(1)
);

create table tb_vendedores
(
matricula varchar2 (5) primary key,
nome varchar2 (100),
data_admissao date,
percentual_comissao number(12,2)
);

create table tb_produtos
(
produto varchar2(20),
nome varchar2(150),
embalagem varchar2(50),
tamanho varchar2(50),
sabor varchar2 (50),
preco_lista number
);

/*Criando mais uma tabela para treinar drop table*/
create table tb_produtos2
(
produto varchar2(20),
nome varchar2(150),
embalagem varchar2(50),
tamanho varchar2(50),
sabor varchar2 (50),
preco_lista number
);

/*DROP TABLE*/
drop table tb_produtos2;
drop TABLE produto1_tb;
/*Resultado: Table TB_PRODUTOS2 eliminado.*/

/*INSERT INTO*/
insert into tb_produtos
(produto, nome, embalagem, tamanho, sabor, preco_lista)
values
('1040107','Light - 350 ml - Melância','Lata','350mL','Melância', 4.56);
/*Resultado: 1 linha inserida.*/

insert into tb_vendedores
(matricula, nome, data_admissao, percentual_comissao)
values
('00233','Joao Geraldo da Fonseca','01/12/2015',0.10);  

/*SELECT*/
/*select * from tb_produtos;*/

insert into tb_produtos
(produto, nome, embalagem, tamanho, sabor, preco_lista)
values
('1037797','Clean - 2 Litros - Laranja','PET','2 Litros','Melância', 14.56);

insert into tb_produtos
(produto, nome, embalagem, tamanho, sabor, preco_lista)
values
('1042712','Linha Refrescante - 1,5 Litros - Manga','PET','2 Litros','Melância', 14.56);

insert into tb_produtos
(produto, nome, embalagem, tamanho, sabor, preco_lista)
values
('520380','Linha Citros - 700 ml - Limão','PET','2 Litros','Melância', 14.56);

INSERT INTO TB_VENDEDORES (
     MATRICULA, NOME, DATA_ADMISSAO, PERCENTUAL_COMISSAO
) VALUES (
     '00400','Maria do Rosario','23/07/2012', 0.15
);

INSERT INTO TB_VENDEDORES (
     MATRICULA, NOME, DATA_ADMISSAO, PERCENTUAL_COMISSAO
) VALUES (
     '00810','Marcia Almeida','14/12/2016', 0.18
);

INSERT INTO TB_VENDEDORES (
     MATRICULA, NOME, DATA_ADMISSAO, PERCENTUAL_COMISSAO
) VALUES (
     '00414','Carlos Moreira','13/11/2015', 0.14
);

INSERT INTO TB_VENDEDORES (
     MATRICULA, NOME, DATA_ADMISSAO, PERCENTUAL_COMISSAO
) VALUES (
     '00934','Juvenildo Martins','09/03/2010', 0.20
);

/*PARA ALTERAR UM DADOS INSERIDO NA TABELA*/
/*1. Select para identificar onde eu tenho que fazer a alteração*/
select * from tb_produtos;
/*2. UPDATE.....SET.....WHERE  */
update tb_produtos set embalagem = 'garrafa' where produto = '520380';
/*resultado: i item atualizado*/
/*Alterando vários ao mesmo tempo*/
update tb_produtos set embalagem = 'vidro', nome = 'testando update', tamanho = 'deu certo' where produto = '1040107';





