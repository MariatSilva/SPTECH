-- Função DATE_FORMAT () -> Permite
-- configurar a formatação da data
-- conforme parametriação

SELECT DATE_FORMAT('2026-02-26 10:23', '%d/%m/%Y, %a, %H:%i') AS 'dt_hota_atual'; -- se é minusculo ou maiusculo importa

-- Função para trazer somente o ano

SELECT YEAR ('2025-10-11');
SELECT YEAR(NOW()) AS 'ANO';

-- Função irá trazer somente o horario
SELECT TIME('2026-02-26 10:28:58');

CREATE DATABASE aula4ccoa;
USE aula4ccoa;

CREATE TABLE pedido (
	id INT PRIMARY KEY AUTO_INCREMENT,
    dt_hora_pedido DATETIME DEFAULT CURRENT_TIMESTAMP(),
    cliente VARCHAR (45)
);

INSERT INTO pedido (cliente) VALUES
('Maria'),
('Camila');

SELECT * FROM pedido;

INSERT INTO pedido(dt_hora_pedido, cliente) VALUES
('2025-10-12 10:30:00', 'Juliana');

-- exibindo o dia do pedido de cada cliente 

SELECT cliente, DAY (dt_hora_pedido) FROM pedido;

-- exibindo o mês do pedido de cada cliente 
SELECT cliente, MONTH (dt_hora_pedido)
FROM pedido;

SELECT cliente, DATE_FORMAT (dt_hora_pedido, '%b')
	FROM pedido;
    
/**/
SELECT
CONCAT (
'Cliente ', cliente, ' realizou o pedido neste mês, na data ', DATE_FORMAT (dt_hora_pedido, '%d/%m')
) AS 'detalhamento'
FROM pedido
	WHERE MONTH (dt_hora_pedido) > 1 AND YEAR (dt_hora_pedido) > 2025;
    
    
    
    
    
    
    
    
-- exercicios sorteio

-- 1.

CREATE DATABASE biblioteca;
USE biblioteca;

-- 2.

		