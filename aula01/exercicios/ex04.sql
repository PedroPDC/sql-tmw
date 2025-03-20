-- Quantos produtos de 'beleza_saude' com menos de 1 litro?

SELECT
    count(product_id)

FROM tb_products

WHERE product_category_name = 'beleza_saude' and product_weight_g < 1000