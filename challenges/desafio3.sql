SELECT
    user_person.name AS pessoa_usuaria,
    COUNT(subquery.song_id) AS musicas_ouvidas,
    ROUND(SUM(song.duration_seconds) / 60, 2) AS total_minutos
FROM
    user_person
LEFT JOIN
    (
        SELECT
            playback_history.user_id,
            playback_history.song_id
        FROM
            playback_history
        GROUP BY
            playback_history.user_id,
            playback_history.song_id
    ) AS subquery ON user_person.id = subquery.user_id
LEFT JOIN
    song ON subquery.song_id = song.id
GROUP BY
    user_person.id
ORDER BY
    user_person.name ASC;