-- MUSIC STREAMING DATABASE
-- File 03: SQL Queries and Reports

-- 1. DISPLAY ALL SONGS
SELECT * FROM Song;

-- 2. SEARCH SONGS BY TITLE
SELECT Song_ID, Song_Title, Language
FROM Song
WHERE LOWER(Song_Title) LIKE LOWER('%Tum Hi Ho%');

-- 3. SEARCH SONGS BY LANGUAGE
SELECT Song_Title, Language
FROM Song
WHERE Language = 'Telugu';

-- 4. DISPLAY SONG DETAILS WITH ALBUM AND GENRE
SELECT S.Song_ID, S.Song_Title, A.Album_Title,
       G.Genre_Name, S.Language, S.Duration
FROM Song S
JOIN Album A ON S.Album_ID = A.Album_ID
JOIN Genre G ON S.Genre_ID = G.Genre_ID;

-- 5. DISPLAY SONGS WITH THEIR ARTISTS
SELECT S.Song_Title, A.Artist_Name
FROM Song S
JOIN Song_Artist SA ON S.Song_ID = SA.Song_ID
JOIN Artist A ON SA.Artist_ID = A.Artist_ID
ORDER BY S.Song_Title;

-- 6. DISPLAY PLAYLISTS AND THEIR OWNERS
SELECT P.Playlist_ID, P.Playlist_Name, U.User_Name
FROM Playlist P
JOIN Music_User U ON P.User_ID = U.User_ID;

-- 7. TOTAL NUMBER OF SONGS
SELECT COUNT(*) AS Total_Songs
FROM Song;

-- 8. AVERAGE SONG DURATION
SELECT ROUND(AVG(Duration), 2) AS Average_Duration_Seconds
FROM Song;

-- 9. LISTENING COUNT FOR EACH SONG
SELECT S.Song_ID, S.Song_Title,
       COUNT(LH.History_ID) AS Total_Listens
FROM Song S
LEFT JOIN Listening_History LH ON S.Song_ID = LH.Song_ID
GROUP BY S.Song_ID, S.Song_Title
ORDER BY Total_Listens DESC;

-- 10. SONGS LISTENED TO MORE THAN ONCE
SELECT S.Song_Title, COUNT(LH.History_ID) AS Total_Listens
FROM Song S
JOIN Listening_History LH ON S.Song_ID = LH.Song_ID
GROUP BY S.Song_ID, S.Song_Title
HAVING COUNT(LH.History_ID) > 1;

-- 11. SONG COUNT BY LANGUAGE
SELECT Language, COUNT(*) AS Total_Songs,
       ROUND(AVG(Duration), 2) AS Average_Duration
FROM Song
GROUP BY Language
ORDER BY Total_Songs DESC;

-- 12. SONGS LONGER THAN THE AVERAGE DURATION
SELECT Song_ID, Song_Title, Duration
FROM Song
WHERE Duration > (SELECT AVG(Duration) FROM Song);

-- 13. PERSONALIZED SONG RECOMMENDATIONS
-- Suggest songs from genres the user has listened to,
-- excluding songs already present in their listening history.
SELECT S.Song_ID, S.Song_Title, G.Genre_Name, S.Language
FROM Song S
JOIN Genre G ON S.Genre_ID = G.Genre_ID
WHERE S.Genre_ID IN (
    SELECT DISTINCT S2.Genre_ID
    FROM Listening_History LH
    JOIN Song S2 ON LH.Song_ID = S2.Song_ID
    WHERE LH.User_ID = 1
)
AND NOT EXISTS (
    SELECT 1
    FROM Listening_History LH2
    WHERE LH2.User_ID = 1
      AND LH2.Song_ID = S.Song_ID
);

-- 14. ARTIST REPORT
SELECT A.Artist_ID, A.Artist_Name, A.Country,
       COUNT(DISTINCT SA.Song_ID) AS Total_Songs
FROM Artist A
LEFT JOIN Song_Artist SA ON A.Artist_ID = SA.Artist_ID
GROUP BY A.Artist_ID, A.Artist_Name, A.Country
ORDER BY Total_Songs DESC, A.Artist_Name;

-- 15. PLAYLIST CONTENTS
SELECT P.Playlist_Name, U.User_Name,
       S.Song_Title, PS.Added_Date
FROM Playlist P
JOIN Music_User U ON P.User_ID = U.User_ID
LEFT JOIN Playlist_Song PS ON P.Playlist_ID = PS.Playlist_ID
LEFT JOIN Song S ON PS.Song_ID = S.Song_ID
ORDER BY P.Playlist_ID, S.Song_Title;

-- 16. NUMBER OF SONGS IN EACH PLAYLIST
SELECT P.Playlist_ID, P.Playlist_Name,
       COUNT(PS.Song_ID) AS Total_Songs
FROM Playlist P
LEFT JOIN Playlist_Song PS ON P.Playlist_ID = PS.Playlist_ID
GROUP BY P.Playlist_ID, P.Playlist_Name
ORDER BY Total_Songs DESC;

-- 17. LISTENING ACTIVITY BY USER
SELECT U.User_ID, U.User_Name,
       COUNT(LH.History_ID) AS Total_Listens
FROM Music_User U
LEFT JOIN Listening_History LH ON U.User_ID = LH.User_ID
GROUP BY U.User_ID, U.User_Name
ORDER BY Total_Listens DESC;

-- 18. LISTENING ACTIVITY BY DATE
SELECT TRUNC(CAST(LH.Listen_Time AS DATE)) AS Listen_Date,
       COUNT(*) AS Total_Listens
FROM Listening_History LH
GROUP BY TRUNC(CAST(LH.Listen_Time AS DATE))
ORDER BY Listen_Date;

-- 19. ARTISTS FOLLOWED BY USERS
SELECT A.Artist_Name, AF.User_ID, AF.Follow_Date
FROM Artist_Follow AF
JOIN Artist A ON AF.Artist_ID = A.Artist_ID
ORDER BY A.Artist_Name;

-- 20. SONGS LIKED BY USERS
SELECT U.User_Name, S.Song_Title, SL.Like_Date
FROM Song_Like SL
JOIN Music_User U ON SL.User_ID = U.User_ID
JOIN Song S ON SL.Song_ID = S.Song_ID
ORDER BY U.User_Name, S.Song_Title;

-- 21. CREATE A VIEW FOR SONG DETAILS
CREATE OR REPLACE VIEW Song_Details AS
SELECT S.Song_ID, S.Song_Title, A.Album_Title,
       G.Genre_Name, S.Language, S.Duration
FROM Song S
LEFT JOIN Album A ON S.Album_ID = A.Album_ID
LEFT JOIN Genre G ON S.Genre_ID = G.Genre_ID;

-- 22. CREATE A VIEW FOR LISTENING STATISTICS
CREATE OR REPLACE VIEW Listening_Statistics AS
SELECT S.Song_ID, S.Song_Title,
       COUNT(LH.History_ID) AS Total_Listens
FROM Song S
LEFT JOIN Listening_History LH ON S.Song_ID = LH.Song_ID
GROUP BY S.Song_ID, S.Song_Title;

-- 23. DISPLAY SONG DETAILS USING THE VIEW
SELECT * FROM Song_Details;

-- 24. DISPLAY LISTENING STATISTICS USING THE VIEW
SELECT * FROM Listening_Statistics
ORDER BY Total_Listens DESC;
