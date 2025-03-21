select
    seller_state,
    count(*) as qtde_sellers

from tb_sellers

-- WHERE filtra o dado na ORIGEM
-- filtro pré agg (agregação)
where seller_state in ('SP', 'RJ', 'PR', 'GO', 'AC')

-- agregação
group by seller_state

-- having é utilizado depois de agrupar, na agregação
-- filtro pós agregação
having count(*) > 10