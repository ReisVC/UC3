CREATE TABLE diogoportugal (
	id_diogoportugal int primary key not null,
	nome_diogoportugal varchar(20),
	idade_diogoportugal int not null
)

SELECT * FROM diogoportugal;

CREATE TABLE cliente (
	id_cliente INT PRIMARY KEY NOT NULL,
	idade INT NOT NULL,
	nome_cliente VARCHAR(80)
);

SELECT * FROM cliente;