CREATE DATABASE friend_music_taste;

CREATE TABLE global_music_taste (
    Track_ID TEXT,
    Track_Name VARCHAR(255),
    Album_Name VARCHAR(255),
    Artist_Name VARCHAR(255),
    Release_Date TEXT,
    Duration_ms INT,
    Popularity INT,
    Added_By VARCHAR(255),
    Added_At TEXT,
    Genres VARCHAR(255),
    Record_Label VARCHAR(255),
    Danceability FLOAT,
    Energy FLOAT,
    Key INT,
    Loudness FLOAT,
    Mode VARCHAR(50),
    Speechiness FLOAT,
    Acousticness FLOAT,
    Instrumentalness FLOAT,
    Liveness FLOAT,
    Valence FLOAT,
    Tempo FLOAT,
    Time_Signature INT
);

COPY my_music_taste (Track_ID, Track_Name, Album_Name, Artist_Name, Release_Date, Duration_ms, Popularity, Added_By, Added_At, Genres, Record_Label, Danceability, Energy, Key, Loudness, Mode, Speechiness, Acousticness, Instrumentalness, Liveness, Valence, Tempo, Time_Signature)
FROM 'C:\Users\kyled\Documents\ALL DATA ANALYST PROJECTS\Spotify Data Analysis\csv_files\boom.csv'
DELIMITER ',' 
CSV HEADER;

ALTER TABLE friends_music_taste
  ALTER COLUMN track_id TYPE TEXT;

ALTER TABLE friends_music_taste
  ALTER COLUMN release_date TYPE DATE;

/*
IF PERSMISSION DENIED: 
\copy friend_music_taste FROM 'C:\Users\kyled\Documents\ALL DATA ANALYST PROJECTS\Spotify Data Analysis\csv_files\top_tracks_of_2024_global.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8')
*/