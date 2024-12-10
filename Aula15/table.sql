SELECT * FROM personagem

INSERT INTO personagem(nome_personagem, classe)
VALUES ('Aragorn', 'Guerreiro'),
('Légolas', 'Arqueiro'),
('Gimli', 'Guerreiro'),
('Gandalf', 'Mago'),
('Frodo', 'Explorador'),
('Sauron ', 'Mago Supremo'),
('Boromir', 'Guerreiro')

INSERT INTO cenario(nome_cenario)
VALUES('Floresta de Lothlórien'),
('Montanhas de Moria'),
('Campo de Batalha de Helm	'),
('As Planícies de Rohan'),
('O Condado')

INSERT INTO item(nome_item, valor)
VALUES('Espada Élfica', 700),
('Arco Longo', 600),
('Machado de Batalha', 600),
('Varinha Mágica', 500),
('Um Anel', 1000),
('Elixir de Galadriel', 500)

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

SELECT * FROM coletado
SELECT * FROM personagem
SELECT * FROM item
SELECT * FROM cenario

SELECT id_personagem, nome_personagem, fk_item, nome_item
FROM personagem, coletado, item
WHERE personagem.id_personagem = coletado.fk_personagem AND coletado.fk_item = item.id_item

SELECT id_personagem, nome_personagem, fk_item, nome_item
FROM personagem
INNER JOIN coletado
ON personagem.id_personagem = coletado.fk_personagem
INNER JOIN item
ON coletado.fk_item = item.id_item
WHERE id_personagem = 1

SELECT nome_personagem, nome_cenario
FROM personagem
INNER JOIN coletado
ON personagem.id_personagem = coletado.fk_personagem
INNER JOIN cenario
ON coletado.fk_cenario = cenario.id_cenario
WHERE id_personagem = 2

SELECT nome_personagem, nome_item, nome_cenario
FROM personagem
INNER JOIN coletado
ON personagem.id_personagem = coletado.fk_personagem
INNER JOIN item
ON coletado.fk_item = item.id_item
INNER JOIN cenario
ON coletado.fk_cenario = cenario.id_cenario
WHERE id_personagem = 3 AND nome_cenario = 'Campo de Batalha de Helm	'

SELECT soma
FROM (SELECT SUM(valor) AS soma
FROM item
INNER JOIN coletado
ON item.id_item = coletado.fk_item
INNER JOIN cenario
ON coletado.fk_cenario = cenario.id_cenario
WHERE id_cenario = 1) AS soma_em_loth
