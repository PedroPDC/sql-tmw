/*OBJETIVO: Qual o produto campeao de vendas de cada seller?
Considere pedidos entregues
Vamos criar uma coluna auxiliar enumerando do mais pedido para o menos pedido
em caso de empate será considerado a receita*/

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

tb_seller_sort as (

    select 
        *,

        -- row_number() é uma window function que atribui um numero sequencial a cada linha dentro de uma particao
        -- over define a janela de dados, partition by divide o conjunto em partições por seller_id
        -- order by é o que vai ordenar essas partições
        row_number() over ( partition by seller_id 
                            order by qtde_produto desc, receita_produto desc) as order_qtde

    from tb_seller_product

)

select
    seller_id,
    product_id,
    qtde_produto

from tb_seller_sort

where order_qtde = 1