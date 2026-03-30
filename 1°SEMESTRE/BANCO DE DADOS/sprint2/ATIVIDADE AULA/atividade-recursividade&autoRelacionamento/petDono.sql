USE ccoa;

CREATE TABLE tipoAnimal(
	idTipoAnimal INT PRIMARY KEY AUTO_INCREMENT,
    descTipoAnimal VARCHAR (45)
);

CREATE TABLE raca(
	idRaca INT PRIMARY KEY AUTO_INCREMENT,
    descRaca VARCHAR (45),
    fkTipoAnimal INT,
    CONSTRAINT ctFkTipoAnimal 
    FOREIGN KEY (fkTipoAnimal) REFERENCES tipoAnimal(idTipoAnimal)
);

CREATE TABLE dono(
	idDono INT PRIMARY KEY AUTO_INCREMENT,
    nomeDono VARCHAR (45),
    cpf CHAR (11)
);

CREATE TABLE pet(
	idPet INT AUTO_INCREMENT,
    nome VARCHAR (45),
    dtNasc DATE,
    fkMae INT,
    fkPai INT,
    fkRaca INT,
    fkDono INT,
    PRIMARY KEY (idPet, fkDono),
    CONSTRAINT ctFkMae 
    FOREIGN KEY (fkMae) REFERENCES pet(idPet),
    
    CONSTRAINT ctFkPai
    
    
    FOREIGN KEY (fkPai) REFERENCES pet(idPet),
    
    CONSTRAINT ctFkRaca
    FOREIGN KEY (fkRaca) REFERENCES raca(idRaca),
    
    CONSTRAINT ctFkDono
    FOREIGN KEY (fkDono) REFERENCES dono(idDono)
    );
    
    INSERT INTO tipoAnimal (descTipoAnimal) VALUES 
    ('gato'),
    ('cachorro');
    
INSERT INTO raca (descRaca, fkTipoAnimal)VALUES
('Persa', 1),
('Siamês', 1),
('Golden Retriever', 2),
('Caramelo', 2),
('Salsicha', 2);

INSERT INTO dono (nomeDono, cpf)VALUES
('Maria Silva', '22222222222'),
('Magnus Bane', 66666666666),
('Simon Lovelace', 77777777777);


INSERT INTO pet (nome, dtNasc, fkMae, fkPai, fkRaca, fkDono)VALUES
('Church', '2021-01-01', null, null, 2, 1 ),
('Marie', '2019-02-16', null, null, 2, 1 ),
('Lino', '2023-02-18', 2, 1, 2, 1)



