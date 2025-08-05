USE ecommerce;
GO

-- Ver todas as tabelas
SELECT * FROM INFORMATION_SCHEMA.TABLES;
GO

-- Ver estrutura da tabela clients
EXEC sp_help clients;
GO

INSERT INTO clients (Fname, Minit, Lname, CPF, Endereco) 
VALUES 
    ('Maria', 'M', 'Silva', 12346789, 'rua silva de prata 29, Carangola - SP'),
    ('Matheus', 'O', 'Pimentel', 987654321, 'rua alemeda 289, Centro - SP'),
    ('Ricardo', 'F', 'Silva', 45678913, 'avenida alemeda vinha 1009, Centro - RJ'),
    ('Julia', 'S', 'França', 789123456, 'rua lareijras 861, Centro - SP'),
    ('Roberta', 'G', 'Assis', 98745631, 'avenidade koller 19, Centro - SP'),
    ('Isabela', 'M', 'Cruz', 654789123, 'rua alemeda das flores 28, Centro - SP');
GO

-- Ver estrutura da tabela product
EXEC sp_help product;
GO

INSERT INTO product (Pname, Classification_kids, Category, avaliacao, Size) 
VALUES 
    ('Fone de ouvido', 0, 'Eletrônico', '4', NULL),
    ('Barbie Elsa', 1, 'Brinquedos', '3', NULL),
    ('Body Carters', 1, 'Vestimenta', '5', NULL),
    ('Microfone Vedo', 0, 'Eletrônico', '4', NULL),
    ('Sofá retrátil', 0, 'Brinquedos', '3', '3x57x80'),
    ('Farinha', 0, 'Alimentos', '2', NULL),
    ('Fire Stick', 0, 'Eletrônico', '3', NULL);
GO

-- Ver estrutura da tabela orders
EXEC sp_help orders;
GO

INSERT INTO orders (orderStatus, orderDescription,sendValue,paymentCash)
VALUES 
    (1, DEFAULT, 'compra via aplicativo', NULL),
    (2, DEFAULT, 'compra via aplicativo', 50),
    (3, 'Confirmado', NULL, NULL),
    (4, DEFAULT, 'compra via web site', 150);
GO

-- Ver estrutura da tabela productOrder
EXEC sp_help productOrder;
GO

SELECT * FROM orders;
GO

INSERT INTO productOrder (idPOproduct, idPOorder, poQuantity, poStatus) 
VALUES 
    (22, 1, 2, NULL), 
    (23, 2, 1, NULL), 
    (25, 3, 1, NULL);
GO

-- Ver estrutura da tabela productStorage
EXEC sp_help productStorage;
GO

INSERT INTO productStorage (StorageLocation, Quantity) 
VALUES 
    ('Rio de Janeiro', 1000),
    ('Rio de Janeiro', 500),
    ('São Paulo', 10),
    ('São Paulo', 100),
    ('São Paulo', 10),
    ('Brasília', 60);
GO

-- Ver todas as tabelas
SELECT * FROM INFORMATION_SCHEMA.TABLES;
GO

-- Inserindo dados em storeagelocation
INSERT INTO storageLocation (idLproduct, idLstorage, localizacao) 
VALUES 
    (1, 2, 'RJ'),
    (2, 6, 'GO');
GO

-- Inserindo dados em supplier
INSERT INTO supplier (SocialName, CNPJ, contact) 
VALUES 
    ('Almeida e filhos', 123456789123456, '21985474'),
    ('Eletrônicos Silva', 854519649143457, '21985484'),
    ('Eletrônicos Valma', 934567893934695, '21975474');
GO

-- Inserindo dados em seller
INSERT INTO seller (idSeller,SocialName, CNPJ, CPF, localizacao, contact) 
VALUES 
    ('Tech eletronics', NULL, 123456789456321, NULL, 'Rio de Janeiro', 219946287),
    ('Botique Durgas', NULL, NULL, 123456783, 'Rio de Janeiro', 219567895),
    ('Kids World', NULL, 456789123654485, NULL, 'São Paulo', 1198657484);
GO

SELECT * FROM product;
GO

-- Inserindo dados em productSeller
INSERT INTO productSeller (idpSeller, idProduct, prodQuantity) 
VALUES 
    (1, 23, 80),
    (2, 24, 10);
GO

SELECT * FROM clients;
GO

-- Contando clientes
SELECT COUNT(*) FROM clients;
GO

-- Recuperar quantos pedidos foram realizados pelos clientes
SELECT 
    c.idClient, 
    Fname AS Client_name, 
    COUNT(*) AS Num_Orders
FROM clients c 
INNER JOIN orders o ON c.idClient = o.idOrderClient
GROUP BY c.idClient, c.Fname;
GO


