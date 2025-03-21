SELECT *

FROM (

    SELECT
        seller_state,
        count(*) as qtd_sellers

    FROM tb_sellers

    -- WHERE seller_state in ('SP', 'RJ', 'PR')

    GROUP BY seller_state

)

WHERE qtd_sellers > 10