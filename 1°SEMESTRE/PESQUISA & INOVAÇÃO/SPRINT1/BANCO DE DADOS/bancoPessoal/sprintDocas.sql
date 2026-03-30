CREATE DATABASE sprintDocas;
USE sprintDocas;

CREATE TABLE armazem (
	idArmazem INT PRIMARY KEY AUTO_INCREMENT,
    nomeArmazem VARCHAR (70),
    logradouroArmazem VARCHAR (100),
    numLogradouro VARCHAR (10),
    cidadeArmazem VARCHAR (80),
    estadoArmazem VARCHAR (30)
);

CREATE TABLE doca(
	idDoca INT PRIMARY KEY AUTO_INCREMENT,
    identificacaoDoca VARCHAR (8),
    statusOcupacaoDoca VARCHAR (12),
    CONSTRAINT cStatusOcupacaoDoca CHECK (statusOcupacaoDoca IN ('Ocupado', 'Desocupado'))
);

CREATE TABLE historicoSensor (
	idHistoricoSensor INT PRIMARY KEY AUTO_INCREMENT,
    dtHoraEntrada DATETIME,
    dtHoraSaida DATETIME,
    tempoPermanencia INT
);

CREATE TABLE cadastro (
	idCadastro INT PRIMARY KEY AUTO_INCREMENT,
    nomeCadastro VARCHAR (100),
    emailCadastro VARCHAR (80),
    senhaCadastro VARCHAR (50)
);

CREATE TABLE empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
      nomeEmpresa VARCHAR (100),
	  cnpjEmpresa CHAR (14) 
);

CREATE TABLE caminhao (
	idCaminhao INT PRIMARY KEY AUTO_INCREMENT,
    placaCaminhao CHAR (7)
);

-- Insert Armazem

INSERT INTO armazem (nomeArmazem, logradouroArmazem, numLogradouro, cidadeArmazem, estadoArmazem) VALUES 
('CD Amazon Cajamar - SBP1', 'Avenida Dr. Antonio João Abdalla', '260', 'Cajamar', 'SP'),
('CD Mercado Livre - Bahia', 'Via Parafuso (BA-535)', 'S/N', 'Camaçari', 'BA'),
('Multilog Curitiba', 'BR-277 Curitiba Paranaguá', '3500', 'São José dos Pinhais', 'PR'),
('GLP Jundiaí VII', 'Avenida José Benassi', '2250', 'Jundiaí', 'SP'),
('Condomínio Logístico Viana', 'Rodovia BR-101', 'KM 298', 'Viana', 'ES'),
('Porto Seco Novo Hamburgo', 'Rua Ver. Adão Rodrigues de Oliveira', '1150', 'Novo Hamburgo', 'RS'),
('Prologis Castelo 46', 'Rodovia Castello Branco', 'KM 46', 'Araçariguama', 'SP');

-- Insert Empresa

INSERT INTO empresa (nomeEmpresa, cnpjEmpresa) VALUES 
('Amazon Servicos de Varejo Brasil Ltda', '15436940000103'),
('Mercado Livre Ebacas Ltda', '03361252000134'),
('Magazine Luiza S/A', '47960950000121'),
('SHPS Tecnologia e Servicos (Shopee)', '35635824000112'),
('Americanas S.A.', '00776574000106'),
('Via S.A. (Casas Bahia)', '33041260065290'),
('Alibaba Cloud (AliExpress)', '39474131000108');


-- insert Doca
INSERT INTO doca (identificacaoDoca, statusOcupacaoDoca) VALUES 
('DC-01', 'Ocupado'), 
('DC-02', 'Desocupado'), 
('DC-03', 'Desocupado'), 
('DC-04', 'Ocupado'), 
('DC-05', 'Desocupado'),
 ('DC-06', 'Ocupado'),
 ('DC-07', 'Desocupado');

-- Insert Histórico
INSERT INTO historicoSensor (dtHoraEntrada, dtHoraSaida, tempoPermanencia) VALUES 
('2026-03-06 08:00:00', '2026-03-06 09:30:00', 90),
('2026-03-06 10:15:00', '2026-03-06 11:45:00', 90),
('2026-03-06 13:00:00', '2026-03-06 14:00:00', 60),
('2026-03-06 14:30:00', '2026-03-06 16:00:00', 90);

-- Insert Cadastro 
INSERT INTO cadastro (nomeCadastro, emailCadastro, senhaCadastro) VALUES 
('Marcos Oliveira', 'm.oliveira@log.com.br', 'Log@2026'),
('Ana Julia Costa', 'ana.costa@operacao.com', 'Doca#321'),
('Bruno Santos', 'bruno.s@supervisor.com', 'Sup_2026'),
('Carla Dias', 'carla.dias@gestao.com', 'Gestao!99');

-- Insert Caminhão 
INSERT INTO caminhao (placaCaminhao) VALUES 
('BRA2S26'),
('RJK7H44'), 
('POG3I19'),
('FTU8J50'),
('LQK9B12'),
('MCO4E55'),
('NDS1A22');


-- select das tabelas

SELECT * FROM armazem;
SELECT * FROM doca;
SELECT * FROM empresa;
SELECT * FROM cadastro;
SELECT * FROM caminhao;
SELECT * FROM historicoSensor;


-- Selecionando empresa que o nome comece com 'A'
SELECT * FROM empresa
	WHERE nomeEmpresa LIKE 'a%';
    
    




