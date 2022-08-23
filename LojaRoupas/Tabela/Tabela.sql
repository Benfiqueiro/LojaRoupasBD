create database db_lojaroupas;

use db_lojaroupas;

create table tbl_cliente(
cd_Cliente int primary key auto_increment,
nm_Cliente varchar(80) not null,
nm_Lougradouro varchar (80) not null,
no_Lougradouro varchar(5) not null,
ds_Complemento varchar (20),
nm_Bairro varchar(20) not null,
nm_Login varchar(20) not null,
ds_Senha char(6) not null
);


create table no_Telefone(
cd_Cliente int,
no_Telefone varchar(11),
CONSTRAINT foreign key(cd_Cliente) references tbl_cliente(cd_Cliente)
);


create table tbl_CliJuri(
cd_Cliente int,
no_CNPJ varchar(14) not null,
CONSTRAINT foreign key(cd_Cliente) references tbl_cliente(cd_Cliente)
);


create table tbl_CliFi(
cd_Cliente int,
no_CPF varchar(11) not null,
CONSTRAINT foreign key(cd_Cliente) references tbl_cliente(cd_Cliente)
);


create table tbl_Pagamento(
cd_Pagto int primary key auto_increment,
ds_Pagto varchar(20) not null
);

create table tbl_Carrinho(
cd_Carrinho int primary key auto_increment,
dt_Compra date not null,
vl_Compra decimal (10,2) not null,
cd_Cliente int not null,
cd_Pagto int not null,
CONSTRAINT foreign key(cd_Cliente) references tbl_cliente(cd_Cliente),
CONSTRAINT foreign key(cd_Pagto) references tbl_pagamento (cd_Pagto)
);


create table tbl_produto(
cd_Produto int primary key auto_increment,
nm_Produto varchar(80) not null,
vl_Produto decimal (10,2) not null
);

create table tbl_Itens_Carrinho(
cd_Carrinho int,
cd_Produto int,
vl_Total decimal (10,2),
qt_iIens int,
primary key(cd_Produto, cd_Carrinho),
CONSTRAINT foreign key(cd_Produto) references tbl_Produto(cd_Produto),
CONSTRAINT foreign key(cd_Carrinho) references tbl_Carrinho(cd_Carrinho)
);

create table tbl_Fornecedor(
cd_Forn int primary key auto_increment,
nm_Forn varchar(80) not null
);


create table tbl_Fone_Forn(
cd_Forn int,
no_Telefone varchar(11),
foreign key(cd_Forn) references tbl_Fornecedor(cd_Forn)
);

create table tbl_Forn_Prod(
cd_Forn int,
cd_Produto int,
dt_Compra date not null,
primary key(cd_fFrn, cd_Produto),
CONSTRAINT foreign key(cd_Forn) references tbl_Fornecedor(cd_Forn),
CONSTRAINT foreign key(cd_Produto) references tbl_Produto(cd_Produto)
);

create table tbl_Categoria(
cd_Cat int primary key auto_increment,
nm_Cat varchar(20) not null
);


create table tbl_Prod_Cat(
cd_Cat int,
cd_Produto int,
primary key(cd_Cat, cd_Produto),
foreign key(cd_Cat) references tbl_Categoria(cd_Cat),
foreign key(cd_Produto) references tbl_Produto(cd_Produto)
);


create table tbl_Tamanho(
cd_Tamanho int primary key auto_increment,
sg_Tamanho varchar(2) not null
);


create table tbl_Prod_Tamanho(
cd_Tamanho int,
cd_Produto int,
qt_Produto int not null,
primary key(cd_Tamanho, cd_Produto),
foreign key(cd_Tamanho) references tbl_Tamanho(cd_Tamanho),
foreign key(cd_Produto) references tbl_Produto(cd_Produto)
);
