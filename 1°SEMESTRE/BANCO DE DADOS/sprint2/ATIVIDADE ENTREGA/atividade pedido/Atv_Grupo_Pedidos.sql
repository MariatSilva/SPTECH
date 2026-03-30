/*
ATIVIDADE PEDIDO
GRUPO 6

N° do Grupo: 06

Integrantes: 
Ana Carolina Viana Dos Reis
Douglas Henrique De Campos Alves
Marcelly Pereira Da Silva
Maria Fernanda Teixeira Da Silva
Vinicius Borges Do Nascimento
*/

-- Criando o banco de dados Script
CREATE DATABASE Script;
USE Script;


-- Crinado a tabela Cliente
CREATE TABLE Cliente(
idCliente INT PRIMARY KEY AUTO_INCREMENT,
nomeCliente VARCHAR (45) NOT NULL,
email VARCHAR(45) NOT NULL,
cpf CHAR (11) NOT NULL
);

-- Criando a tabela Empresa
CREATE TABLE Empresa(
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nomeEmpresa VARCHAR(45) NOT NULL,
cnpj CHAR(14) NOT NULL
);

-- Criando a tabela Produto
CREATE TABLE Produto(
idProduto INT PRIMARY KEY AUTO_INCREMENT,
nomeProduto VARCHAR(70),
categoria VARCHAR(45),
precoUnitario INT,
CONSTRAINT ctCategoria -- Restrição que garante que a categoria esteja entre as definidas
CHECK (categoria IN ('Móveis', 'Eletrodomésticos', 'Eletrônicos'))
);

-- Criando a tabela Vendedor
CREATE TABLE Vendedor(
idVendedor INT PRIMARY KEY AUTO_INCREMENT,
nomeVendedor VARCHAR(45) NOT NULL,
cpf CHAR (11) NOT NULL,

fkEmpresa INT NOT NULL, -- Chave estrangeira da tabela empresa
CONSTRAINT ctFkEmpresa -- Relacionamento 1:n
FOREIGN KEY (fkEmpresa) -- Um vendedor só trabalha pra 1 (1) empresa, mas uma empresa pode ter vários (n) vendedores.
REFERENCES Empresa(idEmpresa)
);

-- Criando a tabela Avaliação
CREATE TABLE Avaliacao(
idAvaliacao INT PRIMARY KEY AUTO_INCREMENT,
nota INT,
comentario VARCHAR (200),

fkCliente INT NOT NULL, -- Chave estrangeira da tabela cliente
CONSTRAINT ctFkCliente -- Relacionamento 1:n
FOREIGN KEY (fkCliente) 
REFERENCES Cliente(idCliente),

CONSTRAINT ctNota -- Restrição que garante que a nota esteja entre 1 e 5
CHECK (nota BETWEEN 0 AND 6)
);
 
 -- Criando a tabela Pedido e suas FK's
CREATE TABLE Pedido(
idPedido INT PRIMARY KEY AUTO_INCREMENT,
dtPedido DATE,
statusPedido VARCHAR(45),
horario TIME,
entregaPrevista DATE,
dtRealizada DATE,
cidade VARCHAR(45),
estado CHAR (2),
quantidade INT,

fkVendedor INT, -- Chave estrangeira da tabela vendedor
CONSTRAINT ctFkVendedor -- relacionamento 1:n
FOREIGN KEY (fkVendedor) 
REFERENCES Vendedor(idVendedor),

fkCliente INT, -- Chave estrangeira da tabela cliente
CONSTRAINT ctFkClienteP -- relacionamento 1:n
FOREIGN KEY (fkCliente) 
REFERENCES Cliente(idCliente),

fkProduto INT, -- Chave estrangeira da tabela produto
CONSTRAINT ctFkProduto -- relacionamento 1:n
FOREIGN KEY (fkProduto) -- Um pedido só pode ter 1 (1) produto, mas um produto pode estar incluso em vários (n) pedidos.
REFERENCES Produto(idProduto),

fkAvaliacao INT UNIQUE, -- Chave estrangeira da tabela avaliação
CONSTRAINT ctFkAvaliacao -- relacionamento 1:1
FOREIGN KEY (fkAvaliacao) 
REFERENCES Avaliacao(idAvaliacao),

CONSTRAINT ctStatusPedido -- Restrição que garante que statusPedido esteja entre os definidas
CHECK (statusPedido IN ('Entregue', 'Cancelado', 'Em transporte'))
);

-- Inserindo dados na tabela Cliente
INSERT INTO Cliente (nomeCliente, email, cpf) VALUES 
('Ana Souza', 'ana@email.com', '01010101010'), -- Fez os pedidos 1 e 3.
('João Silva', 'joao@email.com', '02020202020'), -- Fez o pedido 2.
('Maria Oliveira', 'maria@email.com', '03030303030'), -- Fez o pedido 4.
('Lucas Pereira', 'lucas@email.com', '04040404040'), -- Fez o pedido 5.
('Carla Mendes', 'carla@email.com', '05050505050'), -- Fez o pedido 6.
('Bruno Rocha', 'bruno@email.com', '06060606060'), -- Fez o pedido 7.
('Juliana Castro', 'juliana@email.com', '07070707070'), -- Fez o pedido 8.
('Ricardo Alves', 'ricardo@email.com', '08080808080') -- Fez o pedido 9.
;

-- Inserindo dados na tabela Empresa
INSERT INTO Empresa (nomeEmpresa, cnpj) VALUES
('TechStore', '11111111111111'), -- Tem os funcionários Carlos Lima1 e Fernanda Alves
('HomeStore', '22222222222222'), -- Tem os funcionários Carlos Lima2 e Bruno Costa
('MegaStore', '33333333333333') -- Tem o funcionário Rafael Souza
;

-- Inserindo dados na tabela Produto
INSERT INTO Produto (nomeProduto, categoria, precoUnitario) VALUES
('Notebook Dell', 'Eletrônicos', 3500), -- Pedidos 1 e 5
('Mouse Logitech', 'Eletrônicos', 120), -- Pedido 2
('Cadeira Gamer', 'Móveis', 900), -- Pedido 3
('Mesa Escritório', 'Móveis', 700), -- Pedido 4
('Geladeira Brastemp', 'Eletrodomésticos', 2800), -- Pedido 5
('Fogão 4 bocas', 'Eletrodomésticos', 900), -- Pedido 7
('Smartphone Samsung', 'Eletrônicos', 2200), -- Pedido 8
('Sofá 3 lugares', 'Móveis', 1800) -- Pedido 9
;

-- Inserindo dados na tabela Vendedor
INSERT INTO Vendedor (nomeVendedor, cpf, fkEmpresa) VALUES
('Carlos Lima', '10000000000', 1),
('Fernanda Alves', '33333333333', 1),
('Carlos Lima', '20000000000', 2),
('Bruno Costa', '44444444444', 2),
('Rafael Souza', '55555555555', 3)
;

-- Inserindo dados na tabela nota
INSERT INTO Avaliacao (nota, comentario, fkCliente) VALUES
(5 , 'Notebook perfeito, chegou no prazo e é muito bem embalado, recomendo!', 1),
(4 , 'Produto bom, chegou em 2 dias, dentro do prazo> Recomendo.', 2),
(NULL , NULL, 1),
(3 , 'Chegou dentro do prazo, em 8 dias. Porém o produto deixou um pouco a desejar.', 3),
(NULL , NULL, 4),
(5 , 'Geladeira muitp boaaaa!!! Chegou 1 dia antes em apenas 5 dias, recomendo muuitooo!!!', 5),
(2 , 'Fogão veio danificado! Demorou pra chegar, 3 dias atrasado! Não recomendo.', 6),
(NULL , NULL, 7),
(NULL , NULL, 8)
;

-- Inserindo dados na tabela Pedido
INSERT INTO Pedido (dtPedido, statusPedido, horario, entregaPrevista, dtRealizada, cidade, estado, quantidade, fkVendedor, fkCliente, fkProduto, fkAvaliacao) VALUES
('2024-01-10', 'Entregue', '13:31', '2024-01-15', '2024-01-15', 'São Paulo', 'SP', 1, 1, 1, 1, 1),
('2024-01-11', 'Entregue', '14:20', '2024-01-13', '2024-01-13', 'Campinas', 'SP', 2, 2, 2, 2, 2),
('2024-02-12', 'Cancelado', '07:36', '2026-04-20', NULL, 'São Paulo', 'SP', 1, 3, 1, 3, 3),
('2024-01-12', 'Entregue', '08:30', '2024-01-20', '2024-01-20', 'Uberaba', 'MG', 1, 4, 3, 4, 4),
('2024-03-13', 'Em transporte', '09:00', '2026-03-20', NULL, 'Uberlândia', 'MG', 1, 2, 4, 1, 5),
('2024-02-15', 'Entregue', '11:10', '2024-02-20', '2024-02-19', 'Curitiba', 'PR', 1, 5, 5, 5, 6),
('2024-02-16', 'Entregue', '16:45', '2024-02-22', '2024-02-25', 'Porto Alegre', 'RS', 1, 5, 6, 6, 7),
('2024-02-18', 'Em transporte', '10:15', '2024-03-25', NULL, 'São Paulo', 'SP', 1, 1, 7, 7, 8),
('2024-02-19', 'Cancelado', '18:15', '2024-03-28', NULL, 'Belo Horizonte', 'MG', 1, 4, 8, 8, 9)
;

-- RELATÓRIO FINAL DE PEDIDOS MULTIPLATAFORMA
SELECT
p.dtPedido AS 'Data do Pedido',
p.horario AS 'Hora do Pedido',
c.nomeCliente AS 'Nome do Cliente',
e.nomeEmpresa AS 'Empresa',
pdt.nomeProduto AS 'Produto',
pdt.categoria AS 'Categoria',
v.nomeVendedor AS 'Nome do Vendedor',

CONCAT (nomeCliente, ' ', email) AS 'Contato do Cliente', -- (Nome do cliente + E-mail)
CONCAT (cidade, ' ', estado) AS 'Localização', -- (Cidade + Estado)

p.statusPedido AS 'Status do Pedido',

-- Case de campo calculado (Situação do Pedido)
CASE 
	WHEN statusPedido='Entregue' AND dtRealizada<=entregaPrevista THEN "Entrega no prazo"
	WHEN statusPedido= 'Entregue' AND dtRealizada>entregaPrevista THEN "Entrega atrasada"
	WHEN statusPedido='Cancelado' THEN "Pedido cancelado"
	WHEN statusPedido= 'Em transporte' THEN "Pedido em andamento"
END AS situacao_pedido

-- Relatório feito a partir da tabela Pedidos (pedidos_consolidados)
FROM Pedido AS p

JOIN Vendedor AS v -- Juntando com a tabela Vendedor (v)
ON fkVendedor=idVendedor

JOIN Cliente AS c -- Juntando com a tabela Cliente (c)
ON fkCliente = idCliente

JOIN Produto AS pdt -- Juntando com a tabela Produto (pdt)
ON fkProduto = idProduto

JOIN Avaliacao AS a -- Juntando com a tabela Avaliação (a)
ON fkAvaliacao = idAvaliacao

JOIN Empresa AS e -- Juntando com a tabela Empresa (e)
ON fkEmpresa = idEmpresa

WHERE categoria= "Eletrônicos" -- Só traz informações onde a categoria é Eletrônicos
AND estado="SP" ORDER BY dtPedido; -- Ordena pela data do pedido