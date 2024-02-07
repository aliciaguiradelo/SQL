drop table produto

create table produto(
id_pro number(3) primary key,
ds_pro varchar(40) not null unique,
pr_pro number(8,2) not null,
estoque number(10,2)
);

create table venda(
id_venda number(3) primary key,
dt_venda date not null,
total_venda number(10,2) not null,
fk_vendedor NUMBER(3) NOT NULL,
FOREIGN KEY (fk_vendedor) REFERENCES vendedor(id_vendedor)
);

create table item_venda(
fk_pro NUMBER(3) NOT NULL,
FOREIGN KEY (fk_pro) REFERENCES produto(id_pro),
fk_venda NUMBER(3) NOT NULL,
FOREIGN KEY (fk_venda) REFERENCES venda(id_venda),
total_pro number(10,2)
);

drop table vendedor

create table vendedor(
id_vendedor number(3) primary key,
nm_vendedor varchar(40) not null unique,
salario number(8,2)
);

insert into produto(id_pro,ds_pro,pr_pro,estoque) values (01,'descrição produto um',55,10);
insert into produto(id_pro,ds_pro,pr_pro,estoque) values (02,'descrição produto dois',155,1);
insert into produto(id_pro,ds_pro,pr_pro,estoque) values (03,'descrição produto três',550,5);
insert into produto(id_pro,ds_pro,pr_pro,estoque) values (04,'descrição produto quatro',50,2);
insert into produto(id_pro,ds_pro,pr_pro,estoque) values (05,'descrição produto cinco',05,100);

insert into vendedor(id_vendedor,nm_vendedor,salario) values (01,'alicia',5510);
insert into vendedor(id_vendedor,nm_vendedor,salario) values (02,'larah',5510);
insert into vendedor(id_vendedor,nm_vendedor,salario) values (03,'arthur',5510);
insert into vendedor(id_vendedor,nm_vendedor,salario) values (04,'ana',5510);
insert into vendedor(id_vendedor,nm_vendedor,salario) values (05,'bruno',5510);

insert into venda(id_venda,dt_venda,total_venda,fk_vendedor) values (01, TO_DATE('2024-02-05', 'YYYY-MM-DD'), 100,01);
insert into venda(id_venda,dt_venda,total_venda,fk_vendedor) values (02, TO_DATE('2023-07-05', 'YYYY-MM-DD'), 200,02);
insert into venda(id_venda,dt_venda,total_venda,fk_vendedor) values (03, TO_DATE('2021-09-05', 'YYYY-MM-DD'), 450,03);
insert into venda(id_venda,dt_venda,total_venda,fk_vendedor) values (04, TO_DATE('2014-05-05', 'YYYY-MM-DD'), 18,04);
insert into venda(id_venda,dt_venda,total_venda,fk_vendedor) values (05, TO_DATE('2015-08-05', 'YYYY-MM-DD'), 9,05);

insert into item_venda(fk_pro,fk_venda,total_pro) values (05,01,5510);
insert into item_venda(fk_pro,fk_venda,total_pro) values (02,02,10);
insert into item_venda(fk_pro,fk_venda,total_pro) values (03,03,55);
insert into item_venda(fk_pro,fk_venda,total_pro) values (04,04,510);
insert into item_venda(fk_pro,fk_venda,total_pro) values (01,04,51);

set serveroutput on
set verify off

declare
    v_id_vendedor number(3) := &IdVendedor;
    v_nm_vendedor varchar(40) := &NomeVendedor;
    salario number(8,2) := &Salario;
    cursor c_exibe is select id_vendedor from vendedor;
    v_exibe c_exibe%rowtype;
    
begin   
    open c_exibe;
    loop
        fetch c_exibe into v_exibe;
    exit when c_exibe%notfound;
    
    dbms_output.put_line('Nome: '||v_exibe.nm_fun||' - Salário: '||v_exibe.salario);
    end loop;
    close c_exibe;
    
end;