-- Faça uma query que apresente o tamanho médio, máximo e mínimo da descrição do objeto por categoria

select
    product_category_name,
    avg(product_description_lenght) as tamanho_medio_descricao,
    max(product_description_lenght) as tamanho_max_descricao,
    min(product_description_lenght) as tamanho_min_descricao

from tb_products

WHERE product_category_name is not NULL

GROUP BY product_category_name