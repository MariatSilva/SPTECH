/*
EXERCÍCIO 1

No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Escreva e execute os comandos para:
• Criar a tabela chamada Atleta para conter os dados: idAtleta (int e chave primária da
tabela), nome (varchar, tamanho 40), modalidade (varchar, tamanho 40), qtdMedalha
(int, representando a quantidade de medalhas que o atleta possui)
*/

CREATE DATABASE sprint1;
USE sprint1;

CREATE TABLE Atleta (
	idAtleta INT PRIMARY KEY,
    nome VARCHAR (40),
    modalidade VARCHAR (40),
    qtdMedalha INT
);

/*
• Inserir dados na tabela, procurando colocar mais de um atleta para cada modalidade
e pelo menos 5 atletas.
*/

INSERT INTO Atleta (idAtleta, nome, modalidade, qtdMedalha) VALUES
(1, 'Nathan Souza', 'Vôlei', 10),
(2, 'Kaylla Vitória', 'Balé', 23),
(3, 'Marina Barbosa', 'Balé', 7),
(4, 'Ancelmo Silva', 'Futebol', 17),
(5, 'Francisco Elton', 'Futebol', 238);

/*
Escreva e execute os comandos para:
• Exibir todos os dados da tabela.
*/
SELECT * FROM Atleta;

-- • Atualizar a quantidade de medalhas do atleta com id=1;

UPDATE Atleta SET qtdMedalha = 12
	WHERE idAtleta =  1;
    
-- • Atualizar a quantidade de medalhas do atleta com id=2 e com o id=3;

UPDATE Atleta SET qtdMedalha = 33
	WHERE idAtleta IN (2, 3);
    
-- • Atualizar o nome do atleta com o id=4;

UPDATE Atleta SET nome = 'Ancelmo Aparecida'
	WHERE idAtleta = 4;
    
-- • Adicionar o campo dtNasc na tabela, com a data de nascimento dos atletas, tipo date;

ALTER TABLE Atleta ADD COLUMN dtNasc DATE;

-- • Atualizar a data de nascimento de todos os atletas;
UPDATE Atleta set dtNasc = '2000-01-01'
	WHERE idAtleta IN (1, 2, 3, 4, 5);
    
-- • Excluir o atleta com o id=5;
DELETE FROM Atleta 
	WHERE idAtleta = 5;


-- • Exibir os atletas onde a modalidade é diferente de natação;

SELECT * FROM Atleta
		WHERE modalidade <> 'Natação';

-- • Exibir os dados dos atletas que tem a quantidade de medalhas maior ou igual a 3;

SELECT * FROM Atleta
		WHERE qtdMedalha >= 3;

-- • Modificar o campo modalidade do tamanho 40 para o tamanho 60;

ALTER TABLE Atleta MODIFY COLUMN modalidade VARCHAR (60);

-- • Descrever os campos da tabela mostrando a atualização do campo modalidade;

DESC Atleta;

-- • Limpar os dados da tabela;

TRUNCATE TABLE Atleta;


/*
EXERCÍCIO 2

No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Musica para conter os dados: idMusica, titulo (tamanho 40), artista
(tamanho 40), genero (tamanho 40), sendo que idMusica é a chave primária da tabela.

*/

CREATE TABLE Musica (
	idMusica INT PRIMARY KEY,
    titulo VARCHAR (40),
    artista VARCHAR (40),
    genero VARCHAR (40)
);

/*
Inserir dados na tabela, procurando colocar um gênero de música que tenha mais de uma
música, e um artista, que tenha mais de uma música cadastrada. Procure inserir pelo
menos umas 7 músicas. */

INSERT INTO Musica (idMusica, titulo, artista, genero) VALUES 
(1, 'Still loving you', 'Scorpions', 'Rock'),
(2, 'Estrelar', 'Marcos Valle' ,'MPB'),
(3, 'Voar Com o Águia', 'Banda AR-15', 'Tecnomelody'),
(4, 'Faz o S.', 'Banda AR-15', 'Tecnomelody'),
(5, 'Chove Chuva', 'Jorge Ben Jor', 'MPB'),
(6, 'Wo sind eure Hände', 'Tokio Hotel', 'Rock'),
(7, 'Love Is Dead', 'Tokio Hotel', 'Rock'),
(8, 'No One Like You', 'Scorpions', 'Rock'),
(9, 'Procuro abrigo', 'Míria Therezinha Kolling', 'Canto católico'),
(10, 'Always Foveres', 'Cults', 'Alternative/Indie');

/* Execute os comandos para:
a) Exibir todos os dados da tabela. */

SELECT * FROM Musica;

-- b) Adicionar o campo curtidas do tipo int na tabela;

ALTER TABLE Musica ADD COLUMN curtidas INT;

-- c) Atualizar o campo curtidas de todas as músicas inseridas;

UPDATE musica SET curtidas = 1000
	WHERE idMusica IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
    
-- d) Modificar o campo artista do tamanho 40 para o tamanho 80;

ALTER TABLE Musica MODIFY COLUMN artista VARCHAR (80);

-- e) Atualizar a quantidade de curtidas da música com id=1;

UPDATE Musica SET curtidas = 111
	WHERE idMusica = 1;
    
-- f) Atualizar a quantidade de curtidas das músicas com id=2 e com o id=3;

UPDATE Musica SET curtidas = 222
	WHERE idMusica IN (2, 3);

-- g) Atualizar o nome da música com o id=5;

UPDATE Musica SET titulo = 'Burning Pile'
	WHERE idMusica = 5;

-- h) Excluir a música com o id=4;

DELETE FROM Musica
	WHERE idMusica = 4;

-- i) Exibir as músicas onde o gênero é diferente de funk;

SELECT * FROM Musica 
	WHERE genero <> 'Funk';

-- j) Exibir os dados das músicas que tem curtidas maior ou igual a 20;

SELECT * FROM Musica 
	WHERE curtidas >= 20;

-- k) Descrever os campos da tabela mostrando a atualização do campo artista;

DESC Musica;

-- l) Limpar os dados da tabela;

TRUNCATE TABLE Musica;

/*
EXERCÍCIO 3

No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Filme para conter os dados: idFilme, título (tamanho 50), genero
(tamanho 40), diretor (tamanho 40), sendo que idFilme é a chave primária da tabela. */

CREATE TABLE Filme (
	idFilme INT PRIMARY KEY,
    titulo VARCHAR (50),
    genero VARCHAR (40),
    diretor VARCHAR (40)
);

/*
Inserir dados na tabela, procurando colocar um gênero de filme que tenha mais de um
filme, e um diretor, que tenha mais de um filme cadastrado. Procure inserir pelo menos
uns 7 filmes. */


INSERT INTO Filme (idFilme, titulo, genero, diretor) VALUES
(1, 'Alice no País das Maravilhas', 'Fantasia','Tim Burton'),
(2, 'Edward Mãos de Tesoura', 'Fantasia', 'Tim Burton'),
(3, 'As Crônicas de Nárnia', 'Fantasia', 'Andrew Adamson'),
(4, 'It: A Coisa', 'Terror', 'Andy Muschietti'),
(5, 'Magia Estranha', 'Animação', 'Gary Rydstrom'),
(6, 'The Last: Naruto the Movie','Animação', 'Tsuneo Kobayashi'),
(7, 'Gente Grande', 'Comédia', 'Dennis Dugan');

/*
Execute os comandos para:
• Exibir todos os dados da tabela. */

SELECT * FROM Filme;

-- • Adicionar o campo protagonista do tipo varchar(50) na tabela;

ALTER TABLE Filme ADD COLUMN protagonista VARCHAR (50);

-- • Atualizar o campo protagonista de todas os filmes inseridos;

UPDATE Filme SET protagonista = 'Alice'
	WHERE idFilme = 1;
UPDATE Filme SET protagonista = 'Edward'
	WHERE idFilme = 2;
UPDATE Filme SET protagonista = 'Aslan'
	WHERE idFilme = 3;
UPDATE Filme SET protagonista = 'It'
	WHERE idFilme = 4;
UPDATE Filme SET protagonista = 'Marianne'
	WHERE idFilme = 5;
UPDATE Filme SET protagonista = 'Naruto'
	WHERE idFilme = 6;
UPDATE Filme SET protagonista = 'Lenny Feder'
	WHERE idFilme = 7;

-- • Modificar o campo diretor do tamanho 40 para o tamanho 150;

ALTER TABLE Filme MODIFY COLUMN diretor VARCHAR (150);

-- • Atualizar o diretor do filme com id=5;

UPDATE Filme SET diretor = 'Charlotte Rydstrom'
	WHERE idFilme = 5;

-- • Atualizar o diretor dos filmes com id=2 e com o id=7;

UPDATE Filme SET diretor = 'Helena Bonham'
	WHERE idFilme IN (2, 7);

-- • Atualizar o título do filme com o id=6;

UPDATE Filme SET titulo = 'Naruto Shippuden: O filme'
	WHERE idFilme = 6;
    
-- • Excluir o filme com o id=3;

DELETE FROM Filme 
	WHERE idFilme = 3;
    
-- • Exibir os filmes em que o gênero é diferente de drama;

SELECT * FROM Filme 
	WHERE genero <> 'Drama';
    
-- • Exibir os dados dos filmes que o gênero é igual ‘suspense’;

SELECT * FROM Filme
	WHERE genero = 'Suspense';
    
-- • Descrever os campos da tabela mostrando a atualização do campo protagonista e diretor;

DESC Filme;

-- • Limpar os dados da tabela;

TRUNCATE TABLE Filme;

/*
EXERCÍCIO 4

No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Professor para conter os dados: idProfessor, nome (tamanho 50),
especialidade (tamanho 40), dtNasc (date), sendo que idProfessor é a chave primária da
tabela. */

CREATE TABLE Professor (
	idProfessor INT PRIMARY KEY,
    nome VARCHAR (50),
    especialidade VARCHAR (40),
    dtNasc DATE
);

/* Exemplo do campo data: ‘AAAA-MM-DD’, ‘1983-10-13’.
Inserir dados na tabela, procurando colocar uma especialista para mais de um professor.
Procure inserir pelo menos uns 6 professores. */

INSERT INTO Professor (idProfessor,  nome, especialidade, dtNasc) VALUES

(1, 'Aline Mendonça Cordeiro', 'Banco de Dados', '1958-11-05'),
(2, 'Júnior de Lima', 'Arduino', '1960-04-04'),
(3, 'Clodoaldo Bastos', 'Design', '1947-06-21'),
(4, 'Lenildo Barros', 'História', '1947-06-08'),
(5, 'Rodrigo Navarro', 'Espanhol', '1980-02-01'),
(6, 'Rosângela Freire', 'Matemática', '1989-09-09'),
(7, 'Edson Ferreira', 'Matemática', '2000-02-09'),
(8, 'Ana Santiago', 'Espanhol', '1999-09-09');

-- a) Exibir todos os dados da tabela.

SELECT * FROM Professor;

/* b) Adicionar o campo funcao do tipo varchar(50), onde a função só pode ser ‘monitor’,
‘assistente’ ou ‘titular’; */ 

ALTER TABLE Professor ADD COLUMN funcao VARCHAR (50);

-- c) Atualizar os professores inseridos e suas respectivas funções;

UPDATE Professor SET funcao = 'Monitor'
	WHERE idProfessor = '1';
UPDATE Professor SET funcao = 'Assitente'
	WHERE idProfessor = '2';
UPDATE Professor SET funcao = 'Titular'
	WHERE idProfessor = '3';    
UPDATE Professor SET funcao = 'Monitor'
	WHERE idProfessor = '4';    
UPDATE Professor SET funcao = 'Assistente'
	WHERE idProfessor = '5';    
UPDATE Professor SET funcao = 'Titular'
	WHERE idProfessor = '6';    
UPDATE Professor SET funcao = 'Monitor'
	WHERE idProfessor = '7';    
UPDATE Professor SET funcao = 'Assistente'
	WHERE idProfessor = '8';


-- d) Inserir um novo professor;

INSERT INTO Professor (nome, especialidade, dtNasc, funcao) VALUES
('Jucelia Lima', 'Ciências', '1988-04-01', 'Titular');

-- e) Excluir o professor onde o idProfessor é igual a 5;

DELETE FROM Professor 
	WHERE idProfessor = 5;

-- f) Exibir apenas os nomes dos professores titulares;

SELECT * FROM Professor 
	WHERE funcao = 'titular'; 

-- g) Exibir apenas as especialidades e as datas de nascimento dos professores monitores;

SELECT especialidade, dtNasc FROM Professor
	WHERE funcao = 'monitor';
    
-- h) Atualizar a data de nascimento do idProfessor igual a 3;

UPDATE Professor SET dtNasc = '1955-08-08'
	WHERE idProfessor = 3;
    
-- i) Limpar a tabela Professor;

TRUNCATE TABLE Professor;

/* 
EXERCÍCIO 5

No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Curso para conter os dados: idCurso, nome (tamanho 50), sigla
(tamanho 3), coordenador, sendo que idCurso é a chave primária da tabela.
*/

CREATE TABLE Curso (
	idCurso INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (50),
    sigla CHAR (3),
    coordenador VARCHAR (50)
);

-- Inserir dados na tabela, procure inserir pelo menos 3 cursos.

INSERT INTO Curso (nome, sigla, coordenador) VALUES
('Inglês', 'EN1', 'Douglas Moureira'),
('Desenvolvemento de Sistemas', 'DS1', 'Aline Mendonça'),
('Alemão', 'GM3', 'Bruna Schneider');

/*
Execute os comandos para:
a) Exibir todos os dados da tabela. */ 

SELECT * FROM Curso;

-- b) Exibir apenas os coordenadores dos cursos.

SELECT coordenador FROM Curso; 

-- c) Exibir apenas os dados dos cursos de uma determinada sigla.

SELECT * FROM Curso
	WHERE sigla = 'DS1';

-- d) Exibir os dados da tabela ordenados pelo nome do curso.

SELECT * FROM Curso
	ORDER BY nome;

/* e) Exibir os dados da tabela ordenados pelo nome do coordenador em ordem
decrescente. */

SELECT * FROM Curso
	ORDER BY coordenador DESC;

-- f) Exibir os dados da tabela, dos cursos cujo nome comece com uma determinada letra.

SELECT * FROM Curso
	WHERE nome LIKE 'A%';

-- g) Exibir os dados da tabela, dos cursos cujo nome termine com uma determinada letra.

SELECT * FROM Curso
	WHERE nome LIKE '%S';

/* h) Exibir os dados da tabela, dos cursos cujo nome tenha como segunda letra uma
determinada letra. */

SELECT * FROM Curso
	WHERE nome LIKE '_L%';

/*
i) Exibir os dados da tabela, dos cursos cujo nome tenha como penúltima letra uma
determinada letra. */

SELECT * FROM Curso
	WHERE nome LIKE '%E_';
    
-- j) Elimine a tabela.

DROP TABLE Curso;
    
/*
EXERCÍCIO 6

No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Você vai criar uma tabela para armazenar os dados de revistas (como por ex: Veja, Isto é,
Epoca, Quatro Rodas, Claudia, etc).
Escreva e execute os comandos para:
• Criar a tabela chamada Revista para conter os campos: idRevista (int e chave
primária da tabela), nome (varchar, tamanho 40), categoria (varchar, tamanho 30). Os
valores de idRevista devem iniciar com o valor 1 e ser incrementado automaticamente
pelo sistema.
*/

CREATE TABLE Revista (
	idRevista INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (40),
    categoria VARCHAR (30)
);

--  • Inserir 4 registros na tabela, mas sem informar a categoria.

INSERT INTO Revista(nome) VALUES
('Marie Claire'),
('CartaCapital'),
('Planeta'),
('Galileu');

/* Escreva e execute os comandos para:
• Exibir todos os dados da tabela. */

SELECT * FROM Revista;

/* • Atualize os dados das categorias das 3 revistas inseridas. Exibir os dados da tabela
novamente para verificar se atualizou corretamente. */

UPDATE Revista SET categoria = 'Moda'
	WHERE idRevista = 1;
UPDATE Revista SET categoria = 'Notícia'
	WHERE idRevista = 2;
UPDATE Revista SET categoria = 'Ciência'
	WHERE idRevista = 3;
    
SELECT * FROM Revista;

-- • Insira mais 3 registros completos.

INSERT INTO Revista (nome, categoria) VALUES
('Época', 'Notícia'),
('Turma da Mônica', 'Infantil'),
('Harpers Bazaar', 'Moda');

-- • Exibir novamente os dados da tabela.

SELECT * FROM Revista;

-- • Exibir a descrição da estrutura da tabela.

DESC Revista;

-- • Alterar a tabela para que a coluna categoria possa ter no máximo 40 caracteres.

ALTER TABLE Revista MODIFY COLUMN categoria VARCHAR (40);

/*
• Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o
tamanho da coluna categoria */

DESC Revista;

-- • Acrescentar a coluna periodicidade à tabela, que é varchar(15).

ALTER TABLE Revista ADD COLUMN periodicidade VARCHAR (15);

-- • Exibir os dados da tabela.

SELECT * FROM Revista;

-- • Excluir a coluna periodicidade da tabela.

ALTER TABLE Revista DROP COLUMN periodicidade;


/*
EXERCICIO 7

No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Você vai criar uma tabela para armazenar os dados de Carros (como por ex: Gol, Fusca, Onix, HB20, Corola, etc).
Escreva e execute os comandos para:
• Criar a tabela chamada Carro para conter os campos: idCarro (int e chave primária da tabela),
 nome (varchar, tamanho 40), placa (char, tamanho 7). Os valores de idCarro devem iniciar com o valor 1000 
 e ser incrementado automaticamente pelo sistema.
*/

CREATE TABLE Carro (
	idCarro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (40),
    placa CHAR (7)
);

ALTER TABLE Carro AUTO_INCREMENT = 1000;

-- • Inserir 4 registros na tabela;

INSERT INTO Carro (nome, placa) VALUES
('Fusca', 'ABC1D21'),
('Gol', 'POM1N15'),
('Corola', 'JUL1A29'),
('Onix', 'NIC0L20');

/* Escreva e execute os comandos para:
• Exibir todos os dados da tabela. */

SELECT * FROM Carro;

-- • Insira mais 3 registros sem a placa dos carros.
INSERT INTO Carro (nome) VALUES
('Fiat Argo'),
('Fiat Mobi'),
('Hyundai HB20');

-- • Exibir novamente os dados da tabela.

SELECT * FROM Carro;

-- • Exibir a descrição da estrutura da tabela.
DESC Carro;

-- • Alterar a tabela para que a coluna nome possa ter no máximo 28 caracteres.

ALTER TABLE Carro MODIFY COLUMN nome VARCHAR (28);

-- • Exibir novamente a descrição da estrutura da tabela, para verificar se alterou o tamanho da coluna;

DESC Carro;

-- • Acrescentar a coluna ano à tabela, que é char(4);

ALTER TABLE Carro ADD COLUMN ano CHAR (4);

-- • Atualizar todos os dados nulos da tabela;

UPDATE Carro set placa = 'ANC3L98'
	WHERE idCarro = 1004;
UPDATE Carro set placa = 'DJS9N59'
	WHERE idCarro = 1005;
UPDATE Carro set placa = 'IWQ7J29'
	WHERE idCarro = 1006;
    
    
UPDATE Carro SET ano = 2005
	WHERE idCarro = 1000;    
UPDATE Carro SET ano = 2005
	WHERE idCarro = 1001;    
UPDATE Carro SET ano = 2012
	WHERE idCarro = 1002;    
UPDATE Carro SET ano = 2018
	WHERE idCarro = 1003;    
UPDATE Carro SET ano = 2010
	WHERE idCarro = 1004;    
UPDATE Carro SET ano = 2017
	WHERE idCarro = 1005;    
UPDATE Carro SET ano = 2020
	WHERE idCarro = 1006;