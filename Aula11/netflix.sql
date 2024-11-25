/* Streaming_Simulado_Logico: */

CREATE TABLE Client (
    ID_User INT PRIMARY KEY,
    Username VARCHAR,
    Adress VARCHAR
);

CREATE TABLE Movie (
    Duration_Movie TIME,
    fk_Content_ID_Content INT,
    Cast_Movie VARCHAR,
    Script_Movie VARCHAR
);

CREATE TABLE Episode (
    Cast_Episode INT,
    Duration_Episode TIME,
    Title_Episode VARCHAR,
    Script_Episode VARCHAR,
    ID_Episode INT PRIMARY KEY,
    fk_Season_ID_Season INT
);

CREATE TABLE Season (
    ID_Season INT PRIMARY KEY,
    Number_Season INT
);

CREATE TABLE Serie (
    fk_Content_ID_Content INT
);

CREATE TABLE Content (
    ID_Content INT PRIMARY KEY,
    Title VARCHAR,
    Studio VARCHAR
);

CREATE TABLE Playlist_Watch (
    ID_Rating INT PRIMARY KEY,
    fk_Content_ID_Content INT,
    fk_User_ID_User INT,
    Category_Playlist VARCHAR
);

CREATE TABLE Gender (
    ID_Gender INT PRIMARY KEY,
    Name_Gender VARCHAR,
    Age_Rating INT,
    fk_Content_ID_Content INT
);

CREATE TABLE Wishlist_Has (
    ID_Wishlist INT PRIMARY KEY,
    fk_Content_ID_Content INT,
    fk_User_ID_User INT,
    Name_Wishlist VARCHAR,
    Category_Wishlist VARCHAR
);

CREATE TABLE Rating_Has (
    Script_Content FLOAT,
    Direction FLOAT,
    Acting FLOAT,
    ID_Rating INT PRIMARY KEY,
    fk_Content_ID_Content INT,
    fk_User_ID_User INT
);
 
ALTER TABLE Movie ADD CONSTRAINT FK_Movie_1
    FOREIGN KEY (fk_Content_ID_Content)
    REFERENCES Content (ID_Content)
    ON DELETE NO ACTION;
 
ALTER TABLE Episode ADD CONSTRAINT FK_Episode_2
    FOREIGN KEY (fk_Season_ID_Season)
    REFERENCES Season (ID_Season)
    ON DELETE RESTRICT;
 
ALTER TABLE Serie ADD CONSTRAINT FK_Serie_1
    FOREIGN KEY (fk_Content_ID_Content)
    REFERENCES Content (ID_Content)
    ON DELETE NO ACTION;
 
ALTER TABLE Playlist_Watch ADD CONSTRAINT FK_Playlist_Watch_2
    FOREIGN KEY (fk_Content_ID_Content)
    REFERENCES Content (ID_Content);
 
ALTER TABLE Playlist_Watch ADD CONSTRAINT FK_Playlist_Watch_3
    FOREIGN KEY (fk_User_ID_User)
    REFERENCES Client (ID_User);
 
ALTER TABLE Gender ADD CONSTRAINT FK_Gender_2
    FOREIGN KEY (fk_Content_ID_Content)
    REFERENCES Content (ID_Content)
    ON DELETE RESTRICT;
 
ALTER TABLE Wishlist_Has ADD CONSTRAINT FK_Wishlist_Has_2
    FOREIGN KEY (fk_Content_ID_Content)
    REFERENCES Content (ID_Content);
 
ALTER TABLE Wishlist_Has ADD CONSTRAINT FK_Wishlist_Has_3
    FOREIGN KEY (fk_User_ID_User)
    REFERENCES CLient (ID_User);
 
ALTER TABLE Rating_Has ADD CONSTRAINT FK_Rating_Has_2
    FOREIGN KEY (fk_Content_ID_Content)
    REFERENCES Content (ID_Content);
 
ALTER TABLE Rating_Has ADD CONSTRAINT FK_Rating_Has_3
    FOREIGN KEY (fk_User_ID_User)
    REFERENCES Client (ID_User);


SELECT * FROM client;
SELECT * FROM content;
SELECT * FROM episode;
SELECT * FROM gender;
SELECT * FROM movie;
SELECT * FROM playlist_watch;
SELECT * FROM rating_has;
SELECT * FROM wishlist_has;
SELECT * FROM serie;
SELECT * FROM season;