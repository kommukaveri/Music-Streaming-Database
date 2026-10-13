-- MUSIC STREAMING DATABASE
-- File 1: Table creation and constraints
-- Database: Oracle SQL

CREATE TABLE Music_User (
    User_ID NUMBER PRIMARY KEY,
    User_Name VARCHAR2(100),
    Email VARCHAR2(100) UNIQUE NOT NULL,
    Join_Date DATE
);

CREATE TABLE Artist (
    Artist_ID NUMBER PRIMARY KEY,
    Artist_Name VARCHAR2(100),
    Country VARCHAR2(50)
);

CREATE TABLE Album (
    Album_ID NUMBER PRIMARY KEY,
    Album_Title VARCHAR2(150),
    Release_Date DATE,
    Artist_ID NUMBER,
    CONSTRAINT fk_album_artist
        FOREIGN KEY (Artist_ID)
        REFERENCES Artist(Artist_ID)
);

CREATE TABLE Genre (
    Genre_ID NUMBER PRIMARY KEY,
    Genre_Name VARCHAR2(50) UNIQUE NOT NULL
);

CREATE TABLE Song (
    Song_ID NUMBER PRIMARY KEY,
    Song_Title VARCHAR2(150),
    Duration NUMBER,
    Release_Date DATE,
    Album_ID NUMBER,
    Genre_ID NUMBER,
    Language VARCHAR2(20),
    CONSTRAINT fk_song_album
        FOREIGN KEY (Album_ID)
        REFERENCES Album(Album_ID),
    CONSTRAINT fk_song_genre
        FOREIGN KEY (Genre_ID)
        REFERENCES Genre(Genre_ID)
);

CREATE TABLE Song_Artist (
    Song_ID NUMBER,
    Artist_ID NUMBER,
    CONSTRAINT pk_song_artist
        PRIMARY KEY (Song_ID, Artist_ID),
    CONSTRAINT fk_sa_song
        FOREIGN KEY (Song_ID)
        REFERENCES Song(Song_ID),
    CONSTRAINT fk_sa_artist
        FOREIGN KEY (Artist_ID)
        REFERENCES Artist(Artist_ID)
);

CREATE TABLE Playlist (
    Playlist_ID NUMBER PRIMARY KEY,
    Playlist_Name VARCHAR2(100),
    Created_Date DATE,
    User_ID NUMBER,
    CONSTRAINT fk_playlist_user
        FOREIGN KEY (User_ID)
        REFERENCES Music_User(User_ID)
);

CREATE TABLE Playlist_Song (
    Playlist_ID NUMBER,
    Song_ID NUMBER,
    Added_Date DATE,
    CONSTRAINT pk_playlist_song
        PRIMARY KEY (Playlist_ID, Song_ID),
    CONSTRAINT fk_ps_playlist
        FOREIGN KEY (Playlist_ID)
        REFERENCES Playlist(Playlist_ID),
    CONSTRAINT fk_ps_song
        FOREIGN KEY (Song_ID)
        REFERENCES Song(Song_ID)
);

CREATE TABLE Listening_History (
    History_ID NUMBER PRIMARY KEY,
    User_ID NUMBER,
    Song_ID NUMBER,
    Listen_Time TIMESTAMP,
    CONSTRAINT fk_history_user
        FOREIGN KEY (User_ID)
        REFERENCES Music_User(User_ID),
    CONSTRAINT fk_history_song
        FOREIGN KEY (Song_ID)
        REFERENCES Song(Song_ID)
);

CREATE TABLE Song_Like (
    User_ID NUMBER,
    Song_ID NUMBER,
    Like_Date DATE,
    CONSTRAINT pk_song_like
        PRIMARY KEY (User_ID, Song_ID),
    CONSTRAINT fk_like_user
        FOREIGN KEY (User_ID)
        REFERENCES Music_User(User_ID),
    CONSTRAINT fk_like_song
        FOREIGN KEY (Song_ID)
        REFERENCES Song(Song_ID)
);

CREATE TABLE Artist_Follow (
    User_ID NUMBER,
    Artist_ID NUMBER,
    Follow_Date DATE,
    CONSTRAINT pk_artist_follow
        PRIMARY KEY (User_ID, Artist_ID),
    CONSTRAINT fk_follow_user
        FOREIGN KEY (User_ID)
        REFERENCES Music_User(User_ID),
    CONSTRAINT fk_follow_artist
        FOREIGN KEY (Artist_ID)
        REFERENCES Artist(Artist_ID)
);

-- End of table creation script
