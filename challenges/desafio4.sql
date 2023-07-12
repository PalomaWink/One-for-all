SELECT
    user_person.name AS pessoa_usuaria,
    CASE
        WHEN MAX(playback_history.date_time) >= '2021-01-01' THEN 'Ativa'
        ELSE 'Inativa'
    END AS status_pessoa_usuaria
FROM
    user_person
LEFT JOIN
    playback_history ON user_person.id = playback_history.user_id
GROUP BY
    user_person.id
ORDER BY
    user_person.name ASC;