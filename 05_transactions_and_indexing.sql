-- MUSIC STREAMING DATABASE
-- File 05: Transactions, Concurrency and Indexing

-- 1. TRANSACTION CONTROL: COMMIT
-- Save a change permanently.
-- This example uses a temporary description change.
-- Run only if you intend to update the existing record.

UPDATE Song
SET Song_Title = 'Tum Hi Ho - Test'
WHERE Song_ID = 401;

COMMIT;

-- Restore the original song title
UPDATE Song
SET Song_Title = 'Tum Hi Ho'
WHERE Song_ID = 401;

COMMIT;


-- 2. TRANSACTION CONTROL: ROLLBACK
-- Demonstrate how an uncommitted change can be undone.
-- Check the title before and after the rollback.

UPDATE Song
SET Song_Title = 'Temporary Song Title'
WHERE Song_ID = 401;

ROLLBACK;

SELECT Song_ID, Song_Title
FROM Song
WHERE Song_ID = 401;


-- 3. SAVEPOINT
-- Undo only changes made after a savepoint.

SAVEPOINT Before_Song_Update;

UPDATE Song
SET Song_Title = 'Temporary Update'
WHERE Song_ID = 401;

ROLLBACK TO Before_Song_Update;

COMMIT;

SELECT Song_ID, Song_Title
FROM Song
WHERE Song_ID = 401;


-- 4. CREATE AN INDEX FOR SONG TITLE SEARCH
-- An index can improve searches on Song_Title.

CREATE INDEX IDX_SONG_TITLE
ON Song(Song_Title);


-- 5. VIEW THE EXECUTION PLAN
-- Examine the optimizer's plan for a song-title search.

EXPLAIN PLAN FOR
SELECT Song_ID, Song_Title
FROM Song
WHERE Song_Title = 'Tum Hi Ho';

SELECT PLAN_TABLE_OUTPUT
FROM TABLE(DBMS_XPLAN.DISPLAY);


-- 6. VERIFY THE INDEX
SELECT INDEX_NAME, TABLE_NAME, UNIQUENESS
FROM USER_INDEXES
WHERE INDEX_NAME = 'IDX_SONG_TITLE';


-- 7. CHECK THE SONG RECORD AFTER THE OPERATIONS
SELECT Song_ID, Song_Title, Language
FROM Song
ORDER BY Song_ID;
