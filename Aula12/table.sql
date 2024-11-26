CREATE TABLE cliente(
	id_cliente INT PRIMARY KEY,
	nome_cliente VARCHAR(80) NOT NULL,
	sobrenome_cliente VARCHAR(80) NOT NULL
);

SELECT * FROM client;

CREATE TABLE produto (
	id_produto INT PRIMARY KEY NOT NULL,
	nome_produto VARCHAR(30) NOT NULL,
	descricao TEXT NOT NULL,
	preco NUMERIC CHECK (preco > 0) NOT NULL,
	qtde_estoque SMALLINT DEFAULT 0
);

CREATE TABLE pedido(
	id_pedido SERIAL PRIMARY KEY,   
	fk_produto INT NOT NULL,
	qtde SMALLINT NOT NULL,
	FOREIGN KEY(fk_produto) REFERENCES produto(id_produto)
);


DROP DATABASE Zelda; -- Apaga Banco de Dados (Database)
DROP TABLE Goron; -- Apaga Tabela

-- SELECT * FROM tabela 
-- WHERE condicao
-- ORDER BY ASC -- Em ordem ascendente [A-Z] ou order descendente [Z-A] (DESC)


-- SELECT * FROM tabela ORDER BY DESC;

-- INSERT -- Para inserir novos dados na tabela
-- UPDATE -- Para atualizar dados
-- DELETE -- Para apagar dados

INSERT INTO nome_tabela (coluna1, coluna2, coluna3) 
VALUES (dado1, dado2, dado3);

INSERT INTO nome_tabela (coluna1, coluna2, coluna3) 
VALUES (dado1, dado2, dado3),
       (dado1, dado2, dado3);


UPDATE nome_tabela
SET nome_atributo = novo_valor, outro_atributo = outro_valor
WHERE condicao = 1;

DELETE FROM nome_table WHERE condicao = 1; -- NUNCA ESQUECER DO WHERE

INSERT INTO cliente (id_cliente, nome_cliente, sobrenome_cliente) 
VALUES (3, 'Zé', 'Bolão'),
(4, 'Francesco', 'Virgulinni');

SELECT * FROM cliente
DELETE FROM cliente WHERE id_cliente > 3;

INSERT INTO produto(id_produto, nome_produto, descricao, preco, qtde_estoque) 
VALUES (1, 'Bola', 'Bola Quadrada', 15.00, 20),
(2, 'Água', 'Garra de Plástico de 1,5L', 6.00, 90);

INSERT INTO pedido(fk_cliente, fk_produto, qtde)
VALUES (1, 1, 3),
(2, 2, 4),
(2, 1, 3)

SELECT * FROM produto

INSERT INTO cliente(id_cliente, nome_cliente, sobrenome_cliente, cpf) 
VALUES (4, 'Rodrigo', 'George', '00101000101'),
(5, 'Elize', 'Matsunaga', '00101000101'),
(6, 'Pedrinho', 'Matador', '00101000101'),
(7, 'Jeffrey', 'Dahmer', '00101000101'),
(8, 'Ronald', 'MCDonald', '00101000101'),
(9, 'Michael', 'Myers', '00101000101'),
(10, 'Suzane', 'Von Richsthoffen', '00101000101');