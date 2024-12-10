CREATE TABLE categoria(
	id_categoria INT PRIMARY KEY,
	nome_categoria VARCHAR(80) NOT NULL
)

SELECT * FROM produto;

ALTER TABLE produto ADD fk_categoria INT REFERENCES categoria(id_categoria)

SELECT * FROM produto
ORDER BY id_produto ASC

INSERT INTO categoria (id_categoria, nome_categoria)
VALUES(1, 'Objeto'),
(2, 'Bebidas'),
(3, 'Eletrônicos')

SELECT * FROM categoria

SELECT * FROM produto ORDER BY id_produto ASC;

UPDATE produto
SET fk_categoria = 1
WHERE id_produto > 0

UPDATE produto
SET fk_categoria = 2
WHERE id_produto = 2 OR id_produto = 9

UPDATE produto
SET fk_categoria = 3
WHERE id_produto = 8 OR id_produto = 6

SELECT *, nome_categoria
FROM produto
INNER JOIN categoria
ON produto.fk_categoria = categoria.id_categoria
WHERE id_categoria = 1

SELECT COUNT(produto), nome_categoria
FROM categoria
LEFT JOIN produto
ON categoria.id_categoria = produto.fk_categoria
GROUP BY nome_categoria

SELECT * FROM pedido;

SELECT id_pedido, nome_cliente, sobrenome_cliente
FROM pedido
RIGHT JOIN cliente
ON pedido.fk_cliente = cliente.id_cliente

SELECT nome_produto, nome_categoria FROM produto
CROSS JOIN categoria
WHERE nome_categoria = 'Objeto'

SELECT * FROM categoria;
SELECT * FROM produto;
SELECT * FROM pedido;

SELECT id_pedido, nome_produto, nome_categoria FROM pedido
FULL OUTER JOIN produto
ON pedido.fk_produto = produto.id_produto
JOIN categoria
ON produto.fk_categoria = categoria.id_categoria

