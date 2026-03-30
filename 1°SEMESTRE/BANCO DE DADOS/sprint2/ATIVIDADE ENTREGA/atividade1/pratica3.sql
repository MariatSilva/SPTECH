-- EXERCÍCIO 1

CREATE DATABASE Sprint2;
USE Sprint2;

CREATE TABLE Atleta (
	idAtleta INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(40),
    modalidade VARCHAR (40),
    qtdMedalha INT
);


INSERT INTO Atleta(nome, modalidade, qtdMedalha) VALUES
('Yuri Pardinho', 'Muay thai', 13),
('Raquel Queiroz', 'Natação', 7),
('Amanda Pinto', 'Natação', 2),
('Pedro Pereira', 'Marcha atlética', 5),
('Fábio Lima', 'Marcha atlética', 3);

CREATE TABLE País(
	idPais INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (40),
    capital VARCHAR (40)
);


INSERT INTO País (nome, capital) VALUES
('Brasil', 'São Paulo'),
('Brasil', 'Rio de Janeiro'),
('Rússia', 'Moscou'),
('China', 'Pequim'),
('Japão', 'Tóquio');

ALTER TABLE Atleta ADD COLUMN fkPais INT;

ALTER TABLE Atleta ADD CONSTRAINT ctFkPais
	FOREIGN KEY (fkPais)REFERENCES País(idPais);



UPDATE Atleta SET fkPais = 1
	WHERE idAtleta = 1;
    
UPDATE Atleta SET fkPais = 2
	WHERE idAtleta = 2;
    
UPDATE Atleta SET fkPais = 3
	WHERE idAtleta = 3;

UPDATE Atleta SET fkPais = 4
	WHERE idAtleta = 4;
    
UPDATE Atleta SET fkPais = 5
	WHERE idAtleta = 5;


SELECT 
a.nome AS nomeAtleta,
p.nome AS nomePais
FROM ATleta a
JOIN País p ON a.fkPais = p.idPais;


SELECT 
a.nome AS nomeAtleta,
p.nome AS nomePais
FROM ATleta a
JOIN País p ON a.fkPais = p.idPais
WHERE p.nome = 'Brasil';


-- 	EXERCÍCIO 2

CREATE TABLE Musica(
	idMusica INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR (40),
    artista VARCHAR (40),
    genero VARCHAR (40)
);

INSERT INTO Musica (titulo, artista, genero)VALUES
('NEW MAGIC WAND', 'Tyler, The Creator', 'Hip Hop'),
('Pras Damas', 'Oriente', 'Rap nacional'),
('I DONT LOVE YOU ANYMORE', 'Tyler,The Creator', 'Hip Hop');


CREATE TABLE Album(
	idAlbum INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (40),
    tipo VARCHAR (40),
    dtLancamento DATE,
    CONSTRAINT ctTipo CHECK (tipo IN ('Digital', 'Físico'))
);	

INSERT INTO Album (nome, tipo, dtLancamento) VALUES
('Igor', 'Digital', '2019-05-17'),
('Dois', 'Físico', '1986-07-01');


SELECT * FROM Musica;
SELECT * FROM Album;

ALTER TABLE Musica ADD COLUMN fkAlbum INT; 

ALTER TABLE Musica ADD CONSTRAINT ctFkAlbum 
	FOREIGN KEY (fkAlbum) REFERENCES Album(idAlbum);
    
UPDATE Musica SET fkAlbum = 1
	WHERE idMusica = 1;
    
UPDATE Musica SET fkAlbum = 1
	WHERE idMusica = 3;
    
UPDATE Musica SET fkAlbum = 2
	WHERE idMusica = 2;
    
SELECT 
m.idMusica,
m.titulo,
m.artista,
m.genero,
al.idAlbum,
al.nome,
al.tipo,
al.dtLancamento
FROM Musica m
JOIN Album al ON al.idAlbum = m.fkAlbum;


SELECT 
m.titulo AS tituloMusica,
al.nome AS nomeAlbum
FROM Musica m
JOIN Album al ON al.idAlbum = m.fkAlbum;


SELECT 
m.idMusica,
m.titulo,
m.artista,
m.genero,
al.idAlbum,
al.nome,
al.tipo,
al.dtLancamento
FROM Musica m
JOIN Album al ON al.idAlbum = m.fkAlbum
WHERE tipo = 'Digital';






-- EXERCÍCIO 3

CREATE TABLE pessoa(
	idPessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (40),
    cpf CHAR (11)
);

CREATE TABLE Reserva(
	idReserva INT PRIMARY KEY AUTO_INCREMENT,
    dtReserva DATE,
    dtRetirada DATE,
    dtDevolucao DATE,
    fkPessoa INT,
    CONSTRAINT ctFkPessoa 
		FOREIGN KEY (fkPessoa) REFERENCES pessoa(idPessoa)
);


INSERT INTO pessoa (nome, cpf)VALUES
('Julia Nunes', '12345678912'),
('Nicolas Alves', '98765432198'),
('Rikelme Bismark', 23456789143),
('Rayssa Mineiro', 76543436789),
('Camila Nefertite', 36378492678);


INSERT INTO Reserva (dtReserva, dtRetirada, dtDevolucao, fkPessoa)VALUES
('2025-09-09', '2025-09-12', '2025-09-20', 1),
('2025-12-12', '2026-01-10', '2026-01-14', 2),
('2026-01-03', '2026-01-14', '2026-01-26', 3),
('2025-08-08', '2025-08-30', '2025-09-17', 4),
('2026-01-04', '2026-01-18', '2026-02-01', 5);

SELECT * FROM pessoa;
SELECT * FROM Reserva;

SELECT 
nome AS nomePessao,
cpf AS CPF
FROM pessoa;

SELECT dtReserva AS data_reserva,
dtRetirada AS data_retirada,
dtDevolucao AS data_devolução,
fkPessoa AS idPessoa
FROM Reserva;


SELECT idReserva, 
dtReserva,
dtRetirada,
dtDevolucao,
CASE 
WHEN dtDevolucao < NOW()
THEN 'Devolvido'
ELSE 'A devolver'
END AS data_devolução
FROM reserva;


SELECT 
p.idPessoa,
p.nome,
IFNULL(r.dtDevolucao, 'Não devolvido') AS dataDevolucao
FROM Reserva r
JOIN pessoa p ON r.fkPessoa = p.idPessoa;



-- EXERCÍCIO 4

CREATE TABLE pessoa1(
	idPessoa1 INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (45),
    dtNascimento DATE
);


CREATE TABLE pessoa2(
	idPessoa2 INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (45),
    dtNascimento DATE,
    fkPessoa1 INT,
    CONSTRAINT fkPessoa2Pessoa1 
		FOREIGN KEY (fkPessoa1) REFERENCES pessoa1(idPessoa1)
);


INSERT INTO pessoa1(nome, dtNascimento)VALUES
('Joana Pereira', '2000-01-01'),
('Kevin Costa', '1998-09-09'),
('Safeno Cruz', '2006-07-09'),
('José Maria', '2003-07-01'),
('Yuri Garcia', '2007-02-03');

INSERT INTO pessoa2(nome, dtNascimento, fkPessoa1)VALUES
('João Pedro', '1999-04-28', 1),
('Ramona Oliveira', '2001-06-30', 2),
('Mariana Jesus', '2005-02-21', 3),
('Conrado Castro', '2003-07-06', 4),
('Carmen Pinto', '2007-04-05', 5);

SELECT * FROM pessoa1;
SELECT * FROM pessoa2;


SELECT idPessoa1 AS IdentificaçãoPessoa1,
nome AS nomePessoa,
dtNascimento AS dataNascimento
FROM pessoa1;


SELECT idPessoa2 AS IdentificaçãoPessoa2,
nome AS nomePessoa2,
dtNascimento AS dataNascimento,
fkpessoa1 AS IdentificaçãoPessoa1
FROM pessoa2;


SELECT pessoa2.nome AS nomePessoa2,
pessoa2.dtNascimento AS nascimentoPessoa2,
pessoa1.nome AS nomePessoa1,
pessoa1.dtNascimento AS nascimentoPessoa1,
CASE
WHEN pessoa1.dtNascimento < pessoa2.dtNascimento
THEN 'Pessoa 1 é mais velha que pessoa 2'
ELSE 'Pessoa 2 é mais velha que pessoa 1'
END AS 'Quem é mais velho?'
FROM pessoa2
JOIN pessoa1 ON pessoa1.idPessoa1 = pessoa2.fkPessoa1;



SELECT nome,
IFNULL (dtNascimento, 'Sem data de nascimento') AS dtNascimento
FROM pessoa1;




-- EXERCÍCIO 5


CREATE TABLE candidato (
	idCandidato INT PRIMARY KEY AUTO_INCREMENT,
    nomeCandidato VARCHAR (45),
    dtNasc DATE,
    cpf CHAR (11)
    
);

CREATE TABLE habilitacao (
	idHabilitacao INT PRIMARY KEY AUTO_INCREMENT,
    tipoHabilitacao VARCHAR (3),
    dtCriacaoHabilitacao DATE,
    dtVencimentoHabilitacao DATE,
    fkCandidato INT UNIQUE,
    CONSTRAINT habilitacaoFkCandidato 
		FOREIGN KEY (fkCandidato) REFERENCES candidato(idCandidato)
);




INSERT INTO candidato (nomeCandidato, dtNasc, cpf) VALUES
('Carlos Pereira', '1985-02-01', '12345678998'),
('Aline Costa', '1990-03-07', '23456789014'),
('Alan Vidal', '1978-01-26', '71849482981'),
('Pedro Silva', '2000-06-19', '82018201829'),
('Arthur Souza', '2002-01-18', '91727384939');

INSERT INTO habilitacao(tipoHabilitacao, dtCriacaoHabilitacao, dtVencimentoHabilitacao, fkCandidato) VALUES
('A', '2026-01-01', '2027-01-01', 1),
('B', '2025-01-01','2026-01-01', 2),
('ACC', '2026-01-20', '2027-01-20', 3),
('A', '2025-06-08', '2026-06-08', 4),
('B', '2024-12-12', '2025-12-12', 5);



SELECT * FROM candidato;
SELECT * FROM habilitacao;



SELECT idCandidato AS identificacaoCandidato,
nomeCandidato AS nomeCandidato,
dtNasc AS dataNascimento
FROM candidato;


SELECT tipoHabilitacao,
fkCandidato,
dtCriacaoHabilitacao,
dtVencimentoHabilitacao,
CASE 
WHEN dtVencimentoHabilitacao < NOW()
THEN 'Habilitação fora do prazo'
ELSE 'Habilitação dentro do prazo'
END AS 'Sobre a habilitação'
FROM habilitacao;


SELECT
idCandidato, 
cpf,
 IFNULL(nomeCandidato, 'Sem nome') AS 'nomeCandidato',
IFNULL (dtNasc, 'Sem data de nascimento') AS dataNascimento
FROM candidato;


-- EXERCÍCIO 6

CREATE TABLE farmacia (
	idFarmacia INT PRIMARY KEY AUTO_INCREMENT,
    nomeFarmacia VARCHAR (45),
    cnpj CHAR(14)
);

CREATE TABLE enderecoFarmacia (
	idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR (100),
    numLogradouro VARCHAR (10),
    cidade VARCHAR (50),
    estado VARCHAR (50),
    fkFarmacia INT UNIQUE,
    CONSTRAINT enderecoFkFarmacia
		FOREIGN KEY (fkFarmacia) REFERENCES farmacia(idFarmacia)
);


CREATE TABLE farmaceutico(
	idFarmaceutico INT PRIMARY KEY AUTO_INCREMENT,
    nomeFarmaceutico VARCHAR (100),
    cpfFarmaceutico CHAR (11),
    dtNascFarmaceutico DATE,
    fkFarmacia INT,
    CONSTRAINT farmaceuticoFkFarmacia
		FOREIGN KEY (fkFarmacia) REFERENCES farmacia(idFarmacia)
);



INSERT INTO farmacia (nomeFarmacia, cnpj) VALUES
('Farmácia Vida+', '12345678000101'),
('Farmácia Saúde Total', '23456789000102'),
('Farmácia Bem Estar', '34567890000103'),
('Farmácia Popular', '45678901000104'),
('Farmácia Central', '56789012000105');

INSERT INTO enderecoFarmacia (logradouro, numLogradouro, cidade, estado, fkFarmacia) VALUES
('Rua das Flores', '120', 'São Paulo', 'SP', 1),
('Av. Paulista', '1500', 'São Paulo', 'SP', 2),
('Rua Augusta', '800', 'São Paulo', 'SP', 3),
('Rua Vergueiro', '950', 'São Paulo', 'SP', 4),
('Av. Brigadeiro', '2100', 'São Paulo', 'SP', 5);

INSERT INTO farmaceutico (nomeFarmaceutico, dtNascFarmaceutico, cpfFarmaceutico, fkFarmacia)VALUES 
('Julia Nunes', '2000-05-04',12345678901, '1'),
('Rikelme Ferreira', '2008-09-18', 98765432101, 2),
('Gabriel Nunes', '1999-08-12', 23456789012, 3),
('Isabelly Hiraki', '2009-10-10', 98765432176, 4),
('Jhulia Azevedo', '2005-04-04', 45678937491, 5);


SELECT * FROM farmacia;
SELECT * FROM enderecoFarmacia;
SELECT * FROM farmaceutico;


SELECT 
idFarmaceutico AS identificaçãofarmaceutico,
cpfFarmaceutico AS CPF_Farmaceutico,
fkFarmacia AS identificaçãoFarmacia
FROM farmaceutico;


SELECT 
idFarmaceutico,
nomeFarmaceutico,
cpfFarmaceutico,
dtNascFarmaceutico,
CASE
WHEN dtNascFarmaceutico <(CURDATE() - INTERVAL 18 YEAR)
THEN 'Maior de idade'
ELSE 'Menor de idade'
END AS menorMaiorIdade
FROM farmaceutico;


SELECT logradouro,
 IFNULL (numLogradouro, 'Sem número') AS 'numLogradouro',
 cidade,
 estado, 
fkFarmacia
FROM enderecoFarmacia;


-- DESAFIO

CREATE TABLE Times(
	idTimes INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (45),
    estado CHAR (2)
);

CREATE TABLE Tecnico(
	idTecnico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (45),
    fkTimes INT UNIQUE,
    CONSTRAINT ctFkTimes
		FOREIGN KEY (fkTimes) REFERENCES Times(idTimes)
);

CREATE TABLE Escalacao (
	idEscalacao INT PRIMARY KEY AUTO_INCREMENT,
    numJogador CHAR(3),
    nome VARCHAR (45),
    posicao VARCHAR (45),
    tipo VARCHAR (45),
    dtJogo DATETIME,
    fkTecnico INT,
    CONSTRAINT ctFkTecnico
		FOREIGN KEY (fkTecnico) REFERENCES Tecnico(idTecnico)
);