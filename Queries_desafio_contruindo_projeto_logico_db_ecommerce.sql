-- QUERIES

-- Mostrar todas as Tabelas
show tables;

-- Mostrar os clientes(Pessoa Física) cadastrados
select * from clients;

-- Mostrar os clientes(Pessoa Jurídica) cadastrados
select * from clientsPJ;

-- Mostrar o status do pedido de cada cliente
select concat(Fname, ' ', Lname) as Nome, orderStatus as Status_do_Pedido 
from orders, clients 
where idOrderClient = idClient
order by Status_do_Pedido desc;

-- Relacionar os pedidos, clientes e produtos
select * from clients c
inner join orders o ON c.idClient = o.idOrderClient
inner join productOrder p on p.idPOorder = o.idOrder
inner join product d on d.idProduct = o.idOrderClient;

-- Mostrar os produtos que o clientes pediu
select concat(Fname, ' ' , Lname) as Nome, Pname as Produto
from clients c
inner join orders o ON c.idClient = o.idOrderClient
inner join productOrder p on p.idPOorder = o.idOrder
inner join product d on d.idProduct = o.idOrderClient;

-- Recuperar quantos pedidos foram realizados pelos cliente
select c.idClient, Fname, count(*) as Número_de_pedidos from clients c
	inner join orders o ON c.idClient = o.idOrderClient
    inner join productOrder p on p.idPOorder = o.idOrder
    group by idClient;

