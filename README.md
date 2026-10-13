Project Overview
The Music Streaming Database is a DBMS project developed using Oracle SQL and PL/SQL. It manages music-related information, including users, artists, albums, songs, genres, playlists, and listening history.

The project demonstrates relational database design, SQL queries, aggregate functions, joins, subqueries, views, stored procedures, functions, exception handling, transaction management, and indexing.

Objectives
Store and manage songs, artists, albums, and genres.
Search songs by title and language.
Create playlists and manage their contents.
Maintain listening history, liked songs, and followed artists.
Generate artist reports and listening statistics.
Recommend songs based on a user's listening history and preferred genres.
Demonstrate database transactions and PL/SQL programming.
Technologies Used
Oracle SQL
PL/SQL
Oracle SQL Developer / SQL*Plus-compatible environment
GitHub for source-code management
Database Tables
Table	Purpose
Music_User	Stores user details
Artist	Stores artist information
Album	Stores album details
Genre	Stores music genres
Song	Stores song information
Song_Artist	Associates songs with artists
Playlist	Stores user playlists
Playlist_Song	Associates songs with playlists
Listening_History	Records listening activity
Song_Like	Stores liked songs
Artist_Follow	Records followed artists
Project Features
Song search by title and language.
Retrieval of songs with album, genre, and artist details.
Playlist creation and playlist-content reports.
Listening statistics for songs and users.
Artist reports and song counts by language.
SQL-based song recommendations using listening history.
Views for song details and listening statistics.
PL/SQL anonymous blocks, stored procedures, and functions.
Exception handling.
Transaction control, concurrency concepts, and indexing.
Repository Structure
01_create_tables.sql — Creates the database tables and constraints.
02_insert_data.sql — Inserts sample records.
03_queries_and_reports.sql — Contains SQL queries, recommendations, views, and reports.
04_plsql_implementation.sql — Contains PL/SQL blocks, a procedure, a function, and exception handling.
05_transactions_and_indexing.sql — Demonstrates transaction control and indexing.
How to Run
Open Oracle SQL Developer or a compatible Oracle SQL environment.
Connect to your Oracle database using your schema.
Run 01_create_tables.sql to create the tables.
Run 02_insert_data.sql to insert sample data.
Run 03_queries_and_reports.sql to execute the queries and create the views.
Run 04_plsql_implementation.sql to create and test the PL/SQL objects.
Review 05_transactions_and_indexing.sql and execute its examples individually as required.
Note: Run the table-creation and data-insertion scripts only in a fresh project schema. The transaction and indexing examples should be reviewed before execution.

Expected Outcome
The project provides a relational database for organizing music data, managing playlists, recording listening activity, generating reports, and demonstrating core DBMS and PL/SQL concepts.

Conclusion
This project applies database design, SQL, and PL/SQL concepts to a music streaming scenario. It demonstrates how relational tables, queries, views, transactions, and stored program units can support music discovery and listening-statistics analysis.
