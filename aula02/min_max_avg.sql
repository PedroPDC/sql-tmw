SELECT
    product_category_name,
    count(*) as qtd_produto,
    max(product_weight_g) as maior_peso,
    min(product_weight_g) as menor_peso,
    avg(product_weight_g) as medio_peso

FROM tb_products

WHERE product_category_name is not NULL

GROUP BY product_category_name