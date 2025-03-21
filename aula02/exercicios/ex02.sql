-- Faça uma query que apresente o tamanho médio, máximo e mínimo do nome do objeto por categoria

SELECT
    product_category_name
    product_name_lenght,
    avg(product_name_lenght) as tamanho_medio_nome,
    max(product_name_lenght) as tamanho_max_nome,
    min(product_name_lenght) as tamanho_min_nome

from tb_products

where product_category_name is not null

group by product_category_name