CREATE DATABASE sprint2;
USE sprint2;

/*
Exercício 1
- Criar as tabelas;
- Configurar chave estrangeira
*/

CREATE TABLE pessoa (
	idpessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (45),
    cpf CHAR (11)
);

CREATE TABLE reserva (
	idReserva INT PRIMARY KEY AUTO_INCREMENT,
    dtReserva DATETIME,
    dtRetirada DATETIME,
    dtDevolucao DATETIME,
    fkPessoa INT,
    CONSTRAINT fkReservaPessoa 
		FOREIGN KEY (fkPessoa) REFERENCES pessoa(idPessoa)
    
);
-- - Inserir 5 registros
INSERT INTO pessoa (nome, cpf) VALUES
('Dominique Silva', 11122299966),
('Rodolfo Neto', 88866644569),
('Vanessa dos Santos', 90341826931),
('Lara Rayelle', 72036183946),
('Ribamar Carvalho', 96379574298);

INSERT INTO reserva (dtReserva, dtRetirada, dtDevolucao, fkPessoa) VALUES
('2025-01-09 09:15:00', '2025-02-08 10:30:00', '2025-03-07 16:45:00', 1),
('2026-02-05 08:20:00', '2026-03-12 11:10:00', '2026-03-17 14:50:00', 2),
('2025-01-04 13:00:00', '2025-01-05 09:25:00', '2025-02-06 17:30:00', 3),
('2026-01-01 07:40:00', '2026-01-02 10:00:00', '2026-02-03 15:20:00', 4),
('2025-01-01 12:10:00', '2025-02-02 14:35:00', '2026-03-03 18:00:00', 5);

-- - Exibir dados;
SELECT * FROM pessoa;
SELECT * FROM reserva;

-- - Exibir dados com AS;

SELECT idPessoa AS IdentificaçãoPessoa,
nome AS NomePessoa,
cpf AS CPF
FROM pessoa;

SELECT 
    idReserva AS IdentificaçãoReserva,
    dtReserva AS dataReserva,
    dtRetirada AS dataRetirada,
    dtDevolucao AS dataDevolução,
    fkPessoa AS IdentificaçãoPessoa
FROM
    reserva;

-- Exibir dados com CASE;

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



-- Exibir dados com IFNULL;
INSERT INTO pessoa (cpf)VALUES
(12345678901);


SELECT idPessoa,
IFNULL (nome, 'Sem nome') AS nome,
cpf
FROM pessoa;


/*
EXERCÍCIO 2
- Criar as tabelas;
- Configurar chave estrangeira


*/

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

-- - Exibir dados;

SELECT * FROM pessoa1;
SELECT * FROM pessoa2;

-- Exibir dados com AS;

SELECT idPessoa1 AS IdentificaçãoPessoa1,
nome AS nomePessoa,
dtNascimento AS dataNascimento
FROM pessoa1;

SELECT idPessoa2 AS IdentificaçãoPessoa2,
nome AS nomePessoa2,
dtNascimento AS dataNascimento,
fkpessoa1 AS IdentificaçãoPessoa1
FROM pessoa2;


-- Exibir dados com CASE;

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


--  Exibir dados com IFNULL;
INSERT INTO pessoa1 (nome)VALUES
('Maria Fernanda');

SELECT nome,
IFNULL (dtNascimento, 'Sem data de nascimento') AS dtNascimento
FROM pessoa1;


/*s
EXERCÍCIO 3
Referente a regra de negócio acima, cria a modelagem
 utilizando um relacionamento 1:1, implemente com o script
 realizando os seguintes comandos:

- Criar as tabelas;
- Configurar chave estrangeira
*/

CREATE TABLE candidato (
	idCandidato INT PRIMARY KEY AUTO_INCREMENT,
    nomeCandidato VARCHAR (45),
    dtNasc DATE
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


-- - Inserir 5 registros

INSERT INTO candidato (nomeCandidato, dtNasc) VALUES
('Carlos Pereira', '1985-02-01'),
('Aline Costa', '1990-03-07'),
('Alan Vidal', '1978-01-26'),
('Pedro Silva', '2000-06-19'),
('Arthur Souza', '2002-01-18');

INSERT INTO habilitacao(tipoHabilitacao, dtCriacaoHabilitacao, dtVencimentoHabilitacao, fkCandidato) VALUES
('A', '2026-01-01', '2027-01-01', 1),
('B', '2025-01-01','2026-01-01', 2),
('ACC', '2026-01-20', '2027-01-20', 3),
('A', '2025-06-08', '2026-06-08', 4),
('B', '2024-12-12', '2025-12-12', 5);

-- - Exibir dados;

SELECT * FROM candidato;
SELECT * FROM habilitacao;

-- Exibir dados com AS;

SELECT idCandidato AS identificacaoCandidato,
nomeCandidato AS nomeCandidato,
dtNasc AS dataNascimento
FROM candidato;

-- Exibir dados com CASE;

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

-- Exibir dados com IFNULL;
INSERT INTO candidato ()VALUES
();


SELECT
idCandidato,
 IFNULL(nomeCandidato, 'Sem nome') AS 'nomeCandidato',
IFNULL (dtNasc, 'Sem data de nascimento') AS dataNascimento
FROM candidato;

/*
Exercício 4:

Regra de negócio: 

1 Farmácia tem no mínimo 1 e no máximo 1 endereço, 1 endereço é de no mínimo 1 farmácia e no máximo 1.

1 Farmácia tem no mínimo 1 farmacêutico e no máximo n, 1 farmacêutico é de no mínimo 1 farmácia e no máximo 1.

- Criar a modelagem lógica na regra acima, com os campos de sua escolha.

- Criar as tabelas;

- Configurar chave estrangeira;
*/

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



-- - Inserir 5 registros;

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


-- Exibir dados;

SELECT * FROM farmacia;

SELECT * FROM enderecoFarmacia;

SELECT * FROM farmaceutico;

-- Exibir dados com AS;

SELECT 
idFarmaceutico AS identificaçãofarmaceutico,
cpfFarmaceutico AS CPF_Farmaceutico,
fkFarmacia AS identificaçãoFarmacia
FROM farmaceutico;

-- Exibir dados com CASE;

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

-- Exibir dados com IFNULL;
INSERT INTO farmacia (nomeFarmacia, cnpj) 
VALUES ('Farmácia Mais Mais', '67890123000106');

INSERT INTO enderecoFarmacia(logradouro, cidade, estado, fkFarmacia)VALUES
('Guaianazes', 'São Paulo', 'SP', 6);

SELECT logradouro,
 IFNULL (numLogradouro, 'Sem número') AS 'numLogradouro',
 cidade,
 estado, 
fkFarmacia
FROM enderecoFarmacia;