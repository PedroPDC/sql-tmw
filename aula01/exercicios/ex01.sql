-- Quantos produtos temos da categoria 'artes'?

SELECT
    count(product_id) as qtd_produtos_artes

FROM tb_products

WHERE product_category_name = 'artes'