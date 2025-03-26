-- a receita por estado, por produto da categoria mais vendida
-- apenas pedidos entregues

-- BOA PRÁTICA, BEM MELHOR PARA LEITURA
with tb_best_category as (

    select
        t2.product_category_name

    from tb_order_items as t1

    left join tb_products as t2
    on t1.product_id = t2.product_id

    group by t2.product_category_name
    order by count(*) desc

    limit 3
),

tb_receita_estado_produto as (

    select 
        t2.seller_state,
        t1.product_id,
        t3.product_category_name,
        sum(t1.price) as receita_total

    from tb_order_items as t1

    left join tb_sellers as t2
    on t1.seller_id = t2.seller_id

    left join tb_products as t3
    on t1.product_id = t3.product_id

    inner join tb_vendas as t4
    on t1.order_id = t4.order_id

    group by t2.seller_state, 
            t1.product_id,
            t3.product_category_name

),

tb_vendas as (

    select
        *
    
    from tb_orders as t1
    
    where t1.order_status = 'delivered'

)


select
    *

from tb_receita_estado_produto as t1

inner join tb_best_category as t2
on t1.product_category_name = t2.product_category_name