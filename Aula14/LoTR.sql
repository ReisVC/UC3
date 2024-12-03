CREATE TABLE personagem(
	id_personagem SERIAL PRIMARY KEY,
	nome_personagem VARCHAR(80) NOT NULL,
	classe VARCHAR(80) NOT NULL
)

CREATE TABLE item(
	id_item SERIAL PRIMARY KEY,
	nome_item VARCHAR(80) NOT NULL
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
-- FLORESTA DFE LOTHLÓRIEN, MONTANHAS DE MORIA, CAMPO DE BATALHA DE HELM +2
-- ESPADA ELFICA, ARCO LONGO, MACHADO DE BATAÇHA, VARINHA MÁGICA +2
-- (1,1,1),(2,2,2),(3,3,3),(4,4,1),(1,3,3),(2,1,1) +3