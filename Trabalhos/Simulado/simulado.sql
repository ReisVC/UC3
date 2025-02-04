CREATE DATABASE hogwarts

CREATE TABLE casa( -- check
    id_casa INT PRIMARY KEY,
    nome_casa VARCHAR(80) NOT NULL
)

CREATE TABLE personagem( -- check
    id_personagem INT PRIMARY KEY,
    nome VARHCAR(100) NOT NULL,
    fk_casa INT FOREIGN KEY REFERENCES casa(id_casa)
)

CREATE TABLE materia( -- check
    id_materia INT PRIMARY KEY,
    nome_materia VARCHAR(100) NOT NULL
)

CREATE TABLE professor( -- check
    id_professor INT PRIMARY KEY,
    fk_personagem INT FOREIGN KEY REFERENCES personagem(id_personagem),
    fk_materia INT FOREIGN KEY REFERENCES materia(id_materia),
)

CREATE TABLE feitico( -- check
    id_feitico INT PRIMARY KEY,
    nome_feitico VARCHAR(100) NOT NULL
)

CREATE TABLE feitico_personagem(
    fk_feitico INT REFERENCES feitico(id_feitico),
    fk_personagem INT REFERENCES personagem(id_personagem)
)

INSERT INTO casa(id_casa, nome_casa)
VALUES (1, 'Grifinória'),
(2, 'Sonserina'),
(3, 'Corvinal'),
(4, 'Lufa-Lufa')

INSERT INTO materia(id_materia, nome_materia)
VALUES (1, 'Transfiguração'),
(2, 'Feitiçaria'),
(3, 'Poções'),
(4, 'Defesa Contra as Artes das Trevas'),
(5, 'Astronomia'),
(6, 'Voo'),
(7, 'Herbologia')

INSERT INTO feitico(id_feitico, nome_feitico)
VALUES (1, 'Expelliarmus'),
(2, 'Lumos'),
(3, 'Nox'),
(4, 'Wingardium Leviosa'),
(5, 'Alohomora'),
(6, 'Stupefy'),
(7, 'Accio'),
(8, 'Expecto Patronum'),
(9, 'Imperio'),
(10, 'Crucio')

INSERT INTO personagem (id_personagem, nome, fk_casa)
VALUES (1, 'Harry Potter', 1),
(2, 'Hermione Granger', 1),
(3, 'Ron Weasley', 1),
(4, 'Draco Malfoy', 2),
(5, 'Luna Lovegood', 3),
(6, 'Cho Chang', 3),
(7, 'Cedric Diggory', 4),
(8, 'Pansy Parkinson', 2),
(9, 'Hannah Abbott', 4),
(10, 'Terry Boot', 3),
(11, 'Albus Dumbledore', 1),
(12, 'Severus Snape', 2),
(13, 'Filius Flitwick', 3),
(14, 'Pomona Sprout', 4),

INSERT INTO professor(id_professor, fk_personagem, fk_materia)
VALUES(1, 11, 1),
(2, 12, 4),
(3, 13, 5),
(4, 14, 7)

INSERT INTO feitico_personagem(fk_personagem, fk_feitico)
VALUES(1, 1),
(1, 8),
(2, 4),
(3, 5),
(4, 3),
(5, 8),
(6, 2),
(7, 1),
(8, 5),
(9, 1),
(10, 7),
(11, 10),
(12, 9),
(13, 5),
(14, 3),
(5, 5),
(6, 6),
(7, 10)

ALTER TABLE personagem ADD COLUMN data_nasc DATE

UPDATE
  personagem
SET
  data_nasc = '1966-05-15'
WHERE id_casa = 1


SELECT nome, nome_casa FROM personagem INNER JOIN casa ON casa.id_casa = personagem.fk_casa;

CREATE OR REPLACE VIEW views_personagens_grifinoria AS
SELECT PE.nome AS nome, PE.data_nasc AS data_nascimento,
CA.nome_casa
FROM personagem PE
INNER JOIN casa CA
ON CA.id_casa = PE.fk_casa
WHERE CA.nome_casa = 'Grifinória'

SELECT * FROM views_personagens_grifinoria

CREATE INDEX index_name ON personagem(nome)