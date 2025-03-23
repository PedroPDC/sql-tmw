-- Qual o valor total de receita (tb_order_items - soma do price) 
-- gerada por clientes de cada estado? (tb_customers - customer_unique_id) 
-- Considere a base completa, com apenas pedidos entregues (tb_orders - order_status = 'delivered'

/*Anotações:
total de receita -> tb_order_items - soma do price
clientes por estado -> tb_customers
pedidos entregues -> tb_orders - order_status = 'delivered'
*/


SELECT
    t2.customer_state,
    sum(t3.price) as receita 

FROM tb_orders as t1

LEFT JOIN tb_customers as t2
ON t1.customer_id = t2.customer_id

LEFT JOIN tb_order_items as t3
ON t1.order_id = t3.order_id

WHERE t1.order_status = 'delivered'

GROUP BY t2.customer_state
ORDER BY sum(t3.price) DESC
