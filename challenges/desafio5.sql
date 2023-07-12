SELECT
    song.name AS cancao,
    COUNT(playback_history.song_id) AS reproducoes
FROM
    playback_history
INNER JOIN
    song ON playback_history.song_id = song.id
GROUP BY
    playback_history.song_id
ORDER BY
    reproducoes DESC, cancao ASC
LIMIT 2;