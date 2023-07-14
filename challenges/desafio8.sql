SELECT
    artist.name AS artista,
    album.name AS album
FROM
    SpotifyClone.artist
INNER JOIN
    album ON artist.id = album.artist_id
WHERE
	artist.name = 'Elis Regina';