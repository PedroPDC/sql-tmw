-- qual a receita de cada categoria de produto?
-- e o total de vendas?
-- em unidades e em pedidos.

-- select * from tb_products; -- tabela de produtos

-- select * from tb_orders; -- tabela de vendas

SELECT
    t2.product_category_name,
    sum(t1.price) as receita,
    count(*) as total_itens_vendidos,
    count(DISTINCT t1.order_id) as qtde_pedidos,
    round( count(*) / CAST( count(DISTINCT t1.order_id) as float), 2) as avg_item_por_pedido


FROM tb_order_items as t1

LEFT JOIN tb_products as t2
ON t1.product_id = t2.product_id

GROUP BY t2.product_category_name
ORDER BY count(*) DESC

LIMIT 10