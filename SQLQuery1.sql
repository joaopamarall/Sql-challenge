--create database sqlChallenge
--use sqlChallenge
--DROP TABLE PedidoProdutos;
--DROP TABLE Pedidos;
--DROP TABLE Produtos;

--PASSO 1
CREATE TABLE Pedidos (
    IDPedido INT PRIMARY KEY,
    NomeCliente VARCHAR(255),
    DataHoraPedido DATETIME,
    ValorTotal DECIMAL(10, 2)
);
CREATE TABLE Produtos (
    IDProduto INT PRIMARY KEY,
    NomeProduto VARCHAR(255),
    ValorProduto DECIMAL(10, 2)
);
CREATE TABLE PedidoProdutos (
    IDPedido INT,
    IDProduto INT,
    Quantidade INT,
    PRIMARY KEY (IDPedido, IDProduto),
    FOREIGN KEY (IDPedido) REFERENCES Pedidos(IDPedido),
    FOREIGN KEY (IDProduto) REFERENCES Produtos(IDProduto)
);

INSERT INTO Produtos (IDProduto, NomeProduto, ValorProduto)
VALUES
	(1, 'Produto A', 10.99),
	(2, 'Produto B', 15.99),
	(3, 'Produto C', 20.50),
	(4, 'Produto D', 12.75),
	(5, 'Produto E', 9.99),
	(6, 'Produto F', 8.50);
SELECT * FROM Produtos;

INSERT INTO Pedidos (IDPedido, NomeCliente, DataHoraPedido, ValorTotal)
VALUES 
	(1, 'Cliente A', CONVERT(DATETIME, '2023-08-18 14:30:00', 120), 50.00),
    (2, 'Cliente B', CONVERT(DATETIME,  '2023-08-19 10:00:00', 120), 80.00),
    (3, 'Cliente C', CONVERT(DATETIME,  '2023-08-20 15:30:00', 120), 120.50),
    (4, 'Cliente D', CONVERT(DATETIME,  '2023-08-21 12:45:00', 120), 45.75),
    (5, 'Cliente E', CONVERT(DATETIME,  '2023-08-22 09:30:00', 120), 60.99),
    (6, 'Cliente F', CONVERT(DATETIME,  '2023-08-23 14:15:00', 120), 25.50);

SELECT * FROM Pedidos;

--PASSO 2
--a) Inserir um produto na tabela de produtos:
INSERT INTO Produtos (IDProduto, NomeProduto, ValorProduto)
VALUES (7, 'Produto G', 34.99);

SELECT * FROM Produtos;

--b) Modificar o valor do produto na tabela de produtos:
UPDATE Produtos
SET ValorProduto = 8.99
WHERE IDProduto = 1;

SELECT * FROM Produtos;

--c) Excluir um produto pelo identificador do produto;
DELETE FROM Produtos
WHERE IDProduto = 7;

SELECT * FROM Produtos;

--d) Inserir um pedido na tabela de pedidos;
INSERT INTO Pedidos (IDPedido, NomeCliente, DataHoraPedido, ValorTotal)
VALUES (7, 'Cliente G', CONVERT(DATETIME, '2023-07-23 14:30:00', 120), 500.00);

SELECT * FROM Pedidos;

--e) Modificar a data/hora do pedido na tabela de pedidos:
UPDATE Pedidos
SET DataHoraPedido = '2023-06-12 15:00:00'
WHERE IDPedido = 7;

SELECT * FROM Pedidos;

--f) Excluir um pedido pelo identificador do pedido:
DELETE FROM Pedidos
WHERE IDPedido = 7;

SELECT * FROM Pedidos;

--g) Inserir um produto no pedido com quantidade 5:
INSERT INTO PedidoProdutos (IDPedido, IDProduto, Quantidade)
VALUES (1, 2, 5);

SELECT * FROM PedidoProdutos;

--Passo 3
--a) Buscar os pedidos mais recentes ordenados pela data e hora do pedido:
SELECT *
FROM Pedidos
ORDER BY DataHoraPedido DESC;

--b) Buscar os produtos com menor valor:
SELECT *
FROM Produtos
WHERE ValorProduto = (
    SELECT MIN(ValorProduto) 
    FROM Produtos
);