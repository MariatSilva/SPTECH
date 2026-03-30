USE ccoa;

SHOW TABLES;

CREATE TABLE funcionario (
	idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (45),
    cpf CHAR (11) UNIQUE NOT NULL,
    salario DECIMAL (7, 2),
    fkSupervisor INT,
    CONSTRAINT ctFkSupervisor
    FOREIGN KEY (fkSupervisor) REFERENCES
    funcionario(idFuncionario)
);

CREATE TABLE dependente (
	idDependente INT,
    nome VARCHAR (45),
    cpf CHAR(11) UNIQUE NOT NULL,
    fkFuncionario INT,
    CONSTRAINT chaveComposta 
    PRIMARY KEY (idDependente, fkFuncionario),
    CONSTRAINT ctFkFuncionario 
    FOREIGN KEY (fkFuncionario) REFERENCES
    funcionario(idFuncionario)
);


INSERT INTO funcionario (nome, cpf, salario, fkSupervisor) VALUES
('Clara Faria', '11111111111', 15000, null),
('Vivian Silva', '11111111112', 16000, null),
('Marcos Paulo', '11111111113', 1000, 1),
('Rob Stark', '11111111114', 1700, 2);


SELECT * FROM funcionario;

SELECT 
s.nome AS Nome_Supervisor,
f.nome AS Nome_Funcionario
FROM 
funcionario AS f
JOIN funcionario AS s
ON s.idFuncionario = f.fkSupervisor;





SELECT * FROM funcionario
WHERE fkSupervisor IS NULL;