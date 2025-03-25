-- Qual o valor total de receita gerada por sellers de cada estado? 
-- Considere a base completa, com apenas pedidos entregues

/*Anotações:
receita -> tb_order_items - soma do price
sellers por estado -> tb_sellers
pedidos entregues -> tb_orders - order_status = 'delivered'
*/

SELECT
    t2.seller_state,
    sum(t1.price) as receita_total,
    round( sum(t1.price) / count(DISTINCT t1.seller_id), 2) as avg_receita_seller,
    count(DISTINCT t1.seller_id) as qtde_sellers

FROM tb_order_items as t1

LEFT JOIN tb_sellers as t2
ON t1.seller_id = t2.seller_id

LEFT JOIN tb_orders as t3
ON t1.order_id = t3.order_id

WHERE t3.order_status = 'delivered'

GROUP BY t2.seller_state