-- MUSIC STREAMING DATABASE
-- File 04: PL/SQL Implementation

SET SERVEROUTPUT ON;

-- 1. ANONYMOUS PL/SQL BLOCK
-- Display details of a particular song

DECLARE
    v_song_title Song.Song_Title%TYPE;
    v_language   Song.Language%TYPE;
    v_duration   Song.Duration%TYPE;
BEGIN
    SELECT Song_Title, Language, Duration
    INTO v_song_title, v_language, v_duration
    FROM Song
    WHERE Song_ID = 401;

    DBMS_OUTPUT.PUT_LINE('Song Title: ' || v_song_title);
    DBMS_OUTPUT.PUT_LINE('Language: ' || v_language);
    DBMS_OUTPUT.PUT_LINE('Duration: ' || v_duration || ' seconds');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Song not found.');
END;
/

-- 2. STORED PROCEDURE
-- Display song details for a given song ID

CREATE OR REPLACE PROCEDURE Display_Song_Details (
    p_song_id IN Song.Song_ID%TYPE
)
AS
    v_song_title Song.Song_Title%TYPE;
    v_language   Song.Language%TYPE;
    v_duration   Song.Duration%TYPE;
BEGIN
    SELECT Song_Title, Language, Duration
    INTO v_song_title, v_language, v_duration
    FROM Song
    WHERE Song_ID = p_song_id;

    DBMS_OUTPUT.PUT_LINE('Song Title: ' || v_song_title);
    DBMS_OUTPUT.PUT_LINE('Language: ' || v_language);
    DBMS_OUTPUT.PUT_LINE('Duration: ' || v_duration || ' seconds');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Song not found.');
END;
/

-- Execute the stored procedure
BEGIN
    Display_Song_Details(401);
END;
/

-- 3. STORED FUNCTION
-- Return the total number of listens for a song

CREATE OR REPLACE FUNCTION Get_Song_Listens (
    p_song_id IN Song.Song_ID%TYPE
)
RETURN NUMBER
AS
    v_total_listens NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_total_listens
    FROM Listening_History
    WHERE Song_ID = p_song_id;

    RETURN v_total_listens;
END;
/

-- Execute the function
SELECT Get_Song_Listens(401) AS Total_Listens
FROM DUAL;

-- 4. EXCEPTION HANDLING
-- Handle a song ID that does not exist

DECLARE
    v_song_title Song.Song_Title%TYPE;
    v_song_id NUMBER := 9999;
BEGIN
    SELECT Song_Title
    INTO v_song_title
    FROM Song
    WHERE Song_ID = v_song_id;

    DBMS_OUTPUT.PUT_LINE('Song Title: ' || v_song_title);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: No song found with ID ' || v_song_id
        );

    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: Multiple songs found for the given ID.'
        );

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END;
/
