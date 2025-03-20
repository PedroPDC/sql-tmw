-- Crie uma coluna nova que contenha a informação de volume em m3

SELECT
    *,
    product_length_cm * product_height_cm * product_width_cm / 1000000 as product_volume_m3

FROM tb_products