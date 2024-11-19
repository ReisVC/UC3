/* Spotify_Lógico: */

CREATE TABLE User (
    ID_User INT PRIMARY KEY,
    FK_Subscription INT,
    Name VARCHAR,
    Gender CHAR,
    Contact CHAR
);

CREATE TABLE Content (
    ID_Content INT PRIMARY KEY,
    Played INT,
    TItle_Content VARCHAR
);

CREATE TABLE Artist (
    ID_Artist INT PRIMARY KEY,
    Artist_Name VARCHAR,
    Artist_Type VARCHAR
);

CREATE TABLE Music (
    FK_Content_ID_Content INT PRIMARY KEY,
    Duration_Music TIME,
    Music_Genre VARCHAR,
    Melody VARCHAR,
    Lyric VARCHAR
);

CREATE TABLE Podcast (
    FK_Content_ID_Content INT PRIMARY KEY,
    FK_Episode INT,
    Category_Podcast VARCHAR
);

CREATE TABLE Playlist_Listen (
    ID_Playlist INT PRIMARY KEY,
    FK_User_ID_User INT,
    FK_Content_ID_Content INT,
    Name_Playlist VARCHAR
);

CREATE TABLE Subscription_Plan (
    ID_Subscription INT PRIMARY KEY,
    Register_Date DATE
);

CREATE TABLE Basic (
    FK_Subscription INT,
    Limited_Skips BOOLEAN,
    Advertisement BOOLEAN
);

CREATE TABLE Premium (
    FK_Subscription INT,
    No_Ads BOOLEAN,
    Unlimited_Skips BOOLEAN
);

CREATE TABLE Release_Created (
    FK_Content_ID_Content INT,
    FK_Artist_ID_Artist INT,
    Date_Release DATE
);

CREATE TABLE Episode (
    ID_Episode INT PRIMARY KEY,
    Title_Episode VARCHAR,
    Duration_Episode TIME
);
 
ALTER TABLE User ADD CONSTRAINT FK_User_2
    FOREIGN KEY (FK_Subscription)
    REFERENCES Subscription_Plan (ID_Subscription);
 
ALTER TABLE Music ADD CONSTRAINT FK_Music_2
    FOREIGN KEY (FK_Content_ID_Content)
    REFERENCES Content (ID_Content)
    ON DELETE CASCADE;
 
ALTER TABLE Podcast ADD CONSTRAINT FK_Podcast_2
    FOREIGN KEY (FK_Content_ID_Content)
    REFERENCES Content (ID_Content)
    ON DELETE CASCADE;
 
ALTER TABLE Podcast ADD CONSTRAINT FK_Podcast_3
    FOREIGN KEY (FK_Episode)
    REFERENCES Episode (ID_Episode);
 
ALTER TABLE Playlist_Listen ADD CONSTRAINT FK_Playlist_Listen_2
    FOREIGN KEY (FK_User_ID_User)
    REFERENCES User (ID_User);
 
ALTER TABLE Playlist_Listen ADD CONSTRAINT FK_Playlist_Listen_3
    FOREIGN KEY (FK_Content_ID_Content)
    REFERENCES Content (ID_Content);
 
ALTER TABLE Basic ADD CONSTRAINT FK_Basic_1
    FOREIGN KEY (FK_Subscription)
    REFERENCES Subscription_Plan (ID_Subscription);
 
ALTER TABLE Premium ADD CONSTRAINT FK_Premium_1
    FOREIGN KEY (FK_Subscription)
    REFERENCES Subscription_Plan (ID_Subscription);
 
ALTER TABLE Release_Created ADD CONSTRAINT FK_Release_Created_1
    FOREIGN KEY (FK_Content_ID_Content)
    REFERENCES Content (ID_Content);
 
ALTER TABLE Release_Created ADD CONSTRAINT FK_Release_Created_2
    FOREIGN KEY (FK_Artist_ID_Artist)
    REFERENCES Artist (ID_Artist);
 
ALTER TABLE Episode ADD CONSTRAINT FK_Episode_2
    FOREIGN KEY (fk_Podcast_fk_Content_ID_Content)
    REFERENCES Podcast (FK_Content_ID_Content)
    ON DELETE RESTRICT;