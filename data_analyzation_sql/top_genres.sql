/*
Question: Which genres do I listen to most often?
 - Indentify all the genres I listen to, and then limit to the top 5
 - Focus on all types of types of music from any time
 - Why is this important?
    - It can enhance the music discovery profess, help create genre-based playlists
    - and lead to more personalized music reccomendations
*/

-- This is to read the whole table
SELECT
    *
FROM
    my_music_taste;

-- A song could have multiple genres, so this will separate each of them by commas and
-- count the frequency of any individual genre.
SELECT genre, COUNT(*) AS genre_count
FROM (
    SELECT unnest(string_to_array(genres, ',')) AS genre
    FROM my_music_taste
) AS genre_list
GROUP BY genre
ORDER BY genre_count DESC;

-- find the number of different genres I listen to in my liked songs
SELECT COUNT(DISTINCT genre) AS distinct_genres_count
FROM (
    SELECT unnest(string_to_array(genres, ', ')) AS genre
    FROM my_music_taste
) AS genre_list;

-- At this point, figured out that different kinds of RAP are my #1 listened to music, 
-- followed by pop music
SELECT genre, COUNT(*) AS genre_count
FROM (
    SELECT unnest(string_to_array(genres, ',')) AS genre
    FROM my_music_taste
) AS genre_list
WHERE
    genre LIKE '%rap%'
GROUP BY genre
ORDER BY genre_count DESC;
-- Comment for readme, "Funnily enough, my most listened to types of rap ends up being pop and melodic rap"



