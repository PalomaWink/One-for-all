SELECT 
	COUNT(DISTINCT song.id) AS 'cancoes',
    COUNT(DISTINCT artist.id) AS 'artistas',
    COUNT(DISTINCT album.id) AS 'albuns'
FROM 
	SpotifyClone.song
	INNER JOIN SpotifyClone.artist ON song.artist_id = artist.id
    INNER JOIN SpotifyClone.album ON song.album_id = album.id;