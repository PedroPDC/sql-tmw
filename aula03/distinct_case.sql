SELECT
    DISTINCT CASE WHEN product_category_name IS NULL THEN 'outros'
                  ELSE product_category_name 
             END AS categoria_fillna

FROM tb_products

order by 1