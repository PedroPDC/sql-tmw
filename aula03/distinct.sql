-- lista das categorias DISTINTAS por ordem alfabetica

SELECT
    DISTINCT product_category_name

FROM tb_products

ORDER BY product_category_name