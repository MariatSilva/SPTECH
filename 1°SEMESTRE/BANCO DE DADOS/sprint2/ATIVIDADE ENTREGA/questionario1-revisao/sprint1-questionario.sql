
USE 1cooasprint2;


-- DROP TABLE area;
CREATE TABLE area(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR (100)
);

CREATE TABLE funcionario(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR (100),
area_id INT,
FOREIGN KEY (area_id) REFERENCES area(id),
supervisor_id INT,
FOREIGN KEY (supervisor_id) REFERENCES funcionario(id)
);






INSERT INTO area (nome)VALUES
('Marketing'),
('Financeiro'),
('TI');


INSERT INTO funcionario (nome, area_id, supervisor_id)VALUES
('Carla', 3, null),
('Diego', 3, 1),
('Lia', 3, 1),
('Ana', 1, 1),
('Bruno', 1, 4),
('Paulo', 2, 1),
('Rita', 2, 6);


SELECT 
funcionario.nome AS 'Funcionario',
area.nome AS 'Area',
supervisor.nome AS 'Supervisor'
FROM funcionario 
JOIN area ON funcionario.area_id = area.id
LEFT JOIN funcionario supervisor ON funcionario.supervisor_id = supervisor.id;

SELECT 
funcionario.nome AS 'Funcionario',
supervisor.nome AS 'Supervisor'
FROM funcionario 
LEFT JOIN funcionario supervisor ON funcionario.supervisor_id = supervisor.id
WHERE supervisor.nome LIKE 'Ana';




-- exercicio 8

SELECT 
funcionario.nome AS 'Funcionario',
area.nome AS 'Area',
CASE 
WHEN supervisor_id IS NULL
THEN 'Chefia'
ELSE 'Equipe'
END AS 'Papel'
FROM funcionario
JOIN area ON funcionario.area_id = area.id;



-- exercicio 10

CREATE TABLE usuario(
id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR (100),
gerente_id INT,
FOREIGN KEY(gerente_id) REFERENCES usuario(id)
);


-- EXERCICIO 11

CREATE TABLE email(
id INT AUTO_INCREMENT PRIMARY KEY,
usuario_id INT,
FOREIGN KEY (usuario_id) REFERENCES usuario(id),
endereco VARCHAR (150),
tipo VARCHAR (50)
);


-- EXERCICIO 12

INSERT INTO usuario (nome, gerente_id) VALUES 
('Helena', 1),
('Ana', 1),
('Bruno', 1),
('Caio', 2),
('Duda', 2),
('Eva', 3);

INSERT INTO email(usuario_id, endereco, tipo) VALUES 
(1, 'helenaCorp@gmail.com', 'Corporativo'),
(1, 'helenaPess@gmail.com', 'Pessoal'),
(2, 'anaCorp@gmail.com', 'Corporativo'),
(2, 'anaPass@gmail.com', 'Pessoal'),
(3, 'brunoCorp@gmail.com', 'Corporativo'),
(4, 'caioCorp@gmail.com', 'Corporativo'),
(5, 'dudaCorp@gmail.com', 'Corporativo'),
(5, 'dudaPess@gmail.com', 'Pessoal'),
(6, 'dudaCorp@gmail.com', 'Corporativo');

-- QUESTAO 14
SELECT usuario.nome AS 'Usuario',
gerente.nome AS 'Gerente'
FROM usuario
JOIN usuario AS gerente ON usuario.gerente_id = gerente.id;

-- QUESTAO 15
SELECT usuario.nome AS 'Usuario', 
email.endereco AS 'Email' 
FROM usuario 
JOIN usuario AS gerente ON usuario.gerente_id = gerente.id
JOIN email ON email.usuario_id = usuario.id
WHERE gerente.nome LIKE 'Ana' AND email.tipo LIKE 'Corporativo';

