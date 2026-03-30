/*
1 – Loja de Jogos

No MySQL Workbench, crie o banco de dados "game_store".
A loja de jogos “Game Store” estava passando dificuldades de organização pois o
dono Mário, um simpático senhor italiano aposentado que trabalhou com
encanamento durante sua juventude, não tinha controle do seu estoque de jogos.

Para ajudar Mário a organizar sua loja de jogos, um estudante da SPTech propôs
criar uma tabela chamada “jogo” que continha o id como número e chave primária
que se autoincrementa, o nome do jogo com tamanho máximo de 30 caracteres, o
nome do diretor do jogo com tamanho máximo de 30 caracteres, o gênero com
tamanho de 30 caracteres, a data de lançamento, a nota do jogo (entre 0-10) e um
campo para guardar a quantidade de unidades disponíveis. */

CREATE DATABASE game_store;
USE game_store;

CREATE TABLE jogo (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (30) NOT NULL,
    diretor VARCHAR (30) DEFAULT 'Sem diretor',
    genero VARCHAR (30) DEFAULT 'Sem gênero',
    lancamento DATE,
    nota INT,
    quantidade INT NOT NULL
);
-- DROP TABLE jogo;

-- 1. Insira pelo menos 5 registros para a tabela.

INSERT INTO jogo (nome, diretor, genero, lancamento, nota, quantidade) VALUES
('Super Mario', 'Shigeru Miyamoto', '2D', '1985-09-13', 10, 0),
('God of War', 'David Jaffe', 'Ação', '2005-03-22', 10, 978 ),
('God of War 2', 'David Jaffe', 'Ação','2007-03-13', 9, 542 ),
('Midnight Club 3', 'Daren Bader', 'Arcade', '2005-04-11', 7, 108 ),
('Resident Evil 4', ' Shinji Mikami', 'Survival horror','2005-01-11',  5, 265);

/* 2. Altere a tabela para inserir uma coluna que represente o tipo de mídia que
deve armazenar o tipo de jogo apenas com os valores “física” ou “digital”. */

ALTER TABLE jogo ADD COLUMN tipoMidia VARCHAR (30);
ALTER TABLE jogo ADD CONSTRAINT cTipoMidia CHECK (tipoMidia IN ('Física', 'Digital'));

-- 3. Atualize os registros dos jogos inseridos anteriormente.

UPDATE jogo SET tipoMidia = 'Física'
	WHERE id = 1;
UPDATE jogo SET tipoMidia = 'Digital'
	WHERE id = 2;
UPDATE jogo SET tipoMidia = 'Física'
	WHERE id = 3;
UPDATE jogo SET tipoMidia = 'Digital'
	WHERE id = 4;
UPDATE jogo SET tipoMidia = 'Física'
	WHERE id = 5;
    
-- 4. Exiba apenas os jogos com data de lançamento a partir de 2015.

SELECT * FROM jogo
	WHERE lancamento >= '2015-01-01';
    
-- 5. Exiba os jogos que tenham a letra “a” em seu nome e são de mídia física.

SELECT * FROM jogo
	WHERE nome LIKE '%a%'
    AND tipoMidia = 'Física';
    
-- 6. Exiba os jogos onde o nome do diretor não contenha a letra “e”.

SELECT * FROM jogo
	WHERE diretor NOT LIKE '%e%';
    
/* 7. Altere a tabela para criar uma checagem na inserção da nota, onde o valor
não pode ser menor que 0 e nem maior que 10.
*/

ALTER TABLE jogo ADD CONSTRAINT cNota CHECK (nota <= 10 AND nota>=0);

-- 8. Exiba os jogos de um determinado gênero e que ainda esteja em estoque.

SELECT * FROM jogo
	WHERE genero LIKE 'Ação' AND quantidade > 0;
    
-- 9. Exclua os jogos que não têm mais unidades disponíveis em estoque.

DELETE FROM jogo
	WHERE quantidade < 1 AND id >= 1;
    
-- 10. Renomeie a coluna “diretor” para “criador” e exiba como ficou a estrutura da tabela.

 ALTER TABLE jogo RENAME COLUMN diretor TO criador;
 
 
/*
2 – Esportes Olímpicos

No MySQL Workbench, crie o banco de dados "olimpiadas".
Casimiro, um fã apaixonado por esportes, decidiu que queria acompanhar de
perto as Olimpíadas. Ele pediu ajuda a um amigo para criar uma tabela que
armazenasse informações sobre os esportes praticados nas Olimpíadas.

Eles criaram uma tabela chamada "esporte" que continha id como número e chave
primária que se autoincrementa, nome que armazena o nome do esporte com
limite de 40 caracteres, a categoria do esporte com limite de 20 caracteres que
aceita apenas ("Individual" ou "Coletivo"), o número de jogadores que podem
participar por equipe, estreia que armazena a data de quando o esporte estreou
nas Olimpíadas e o nome do país de origem do esporte com até 30 caracteres.
*/


CREATE DATABASE olimpiadas;
USE olimpiadas;

CREATE TABLE esporte (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (40),
    categoria VARCHAR (20),
    numJogadores INT,
    estreia DATE,
    paisOrigem VARCHAR (30),
    CONSTRAINT cCategoria CHECK (categoria IN ('Individual', 'Coletivo'))
);


-- 1. Insira pelo menos 5 registros na tabela.

INSERT INTO esporte (nome, categoria, numJogadores, estreia, paisOrigem) VALUES
('Futebol', 'Coletivo', 22, '1870-09-02', 'Inglaterra'),
('Basquete', 'Coletivo', 10, '1896-12-21', 'Estados Unidos'),
('Vôlei', 'Coletivo', 12, '1897-02-09', 'Estados Unidos'),
('Tênis', 'Individual', 2, '1973-03-04', 'Reino Unido'),
('Handebol', 'Coletivo', 14, '1917-01-01', 'Alemanha');

/*2. Altere a tabela para adicionar uma coluna popularidade que armazene a
popularidade do esporte como um valor decimal entre 0 e 10 e exiba como
ficou a estrutura da tabela.*/

ALTER TABLE esporte ADD COLUMN popularidade DECIMAL (4, 2);
ALTER TABLE esporte ADD CONSTRAINT cPopularidade CHECK(popularidade >=0 AND popularidade <=10);
/*3. Atualize os registros para definir a popularidade dos esportes inseridos
anteriormente.*/

UPDATE esporte SET popularidade = 10.00
	WHERE id = 1;
UPDATE esporte SET popularidade = 10.00
	WHERE id = 2;
UPDATE esporte SET popularidade = 08.50
	WHERE id = 3;
UPDATE esporte SET popularidade = 06.75
	WHERE id = 4;
UPDATE esporte SET popularidade = 7.95
	WHERE id = 5;
    
-- 4. Exiba os esportes ordenados por popularidade em ordem crescente.

SELECT * FROM esporte
	ORDER BY popularidade;
    
/*5. Exiba apenas os esportes que estrearam nas Olimpíadas a partir do ano
2000.*/

SELECT * FROM esporte
	WHERE estreia >= '2000-01-01';

/*6. Crie uma checagem para que não possa ser inserido valores dentro de
estreia que seja menor que 06 de abril de 1896 e depois da data atual.*/
    
UPDATE esporte SET estreia = '1899-09-02'
	WHERE id = 1;
    
ALTER TABLE esporte ADD CONSTRAINT cEstreia CHECK (estreia >= '1896-04-06' AND estreia < '2026-02-21');

/*7. Altere a tabela para excluir a regra de inserção de categoria, assim
podendo colocar valores além de "Individual" ou "Coletivo".*/

ALTER TABLE esporte DROP CONSTRAINT cCategoria;

/*8. Exiba apenas os esportes cujo nome do país de origem tenha "a" na
segunda letra.
*/

SELECT * FROM esporte
	WHERE paisOrigem LIKE '_a%';

-- 9. Exiba os dados onde o número de jogadores por equipe esteja entre 4 e 11.

SELECT * FROM esporte
	WHERE numJogadores >= 4 AND numJogadores <= 11;
    
-- 10. Remova os registros onde id seja 1, 3 e 5.

DELETE FROM esporte
	WHERE id = 1;

DELETE FROM esporte
	WHERE id = 3;

DELETE FROM esporte
	WHERE id = 5;
    
/*3 – Desenhos Animados

No MySQL Workbench, crie o banco de dados "desenho".
Você foi contratado para criar um banco de dados que armazene informações
detalhadas sobre desenhos animados exibidos na emissora. O objetivo é manter
um catálogo com as seguintes informações.

Para atender a essa necessidade, você propôs a criação de uma tabela com os
seguintes campos: id, um número inteiro chave primária da tabela, este valor
deverá ser autoincrementado a partir do 10. Título, um campo de texto com
tamanho de 50 caracteres que armazenará o título do desenho animado. A data de
lançamento um campo que armazenará a data de lançamento do desenho. O
nome da emissora original, um campo de texto com tamanho de 50 caracteres.
Classificação, um campo que armazenará a classificação indicativa do desenho.
Status, um campo de texto com tamanho de 15 caracteres, que armazenará o
status do desenho. Nota, um campo que armazenará a avaliação do desenho,
permitindo valores de 1 a 5*/

CREATE DATABASE desenho;
USE desenho;

CREATE TABLE catalogoDesenho (
	id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR (50),
    dtLancamento DATE,
    emissoraOriginal VARCHAR (50),
    classificacao INT,
    statusDesenho VARCHAR (15),
    nota DECIMAL (2,1),
    CONSTRAINT cNota CHECK(nota>=1 AND nota<=5)
);

ALTER TABLE catalogoDesenho AUTO_INCREMENT = 10;

INSERT INTO catalogoDesenho 
(titulo, dtLancamento, emissoraOriginal, classificacao, statusDesenho, nota) VALUES
('Bob Esponja', '1999-05-01', 'Nickelodeon', 0, 'exibindo', 4.8),
('Hora de Aventura', '2010-04-05', 'Cartoon Network', 10, 'finalizado', 4.7),
('Os Simpsons', '1989-12-17', 'Fox', 12, 'cancelado', 4.5),
('Peppa Pig', '2004-05-31', 'Channel 5', 0, 'exibindo', 3.9),
('Avatar: A Lenda de Aang', '2005-02-21', 'Nickelodeon', 10, 'finalizado', 5.0);

-- 1. Exibir todos os dados da tabela

SELECT * FROM catalogoDesenho;

-- 2. Exibir todos os desenhos com a classificação menor ou igual a 14 anos

SELECT * FROM catalogoDesenho
	WHERE classificacao <=14;
    
-- 3. Exibir todos os desenhos de uma mesma emissora original

SELECT * FROM catalogoDesenho
	WHERE emissoraOriginal LIKE 'Nickelodeon';
    
/*4. Modificar o campo status, para que aceite apenas o status 'exibindo',
'finalizado', 'cancelado', tente inserir algum outro valor para ver se a regra
foi aplicada*/

ALTER TABLE catalogoDesenho ADD CONSTRAINT cStatusDesenho CHECK(statusDesenho IN('exibindo', 'finalizado', 'cancelado'));

-- 5. Modificar o status 'exibindo' para 'finalizado' de 2 desenhos pelo ID

UPDATE catalogoDesenho SET statusDesenho = 'finalizado'
		WHERE id = 1;
UPDATE catalogoDesenho SET statusDesenho = 'finalizado'
		WHERE id = 4;
        

-- 6. Deletar a linha do desenho de ID 12

DELETE FROM catalogoDesenho 
	WHERE id = 12;
    
-- 7. Exibir apenas os desenhos que comecem com uma determinada letra

SELECT * FROM catalogoDesenho
	WHERE titulo LIKE 'A%';
    
-- 8. Renomear a coluna classificacao para classificacaoIndicativa

ALTER TABLE catalogoDesenho RENAME COLUMN classificacao TO classificacaoIndicativa;

-- 9. Atualizar a nota e data de lançamento do desenho de ID 11
UPDATE catalogoDesenho set dtLancamento = '2011-09-08'
	WHERE id = 11;
    
-- 10. Limpe todos os dados da tabela

TRUNCATE catalogoDesenho;

-- 11. Remover a regra do status do desenho 
ALTER TABLE catalogoDesenho DROP CONSTRAINT cStatusDesenho;




/*4 – Despensa do Scooby-Doo 

No MySQL Workbench, crie o banco de dados "estoque". 
A turma do Scooby Doo percebeu que os alimentos guardados no armário estavam 
sumindo de forma muito rápida. Para ter um melhor controle, Fred propôs criar 
um banco de dados que registrasse os dados de entrada e saída dos alimentos do 
armário. 

Ele criou uma tabela chamada "MisteriosSA", que possui os campos id um número 
inteiro chave primária, nome um campo de texto para armazenar o nome do 
produto, data da compra para armazenar a data na qual o produto foi comprado, 
preço valor numérico com casas decimais, peso um valor numérico que armazena 
o peso em gramas e data de retirada para armazenar a data em que o produto foi 
consumido. */

CREATE DATABASE estoque;
USE estoque;


CREATE TABLE MisteriosSA (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR (50),
    dtCompra DATE,
    preco DECIMAL (6,2),
    peso INT,
    dtRetirada DATE
);

/*1. Insira na tabela, no mínimo 5 compras de alimentos com datas diferentes. 
Por agora, não preencha a coluna referente a "data de retirada".*/

INSERT INTO MisteriosSA(nome, dtCompra, preco, peso) VALUES
('Biscoito Scooby', '2025-12-27', 20.0, 1000),
('Salsicha', '2026-01-12', 22.0, 1500),
('Cacho de banana', '2026-02-20', 8.0, 500),
('Parmesão', '2026-02-15', 15.0, 400),
('Chocolate', '2026-01-01', 20.0, 100);


-- 2. Verifique se os valores foram inseridos corretamente.

SELECT * FROM MisteriosSA;

/*3. Exiba os nomes, as datas de compra e retirada e o id dos alimentos 
ordenados a partir da data de compra mais antiga. */

SELECT nome, dtCompra, dtRetirada, id FROM MisteriosSA
	ORDER BY dtCompra;
    
/*4. Alguém comeu uma caixa de biscoitos, atualize a data de retirada da caixa 
de “Biscoitos Scooby” que foi comprada a mais tempo.*/

UPDATE MisteriosSA SET  dtRetirada = '2026-02-24'
	WHERE id = 1;

-- 5. Altere o nome da coluna id para idComida. 

ALTER TABLE MisteriosSA RENAME COLUMN id TO idComida;

/*6. Altere o tipo do check para que os alimentos só possam ser “Biscoitos 
Scooby” ou “Cachorro-quente”.*/
UPDATE MisteriosSA SET nome = 'Biscoitos Scooby'
	WHERE idComida = 1;
UPDATE MisteriosSA SET nome = 'Cachorro-quente'
	WHERE idComida = 2;
UPDATE MisteriosSA SET nome = 'Biscoitos Scooby'
	WHERE idComida = 3;
UPDATE MisteriosSA SET nome = 'Cachorro-quente'
	WHERE idComida = 4;
UPDATE MisteriosSA SET nome = 'Biscoitos Scooby'
	WHERE idComida = 5;
    
ALTER TABLE MisteriosSA ADD CONSTRAINT cNome CHECK (nome IN('Biscoitos Scooby', 'Cachorro-quente'));

/*7. Exiba os produtos onde o nome seja "Biscoitos Scooby" de forma que o 
nome das colunas dataCompra apareça como "data da compra" e 
dataRetirada apareça como "data da retirada".*/

SELECT nome, dtCompra AS 'data da compra', preco, peso, dtRetirada AS 'data da retirada' FROM MisteriosSA
	WHERE nome = 'Biscoitos Scooby';
    
-- 8. Exiba os alimentos que foram comprados antes do dia 25 de julho de 2024.

SELECT * FROM MisteriosSA
	WHERE dtCompra < '2024-07-25';
    
-- 9. Exiba os alimentos que possuem um preço acima ou igual a 30.50.

SELECT * FROM MisteriosSA
	WHERE preco >= 30.50;
    
-- 10. Limpe a tabela. 

TRUNCATE TABLE MisteriosSA;


/*5 – Heróis   

No MySQL Workbench, crie o banco de dados “vingadores”. 
Crie uma tabela chamada “heroi”, onde terá um campo de nome contendo até 45 
caracteres. 
O seu herói poderá ter uma versao, onde será armazenado o filme de 
sua escolha, esse campo aceitará até 45 caracteres. Todo herói, tem uma 
habilidade que se destaca entre os outros super-heróis. Todo herói tem uma 
altura, esse campo aceitará valores inteiros representando centímetros. O id 
deverá se autoincrementar. */

CREATE DATABASE vingadores;
USE vingadores;

CREATE TABLE heroi (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR (45),
    versao VARCHAR (45),
    habilidade VARCHAR (45),
    altura INT
);

-- Insira 5 heróis para derrotar o vilão Doutor Destino. 

INSERT INTO heroi (nome, versao, habilidade, altura) VALUES
('Magneto', 'O Confronto Final', 'Telecinesia', 183),
('Batman', 'Batman: O Cavaleiro das Trevas', 'Intelecto e artes marcias', 190),
('Homem-aranha', 'Homem-Aranha', 'Lançar teias', '172'),
('Mulher-Maravilha', 'Mulher-Maravilha', 'Força', 177),
('Thor', 'Os Vingadores', 'Eletricidade', 186);

-- 1. Exiba os dados inseridos na tabela

SELECT * FROM heroi;

/*2. Adicione um campo de regeneração, onde ele aceitará apenas os valores 
booleanos de TRUE ou FALSE.*/

ALTER TABLE heroi ADD COLUMN regeneracao BOOLEAN;

ALTER TABLE heroi ADD CONSTRAINT cRegeneracao CHECK (regeneracao IN (TRUE, FALSE));

-- 3. Modifique o campo versão para aceitar até 100 caracteres.

ALTER TABLE heroi MODIFY COLUMN versao VARCHAR (100);

-- 4. Remova o herói de id 3 pois ele se morreu em batalha.

DELETE FROM heroi
	WHERE id = 3;

-- 5. Chegou reforços, insira um novo herói para a equipe.

INSERT INTO heroi (nome, versao, habilidade, altura) VALUES
('Aquaman', 'Aquaman', 'Controlar os mares', 178);

/*6. Exiba todos os dados inseridos na tabela onde o nome do herói começa 
com “C” ou “H”. */

SELECT * FROM heroi
	WHERE nome LIKE 'C%' OR nome LIKE 'H%';
    
/* 7. Exiba todos os dados inseridos na tabela onde o nome do herói não contém 
a letra “A” no campo nome.*/
SELECT * FROM heroi
	WHERE nome NOT LIKE '%a%';
    
-- 8. Exiba apenas o nome do herói onde a altura for maior que 190. 
SELECT * FROM heroi
	WHERE altura > 190;
    
/*9. Exiba todos os dados da tabela de forma decrescente pelo nome onde a 
altura do herói for maior que 180.*/

SELECT * FROM heroi
	WHERE altura > 180
		ORDER BY nome DESC;
        
-- 10. Limpe os dados da tabela.

TRUNCATE TABLE heroi; 

