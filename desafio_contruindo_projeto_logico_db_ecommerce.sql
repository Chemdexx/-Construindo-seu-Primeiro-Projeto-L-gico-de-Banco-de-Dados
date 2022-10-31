-- Criação do Banco de Dados para um cenário de E-commerce 

drop database ecommerce;
create database ecommerce;
use ecommerce;

-- criando tabela cliente Pessoa Física
create table clients(
	idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    CPF char(11) not null,
    Address varchar(255),
    constraint unique_cpf_client unique (CPF)
);

alter table clients auto_increment=1;

-- criando tabela cliente Pessoa Jurídica
create table clientsPJ(
	idClientsPJ int auto_increment primary key,
    Rsocial varchar(255) not null,
    Address varchar(255) not null,
    CNPJ char(14) not null,
    constraint unique_cnpj_client unique (CNPJ)
);

-- criando tabela produto (size = dimensão do produto)
create table product(
	idProduct int auto_increment primary key,
    Pname varchar(25) not null,
    classification_kids bool default false,
    category enum('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') not null,
    avaliação float default 0,
    size varchar(10)
);

-- criando tabela pedido
create table orders(
	idOrder int auto_increment primary key,
	idOrderClient int,
    orderStatus enum('Cancelado', 'Confirmado', 'Em Processamento') default 'Em Processamento',
    orderDescription varchar(255),
    sendValue float default 10,
    paymentCash bool default false,
    constraint fk_orders_client foreign key(idOrderClient) references clients(idClient)
			on update cascade
);

-- criando tabela entrega
create table delivery(
	idDelivery int auto_increment primary key,
    idDeliOrder int,
    deliStatus enum('A Caminho', 'Pedido Entregue') default 'A Caminho',
    trackCode varchar(255),
    constraint fk_delivery_order foreign key(idDeliOrder) references orders(idOrder)    
);

-- criando tabela pagamento
create table payment(
    idPayment int auto_increment primary key,
    idPayorder int,
    typePayment enum('Boleto', 'Cartão de Crédito', 'PIX', 'Depósito Bancário') default 'PIX',
    limitAvailable boolean,
    constraint fk_pay_order foreign key(idPayorder) references orders(idOrder)
);

-- criando tabela estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);

-- criando tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    socialName varchar(255) not null,
    CNPJ char(14) not null,
    contact char(11) not null,
    constraint unique_supplier unique(CNPJ)
);

-- criando tabela vendedor
create table seller(
	idSeller int auto_increment primary key,
    socialName varchar(255) not null,
    AbstName varchar(255) not null,
    CNPJ char(14),
    CPF char(9), 
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique(CNPJ),
	constraint unique_cpf_seller unique(CPF)
);

create table productSeller(
	idPseller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key(idPseller, idPproduct),
    constraint fk_product_seller foreign key(idPseller) references seller(idSeller),
    constraint fk_product_product foreign key(idPproduct) references product(idProduct)
);

create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key(idPOproduct, idPOorder),
    constraint fk_productorder_seller foreign key(idPOproduct) references product(idProduct),
    constraint fk_productorder_product foreign key(idPOorder) references orders(idOrder)
);

create table storageLocation(
	idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key(idLproduct, idLstorage),
    constraint fk_storage_location_product foreign key(idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key(idLstorage) references productStorage(idProdStorage)
);

create table productSupplier(
	idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key(idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key(idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key(idPsProduct) references product(idProduct)
);

