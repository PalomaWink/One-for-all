SELECT
    artist.name AS artista,
    album.name AS album,
    COUNT(artist_follow.user_id) AS pessoas_seguidoras
FROM
    SpotifyClone.artist
INNER JOIN
    album ON artist.id = album.artist_id
LEFT JOIN
    artist_follow ON artist.id = artist_follow.artist_id
GROUP BY
    artist.id, album.id
ORDER BY
    COUNT(artist_follow.user_id) DESC, artist.name ASC, album.name ASC;