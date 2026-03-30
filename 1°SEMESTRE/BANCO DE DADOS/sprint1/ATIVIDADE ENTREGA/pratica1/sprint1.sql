-- Exercício 1:
/*

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


/* • Inserir dados na tabela, procurando colocar mais de um atleta para cada modalidade
 */

INSERT INTO Atleta (idAtleta, nome, modalidade, qtdMedalha) VALUES
(1, 'LeBron James', 'Basquete', 20),
(2, 'Cristiano Ronaldo', 'Futebol', 100),
(3, 'Rayssa Leal', 'Skate Street', 30),
(4, 'Rebeca Andrade', 'Ginástica Artística', 10),
(5, 'Simone Biles', 'Ginástica Artística', 27),
(6, 'Edson Arantes', 'Futebol', 309),
(7, 'Daniel Dias', 'Natação Paralímpica', 19),
(8, 'Maria Tallchief', 'Ballet', 3),
(9, 'Richarlison', 'Futebol', 71),
(10, 'Serena Williams', 'Tênis', 78);

/*Escreva e execute os comandos para:
• Exibir todos os dados da tabela.*/
SELECT * FROM Atleta;

-- • Exibir apenas os nomes e quantidade de medalhas dos atletas.
SELECT nome, qtdMedalha FROM Atleta;

-- • Exibir apenas os dados dos atletas de uma determinada modalidade.
SELECT * FROM Atleta
	WHERE modalidade = 'Futebol';

-- • Exibir os dados da tabela ordenados pela modalidade.
SELECT * FROM Atleta
	ORDER BY modalidade;

-- • Exibir os dados da tabela, ordenados pela quantidade de medalhas, em ordem decrescente.

SELECT * FROM Atleta
	ORDER BY qtdMedalha DESC;

-- • Exibir os dados da tabela, dos atletas cujo nome contenha a letra s
SELECT * FROM Atleta
	WHERE nome LIKE '%S%';

-- • Exibir os dados da tabela, dos atletas cujo nome comece com uma determinada letra.
SELECT * FROM Atleta
	WHERE nome LIKE 'M%';

-- • Exibir os dados da tabela, dos atletas cujo nome termine com a letra o.
SELECT * FROM Atleta
	WHERE nome LIKE '%O';

-- • Exibir os dados da tabela, dos atletas cujo nome tenha a penúltima letra r.
SELECT * FROM Atleta
	WHERE nome LIKE '%r_';

-- • Eliminar a tabela
DROP TABLE Atleta;







/* 
Exercício 2:

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
menos umas 7 músicas.
*/

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

/*
Execute os comandos para:

a) Exibir todos os dados da tabela.
*/
SELECT * FROM Musica;

-- b) Exibir apenas os títulos e os artistas das músicas.

SELECT titulo, artista FROM Musica;

-- c) Exibir apenas os dados das músicas de um determinado gênero.

SELECT * FROM Musica
	WHERE genero = 'Rock';

-- d) Exibir apenas os dados das músicas de um determinado artista.

SELECT * FROM Musica
	WHERE artista = 'Tokio Hotel';

-- e) Exibir os dados da tabela ordenados pelo título da música.

SELECT * FROM Musica
	ORDER BY titulo;

-- f) Exibir os dados da tabela ordenados pelo artista em ordem decrescente.

SELECT * FROM Musica
	ORDER BY artista DESC;

-- g) Exibir os dados da tabela, das músicas cujo título comece com uma determinada letra.

SELECT * FROM Musica
	WHERE titulo LIKE 'W%';

-- h) Exibir os dados da tabela, das músicas cujo artista termine com uma determinada letra.

SELECT * FROM Musica
	WHERE artista LIKE '%R';

/* i) Exibir os dados da tabela, das músicas cujo gênero tenha como segunda letra uma
determinada letra. */

SELECT * FROM Musica
	WHERE genero LIKE '_O%'

/* j) Exibir os dados da tabela, das músicas cujo título tenha como penúltima letra uma
determinada letra. */

SELECT * FROM Musica
	WHERE titulo LIKE '%A_'

-- k) Elimine a tabela.

DROP TABLE Musica;







/*
Exercício 3:

No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Filme para conter os dados: idFilme, título (tamanho 50), genero
(tamanho 40), diretor (tamanho 40), sendo que idFilme é a chave primária da tabela.

*/

CREATE TABLE Filme (
	idFilme INT PRIMARY KEY,
	titulo VARCHAR (50),
	genero VARCHAR(40),
	diretor VARCHAR (40),
);


/*
Inserir dados na tabela, procurando colocar um gênero de filme que tenha mais de um
filme, e um diretor, que tenha mais de um filme cadastrado. Procure inserir pelo menos
uns 7 filmes.
*/

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
• Exibir todos os dados da tabela.
*/
SELECT * FROM Filme;

-- • Exibir apenas os títulos e os diretores dos filmes.

SELECT titulo, diretor FROM Filme;

-- • Exibir apenas os dados dos filmes de um determinado gênero.

SELECT * FROM Filme
	WHERE genero = 'Fantasia';

-- • Exibir apenas os dados dos filmes de um determinado diretor.

SELECT * FROM Filme
	WHERE diretor = 'Tim Burton';

-- • Exibir os dados da tabela ordenados pelo título do filme.

SELECT * FROM Filme
	ORDER BY  titulo;

-- • Exibir os dados da tabela ordenados pelo diretor em ordem decrescente.

SELECT * FROM Filme
	ORDER BY  diretor DESC;

-- • Exibir os dados da tabela, dos filmes cujo título comece com uma determinada letra.

SELECT * FROM Filme
	WHERE titulo LIKE 'A%';

-- • Exibir os dados da tabela, dos filmes cujo diretor termine com uma determinada letra.

SELECT * FROM Filme
	WHERE diretor LIKE '%M';

/* • Exibir os dados da tabela, dos filmes cujo gênero tenha como segunda letra uma
determinada letra. */

SELECT * FROM Filme
	WHERE genero LIKE '_N%';

/* • Exibir os dados da tabela, dos filmes cujo título tenha como penúltima letra uma
determinada letra. */

SELECT * FROM Filme
	WHERE titulo LIKE '%H_';

-- • Elimine a tabela.

DROP TABLE Filme;






/*
Exercício 4:

No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Professor para conter os dados: idProfessor, nome (tamanho 50),
especialidade (tamanho 40), dtNasc (date), sendo que idProfessor é a chave primária da
tabela.
Exemplo do campo data: ‘AAAA-MM-DD’ - ‘1983-10-13’.
*/

CREATE TABLE Professor (
	idProfessor INT PRIMARY KEY,
	nome VARCHAR (50),
	especialidade VARCHAR (40),
	dtNasc DATE
);
/* Inserir dados na tabela, procurando colocar uma especialista para mais de um professor.
Procure inserir pelo menos uns 6 professores. */

INSERT INTO Professor (idProfessor, nome, especialidade, dtNasc) VALUES

(1, 'Aline Mendonça Cordeiro', 'Banco de Dados', '1958-11-05'),
(2, 'Júnior de Lima', 'Arduino', '1960-04-04'),
(3, 'Clodoaldo Bastos', 'Design', '1947-06-21'),
(4, 'Lenildo Barros', 'História', '1947-06-08'),
(5, 'Rodrigo Navarro', 'Espanhol', '1980-02-01'),
(6, 'Rosângela Freire', 'Matemática', '1989-09-09'),
(7, 'Edson Ferreira', 'Matemática', '2000-02-09'),
(8, 'Ana Santiago', 'Espanhol', '1999-09-09');


/* Execute os comandos para:
a) Exibir todos os dados da tabela. */

SELECT * FROM Professor;

-- b) Exibir apenas as especialidades dos professores.

SELECT especialidade FROM Professor;

-- c) Exibir apenas os dados dos professores de uma determinada especialidade.

SELECT * FROM Professor	
	WHERE especialidade = 'Espanhol';

-- d) Exibir os dados da tabela ordenados pelo nome do professor.

SELECT * FROM Professor
	ORDER BY nome;

/* e) Exibir os dados da tabela ordenados pela data de nascimento do professor em ordem
decrescente. */

SELECT * FROM Professor
	ORDER BY dtNasc DESC;

/* f) Exibir os dados da tabela, dos professores cujo nome comece com uma determinada
letra. */

SELECT * FROM Professor
	WHERE nome LIKE 'A%';

/* g) Exibir os dados da tabela, dos professores cujo nome termine com uma determinada
letra. */

SELECT * FROM Professor
	WHERE nome LIKE '%O';

/* h) Exibir os dados da tabela, dos professores cujo nome tenha como segunda letra uma
determinada letra. */

SELECT * FROM Professor
	WHERE nome LIKE '_D%';

/* i) Exibir os dados da tabela, dos professores cujo nome tenha como penúltima letra uma
determinada letra. */

SELECT * FROM Professor
	WHERE nome LIKE '%R_';

-- j) Elimine a tabela.

DROP TABLE Professor;






/*
Exercício 5:

No MySQL Workbench, utilizando o banco de dados ‘sprint1’:
Criar a tabela chamada Jogo para conter os dados: idJogo, nome (tamanho 50), comentario (tamanho 200), ranking (número inteiro), sendo que idJogo é a chave primária da tabela.
*/

CREATE TABLE Jogo (
	idJogo INT PRIMARY KEY,
	nome VARCHAR(50),
	comentario VARCHAR (200),
	ranking INT,
)

/* Inserir dados na tabela.
Procure inserir pelo menos 5 jogos. */

INSERT INTO Jogo (idJogo, nome, comentario, ranking) VALUES
(1,'Free Fire', 'É um jogo eletrônico mobile de ação-aventura no estilo battle royale.', 2),
(2, 'Roblox', 'É uma popular plataforma online e sistema de criação de jogos onde usuários jogam e desenvolvem suas próprias experiências.', 1),
(3, 'Escape Room', 'É um aplicativo de quebra-cabeça para celular.', 3),
(4, 'Paciência', 'É um jogo de cartas para um só jogador.', 4),
(5, 'Minecraft', 'Consiste em sobreviver em um mundo formado (majoritariamente) por blocos cúbicos.', 5),
(6, 'Stardew Valley', 'É um jogo de simulação de fazenda e RPG, onde o jogador herda a antiga fazenda de seu avô no pacato "Vale do Orvalho', 6);

/* Execute os comandos para:
a) Exibir todos os dados da tabela. */

SELECT * FROM Jogo;

-- b) Exibir apenas os nomes dos jogos.

SELECT nome FROM Jogo;

-- c) Exibir apenas o comentário de um determinado jogo.

SELECT comentario FROM Jogo
	WHERE nome = 'Free Fire';

-- d) Exibir os dados da tabela ordenados pelo nome do jogo.

SELECT * FROM Jogo
	ORDER BY nome;

-- e) Exibir os dados da tabela ordenados pelo ranking em ordem decrescente.

SELECT * FROM Jogo
	ORDER BY ranking DESC;

-- f) Exibir os dados da tabela, dos jogos cujo nome comece com uma determinada letra.

SELECT * FROM Jogo
	WHERE nome LIKE 'R%';

-- g) Exibir os dados da tabela, dos jogos cujo nome termine com uma determinada letra.

SELECT * FROM Jogo
	WHERE nome LIKE '%E';

/* h) Exibir os dados da tabela, dos jogos cujo nome tenha como segunda letra uma determinada letra.
*/

SELECT * FROM Jogo
	WHERE nome LIKE '_S%';

/* i) Exibir os dados da tabela, dos jogos cujo nome tenha como penúltima 
letra uma determinada letra.*/

SELECT * FROM Jogo
	WHERE nome LIKE '%E_';

-- j) Exibir os dados da tabela, dos jogos cujo nome seja diferente de Minecraft.

SELECT * FROM Jogo
	WHERE nome <> 'Minecraft';

-- k) Elimine a tabela.

DROP TABLE Jogo;
