INSERT INTO produto(id_produto, nome_produto, descricao, preco, qtde_estoque)
VALUES (3,'Cubo magico','produto d eplástico',10.00, 20),
(4, 'stanley','garrafa térmica', 300.00, 50),
(5, 'Capinha de telefone','apenas para samsung', 25.00, 100),
(6, 'MousePad', 'tamanho médio',50.00, 10),
(7, 'Caneta', 'contém cores azul, verde e vermelho', 6.00, 70),
(8, 'Fone de ouvido', 'via bluetooth', 50.00, 30),
(9, 'Energético','Agite antes de beber', 12.00, 20),
(10, 'Esmalte','secagem rápida', 7.00, 50)

SELECT * FROM produto
SELECT * FROM cliente
SELECT * FROM pedido

INSERT INTO pedido(fk_cliente, fk_produto, qtde)
VALUES (7,6,4),
(4,8,9),
(1,2,3),
(8,9,3),
(4,8,6),
(1,5,9),
(4,3,6),
(7,6,4);

SELECT nome_produto, qtde_estoque FROM produto WHERE id_produto = 2

UPDATE produto SET qtde_estoque = 43 where id_produto = 2

SELECT DISTINCT atributo FROM tabela;
SELECT ALL atributo FROM tabela;

INSERT INTO cliente(id_cliente, nome_cliente, sobrenome_cliente, cpf)
VALUES(12, 'João', 'Silva', '01110110110')

SELECT DISTINCT nome_cliente FROM cliente

ALTER TABLE cliente ADD genero CHAR(1)
ALTER TABLE cliente ADD salario FLOAT

UPDATE cliente 
SET genero = 'M'
WHERE id_cliente > 0

UPDATE cliente 
SET genero = 'F'
WHERE id_cliente = 5 OR id_cliente = 10

UPDATE cliente
SET salario = 2000
WHERE id_cliente > 0

UPDATE cliente
SET salario = 1500
WHERE id_cliente = 5 

UPDATE cliente
SET salario = 1500
WHERE id_cliente = 10

UPDATE cliente
SET cpf = 00101000555
WHERE id_cliente = 10

-- EXERCÍCIOS DQL 

SELECT * FROM cliente;

SELECT DISTINCT nome_cliente FROM cliente;

SELECT nome_cliente, cpf FROM cliente;

SELECT * FROM cliente WHERE genero = 'F';

SELECT * FROM cliente WHERE genero = 'F' ORDER BY nome_cliente DESC;

SELECT nome_cliente, salario FROM cliente WHERE genero = 'M' AND salario < 3000;




