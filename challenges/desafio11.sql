SELECT
    album.name AS album,
    COUNT(favorite_song.id) AS favoritadas
FROM
    favorite_song
INNER JOIN
	song ON favorite_song.song_id = song.id
INNER JOIN
	album ON song.album_id = album.id
GROUP BY
	album.id
ORDER BY
	favoritadas DESC, album ASC
LIMIT 3;