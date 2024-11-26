CREATE TABLE Item (
    ID_Item INT PRIMARY KEY,
    Nome VARCHAR(80),
    Efeito VARCHAR(80),
    Raridade VARCHAR(80),
    Tipo VARCHAR(80)
);

CREATE TABLE Local (
    ID_Local INT PRIMARY KEY,
    Nome VARCHAR(80),
    Descricao TEXT,
    Tipo VARCHAR(80)
);

CREATE TABLE Personagem (
    ID_Personagem INT PRIMARY KEY,
    Nome VARCHAR(80)
);

CREATE TABLE Inventario (
    fk_Item_ID_Item INT,
    fk_Personagem_ID_Personagem INT,
    Quantidade INT
);

CREATE TABLE Goron (
    fk_Personagem_ID_Personagem INT PRIMARY KEY,
    Habilidade VARCHAR(80)
);

CREATE TABLE Hyllian (
    fk_Personagem_ID_Personagem INT PRIMARY KEY,
    Habilidade VARCHAR(80)
);

CREATE TABLE Relacao (
    fk_Personagem_ID_Personagem INT,
    fk_Personagem_ID_Personagem_ INT
);

CREATE TABLE Associado (
    fk_Local_ID_Local INT,
    fk_Personagem_ID_Personagem INT
);
 
ALTER TABLE Inventario ADD CONSTRAINT FK_Inventario_1
    FOREIGN KEY (fk_Personagem_ID_Personagem)
    REFERENCES Personagem (ID_Personagem);
 
ALTER TABLE Inventario ADD CONSTRAINT FK_Inventario_2
    FOREIGN KEY (fk_Item_ID_Item)
    REFERENCES Item (ID_Item);
 
ALTER TABLE Goron ADD CONSTRAINT FK_Goron_2
    FOREIGN KEY (fk_Personagem_ID_Personagem)
    REFERENCES Personagem (ID_Personagem)
    ON DELETE CASCADE;
 
ALTER TABLE Hyllian ADD CONSTRAINT FK_Hyllian_2
    FOREIGN KEY (fk_Personagem_ID_Personagem)
    REFERENCES Personagem (ID_Personagem)
    ON DELETE CASCADE;
 
ALTER TABLE Relacao ADD CONSTRAINT FK_Relacao_1
    FOREIGN KEY (fk_Personagem_ID_Personagem)
    REFERENCES Personagem (ID_Personagem)
    ON DELETE CASCADE;
 
ALTER TABLE Relacao ADD CONSTRAINT FK_Relacao_2
    FOREIGN KEY (fk_Personagem_ID_Personagem_)
    REFERENCES Personagem (ID_Personagem)
    ON DELETE CASCADE;
 
ALTER TABLE Associado ADD CONSTRAINT FK_Associado_1
    FOREIGN KEY (fk_Local_ID_Local)
    REFERENCES Local (ID_Local)
    ON DELETE CASCADE;
 
ALTER TABLE Associado ADD CONSTRAINT FK_Associado_2
    FOREIGN KEY (fk_Personagem_ID_Personagem)
    REFERENCES Personagem (ID_Personagem)
    ON DELETE SET NULL;