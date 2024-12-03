SELECT COUNT(id_pedido) FROM pedido;

SELECT SUM(salario) FROM cliente;

SELECT AVG(salario) FROM cliente;

SELECT * FROM cliente;

SELECT COUNT(*) FROM cliente;

SELECT COUNT(*) AS numero_cliente FROM cliente;

SELECT nome_cliente AS nome, sobrenome_cliente AS sobrenome FROM cliente;

SELECT COUNT(*) AS quantidade_clientes FROM cliente;

SELECT COUNT(*) AS quantidade_cliente FROM cliente WHERE genero = 'F'

SELECT COUNT(*) AS quantidade_cliente FROM cliente WHERE salario > 1500

-- EXERCÍCIOS DQL
SELECT * FROM pedido;

SELECT COUNT(*) AS numero_produtos FROM produto;

SELECT COUNT(*) AS numero_pedidos FROM pedido WHERE fk_cliente = 2;

SELECT COUNT(*) AS numero_pedidos FROM pedido WHERE fk_produto = 1;

SELECT COUNT(DISTINCT fk_cliente) AS numero_clientes FROM pedido;

-- Fim dos exercícios DQL;

SELECT AVG(salario) FROM cliente;

-- EXERCÍCIOS DQL DE AVG

SELECT * FROM pedido;
SELECT * FROM cliente;

SELECT AVG(preco::numeric) FROM produto;

SELECT AVG(qtde) FROM pedido;

SELECT AVG(numero_pedido) FROM 
(SELECT COUNT(*) AS numero_pedido FROM pedido GROUP BY(fk_cliente)) as pk;

SELECT AVG(salario::numeric) FROM cliente;

-- EXERCÍCIOS DQL DE SUM

SELECT SUM(salario) as Salario_total FROM cliente;

SELECT SUM(salario/3) as Salario FROM cliente;

SELECT genero, AVG(salario) as salario FROM cliente GROUP BY genero;

SELECT genero, COUNT(genero) as qtde_genero FROM cliente GROUP BY genero;

SELECT * FROM produto;

SELECT SUM(preco) FROM produto;

SELECT SUM(preco-(preco*0.10)) as soma_produtos_com_desconto FROM produto;

-- FIM DOS EXERCÍCIOS DQL SUM