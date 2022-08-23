-- alter tables
alter table tbl_cliente
add column no_logradouro varchar(5) not null;

alter table tbl_cliente
drop column no_logradouro;

alter table tbl_cliente
add column no_logradouro varchar(5) not null
after nm_lougradouro;

alter table tbl_cliente
add column ds_status bit not null;

alter table tbl_cliente
change column nm_Lougradouro nm_logradouro
varchar(80) not null;


alter table tbl_cliente
drop column ds_statys;

-- altera o nome da tabela
alter table no_telefone
rename to tbl_TelefoneCli;

alter table tbl_TelefoneCli
modify column no_telefone char(11) not null;

alter table tbl_clifi
rename to tbl_pf;

alter table tbl_pf
modify column no_cpf char(11) not null;

alter table tbl_clijuri
rename to tbl_pj;

alter table tbl_pj
modify column no_cnpj char(11) not null;

alter table tbl_produto
add column ds_status bit not null;

alter table tbl_categoria
add column ds_status bit not null;

alter table tbl_pf
add primary key(cd_cliente,no_cpf);

alter table tbl_pj
add primary key(cd_cliente,no_cnpj);

alter table tbl_telefoneCli
add primary key(cd_cliente, no_telefone);

desc tbl_pj;
desc tbl_pf;
desc tbl_cliente;
desc tbl_TelefoneCli;