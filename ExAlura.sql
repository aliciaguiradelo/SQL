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

/*Ajustando comissão dos vendedores*/
select * from TB_VENDEDORES;

update TB_VENDEDORES set percentual_comissao = 0.18 where matricula = '00400';
update TB_VENDEDORES set percentual_comissao = 0.18 where matricula = '00414';
update TB_VENDEDORES set percentual_comissao = 0.18 where matricula = '00233';

/*Para deletar dados de uma tabela ou seja uma linha da tabela*/
select * from tb_produtos;

delete from tb_produtos where produto ='1037797';

/*Deletando uma vendedora*/
select * from TB_VENDEDORES;

delete from tb_vendedores where matricula = '00400';

select * from tb_produtos;
insert into tb_produtos
(produto, nome, embalagem, tamanho, sabor, preco_lista)
values
('1037797','Clean - 2 Litros - Laranja','PET','2 Litros','Melância', 14.56);
delete from tb_produtos where produto ='1037797';                                                                                                                    

/*Adicionando uma Primary Key na tabela*/
alter table tb_produtos add constraint pk_tb_produtos primary key (produto);

alter table tb_vendedores add constraint pk_tb_vendedores primary key (matricula);

alter table tb_clientes add constraint pk_tb_clientes primary key (cpf);

insert into tb_clientes
(cpf, nome, endereco1, endereco2, bairro,estado,cep,data_nascimento,idade,sexo,limite_cartao,volume_compra,primeira_compra)
values
('43849634833','Joao da Silva','Rua um',null, 'vila roman', 'sp', '02732000', '18/02/2001', 22, 'F',10000,10000,0);  
select * from tb_clientes;
/*Mostra o mês da data*/
select to_char (data_nascimento,'mm') from tb_clientes;

delete from tb_clientes where cpf ='43849634833';  
insert into tb_clientes
(cpf, nome, endereco1, endereco2, bairro,estado,cep,data_nascimento,idade,sexo,limite_cartao,volume_compra,primeira_compra)
values
('43849634833','Joao da Silva','Rua um',null, 'vila roman', 'sp', '02732000',to_date ('10/12/2001', 'mm/dd/yyyy'), 22, 'F',10000,10000,0); 
insert into tb_clientes
(cpf, nome, endereco1, endereco2, bairro,estado,cep,data_nascimento,idade,sexo,limite_cartao,volume_compra,primeira_compra)
values
('43849631233','Joao da Silva','Rua um',null, 'vila roman', 'sp', '02732000',to_date ('10/12/2001', 'dd/mm/yyyy'), 22, 'F',10000,10000,0);
select * from tb_clientes;
select * from TB_VENDEDORES;

INSERT INTO TB_VENDEDORES (
     MATRICULA, NOME, DATA_ADMISSAO, PERCENTUAL_COMISSAO
) VALUES (
     '00265','Jonh Wayne',to_date('03/27/2019', 'mm/dd/yy'), 0.12
);

INSERT INTO TB_VENDEDORES (
     MATRICULA, NOME, DATA_ADMISSAO, PERCENTUAL_COMISSAO
) VALUES (
     '00777','Katy Peterson',to_date('02/04/2020', 'mm/dd/yy'), 0.10
);

INSERT INTO TB_VENDEDORES (
     MATRICULA, NOME, DATA_ADMISSAO, PERCENTUAL_COMISSAO
) VALUES (
     '00342','Rodrigo Almeida',to_date('18/01/2022', 'dd/mm/yy'), 0.09
);

INSERT INTO TB_VENDEDORES (
     MATRICULA, NOME, DATA_ADMISSAO, PERCENTUAL_COMISSAO
) VALUES (
     '00729','Patricia Martins',to_date('02/01/2022', 'dd/mm/yy'), 0.09
);

/*Executar todos comandos do arquivo SQL_10.sql de uma só vez*/

select produto, nome,embalagem,tamanho,sabor,preco_lista from tb_produtos;

/*Os valores cadastrados vão aparecer na ordem que eu escrevi os nomes das colunas.
Se na hora de fazer o comando select eu alterar a ordem, ele vai mostrar na ordem diferente*/

select tamanho, nome,embalagem,produto,sabor,preco_lista from tb_produtos;

/*Se eu quiser printar os dados da tabela e mudar o nome da coluna, basta usar 
select (nome original da coluna) as "nome que quero que apareça"*/

select produto as "codigo do produto", 
       nome as "nome do produto", 
       embalagem as "embalagem do produto",
       produto,sabor,preco_lista from tb_produtos;

/*FILTROS DE BUSCA DE DADOS COM WHERE*/
/*Caso eu queira trazer só uma parte da tabela e não todos os dados*/

select * from tb_produtos where sabor = 'Melancia';

select * from tb_produtos where sabor = 'Limao';

update tb_produtos set sabor = 'Citrico' where sabor='Limao';

select * from tb_produtos where sabor = 'Citrico';

select * from tb_clientes;

/*Buscas específicas com o select + where*/
select * from tb_clientes where idade > 22;

select * from tb_clientes where idade = 22;

select * from tb_clientes where idade < 22;

select * from tb_clientes where idade <> 22; /* <> símbolo de diferente*/

/*Select específico para ver clientes que vem dps do Marcelo Mattos em de acordo com a ordem alfabética*/
select * from tb_clientes where nome > 'Marcelo Mattos'; 

select * from tb_clientes where nome <> 'Marcelo Mattos';

select * from tb_produtos where preco_lista > 16 ;

select * from tb_vendedores where PERCENTUAL_COMISSAO < 0.17;

/*Filtro de busca com datas*/
select * from tb_clientes where data_nascimento = to_date ('25/03/1992', 'dd/mm/yyy');

select * from tb_clientes;








