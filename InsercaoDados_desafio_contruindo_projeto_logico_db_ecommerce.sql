-- INSERÇÃO DE DADOS

use ecommerce;

-- Client (idClient, Fname, Minit, Lname, CPF, Addres)
insert into Clients (Fname, Minit, Lname, CPF, Address) values
	('Murilo', 'B', 'Silva', 514632478, 'Rua da Goteira 45, Perambolé - São João'),
    ('Carlos', 'J', 'Bustamante', 426879324, 'Av. da Granja 234, Poente - Aracaju'),
    ('Jonnathan', 'F', 'Capiroto', 236547952, 'Rua Leão 23, Paraíso - São Paulo'),
    ('Cesar', 'R', 'Motta', 423658974, 'Av. São Pedro de Vaz 2347, Olaria - Rio de Janeiro'),
    ('Mario', 'A', 'Amaral', 652498731, 'Av. José Whitaker 194, Perdizes - São Paulo'),
    ('Alana', 'D', 'Souza', 789532614, 'Travessa Boa Vida 781, Amarantos - Tocantins');
    
-- ClientsPJ (idClientsPJ, Rsocial, Address, CNPJ)
insert into ClientsPJ (Rsocial, CNPJ, Address) values
	('Cambagem Amiga Eirelli', 16348975634895, 'Rua da Porcelanas 133, Jd. Vitória - Ceará'),
    ('Destronados S.A.', 65479513541658, 'Av. Alabama 1478, Pierí - Amazonas'),
    ('Agora Já Deu! LTDA.', 65485624578523, 'Rua Papa Capim 226, Atalanta do Norte - Mato Grosso'),
    ('Imbroxável S.A.', 63542987465932, 'Beco das Trapaças 884, Pôr do Sol - Espírito Santo'),
    ('Install Lab Eirelli', 46985321895674, 'Rua Eugênio de Medeiros 89, Pinheiros - São Paulo');

-- Product (idProduct, Pname, classification_kids, category, avaliação, size)
insert into Product(Pname, classification_kids, category, avaliação, size) values
	('Fone de Ouvido', false, 'Eletrônico', '4', null),
    ('Barbie Elsa', true, 'Brinquedos', '3', null),
    ('Body Carters', true, 'Vestimenta', '5', null),
    ('Microfone Vedo - YouTuber', false, 'Eletrônico', '4', null),
    ('Sofá retrátil', false, 'Móveis', '3', '3x57x80'),
    ('Farinha de arroz', false, 'Alimentos', '2', null),
    ('Fire Stick Amazon', false, 'Eletrônico', '3', null),
    ('Paco Rabanne', false, 'Vestimenta', '5', null),
    ('Lego Avengers', true, 'Brinquedos', '3', null),
    ('Cadeira Gamer', true, 'Móveis', '4', '120x40x53');
    
-- Orders (idOrder, idOrderClient, orderStatus, orderDescription, sendValue paymentCash)
insert into Orders(idOrderClient, orderStatus, orderDescription, sendValue, paymentCash) values
	(1, default, 'compra via app', null, 1),
    (2, null, 'compra via app', 50, 0),
	(3, 'Confirmado', null, null, 1),
    (4, null, 'compra via website',150, 0),
    (5, 'Cancelado', 'compra via app', 20, 1),
    (6, 'Confirmado', 'compra via website', 200, 0);
    
-- Payment (idPayment, idPayorder, typePayment, limitAvaliable)
insert into Payment(idPayorder, typePayment, limitAvailable) values
	(1, default, false),
    (2, 'Boleto', true),
    (3, 'Cartão de Crédito', false),
    (4, 'Cartão de Crédito', true),
    (5, 'PIX', false),
    (6, null, false);
    
-- Delivery (idDelivery, idDeliOrder, deliStatus, trackCode)
insert into Delivery(idDeliOrder, deliStatus, trackCode) values
	(1, default, 'PRm456gb787'),
    (2, 'A Caminho', 'Gm235487-B19'),
    (3, null, 'GRN40003-1848L'),
    (4, 'Pedido Entregue', 'GHJ45651_2022'),
    (5, default, 'Ainda não Gerado'),
    (6, null, 'GH222-021FH');
    
-- productStorage (idProdStorage, storageLocation, quantity)
insert into productStorage (storageLocation, quantity) values
	('Rio de Janeiro', 1000),
    ('Rio de Janeiro', 500),
    ('São Paulo', 10),
    ('São Paulo', 100),
    ('Curitiba', 388),
    ('Brasília', 670);
    
-- supplier (idSupplier, socialName, CNPJ, contact)
insert into supplier (socialName, CNPJ, contact) values
	('Centauro', 15698456789641, 11980746523),
	('Piologo', 56434893157628, 85978965421),
    ('RCHLO', 45689657343946, 12976548542),
    ('Renner', 85642393784619, 13887946532),
    ('Pernabucanas', 78984596813549, 4194567891);
    
-- seller (idSeller, socialName, AbstName, CNPJ, CPF, location, contact)
insert into seller(socialName, AbstName, CNPJ, CPF, location, contact) values
	('Ricardo Eletro LTDA','Ricardo Eletro', 54678913548926, null, 'Av. das Flores 874, Bel Air - São Paulo', 11947563214),
    ('Vedana Pompeu Associados', 'Vedana', null, 214369148, 'Terminal Capelinha 20, Capelinha - Cruzeiro', 13987469213);

-- productSeller (idPseller, idPproduct, prodQuantity)
insert into productSeller(idPseller, idPproduct, prodQuantity) values
	(3, 6, 80),
    (4, 7, 10);
    
-- productOrder (idPOproduct, idPOorder, poQuantity, poStatus)
insert into productOrder(idPOproduct, idPOorder, poQuantity, poStatus) values
	(1, 5, 2, default),
    (2, 5, 1, null),
    (3, 6, default, 'Sem Estoque');
    
-- storageLocation (idLproduct, idLstorage, location)
insert into storageLocation (idLproduct, idLstorage, location) values
	(1, 2, 'RJ'),
    (2, 6, 'GO');
    
-- productSupplier (idPsSupplier, idPsProduct, quantity)
insert into productSupplier(idPsSupplier, idPsProduct, quantity) values
	(1, 1, 500),
    (1, 2, 400),
    (2, 4, 633),
    (3, 3, 5),
    (2, 5, 10);
