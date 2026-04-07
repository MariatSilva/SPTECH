-- Atributo atômico: possui menor forma de um atributo;
-- Atributo composto: composto por vário elemento;

CREATE DATABASE 1cooasprint2;
USE 1cooasprint2;

CREATE TABLE pessoa (
	id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (60),
    cpf CHAR (11) UNIQUE NOT NULL
);

-- Atributuo multivaloravel: possui mais de um valor
-- É diferente de um atributo composto-> Este possui os avlores 
-- dentro do mesmo campo

CREATE TABLE telefone(
	id_telefone INT PRIMARY KEY AUTO_INCREMENT,
    numero VARCHAR (11),
    fk_pessoa INT,
    CONSTRAINT ctFkPessoa
    FOREIGN KEY (fk_pessoa) REFERENCES pessoa(id_pessoa)
    );
    
    
CREATE TABLE dependente(
 id_dependente INT AUTO_INCREMENT,
 nome VARCHAR (60),
 cpf CHAR (11) UNIQUE NOT NULL,
 fk_pessoa INT,
 PRIMARY KEY (id_dependente, fk_pessoa),
 FOREIGN KEY (fk_pessoa)REFERENCES pessoa (id_pessoa)
);


INSERT INTO pessoa(nome, cpf)VALUES
('Jon Snow', '80000000000'),
('Arya Stark', '22222222222'),
('Eduard Stark', '12212121212');

INSERT INTO telefone (numero, fk_pessoa)VALUES
('11999999999', 1),
('11555555555', 1),
('11777777777', '2');

INSERT INTO dependente (nome, cpf, fk_pessoa)VALUES
('Tyrion Lanister', '17111717171', 1);

SELECT * FROM pessoa p
JOIN telefone t ON  t.fk_pessoa = p.id_pessoa;

SELECT * FROM pessoa p
JOIN telefone t ON t.fk_pessoa = p.id_pessoa
JOIN dependente d ON d.fk_pessoa = p.id_pessoa;


ALTER TABLE pessoa ADD COLUMN fk_chefe INT;

ALTER TABLE pessoa ADD CONSTRAINT ctFkChefe 
FOREIGN KEY (fk_chefe) REFERENCES pessoa(id_pessoa);

UPDATE pessoa SET fk_chefe = 3
WHERE id_pessoa = 1;

SELECT * FROM pessoa p 
LEFT JOIN pessoa chefe 
ON p.fk_chefe = chefe.id_pessoa
WHERE p.nome  LIKE '%k' OR p.nome LIKE '%e'
ORDER BY p.nome ASC;



-- Exemplo de atributo derivado

SELECT 
	TIMESTAMPDIFF(YEAR, '1988-10-10', NOW())
    AS idade;
    
-- Atributo identificador(determinamente)=
-- Identificador da tabela

-- Atributo monovalorado te somente um valor;