CREATE DATABASE ccoa;
USE ccoa;

CREATE TABLE aluno (
	idAluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (100),
    ra CHAR (8) UNIQUE NOT NULL,
	fkEmpresa INT,
    CONSTRAINT ctfkEmpresa
    FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

CREATE TABLE empresa(
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    razao_social VARCHAR (50),
    cnpj CHAR (14),
    fkResponsavel INT UNIQUE,
    CONSTRAINT ctFkResp
    FOREIGN KEY (fkResponsavel) REFERENCES responsavel (idResponsavel)
);

CREATE TABLE responsavel (
	idResponsavel INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (45),
    cpf CHAR (11),
    salario DECIMAL (7,2)
);

INSERT INTO responsavel (nome, cpf, salario) VALUES
('Ana', '12345678909', 5000),
('Magnus Bane', '23456789012', 10000);


INSERT INTO empresa (razao_social, cnpj, fkResponsavel) VALUES
('NightShade', '12121212121232', 2),
('Hell Ruelle', 10918201920101, 1);

INSERT INTO aluno (nome, ra, fkEmpresa)VALUES
('Alexander Lightwood', '91728811', 1),
('Isabelle Lightwood', '91728910', 2);

SELECT
a.nome AS nome_aluno,
e.razao_social,
r.nome AS responsavel
 FROM
aluno AS a
JOIN empresa e 
	ON e.idEmpresa = a.fkEmpresa
JOIN responsavel r
	On r.idResponsavel = e.fkResponsavel;