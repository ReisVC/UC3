/* ModeloLogico: */

CREATE TABLE Player (
    ID_Player INT PRIMARY KEY,
    Level INT,
    Score FLOAT,
    Region VARCHAR,
    User_Name VARCHAR,
    fk_Team_ID_Team INT
);

CREATE TABLE Team (
    ID_Team INT PRIMARY KEY,
    Name_Team VARCHAR,
    fk_Match_ID_Match INT
);

CREATE TABLE Match (
    ID_Match INT PRIMARY KEY,
    Results VARCHAR,
    Duration TIME,
    Date_Time TIME,
    fk_Champion_ID_Champion INT
);

CREATE TABLE Item (
    ID_Item INT PRIMARY KEY,
    Cost INT,
    Description VARCHAR,
    Effect VARCHAR,
    Name_Item VARCHAR,
    fk_Match_ID_Match INT
);

CREATE TABLE Champion (
    ID_Champion INT PRIMARY KEY,
    Name_Champion VARCHAR,
    Ability VARCHAR,
    Damage_Type VARCHAR,
    Function VARCHAR,
    fk_Player_ID_Player INT
);

CREATE TABLE Player_Match_Game (
    Player_Points INT,
    Team_Points INT,
    fk_Player_ID_Player INT,
    fk_Match_ID_Match INT
);

CREATE TABLE Offensive_Item (
    Physic_Damage INT,
    Magic_Damage INT,
    fk_Item_ID_Item INT PRIMARY KEY
);

CREATE TABLE Consumable (
    HP INT,
    Damage INT,
    fk_Item_ID_Item INT PRIMARY KEY
);

CREATE TABLE Defensive_Item (
    Armor INT,
    Res_Magic INT,
    fk_Item_ID_Item INT PRIMARY KEY
);
 
ALTER TABLE Player ADD CONSTRAINT FK_Player_2
    FOREIGN KEY (fk_Team_ID_Team)
    REFERENCES Team (ID_Team)
    ON DELETE RESTRICT;
 
ALTER TABLE Team ADD CONSTRAINT FK_Team_2
    FOREIGN KEY (fk_Match_ID_Match)
    REFERENCES Match (ID_Match)
    ON DELETE RESTRICT;
 
ALTER TABLE Match ADD CONSTRAINT FK_Match_2
    FOREIGN KEY (fk_Champion_ID_Champion)
    REFERENCES Champion (ID_Champion)
    ON DELETE RESTRICT;
 
ALTER TABLE Item ADD CONSTRAINT FK_Item_2
    FOREIGN KEY (fk_Match_ID_Match)
    REFERENCES Match (ID_Match)
    ON DELETE RESTRICT;
 
ALTER TABLE Champion ADD CONSTRAINT FK_Champion_2
    FOREIGN KEY (fk_Player_ID_Player)
    REFERENCES Player (ID_Player)
    ON DELETE RESTRICT;
 
ALTER TABLE Player_Match_Game ADD CONSTRAINT FK_Player_Match_Game_1
    FOREIGN KEY (fk_Player_ID_Player)
    REFERENCES Player (ID_Player);
 
ALTER TABLE Player_Match_Game ADD CONSTRAINT FK_Player_Match_Game_2
    FOREIGN KEY (fk_Match_ID_Match)
    REFERENCES Match (ID_Match);
 
ALTER TABLE Offensive_Item ADD CONSTRAINT FK_Offensive_Item_2
    FOREIGN KEY (fk_Item_ID_Item)
    REFERENCES Item (ID_Item)
    ON DELETE CASCADE;
 
ALTER TABLE Consumable ADD CONSTRAINT FK_Consumable_2
    FOREIGN KEY (fk_Item_ID_Item)
    REFERENCES Item (ID_Item)
    ON DELETE CASCADE;
 
ALTER TABLE Defensive_Item ADD CONSTRAINT FK_Defensive_Item_2
    FOREIGN KEY (fk_Item_ID_Item)
    REFERENCES Item (ID_Item)
    ON DELETE CASCADE;