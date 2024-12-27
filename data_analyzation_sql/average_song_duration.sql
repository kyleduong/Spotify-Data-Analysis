
/*
Question: How does the timing of a song release (e.g., holiday season, summer, etc.) impact its popularity and chart performance?
 - Split and Group all of the songs by their release date months.
 - Find the average popularity rating of those songs.
 - Why is this important?
    - Certain times of the year (e.g., summer for upbeat tracks, Christmas for holiday music) are better for releasing 
    specific types of songs. Analyzing the timing of successful songs' releases can help artists and labels strategically
    plan their releases.
 - Impact: This can optimize release strategies, ensuring that songs are launched at the best possible time to maximize visibility and streams.
*/

SELECT
    *
FROM
    my_music_taste;

-- Groups the songs by their release_month, and find the average_popularity for those songs.
-- Also included the total number of songs to see if there is a lack of data for a particular month

SELECT
    SUBSTRING(release_date FROM 6 FOR 2) AS release_month,  -- Extracts year and month (e.g., '2024-12')
    AVG(popularity) AS average_popularity,                -- Example: calculating the average popularity
    COUNT(*) AS total_songs                              -- Example: counting the number of songs
FROM my_music_taste
WHERE release_date <> '' AND release_date ~ '^\d{4}-\d{2}-\d{2}$'  -- Ensures the date follows the 'YYYY-MM-DD' format
GROUP BY release_month
ORDER BY average_popularity DESC;

-- Did some data cleaning to filter out those with incorrect release_date formattings