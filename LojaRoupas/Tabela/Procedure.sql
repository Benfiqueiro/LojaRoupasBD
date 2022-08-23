use db_lojaroupas;

-- Exclui uma procedure
drop procedure if exists sp_InsCli;

-- Procedure Inserir
delimiter $$
create procedure sp_InsertCat(in pcat varchar(20),in pstatus bit)
begin
	insert into tbl_categoria(nm_cat,ds_status)
	values(pcat,pstatus);
end$$ 
delimiter ;

call sp_InsertCat('Lançamentos',1);
call sp_InsertCat('Filmes & TV',1);
call sp_InsertCat('Séries',1);
call sp_InsertCat('Games',1);
call sp_InsertCat('Nerd',1);
call sp_InsertCat('Divertidas',1);
call sp_InsertCat('Pets',1);

-- Procedure selecionar todos
delimiter $$
create procedure sp_SelectCat()
begin 
	select * from tbl_categoria;
end$$
delimiter ;

call sp_SelectCat();

-- Procedure Update
delimiter $$
create procedure sp_UpdateCat(in pcat varchar(20),in pstatus bit, pcod int)
begin
	update tbl_categoria set nm_Cat=pcat , ds_status=pstatus where cd_Cat=pcod;
end$$
delimiter ;

call sp_UpdateCat('Pets',0,7);

-- Procedure Mostrar apenas os status que eu selecionar
delimiter $$
create procedure sp_SelectStatsCat(in pstatus bit)
begin 
	select * from tbl_categoria where ds_status= pstatus;
end$$
delimiter ;

call sp_selectstatscat(1);
call sp_selectstatscat(0);

-- Procedure selecionar apenas por nome a categoria
delimiter $$
create procedure sp_SelectNomeCat(in pcat varchar(20))
begin 
	select * from tbl_categoria where nm_cat like concat('%',pcat,'%');
end$$
delimiter ;

call sp_SelectNomeCat('a');

-- Procedure insert Pagamento
delimiter $$
create procedure sp_InsertPag(in vPag varchar(20))
begin
	insert into tbl_pagamento(ds_Pagto)
	values(vPag);
end$$ 
delimiter ;

call sp_InsertPag('Pix');
call sp_InsertPag('Cartão Crédito');
call sp_InsertPag('Cartão Débito');
call sp_InsertPag('Boleto Bancario');

-- Procedure Selecionar todos os pagamentos
delimiter $$
create procedure sp_SelectPag()
begin 
	select * from tbl_Pagamento;
end$$
delimiter ;

call sp_SelectPag();

-- Procedure Atualizar a descrição do pagamento
delimiter $$
create procedure sp_UpdatePag(in vPag varchar(20),pcod int)
begin
	update tbl_Pagamento set ds_Pagto=vPag where cd_Pagto=pcod;
end$$
delimiter ;

call sp_UpdatePag('Pix',1);

-- Procedure de inserir pessoa fisica ou juridica
delimiter $$
create procedure sp_InsCli(
in pPessoa char(1),
in pnm_Cliente varchar(80),
in pnm_Logradouro varchar(80),
in pno_Logradouro varchar(5),
in pds_Complemento varchar(20),
in pnm_Bairro varchar(20),
in pnm_Login varchar(20),
in pds_Senha char(8),
in pds_status bit(1),
in pno_CPF varchar(11),
in pno_CNPJ varchar(14),
in pno_telefone varchar(11)
)
begin
declare vCod int;
if(pPessoa='F')then
	insert into tbl_cliente(nm_Cliente,nm_logradouro,no_logradouro,ds_Complemento,nm_Bairro,nm_Login,ds_Senha,ds_status)values(pnm_Cliente,pnm_Logradouro,pno_Logradouro,pds_Complemento,pnm_Bairro,pnm_Login,pds_Senha,pds_status);
    set vCod=last_insert_id();
    insert into tbl_pf(cd_Cliente,no_Cpf) values(vCod,pno_CPF);
    insert into tbl_Telefone(cd_Cliente,no_Telefone) values(vCod,pno_telefone);
    else
	insert into tbl_cliente(nm_Cliente,nm_logradouro,no_logradouro,ds_Complemento,nm_Bairro,nm_Login,ds_Senha,ds_status)values(pnm_Cliente,pnm_Logradouro,pno_Logradouro,pds_Complemento,pnm_Bairro,pnm_Login,pds_Senha,pds_status);
    set vCod=last_insert_id();
    insert into tbl_pj(cd_cliente,no_CNPJ) values(vCod,pno_CNPJ);
	insert into tbl_Telefone(cd_cliente,no_Telefone) values(vCod,pno_telefone);
    end if;
end$$ 
delimiter ;

drop procedure if exists sp_InsCli;

call sp_InsCli('F','Juliano Souza','Rua Camargo Coelho','570','','Vila Ipojuca','Juliano@hotmail.com','123456',1,'1122233304','11999687574');

desc tbl_Cliente;


