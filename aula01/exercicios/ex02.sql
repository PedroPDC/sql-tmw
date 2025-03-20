-- Quantos produtos tem mais de 5 litros?

SELECT
    count(*),
    count(DISTINCT product_id)

FROM tb_products

WHERE product_length_cm * product_height_cm * product_width_cm / 1000 > 5