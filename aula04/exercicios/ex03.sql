-- Qual o peso médio dos produtos vendidos por sellers de cada estado? 
-- Considere apenas o ano de 2017 
-- e pedidos entregues nesta análise.

/*Anotações:
peso médio -> tb_products - avg(product_weight_g)
sellers por estado -> tb_sellers
pedidos entregues -> tb_orders - order_status = 'delivered'
*/

SELECT
    t3.seller_state,
    round( avg(t2.product_weight_g), 2) as avg_peso_produtos_vendidos

FROM tb_order_items as t1

LEFT JOIN tb_products as t2
ON t1.product_id = t2.product_id

LEFT JOIN tb_sellers as t3
ON t1.seller_id = t3.seller_id

LEFT JOIN tb_orders as t4
ON t1.order_id = t4.order_id

WHERE t4.order_status = 'delivered'
AND CAST( strftime('%Y', t4.order_approved_at) as int) = 2017

GROUP BY t3.seller_state
ORDER BY round( avg(t2.product_weight_g), 2) DESC