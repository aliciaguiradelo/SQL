--produto
drop table produto cascade constraints;

CREATE TABLE produto(
    id_prod number(3) PRIMARY KEY,
    tamanho_prod varchar(20),
    nome_prod varchar(50)
);

INSERT INTO produto VALUES (1, '2 L', 'tinta azul');
INSERT INTO produto VALUES (2, '210 x 297 mm', 'folha de papel A4');
INSERT INTO produto VALUES (3, '2 m', 'plastico');
INSERT INTO produto VALUES (4, '3 m', 'espiral');
INSERT INTO produto VALUES (5, '0.8 mm', 'ponteiras caneta esferografica');




--fornecedor (manter neste padrão?)
drop table fornecedor cascade constraints;

--select sysdate from dual
CREATE TABLE fornecedor(
	id_forn number(3) PRIMARY KEY,
	nome_forn varchar(50),
	desc_forn varchar(90),
	tipo_Frete varchar(30),
	data_criacao date
);

INSERT INTO fornecedor VALUES (111, 'Fornecedor A', 'Fornecedor pontual e com bons preços', 'Frete Expresso', TO_DATE('2022-08-15', 'YYYY-MM-DD'));
INSERT INTO fornecedor VALUES (222, 'Fornecedor B', 'Fornecedor de tinta com melhor custo beneficio', 'Frete Padrão', TO_DATE('2022-09-12', 'YYYY-MM-DD'));
INSERT INTO fornecedor VALUES (333, 'Fornecedor C', 'Excelente prazo de entrega', 'Frete Rápido', TO_DATE('2022-10-22', 'YYYY-MM-DD'));
INSERT INTO fornecedor VALUES (444, 'Fornecedor D', 'Fornecedor atrasou na entrega em 2 dias', 'Frete Econômico', TO_DATE('2023-01-05', 'YYYY-MM-DD'));
INSERT INTO fornecedor VALUES (555, 'Fornecedor E', 'Pior custo beneficio', 'Frete Prioritário', TO_DATE('2023-03-19', 'YYYY-MM-DD'));




--forma_pgto
drop table forma_pgto cascade constraints;

CREATE TABLE forma_pgto(
	id_pgto number(3) PRIMARY KEY,
	nome_pgto varchar(30),
	desc_pgto varchar(90)
);

INSERT INTO forma_pgto VALUES (10, 'Debito', 'Pagamento realizado no momento da compra');
INSERT INTO forma_pgto VALUES (20, 'Credito à vista', 'Pagamento realizado no momento da compra no credito');
INSERT INTO forma_pgto VALUES (30, 'Parcelado 3x s/j', 'Pagamento realizado no momento da compra parcelado em 3x');
INSERT INTO forma_pgto VALUES (40, 'Dinheiro', 'Pagamento realizado no ato em dinheiro');
INSERT INTO forma_pgto VALUES (50, 'Entrada c/ Parc', 'Pagamento realizado no ato + parcelamento em 2x sem juros');




--empresa
drop table empresa cascade constraints;

CREATE TABLE empresa(
	id_empresa number(3) PRIMARY KEY,
	nome_empresa varchar(50),
	cnpj_empresa varchar(20),
	cep_empresa varchar(9)
);

INSERT INTO empresa VALUES (222,'FIAP', '03.289.019/0001-98','01568-100');
INSERT INTO empresa VALUES (676,'Empresa de Distribuições','04.632.267/0001-93','01445-105');
INSERT INTO empresa VALUES (543,'Produções e CIA','03.693.083/0001-38','01638-340');
INSERT INTO empresa VALUES (624,'Factory SP','03.169.019/0001-96','05228-150');
INSERT INTO empresa VALUES (211,'Materiais Escolares e CIA','03.927.837/0001-91','05658-403');





--funcionario
drop table funcionario cascade constraints;

CREATE TABLE funcionario(
	id_func number(3) PRIMARY KEY,
	nome_func varchar(30),
	email_func varchar(50),
	senha_func varchar(12),
	id_empresa number(3) REFERENCES empresa
);

INSERT INTO funcionario VALUES (89,'Joao de Almeida Junior','joao@funcionario.com', 'Senhajo2#100', 222);
INSERT INTO funcionario VALUES (22,'Arthur Foschiani', 'arthur@funcionario.com','Senhaar2@200', 676);
INSERT INTO funcionario VALUES (33,'Alicia Guiradelo','alicia@funcionario.com','Senhaal2!300', 543);
INSERT INTO funcionario VALUES (44,'Ana Carolina Dantas', 'ana@funcionario.com','Senhaan2*400', 624);
INSERT INTO funcionario VALUES (55,'Larah Rangel Correa', 'larah@funcionario.com' ,'Senhala2@500', 211);




--estoque
drop table estoque cascade constraints;

CREATE TABLE estoque(
	id_estoque number(3) PRIMARY KEY,
	qtd_min varchar(20),
	qtd_max varchar(20),
	qtd_atual varchar(20),
	id_prod number(3) REFERENCES produto,
	id_empresa number(3) REFERENCES empresa
);

INSERT INTO estoque VALUES ('111', '20 L', '100 L', '32 L', 1, 222);
INSERT INTO estoque VALUES ('444', '20 caixas', '200 caixas', '40 caixas', 2, 676);
INSERT INTO estoque VALUES ('222', '20 caixas', '500', '100', 3, 543);
INSERT INTO estoque VALUES ('555', '20 rolos', '500', '100', 4, 624);
INSERT INTO estoque VALUES ('333', '20 caixas', '500', '100', 5, 211);




--requisicao
drop table requisicao cascade constraints;

--select sysdate from dual
CREATE TABLE requisicao(
	id_req number(3) PRIMARY KEY,
	data_req date,
	status_req varchar(20),
	id_pgto number(3) REFERENCES forma_pgto
);

INSERT INTO requisicao VALUES (1, TO_DATE('2023-10-21', 'YYYY-MM-DD'), 'Pendente', 10);
INSERT INTO requisicao VALUES (2, TO_DATE('2023-10-20', 'YYYY-MM-DD'), 'Aprovada', 20);
INSERT INTO requisicao VALUES (3, TO_DATE('2023-10-19', 'YYYY-MM-DD'), 'Pendente', 30);
INSERT INTO requisicao VALUES (4, TO_DATE('2023-10-18', 'YYYY-MM-DD'), 'Rejeitada', 40);
INSERT INTO requisicao VALUES (5, TO_DATE('2023-10-17', 'YYYY-MM-DD'), 'Aprovada', 50);




--atende
drop table atende cascade constraints;

CREATE TABLE atende(
	id_req number(3) REFERENCES requisicao,
	id_forn number(3) REFERENCES fornecedor
);

INSERT INTO atende (id_req, id_forn) VALUES (1, 111);
INSERT INTO atende (id_req, id_forn) VALUES (2, 222);
INSERT INTO atende (id_req, id_forn) VALUES (3, 333);
INSERT INTO atende (id_req, id_forn) VALUES (4, 444);
INSERT INTO atende (id_req, id_forn) VALUES (5, 555);





 --pedido
drop table pedido cascade constraints;

CREATE TABLE pedido(
	id_pedido number(3) PRIMARY KEY,
	qtd_pedido number(5),
	id_req number(3) REFERENCES requisicao,
	id_estoque number(3) REFERENCES estoque
);

INSERT INTO pedido (id_pedido, qtd_pedido, id_req, id_estoque) VALUES (1, 100, 1, 111);
INSERT INTO pedido (id_pedido, qtd_pedido, id_req, id_estoque) VALUES (2, 50, 2, 222);
INSERT INTO pedido (id_pedido, qtd_pedido, id_req, id_estoque) VALUES (3, 30, 3, 333);
INSERT INTO pedido (id_pedido, qtd_pedido, id_req, id_estoque) VALUES (4, 20, 4, 444);
INSERT INTO pedido (id_pedido, qtd_pedido, id_req, id_estoque) VALUES (5, 10, 5, 555);




--INNER JOIN:
--1:
SELECT f.id_func,f.nome_func, f.id_empresa, e.id_empresa, e.nome_empresa
FROM funcionario f INNER JOIN empresa e 
ON f.id_empresa = e.id_empresa; 

--2:
SELECT r.id_req, r.status_req,r.id_pgto, f.id_pgto,f.nome_pgto 
FROM requisicao r INNER JOIN forma_pgto f 
ON r.id_pgto = f.id_pgto;