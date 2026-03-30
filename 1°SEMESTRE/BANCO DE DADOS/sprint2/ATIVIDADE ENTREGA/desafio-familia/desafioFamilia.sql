CREATE DATABASE atividadeFamilia;
USE atividadeFamilia;



CREATE TABLE pessoa(
	idPessoa INT PRIMARY KEY AUTO_INCREMENT,
    nomePessoa VARCHAR (100),
    idPai INT,
    idMae INT,
    CONSTRAINT cIdMae 
    FOREIGN KEY (idMae) REFERENCES pessoa(idPessoa),
    CONSTRAINT cIdPai 
    FOREIGN KEY (idPai) REFERENCES pessoa(idPessoa)
);

INSERT INTO pessoa (nomePessoa)VALUES
('José Maria'),
('Maria Julieta'),
('Francisco Queiroz'),
('Emma Dante');


INSERT INTO pessoa (nomePessoa, idPai, idMae)VALUES 
('Rebecca Soares', 1, 2),
('Filomena Silva', 3, 4);


INSERT INTO pessoa (nomePessoa, idPai, idMae) VALUES
('Jade Teixeira', 5, 6);


SELECT 
    filho.nomePessoa AS Filho,
    pai.nomePessoa AS Pai,
    mae.nomePessoa AS Mae,
    voP.nomePessoa AS avoPaterno,
    voM.nomePessoa AS avoMaterno
    
FROM pessoa AS filho

LEFT JOIN pessoa AS pai 
    ON filho.idPai = pai.idPessoa
LEFT JOIN pessoa AS mae 
    ON filho.idMae = mae.idPessoa
LEFT JOIN pessoa AS voP
	ON pai.idPai = voP.idPessoa
LEFT JOIN pessoa AS voM
	ON mae.idMae = voM.idPessoa;
    
    
    