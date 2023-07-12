SELECT
    ROUND(MIN(plan.price), 2) AS faturamento_minimo,
    ROUND(MAX(plan.price), 2) AS faturamento_maximo,
    ROUND(AVG(plan.price), 2) AS faturamento_medio,
    ROUND(SUM(plan.price), 2) AS faturamento_total
FROM
    user_person
INNER JOIN
    plan ON user_person.plan_id = plan.id;