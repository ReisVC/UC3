CREATE TABLE personagem(
	id_personagem SERIAL PRIMARY KEY,
	nome_personagem VARCHAR(80) NOT NULL,
	classe VARCHAR(80) NOT NULL
)

CREATE TABLE item(
	id_item SERIAL PRIMARY KEY,
	nome_item VARCHAR(80) NOT NULL,
    valor NUMERIC NOT NULL
)

CREATE TABLE cenario(
	id_cenario SERIAL PRIMARY KEY,
	nome_cenario VARCHAR(80) NOT NULL
)

CREATE TABLE coletado(
	id_coletado SERIAL PRIMARY KEY,
	fk_personagem INT NOT NULL REFERENCES personagem(id_personagem),
	fk_item INT NOT NULL REFERENCES item(id_item),
	fk_cenario INT NOT NULL REFERENCES cenario(id_cenario)
)

-- ARAGORN, LEGOLAS, GIMLI, GANDALF +3
INSERT INTO personagem(nome_personagem, classe)
VALUES ('Aragorn', 'Guerreiro'),
('Légolas', 'Arqueiro'),
('Gimli', 'Guerreiro'),
('Gandalf', 'Mago'),
('Frodo', 'Explorador'),
('Sauron ', 'Mago Supremo'),
('Boromir', 'Guerreiro')

-- FLORESTA DFE LOTHLÓRIEN, MONTANHAS DE MORIA, CAMPO DE BATALHA DE HELM +2
INSERT INTO cenario(nome_cenario)
VALUES('Floresta de Lothlórien'),
('Montanhas de Moria'),
('Campo de Batalha de Helm	'),
('As Planícies de Rohan'),
('O Condado')

-- ESPADA ELFICA, ARCO LONGO, MACHADO DE BATAÇHA, VARINHA MÁGICA +2
INSERT INTO item(nome_item, valor)
VALUES('Espada Élfica', 700),
('Arco Longo', 600),
('Machado de Batalha', 600),
('Varinha Mágica', 500),
('Um Anel', 1000),
('Elixir de Galadriel', 500)

-- (1,1,1),(2,2,2),(3,3,3),(4,4,1),(1,3,3),(2,1,1) +3
INSERT INTO coletado(fk_personagem, fk_item, fk_cenario)
VALUES (1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 1),
(1, 3, 3),
(2, 1, 1),
(6, 5, 2),
(7, 3, 3),
(5, 4, 5)