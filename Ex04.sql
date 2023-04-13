create table cliente4
(cod_cli number(4) constraint pk_cod_cli primary key,
nome_clie varchar(20) not null,
endereco varchar(30),
cidade varchar(15),
cep char(8),
uf char(2),
cnpj char(16),
ie char(12))

create table vendedor4
(cod_ven number(4) constraint pk_cod_ven4 primary key,
nome_ven varchar(20) not null,
salario_fixo number(10,2),
comissao char(1))

create table produto4
(cod_prod number(4) constraint pk_cod_prod4 primary key,
unidade varchar(3),
descricao varchar(20),
val_unit number(8,2))

create table pedido4
(num_pedido number(4) constraint pk_cod_pedido4 primary key,
pr_entrega number(3) not null,
cod_clie number(4) references cliente4,
cod_ven number(4) references vendedor4)

create table item_pedido4
(num_pedido number(4) references pedido4,
cod_prod number(4) references produto4,
quant number(8,2))

desc cliente4
desc vendedor4
desc produto4
desc pedido4

insert into cliente4 values (720,'Ana','Rua17n.19','Niterói',24358310,'RJ',12113231000134,2134);
insert into cliente4 values (870,'Flávio','Av.Pres.Vargas,10','São Paulo',22763931,'SP',2253412693879,4631);
insert into cliente4 values (110,'Jorge','Rua Caiapó,13','Curitiba', 30078500,'PR',1451276498349,null);
insert into cliente4 values (222,'Lúcia','Rua Itabira,123','Belo Horizonte',22124391,'MG',28315212393488,2985);
insert into cliente4 values (830,'Mauricio','Av. Paulista, 1236','São Paulo',3012683,'SP',3281698574656,9343);
insert into cliente4 values (130,'Edmar','Rua da Praia, s/n','Salvador',30079300,'BA',234632842349,7121);
insert into cliente4 values (410,'Rodolfo','Largo da Lapa, 27','Rio de Janeiro',30078900,'RJ',1283512823469,7431);
insert into cliente4 values (20,'Beth','Av. Climério, 45','São Paulo',25679300,'SP',3248512673268,9280);
insert into cliente4 values (157,'Paulo','Trav. Moraes, casa 3','Londrina',null,'PR',328482233242,1923);
insert into cliente4 values (180,'Lívio','Av. Beira Mar 1256','Florianópolis',30077500,'SC',1273657123474,1111);
insert into cliente4 values (260,'Susana','Rua Lopes Mandes,12','Niterói',30046500,'RJ',217635712329,2530);
insert into cliente4 values (290,'Renato','Rua Meireles,123','São Paulo',30225900,'SP',1327657112314,1820);
insert into cliente4 values (390,'Sebastião','Rua da Igreja, 10','Uberaba',30438700,'MG',321765472133,9071);
insert into cliente4 values (234,'José','Quadra 3, Bl. 3, sl. 1003','Brasília',22841650,'DF',2176357612323,2931);

insert into vendedor4 values (209,'José',1800,'C');
insert into vendedor4 values (111,'Carlos',2490,'A');
insert into vendedor4 values (11,'João',2780,'C');
insert into vendedor4 values (240,'Antônio',9500,'C');
insert into vendedor4 values (720,'Felipe',4600,'A');
insert into vendedor4 values (213, 'Jonas', 2300, 'A');
insert into vendedor4 values (101, 'João', 2650, 'C');
insert into vendedor4 values (310, 'Josias', 870, 'B');
insert into vendedor4 values (250,'Maurício', 2930, 'B');

insert into produto4 values (25, 'KG', 'Queijo', 0.97);
insert into produto4 values (31, 'BAR', 'Chocolate', 0.87);
insert into produto4 values (78, 'L', 'Vinho', 2.00);
insert into produto4 values (22, 'M', 'Linho', 0.11);
insert into produto4 values (30, 'SAC', 'Açúcar', 0.30);
insert into produto4 values (53, 'M', 'Linha', 1.80);
insert into produto4 values (13, 'G', 'Ouro', 6.18);
insert into produto4 values (45, 'M', 'Madeira', 0.25);
insert into produto4 values (87, 'M', 'Cano', 1.97);
insert into produto4 values (77, 'M', 'Papel', 1.05);

INSERT INTO pedido4 VALUES (121, 20, 410, 209);
insert into pedido4 values (97, 20, 720, 101);
insert into pedido4 values (101, 15, 720, 101);
insert into pedido4 values (137, 20, 720, 720);
insert into pedido4 values (148, 20, 720, 101);
insert into pedido4 values (189, 15, 870, 213);
insert into pedido4 values (104, 30, 110, 101);
insert into pedido4 values (203, 30, 830, 250);
insert into pedido4 values (98, 20, 410, 209);
insert into pedido4 values (143, 30, 20, 111);
insert into pedido4 values (105, 30, 180, 240);
insert into pedido4 values (111, 15, 260, 240);
insert into pedido4 values (103, 20, 260, 11);
insert into pedido4 values (91, 20, 260, 11);
insert into pedido4 values (138, 20, 260, 11);
insert into pedido4 values (108, 15, 290, 310);
insert into pedido4 values (119, 30, 390, 250);
insert into pedido4 values (127, 10, 410, 11);

INSERT INTO item_pedido4 VALUES (121, 25, 10);
INSERT INTO item_pedido4 VALUES (121, 31, 35);
INSERT INTO item_pedido4 VALUES (97, 77, 20);
INSERT INTO item_pedido4 VALUES (101, 31, 9);
INSERT INTO item_pedido4 VALUES (101, 78, 18);
INSERT INTO item_pedido4 VALUES (101, 13, 5);
INSERT INTO item_pedido4 VALUES (98, 77, 5);
INSERT INTO item_pedido4 VALUES (148, 45, 8);
INSERT INTO item_pedido4 VALUES (148, 31, 7);
INSERT INTO item_pedido4 VALUES (148, 77, 3);
INSERT INTO item_pedido4 VALUES (148, 25, 10);
INSERT INTO item_pedido4 VALUES (148, 78, 30);
INSERT INTO item_pedido4 VALUES (104, 53, 32);
INSERT INTO item_pedido4 VALUES (203, 31, 6);
INSERT INTO item_pedido4 VALUES (189, 78, 45);
INSERT INTO item_pedido4 VALUES (143, 31, 20);
INSERT INTO item_pedido4 VALUES (143, 78, 10);

select * from cliente4
select * from vendedor4
select * from pedido4
select * from item_pedido4
select * from produto4








