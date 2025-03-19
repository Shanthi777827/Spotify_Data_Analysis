-- Removing Duplicates

 SELECT 
    track_name, COUNT(*) AS count_name
FROM
    music.high_popularity_spotify_data
GROUP BY track_name
HAVING COUNT(*) > 1
ORDER BY count_name DESC;
 
-- Basic Queries
-- Retrieve all song
SElect * from music.high_popularity_spotify_data;
Select* from music.low_popularity_spotify_data;

-- 1. Find the total number of Pop songs in the High Popularity dataset

SELECT 
    playlist_genre, COUNT(*) AS Total_popsong
FROM
    music.high_popularity_spotify_data
WHERE
    playlist_genre LIKE '%pop%'
GROUP BY playlist_genre;


-- 2. Identify the most common genre in the Low Popularity dataset
SELECT 
    playlist_genre, COUNT(*) AS Common_genre
FROM
    music.low_popularity_spotify_data
GROUP BY playlist_genre
ORDER BY Common_genre DESC
LIMIT 1;
 
 
 -- 3. Calculate the average popularity score of Rock song
 
SELECT 
    AVG(track_popularity) AS avg_score
FROM
    music.high_popularity_spotify_data
WHERE
    playlist_genre = 'Rock';
 
--  Intermediate Queries
-- 1. List artists who have produced songs in both Pop and hip-hop genres
SELECT 
    a.track_artist
FROM
    music.high_popularity_spotify_data AS a
        JOIN
    music.high_popularity_spotify_data AS b ON a.track_artist = b.track_artist
WHERE
    a.playlist_genre LIKE '%pop%'
        AND b.playlist_genre LIKE '%hip_hop%';


-- 2. Which song has the highest energy score in the High Popularity dataset?
SELECT 
    track_album_name, MAX(energy) AS Highest_energy_score
FROM
    music.high_popularity_spotify_data
GROUP BY track_album_name
ORDER BY Highest_energy_score DESC
LIMIT 1;


-- 3. identify artists who improved their average song popularity over time
SELECT 
    track_artist,
    AVG(track_popularity) AS song_popularity,
    track_album_release_date
FROM
    music.high_popularity_spotify_data
GROUP BY track_artist , track_album_release_date
ORDER BY song_popularity ASC
LIMIT 5;

-- 4.Find Artists with the Highest Average Popularity Across Both Table

SELECT 
    track_artist, AVG(track_popularity) AS Average_popularity
FROM
    (SELECT 
        track_artist, track_popularity
    FROM
        music.high_popularity_spotify_data UNION ALL SELECT 
        track_artist, track_popularity
    FROM
        music.low_popularity_spotify_data) AS Combined_data
GROUP BY track_artist
ORDER BY Average_popularity DESC
LIMIT 1; 


-- 5.Find the Overlapping Artists in Both Datasets
SELECT DISTINCT
    a.track_artist
FROM
    music.high_popularity_spotify_data AS a
        JOIN
    music.low_popularity_spotify_data AS b ON a.track_artist = b.track_artist;
    
    
    -- 6.list songs that appear in both high and low popularity datasets
SELECT DISTINCT
    c.track_name
FROM
    music.high_popularity_spotify_data AS c
        JOIN
    music.low_popularity_spotify_data AS d ON c.track_name = d.track_name;
    
   -- 7.Find the most common key used in songs by artists who appear in both datasets. 
SELECT 
    c.track_artist, c.key, COUNT(c.key) AS Common_key
FROM
    music.high_popularity_spotify_data AS c
        JOIN
    music.low_popularity_spotify_data AS d ON c.track_artist = d.track_artist
GROUP BY c.track_artist , c.key
ORDER BY common_key DESC
LIMIT 1; 

 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 





-- 

 

