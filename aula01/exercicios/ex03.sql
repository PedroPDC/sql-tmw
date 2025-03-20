-- Crie uma coluna nova que contenha a informação de volume em m3

SELECT
    product_id,
    product_category_name,
    product_length_cm,
    product_width_cm,
    product_height_cm,
    ((product_length_cm / 100) * (product_width_cm / 100) * (product_height_cm / 100)) as volume_m3

FROM tb_products