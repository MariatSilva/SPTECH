CREATE DATABASE aula3BD;

USE aula3BD;

CREATE TABLE professor (
	id INT,
    nome VARCHAR(45),
    cpf CHAR (11),
    salario DECIMAL (6, 2),
    tipo VARCHAR (20),
    dtCadastro DATETIME,
    CONSTRAINT PKid PRIMARY KEY (id),
    CONSTRAINT cTipo CHECK (tipo IN('Assistente', 'Titular', 'Monitor')
));
-- CONSTRAINT é um tipo de resrição
-- PRIMARY KEY é tipo de constraint
-- CHECK é outro tipo de constraint - VERIFICA UMA REGRA
ALTER TABLE professor MODIFY COLUMN id INT AUTO_INCREMENT;

-- CURDATE - data atual
-- CURRENT_TIMESTAMP() OU NOW() -Pega a data e hora atual
INSERT INTO professor (nome, cpf, salario, tipo, dtCadastro) VALUES
('Maria', '11111111111', 1000, 'Assistente', CURRENT_TIMESTAMP()),
('Julia', '22222222222', 4000, 'Monitor', NOW()),
('Lenildo', '33333333333', 5000, 'Titular', NOW()),
('Jucelia', '44444444444', 9999, 'Titular', NOW());

-- ALTER TABLE professor DROP CONSTRAINTcTipo;
-- ALTER TABLE professor MODIFY CONSTRAINT cTipo CHECK (tipo IN('Assistente', 'Titular', 'Monitor');

CREATE TABLE aluno (
	id INT PRIMARY KEY AUTO_INCREMENT,
    ra CHAR (8) UNIQUE,
    nome VARCHAR (100) DEFAULT 'Sem Nome',
    dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO aluno (ra) VALUES
('04261077'),
('04261099'),
('04261000');

SELECT * FROM aluno;

UPDATE aluno SET nome = 'Nicolle'
	WHERE id = 1;

UPDATE aluno SET nome = 'Leide'
	WHERE id = 2;

UPDATE aluno SET nome = 'Elton'
	WHERE id = 3;

-- ALIAS-> APELIDO
SELECT 
nome AS 'Primeiro nome',
ra AS 'Registro Acadêmico'
FROM aluno;

-- ou 
SELECT 
nome ' nome',
ra 'Registro'
FROM aluno;

SELECT
	CASE 
    WHEN tipo = 'Monitor' THEN  3000
	WHEN tipo = 'Assistente' THEN 5000
	WHEN tipo = 'Titular' THEN 9000
    ELSE 0
	END AS salario_teste
    FROM professor;
    
    
    
    CREATE TABLE atleta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (100),
    modalidade VARCHAR (30),
    cpf CHAR (11) UNIQUE NOT NULL,
    dtCadastro DATETIME DEFAULT CURRENT_TIMESTAMP(),
    qtdMedalhas INT,
    CONSTRAINT cModalidade CHECK (modalidade IN ('Atletistmo', 'Natação', 'Futebol'))
    );
    
    
    INSERT INTO atleta (nome, modalidade, cpf, qtdMedalhas) VALUES
		('Phelps', 'Natação','11122233344', 28),
        ('Emilly', 'Natação', '22233344456', 56),
        ('Carlos', 'Futebol', '33344455532', 28),
        ('Aline', 'Futebol', '11166633323', 24);
    
    
    -- IFNULL() - TRATAMENTO QUANDO NULO
    -- CONCAT() - CONCATENÇÃO
    
    SELECT 
    CONCAT('Hello ', 'World');
    
    INSERT INTO atleta (cpf) VALUES
    ('12345678901');


	SELECT 
    IFNULL(nome, 'Sem nome')
    FROM atleta;
    
    -- CONCAT -> juntando dados
    -- IFNULL -> tratando os null da tabela
    SELECT 
    CONCAT (IFNULL (nome, 'Sem nome'), ' ', IFNULL (modalidade, 'Sem modalidade'))
    AS nome_mod
    FROM atleta;
    
    -- select com case, ifnull, concat, alias, 
    
    
    SELECT 
    CASE 
    WHEN qtdMedalhas >2 THEN 'Muito bom!'
    WHEN qtdMedalhas <1 THEN 'Vixe, sem medalha!'
    ELSE 'Tá no caminho! Continua!'
    END AS performance,
    CASE 
    WHEN modalidade = 'futebol' THEN 'Diferenciado'
    ELSE 'Padrão'
    END AS descricao_modalidade,
    IFNULL (nome, 'Sem Nome'),
    CONCAT('CPF: ',cpf, ' /Cadastrado na data: ', dtCadastro) AS info_registro
    FROM atleta
    WHERE nome LIKE 'P%' AND nome LIKE 'M%'
    OR nome NOT LIKE 'L%';
   
    
    
    SELECT
    nome,
    qtdMedalhas
    FROM atleta
    WHERE qtdMedalhas BETWEEN 20 AND 40
    AND nome LIKE 'P%'
    ORDER BY nome DESC;