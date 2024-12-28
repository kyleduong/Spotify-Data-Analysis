/*
 ALL QUESTIONS TO ANSWER:
 - What are the standout characteristics of the music I add? (Any outliers?)
 - ^ too vague maybe
 - How has my music taste evolved over time?
 - Which genres do I listen to most often?
 ^ DONE
 - What aspects of music do my friend and I have in common?
 ^ IN PROGRESS
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

-- 