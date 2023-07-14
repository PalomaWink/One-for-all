SELECT
    CASE
        WHEN age <= 30 THEN 'Até 30 anos'
        WHEN age <= 60 THEN 'Entre 31 e 60 anos'
        ELSE 'Maior de 60 anos'
    END AS faixa_etaria,
    COUNT(DISTINCT user_person.id) AS total_pessoas_usuarias,
    COUNT(DISTINCT favorite_song.id) AS total_favoritadas
FROM
    user_person
LEFT JOIN
    favorite_song ON favorite_song.user_id = user_person.id
GROUP BY
    faixa_etaria
ORDER BY
    CASE faixa_etaria
        WHEN 'Até 30 anos' THEN 1
        WHEN 'Entre 31 e 60 anos' THEN 2
        WHEN 'Maior de 60 anos' THEN 3
    END;