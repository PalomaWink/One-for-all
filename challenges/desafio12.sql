SELECT 
	artist.name AS artista,
    CASE
		WHEN COUNT(favorite_song.id) >= 5 THEN 'A'
        WHEN COUNT(favorite_song.id) BETWEEN 3 AND 4 THEN 'B'
        WHEN COUNT(favorite_song.id) BETWEEN 1 AND 2 THEN 'C'
        ELSE '-'
	END AS ranking
FROM
	artist
LEFT JOIN
	song ON song.artist_id = artist.id
LEFT JOIN
	favorite_song ON favorite_song.song_id = song.id
GROUP BY
	artist.id
ORDER BY
	COUNT(favorite_song.id) DESC, artista ASC;