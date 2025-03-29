-- Tempo entre vendas dos sellers
-- Apenas pedidos entregues

with tb_seller_order as (

    select
        t1.order_id,
        date(t1.order_approved_at) as data_venda,
        t2.seller_id

    from tb_orders as t1

    left join tb_order_items as t2
    on t1.order_id = t2.order_id

    where order_status = 'delivered'

),

tb_seller_order_sort as (

    select 
        *,

        --Marca linhas duplicadas de mesmo dia de venda usando window function
        row_number() over ( partition by seller_id, data_venda) as date_seller_order

    from tb_seller_order

),

tb_seller_lag_data as (

    select 
        order_id,
        seller_id,
        data_venda,

        /*lag é uma window function que retorna o valor da coluna entre parenteses da linha anterior dentro de uma particao
        over define a janela de dados que o lag irá operar, partition divide o conjunto em partições,
        order by ordena essas partições*/
        lag(data_venda) over ( partition by seller_id
                            order by data_venda) as lag_data_venda

    from tb_seller_order_sort

    --Remove linhas duplicadas marcadas anteriormente
    where date_seller_order = 1

)

select
    seller_id,

    --forma de calcular diferença entre dias no sqlite3
    round(avg(julianday(data_venda) - julianday(lag_data_venda)), 2) as avg_diff_dias

from tb_seller_lag_data

where lag_data_venda is not null

group by seller_id