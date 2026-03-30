-- EXERCÍCIO 1

CREATE DATABASE sprint2;
USE sprint2;

CREATE TABLE funcionario (
	idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nomeFuncionario VARCHAR (75),
    cpfFuncionario CHAR (11	),
    fkSupervisor INT,
    fkAreaEmpresa INT,
    
    CONSTRAINT ctFkFuncionario 
    FOREIGN KEY (fkSupervisor) REFERENCES
    funcionario(idFuncionario),
    
	CONSTRAINT ctFkAreaEmpresa
    FOREIGN KEY (fkAreaEmpresa) REFERENCES
    areaEmpresa(idArea)
);

CREATE TABLE areaEmpresa (
	idArea INT PRIMARY KEY AUTO_INCREMENT,
    nomeArea VARCHAR (45)
);

INSERT INTO areaEmpresa (nomeArea)VALUES
('Marketing'),
('Financeiro'),
('T.I');

INSERT INTO funcionario (nomeFuncionario, cpfFuncionario, fkSupervisor, fkAreaEmpresa) VALUES
('Raziel de Jesus', '33333333333', null, 3),
('Jace Herondale', '12345678901', 1, 1),
('Isabelle Lightwood', '23456789012', 1, 2),
('Alexander Lightwood', 18272901011, 1, 2),
('Clarice Fray', '86518291027', 1, 3);


SELECT 
s.nomeFuncionario AS 'Nome Supervisor',
s.cpfFuncionario AS 'CPF supervisor',
f.nomeFuncionario AS 'Nome Funcionario',
f.cpfFuncionario AS 'CPF funcionario'
FROM funcionario f
LEFT JOIN funcionario s ON s.idFuncionario = f.fkSupervisor;


SELECT 
s.nomeFuncionario AS 'Nome Supervisor',
s.cpfFuncionario AS 'CPF supervisor',
f.nomeFuncionario AS 'Nome Funcionario',
f.cpfFuncionario AS 'CPF funcionario',
a.nomeArea AS 'Área'
FROM funcionario f
LEFT JOIN funcionario s ON s.idFuncionario = f.fkSupervisor
JOIN areaEmpresa a ON a.idArea = f.fkAreaEmpresa
WHERE a.nomeArea LIKE 'T.I'
ORDER BY f.idFuncionario;


SELECT 
s.nomeFuncionario AS 'Nome Supervisor',
s.cpfFuncionario AS 'CPF supervisor',
f.nomeFuncionario AS 'Nome Funcionario',
f.cpfFuncionario AS 'CPF funcionario',
CASE 
WHEN s.fkAreaEmpresa = f.fkAreaEmpresa
THEN 'Você é da mesma área do seu supervisor.'
WHEN s.fkAreaEmpresa <> f.fkAreaEmpresa
THEN 'Você NÃO é da mesma área do seu supervisor.'
ELSE 'Você é um supervisor'
END AS TipoArea
FROM funcionario f
LEFT JOIN funcionario s ON s.idFuncionario = f.fkSupervisor
JOIN areaEmpresa a ON a.idArea = f.fkAreaEmpresa;




-- EXERCÍCIO 2


CREATE TABLE usuario(
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nomeUsuario VARCHAR (100),
    emailUsuario VARCHAR (75),
    fkUsuarioGerente INT,
    
    CONSTRAINT ctFkUsuarioGerente 
    FOREIGN KEY (fkUsuarioGerente) REFERENCES 
    usuario(idUsuario)
);

CREATE TABLE email (
	idEmail INT PRIMARY KEY AUTO_INCREMENT,
    mensagemEmail VARCHAR (200),
    fkUsuario INT,
    
    CONSTRAINT ctFkUsuario
    FOREIGN KEY (fkUsuario) REFERENCES 
    usuario(idUsuario)
);

INSERT INTO usuario(nomeUsuario, emailUsuario, fkUsuarioGerente) VALUES
('Charlotte Branwell', 'charlotteBranwell@gmail.com', null),
('Teresa Gray', 'teresa.gray@gmail.com', 1),
('Will Herondale', 'willDale@hotmail.com', 1),
('James Carstairs', 'jemCarstais@gmail.com', 1),
('Jessamine Lovelace', 'jess.lovelace@gmail.com', 1);

INSERT INTO email (mensagemEmail, fkUsuario) VALUES
('Para a guerra que se aproxima contra Axel Mortmain e seus autômatos, iremos precisar de mais lâminas serafim.', 1),
('Saudações, irmão. Já estou a caminho de Londres para nos revermos!', 2),
('A saúde de Jem continua a piorar, precisamos encontrar logo uma cura.', 3),
('Estou criando uma nova música com meu violino, espero que você e Will possam ouvi-lá.', 4),
('Me encontre no Centre Park, preciso encomendar novos vestidos e necessito de companhia.', 5);


SELECT 
u.nomeUsuario AS 'Usuário',
u.emailUsuario AS 'Email',
e.mensagemEmail 'Mensagem'
FROM email e
JOIN usuario u ON e.fkUsuario = u.idUsuario;


SELECT 
u.nomeUsuario AS 'Nome',
u.emailUsuario 'Email',
e.mensagemEmail AS 'Mensagem'
FROM email e
JOIN usuario u ON e.fkUsuario = u.idUsuario
WHERE u.fkUsuarioGerente IS NULL;

SELECT 
u.nomeUsuario AS 'Usuário',
u.emailUsuario AS 'Email',
e.mensagemEmail AS 'Mensagem',
CASE 
WHEN u.fkUsuarioGerente IS NULL
THEN 'Usuário Gerente'
ELSE 'Usuário Comum'
END AS 'Tipo de usuário'
FROM usuario u
JOIN email e ON u.idUsuario = e.fkUsuario;

