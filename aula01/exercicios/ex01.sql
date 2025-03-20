-- Quantos produtos temos da categoria 'artes'?

SELECT
    count(*) as qtd_linhas,
    count(product_id) as qtd_produtos,
    count(DISTINCT product_id) as qtd_produtos_distintos,
    count(DISTINCT product_category_name) as qtd_categorias_distintas

FROM tb_products

WHERE product_category_name = 'artes'