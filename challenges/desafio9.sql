SELECT
    COUNT(playback_history.song_id) AS 'musicas_no_historico'
FROM
    SpotifyClone.playback_history
INNER JOIN
    user_person ON playback_history.user_id = user_person.id
WHERE
	user_id = 1;