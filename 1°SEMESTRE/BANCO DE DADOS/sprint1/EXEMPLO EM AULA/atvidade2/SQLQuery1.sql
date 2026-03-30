CREATE DATABASE ccoaaula2;

USE ccoaaula2;

-- DROP DATABASE ccoaaula2;

/* CAMPOS PARA NÚMEROS:

INT - Inteiro
FLOAT - permite decimais (até 7 casas)
DOUBLE - permite casa decimais (até 15 casas)
DECIMAL - permite decimaisde forma "customizadas"

EX de DECIMAL: DECIMAL (5,2);
poderia ser: 999,99
5 numeros no total e so 2 depois da virgula
*/


CREATE TABLE pessoa (
	idPessoa INT PRIMARY KEY IDENTITY (1,1), -- depois trocar para AUTO_INCREMENT
	nome VARCHAR (60),
	dtNasc DATE,
);

-- DESCRIBE pessoa;

INSERT INTO pessoa(nome, dtNasc) VALUES
('Maria', '2008-09-18'),
('Camila', '2008-01-25');


SELECT * FROM pessoa;

SELECT nome, dtNasc FROM pessoa
	WHERE nome LIKE 'M%';

SELECT nome FROM pessoa
	WHERE nome NOT LIKE 'M%';


SELECT nome FROM pessoa
	WHERE nome <> 'Camila';


SELECT nome FROM pessoa
	ORDER BY nome DESC;


SELECT nome FROM pessoa
	ORDER BY nome ASC;


INSERT INTO pessoa (nome, dtNasc) VALUES
('Yuri', '2007-09-09'),
('Raissa', '2007-03-09'),
('Cosmos', '2007-07-07');

DELETE FROM pessoa 
	WHERE idPessoa=1;


