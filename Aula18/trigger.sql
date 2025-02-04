CREATE TRIGGER nome_trigger
BEFORE|AFTER
INSERT|DELETE|UPDATE
ON nome_tabela

CREATE OR REPLACE FUNCTION nome_funcao() RETURNS 
    TRIGGER AS $$
        BEGIN
                \\COMANDOS
            RETURN NULL;
        END;
$$LANGUAGE plpgsql;

CREATE TABLE cliente(
	id_cliente INT PRIMARY KEY,
	salario MONEY NOT NULL
)

INSERT INTO cliente(id_cliente, salario)
VALUES (1, 1.200)

SELECT * FROM cliente
SELECT * FROM historico_salarial

UPDATE cliente SET salario = 400 WHERE id_cliente = 1

CREATE TABLE historico_salarial(
	id_historico SERIAL PRIMARY KEY,
	fk_cliente INT REFERENCES cliente(id_cliente),
	data_alteracao DATE,
	salario MONEY
)

CREATE OR REPLACE FUNCTION atualizacao_salario() RETURNS
TRIGGER AS $$ BEGIN
INSERT INTO historico_salarial(fk_cliente, data_alteracao, salario)
VALUES (NEW.id_cliente, NOW(), NEW.salario);
RETURN NULL; 
END;
$$LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trigger_salario
AFTER INSERT OR UPDATE 
ON cliente
FOR EACH ROW
EXECUTE FUNCTION atualizacao_salario()

INSERT INTO cliente(id_cliente, salario)
VALUES (2, 1600)

UPDATE cliente SET salario = 1400 WHERE id_cliente = 1

INSERT INTO cliente(id_cliente, salario)
VALUES (3, 2000),
(4, 2500),
(5, 3000)

CREATE TABLE produto(
	id_produto SERIAL PRIMARY KEY,
	preco MONEY NOT NULL
)

CREATE TABLE historico_preco(
	id_historico_preco SERIAL PRIMARY KEY,
	fk_produto INT REFERENCES produto(id_produto),
	data_atualizacao DATE,
	preco MONEY
)

CREATE OR REPLACE FUNCTION atualizacao_preco() RETURNS
TRIGGER AS $$ BEGIN
INSERT INTO historico_preco(fk_produto, data_atualizacao, preco)
VALUES (NEW.id_produto, NOW(), NEW.preco);
RETURN NULL;
END;
$$LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER trigger_preco
AFTER INSERT OR UPDATE
ON produto
FOR EACH ROW
EXECUTE FUNCTION atualizacao_preco()

INSERT INTO produto(preco)
VALUES(350),
(250),
(150)

UPDATE produto SET preco = 10000 WHERE id_produto = 3