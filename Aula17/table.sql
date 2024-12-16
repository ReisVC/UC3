CREATE OR REPLACE VIEW produtos_comprados AS
SELECT PE.id_pedido AS pedido, nome_cliente AS cliente,
PR.nome_produto AS produto, PE.qtde AS quantidade,
PE.qtde*PR.preco AS fatura
FROM pedido PE
JOIN produto PR
ON PE.fk_produto = PR.id_produto
JOIN cliente CL
ON PE.fk_cliente = CL.id_cliente;


SELECT * FROM produtos_comprados;

ALTER VIEW nome_view RENAME TO novo_nome

DROP VIEW IF EXISTS nome_view CASCADE

SELECT SUM(fatura) FROM produtos_comprados

CREATE OR REPLACE VIEW produtos_categorias AS
SELECT nome_produto AS produto,
descricao,
preco AS valor,
qtde_estoque AS quantidade,
nome_categoria AS categoria
FROM produto
LEFT JOIN categoria
ON produto.fk_categoria = categoria.id_categoria

SELECT * FROM produtos_categorias

CREATE OR REPLACE VIEW pedidos_feitos AS
SELECT nome_cliente AS cliente,
qtde AS quantidade,
id_pedido AS numero_pedido
FROM cliente
RIGHT JOIN pedido
ON pedido.fk_cliente = cliente.id_cliente

SELECT * FROM pedidos_feitos

-- Exercício 3
CREATE OR REPLACE VIEW Usuarios_cliente AS
SELECT nome_cliente AS cliente,
nome_produto AS produto, 
id_pedido AS numero_pedido,
qtde AS quantidade
FROM cliente
LEFT JOIN pedido
ON cliente.id_cliente = pedido.fk_cliente
JOIN produto
ON produto.id_produto = pedido.fk_produto

SELECT * FROM usuarios_cliente

CREATE INDEX ON cliente(id_cliente)
CREATE INDEX ON produto using hash(id_produto)
CREATE INDEX ON pedido(id_pedido)

