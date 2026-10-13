-- MUSIC STREAMING DATABASE
-- File 2: Sample data insertion
-- Database: Oracle SQL

-- 1. Insert users
INSERT INTO Music_User
VALUES (1, 'Aarav', 'aarav@example.com', DATE '2026-01-10');

INSERT INTO Music_User
VALUES (2, 'Ananya', 'ananya@example.com', DATE '2026-02-15');


-- 2. Insert artists
INSERT INTO Artist
VALUES (101, 'Arijit Singh', 'India');

INSERT INTO Artist
VALUES (102, 'Anirudh Ravichander', 'India');

INSERT INTO Artist
VALUES (103, 'Sid Sriram', 'India');


-- 3. Insert genres
INSERT INTO Genre
VALUES (301, 'Romantic');

INSERT INTO Genre
VALUES (302, 'Melody');

INSERT INTO Genre
VALUES (303, 'Mass');


-- 4. Insert albums
INSERT INTO Album
VALUES (201, 'Aashiqui 2', DATE '2013-04-06', 101);

INSERT INTO Album
VALUES (202, '3', DATE '2012-02-03', 102);

INSERT INTO Album
VALUES (203, 'Devara Part 1', DATE '2024-09-27', 102);

INSERT INTO Album
VALUES (204, 'Ala Vaikunthapurramuloo',
        DATE '2020-01-12', 103);


-- 5. Insert songs
INSERT INTO Song
VALUES (401, 'Tum Hi Ho', 262, DATE '2013-04-16',
        201, 301, 'Hindi');

INSERT INTO Song
VALUES (402, 'Why This Kolaveri Di', 274,
        DATE '2011-11-16', 202, 302, 'Tamil');

INSERT INTO Song
VALUES (403, 'Idhazhin Oram', 210,
        DATE '2012-02-03', 202, 302, 'Tamil');

INSERT INTO Song
VALUES (404, 'Fear Song', 200,
        DATE '2024-09-05', 203, 303, 'Telugu');

INSERT INTO Song
VALUES (405, 'Chuttamalle', 210,
        DATE '2024-08-05', 203, 301, 'Telugu');

INSERT INTO Song
VALUES (406, 'Samajavaragamana', 220,
        DATE '2020-01-06', 204, 301, 'Telugu');

INSERT INTO Song
VALUES (407, 'Kollagottey', 190,
        DATE '2024-09-27', 203, 303, 'Telugu');


-- 6. Link songs with artists
INSERT INTO Song_Artist VALUES (401, 101);
INSERT INTO Song_Artist VALUES (402, 102);
INSERT INTO Song_Artist VALUES (403, 102);
INSERT INTO Song_Artist VALUES (404, 102);
INSERT INTO Song_Artist VALUES (405, 102);
INSERT INTO Song_Artist VALUES (406, 103);
INSERT INTO Song_Artist VALUES (407, 102);


-- 7. Insert a playlist
INSERT INTO Playlist
VALUES (501, 'Favorites', DATE '2026-03-01', 1);

INSERT INTO Playlist_Song
VALUES (501, 401, DATE '2026-03-01');


-- 8. Insert listening history
INSERT INTO Listening_History
VALUES (601, 1, 401,
        TIMESTAMP '2026-03-02 10:30:00');

INSERT INTO Listening_History
VALUES (602, 1, 403,
        TIMESTAMP '2026-03-03 11:00:00');

INSERT INTO Listening_History
VALUES (603, 1, 405,
        TIMESTAMP '2026-03-03 11:30:00');

INSERT INTO Listening_History
VALUES (604, 1, 401,
        TIMESTAMP '2026-03-03 12:00:00');


-- 9. Insert liked songs
INSERT INTO Song_Like
VALUES (1, 401, DATE '2026-03-02');

-- 10. Insert followed artists
INSERT INTO Artist_Follow
VALUES (1, 101, DATE '2026-03-02');


-- Save all inserted records
COMMIT;
