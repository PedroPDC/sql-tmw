/*OBJETIVO: Qual o produto campeao de vendas de cada seller?
Considere pedidos entregues*/

with tb_seller_product as (

    select
        t2.seller_id,
        t2.product_id,
        count(*) as qtde_produto,
        sum(t2.price) as receita_produto

    from tb_orders as t1

    left join tb_order_items as t2
    on t1.order_id = t2.order_id

    where order_status = 'delivered'

    group by t2.product_id, t2.seller_id

    order by t2.seller_id

),

tb_seller_max as (

    select
        seller_id,
        max(qtde_produto) as max_qtde

    from tb_seller_product

    group by seller_id

)

select 
    t1.*,
    t2.*

from tb_seller_max as t1

-- Join com CHAVE DUPLA
left join tb_seller_product as t2
on t1.seller_id = t2.seller_id
and t1.max_qtde = t2.qtde_produto