WITH ranking_output_cte AS (SELECT a.artist_name,
--,a.artist_name,a.label_owner,s.song_id,s.name,
DENSE_RANK() OVER(
ORDER BY count(g.day) DESC
) AS artist_rank
--,g.rank
FROM artists as a
JOIN
songs as s
ON a.artist_id = s.artist_id
JOIN
global_song_rank as g
ON s.song_id = g.song_id AND rank <= 10
group by artist_name)

SELECT * FROM ranking_output_cte WHERE artist_rank<=5;