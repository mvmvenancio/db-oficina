SHOW TABLES FROM db_oficina;
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY,
    nome VARCHAR(255),
    nomeDoMeio VARCHAR(255),
    sobrenome VARCHAR(255),
    endereço VARCHAR(255),
    telefone VARCHAR(255)
);

CREATE TABLE Funcionário (
    idFuncionário INT PRIMARY KEY,
    nome VARCHAR(255),
    nomeDoMeio VARCHAR(255),
    sobrenome VARCHAR(255),
    matrícula INT,
    CPF VARCHAR(11)
);

CREATE TABLE Produtos (
    idProdutos INT PRIMARY KEY,
    códigoDoProduto VARCHAR(255),
    valorDoProduto DECIMAL(10,2)
);

CREATE TABLE Atendimento (
    idAtendimento INT PRIMARY KEY,
    data DATE,
    hora TIME,
    serviçoRealizado VARCHAR(255),
    valorCobrado DECIMAL(10,2),
    idCliente INT,
    idFuncionário INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idFuncionário) REFERENCES Funcionário(idFuncionário)
);

CREATE TABLE Veículo (
    idVeículo INT PRIMARY KEY,
    placa VARCHAR(7),
    chassi VARCHAR(17),
    modelo VARCHAR(255),
    marca VARCHAR(255),
    ano INT,
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

CREATE TABLE Compras_Cliente (
    idCompras_Cliente INT PRIMARY KEY,
    data DATE,
    hora TIME,
    valorTotalDaCompra DECIMAL(10,2),
    idProdutos INT,
    idCliente INT,
    FOREIGN KEY (idProdutos) REFERENCES Produtos(idProdutos),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- 1) Cliente
INSERT INTO Cliente (idCliente, nome, nomeDoMeio, sobrenome, endereço, telefone) VALUES
(1, 'Maria', 'A.', 'Silva', 'Rua A, 1', '123-456-7890'),
(2, 'João', 'B.', 'Santos', 'Avenida B, 2', '987-654-3210'),
(3, 'Ana', 'C.', 'Oliveira', 'Rua C, 3', '555-123-4567'),
(4, 'Pedro', 'D.', 'Ribeiro', 'Avenida D, 4', '111-222-3333'),
(5, 'Carla', 'E.', 'Almeida', 'Rua E, 5', '444-555-6666'),
(6, 'Miguel', 'F.', 'Ferreira', 'Avenida F, 6', '777-888-9999'),
(7, 'Sofia', 'G.', 'Cunha', 'Rua G, 7', '222-333-4444'),
(8, 'Lucas', 'H.', 'Machado', 'Avenida H, 8', '666-777-8888'),
(9, 'Laura', 'I.', 'Fonseca', 'Rua I, 9', '999-000-1111'),
(10, 'Gabriel', 'J.', 'Barbosa', 'Avenida J, 10', '333-444-5555');

-- 2) Funcionário
INSERT INTO Funcionário (idFuncionário, nome, nomeDoMeio, sobrenome, matrícula, CPF) VALUES
(1, 'João', 'A.', 'Silva', 12345, '12345678901'),
(2, 'Maria', 'B.', 'Santos', 23456, '23456789012'),
(3, 'Pedro', 'C.', 'Oliveira', 34567, '34567890123'),
(4, 'Ana', 'D.', 'Ribeiro', 45678, '45678901234'),
(5, 'Lucas', 'E.', 'Almeida', 56789, '56789012345'),
(6, 'Sofia', 'F.', 'Ferreira', 67890, '67890123456'),
(7, 'Miguel', 'G.', 'Cunha', 78901, '78901234567'),
(8, 'Laura', 'H.', 'Machado', 89012, '89012345678'),
(9, 'Gabriel', 'I.', 'Fonseca', 90123, '90123456789'),
(10, 'Carla', 'J.', 'Barbosa', 10234, '01234567890');

-- 3) Produtos
INSERT INTO Produtos (idProdutos, códigoDoProduto, valorDoProduto) VALUES
(1, 'ABC123', 99.99),
(2, 'XYZ456', 49.99),
(3, 'DEF789', 199.99),
(4, 'GHI012', 29.99),
(5, 'JKL345', 149.99),
(6, 'MNO678', 79.99),
(7, 'PQR901', 59.99),
(8, 'STU234', 39.99),
(9, 'VWX567', 129.99),
(10, 'YZA890', 89.99);

-- 4) Veículo
INSERT INTO Veículo (idVeículo, placa, chassi, modelo, marca, ano, idCliente) VALUES
(1, 'ABC1234', '12345678901234567', 'Sedan', 'Toyota', 2023, 1),
(2, 'XYZ5678', '23456789012345678', 'Hatchback', 'Honda', 2022, 2),
(3, 'DEF9876', '34567890123456789', 'SUV', 'Ford', 2021, 3),
(4, 'GHI5432', '45678901234567890', 'Crossover', 'Nissan', 2023, 4),
(5, 'JKL2109', '56789012345678901', 'Sedan', 'Chevrolet', 2020, 5),
(6, 'MNO8796', '67890123456789012', 'Hatchback', 'Volkswagen', 2022, 6),
(7, 'PQR6543', '78901234567890123', 'SUV', 'Kia', 2021, 7),
(8, 'STU4321', '89012345678901234', 'Crossover', 'Hyundai', 2023, 8),
(9, 'VWX9876', '90123456789012345', 'Sedan', 'Mazda', 2022, 9),
(10, 'YZA5678', '01234567890123456', 'Hatchback', 'Subaru', 2020, 10);

-- 5) Compras_Cliente
INSERT INTO Compras_Cliente (idCompras_Cliente, data, hora, valorTotalDaCompra, idProdutos, idCliente) VALUES
(1, '2023-08-20', '10:00:00', 150.00, 1, 1),
(2, '2023-08-21', '14:30:00', 70.00, 3, 2),
(3, '2023-08-22', '09:15:00', 200.00, 2, 3),
(4, '2023-08-23', '16:00:00', 100.00, 4, 4),
(5, '2023-08-24', '11:45:00', 130.00, 5, 5),
(6, '2023-08-25', '13:20:00', 80.00, 6, 6),
(7, '2023-08-26', '15:30:00', 50.00, 8, 7),
(8, '2023-08-27', '08:45:00', 90.00, 7, 8),
(9, '2023-08-28', '17:15:00', 180.00, 9, 9),
(10, '2023-08-29', '10:30:00', 70.00, 10, 10);

-- 6) Atendimento
INSERT INTO Atendimento (idAtendimento, data, hora, serviçoRealizado, valorCobrado, idCliente, idFuncionário) VALUES
(1, '2023-08-20', '10:00:00', 'Manutenção de motor', 150.00, 1, 1),
(2, '2023-08-21', '14:30:00', 'Troca de óleo', 50.00, 2, 3),
(3, '2023-08-22', '09:15:00', 'Alinhamento e balanceamento', 80.00, 3, 2),
(4, '2023-08-23', '16:00:00', 'Reparo de freios', 120.00, 4, 1),
(5, '2023-08-24', '11:45:00', 'Troca de bateria', 90.00, 5, 3),
(6, '2023-08-25', '13:20:00', 'Diagnóstico de problemas', 60.00, 6, 2),
(7, '2023-08-26', '15:30:00', 'Limpeza de injeção', 70.00, 7, 1),
(8, '2023-08-27', '08:45:00', 'Troca de filtros', 40.00, 8, 3),
(9, '2023-08-28', '17:15:00', 'Revisão completa', 200.00, 9, 2),
(10, '2023-08-29', '10:30:00', 'Troca de pneus', 160.00, 10, 1);

-- Listar todos os produtos
SELECT * FROM Produtos;

-- Listar todos os clientes
SELECT * FROM Cliente;

-- Listar valor total de todos os pedidos
SELECT SUM(valorTotalDaCompra) AS Total FROM Compras_Cliente;

-- Listar valor total que cada vendedor gastou
SELECT F.idFuncionário, F.nome, SUM(CC.valorTotalDaCompra) AS TotalGasto
FROM Funcionário F
LEFT JOIN Atendimento A ON F.idFuncionário = A.idFuncionário
LEFT JOIN Compras_Cliente CC ON A.idCliente = CC.idCliente
GROUP BY F.idFuncionário, F.nome;

-- Listar valor total que cada cliente gastou
SELECT C.idCliente, C.nome, SUM(CC.valorTotalDaCompra) AS TotalGasto
FROM Cliente C
LEFT JOIN Compras_Cliente CC ON C.idCliente = CC.idCliente
GROUP BY C.idCliente, C.nome;

-- Listar produtos por valor em ordem decrescente
SELECT * FROM Produtos
ORDER BY valorDoProduto DESC;

-- Listar pedidos por cliente em ordem crescente
SELECT CC.idCliente, C.nome, COUNT(CC.idCompras_Cliente) AS QuantidadePedidos
FROM Compras_Cliente CC
JOIN Cliente C ON CC.idCliente = C.idCliente
GROUP BY CC.idCliente, C.nome
ORDER BY QuantidadePedidos ASC;

-- Listar detalhes dos produtos em um pedido com cliente
SELECT CC.idCompras_Cliente, P.idProdutos, P.códigoDoProduto, P.valorDoProduto, C.idCliente, C.nome
FROM Compras_Cliente CC
JOIN Produtos P ON CC.idProdutos = P.idProdutos
JOIN Cliente C ON CC.idCliente = C.idCliente;

-- Listar nomes do cliente e descrição do pedido
SELECT C.nome, CC.idCompras_Cliente, CC.valorTotalDaCompra
FROM Cliente C
JOIN Compras_Cliente CC ON C.idCliente = CC.idCliente;

-- Quantos pedidos foram feitos por cada cliente?
SELECT C.idCliente, C.nome, COUNT(CC.idCompras_Cliente) AS QuantidadePedidos
FROM Cliente C
LEFT JOIN Compras_Cliente CC ON C.idCliente = CC.idCliente
GROUP BY C.idCliente, C.nome;

-- Algum cliente também é funcionário?
SELECT C.idCliente, C.nome
FROM Cliente C
WHERE C.idCliente IN (SELECT idFuncionário FROM Funcionário);

-- Qual Relação de funcionário e cliente?
SELECT F.idFuncionário, F.nome, C.idCliente, C.nome
FROM Funcionário F
LEFT JOIN Cliente C ON F.idFuncionário = C.idCliente;

-- Qual número de vendas por ano?
SELECT YEAR(data) AS Ano, COUNT(idCompras_Cliente) AS NúmeroVendas
FROM Compras_Cliente
GROUP BY Ano;

-- Qual número de serviço realizado por ano?
SELECT YEAR(data) AS Ano, COUNT(idAtendimento) AS NúmeroServiçosRealizados
FROM Atendimento
GROUP BY Ano;

-- Qual número de serviço realizado e vendas por ano?
SELECT Ano, SUM(NúmeroVendas) AS NúmeroVendas, SUM(NúmeroServiçosRealizados) AS NúmeroServiçosRealizados
FROM (
    SELECT YEAR(data) AS Ano, COUNT(idCompras_Cliente) AS NúmeroVendas, 0 AS NúmeroServiçosRealizados
    FROM Compras_Cliente
    GROUP BY Ano
    UNION ALL
    SELECT YEAR(data) AS Ano, 0 AS NúmeroVendas, COUNT(idAtendimento) AS NúmeroServiçosRealizados
    FROM Atendimento
    GROUP BY Ano
) AS AnoStats
GROUP BY Ano;

-- Quantos produtos foram disponibilizados?
SELECT COUNT(idProdutos) AS TotalProdutos FROM Produtos;

-- Quantos serviço realizado foram realizados?
SELECT COUNT(idAtendimento) AS TotalServiçosRealizados FROM Atendimento;

-- Qual valor de serviço realizado por ano?
SELECT YEAR(data) AS Ano, SUM(valorCobrado) AS ValorTotalServiçosRealizados
FROM Atendimento
GROUP BY Ano;

-- Qual valor de serviço realizado e vendas por ano?
SELECT Ano, SUM(ValorTotalVendas) AS ValorTotalVendas, SUM(ValorTotalServiçosRealizados) AS ValorTotalServiçosRealizados
FROM (
    SELECT YEAR(data) AS Ano, SUM(valorTotalDaCompra) AS ValorTotalVendas, 0 AS ValorTotalServiçosRealizados
    FROM Compras_Cliente
    GROUP BY Ano
    UNION ALL
    SELECT YEAR(data) AS Ano, 0 AS ValorTotalVendas, SUM(valorCobrado) AS ValorTotalServiçosRealizados
    FROM Atendimento
    GROUP BY Ano
) AS AnoStats
GROUP BY Ano;
