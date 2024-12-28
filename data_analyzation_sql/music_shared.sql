/*
 ALL QUESTIONS TO ANSWER:
 - What are the standout characteristics of the music I add? (Any outliers?)
 - ^ too vague maybe
 - How has my music taste evolved over time?
 - Which genres do I listen to most often?
 ^ DONE
 - What aspects of music do my friend and I have in common?
 ^ DONE
 - Which song features (e.g., tempo, energy, acousticness, danceability) are most predictive of a song becoming a future hit?
 ^ DONE
 - How does the timing of a song release (e.g., holiday season, summer, etc.) impact its popularity and chart performance?
 ^ DONE
 */

/*
Question: What aspects of music do my friend and I have in common?
 - Indentify all the genres I listen to, and then limit to the top 5
 - Focus on all types of types of music from any time
 - Why is this important?
    - It can enhance the music discovery profess, help create genre-based playlists
    - and lead to more personalized music reccomendations
*/

SELECT *
FROM global_music_taste;

-- This calculates the averge popularity ratings for me, my friends, and the top 50 global songs.
SELECT
AVG(friend.popularity) AS friend_avg_popularity,
AVG(me.popularity) AS me_avg_popularity,
AVG(globally.popularity) AS global_avg_popularity
FROM friend_music_taste AS friend,
my_music_taste AS me,
global_music_taste AS globally;


-- Number of songs my friend and I have in common
SELECT
    COUNT(*) AS number_of_similar_songs
FROM
    my_music_taste
INNER JOIN friend_music_taste AS friend ON friend.track_id = my_music_taste.track_id

-- Comparing the characteristics of all 3's music types.

SELECT
    me.popularity,
    COUNT(me.popularity) AS number_of_songs,
    
    -- Calculate the average of the 'loudness' for each table
    ROUND(AVG(me.loudness)::NUMERIC, 2) AS me_average_loudness,
    ROUND(AVG(friend.loudness)::NUMERIC, 2) AS friend_average_loudness,
    ROUND(AVG(globally.loudness)::NUMERIC, 2) AS globally_average_loudness,
    
    -- Calculate the average of the 'tempo' for each table
    ROUND(AVG(me.tempo)::NUMERIC, 2) AS me_average_tempo,
    ROUND(AVG(friend.tempo)::NUMERIC, 2) AS friend_average_tempo,
    ROUND(AVG(globally.tempo)::NUMERIC, 2) AS globally_average_tempo,

    -- Calculate the average of the 'acousticness' for each table
    ROUND(AVG(me.acousticness)::NUMERIC, 2) AS me_average_acousticness,
    ROUND(AVG(friend.acousticness)::NUMERIC, 2) AS friend_average_acousticness,
    ROUND(AVG(globally.acousticness)::NUMERIC, 2) AS globally_average_acousticness,

    -- Calculate the average of the 'speechiness' for each table
    ROUND(AVG(me.speechiness)::NUMERIC, 2) AS me_average_speechiness,
    ROUND(AVG(friend.speechiness)::NUMERIC, 2) AS friend_average_speechiness,
    ROUND(AVG(globally.speechiness)::NUMERIC, 2) AS globally_average_speechiness

FROM
    my_music_taste AS me
LEFT JOIN
    friend_music_taste AS friend ON me.popularity = friend.popularity  -- Assuming the join condition
LEFT JOIN
    global_music_taste AS globally ON me.popularity = globally.popularity  -- Assuming the join condition

GROUP BY
    me.popularity

HAVING
    COUNT(me.popularity) > 10

ORDER BY
    me.popularity DESC;
/*
Here, we can see the correlation between popularity and certain traits in music.
I liked more songs that were less popular, and it showed strong correlation between the globally
popular songs. The traits in music that I liked deviated far from the traits in music for the
globally popular ones.
*/