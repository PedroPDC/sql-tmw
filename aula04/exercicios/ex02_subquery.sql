SELECT 
    t1.seller_state,
    avg(receita_total) as avg_seller

FROM (

    SELECT
        t2.seller_state,
        t1.seller_id,
        sum(t1.price) as receita_total

    FROM tb_order_items as t1

    LEFT JOIN tb_sellers as t2
    ON t1.seller_id = t2.seller_id

    LEFT JOIN tb_orders as t3
    ON t1.order_id = t3.order_id

    WHERE t3.order_status = 'delivered'

    GROUP BY t2.seller_state, t1.seller_id

) as t1

GROUP BY t1.seller_state