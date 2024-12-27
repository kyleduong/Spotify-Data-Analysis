/*
 Question: Which song features (e.g., tempo, energy, acousticness, danceability) are most predictive of a song becoming a future hit?
 - Group by all of the different popularity ratings, and list the top 10 of them
 - find the averages for temp, energy, acousticness, danceability
 - Why is this important?
 - This helps in making data-driven decisions about which songs or artists to invest in. It also allows streaming 
 platforms to prioritize songs that are more likely to gain traction.
 */

SELECT
    popularity,
    COUNT(popularity) AS number_of_songs,
    ROUND( AVG(loudness)::NUMERIC,2 ) AS average_loudness,
    ROUND( AVG(tempo)::NUMERIC,2 ) AS average_tempo,
    ROUND( AVG(acousticness)::NUMERIC,2 ) AS average_acousticness,
    ROUND( AVG(speechiness)::NUMERIC,2 ) AS average_speechiness
FROM
    my_music_taste
GROUP BY
    popularity
HAVING
    COUNT(popularity) > 10
ORDER BY
    popularity DESC

-- THE TREND HERE IS THAT average_speechiness is lower, average_acousticness varies
-- tempo of songs are slower, and average_loudness of songs is around -6.4 to -6.5
-- makes songs more my type.
