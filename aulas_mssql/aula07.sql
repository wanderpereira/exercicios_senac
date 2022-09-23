select count(*) [TOTAL DE CIDADES] From cidades

select sum(populacao_2010) [POPULACAO BRASIL] from cidades

SELECT sum(cidades.populacao_2010) [Populacao], estados.nome [Estados]
FROM cidades
inner join estados on estados.id = cidades.estado_id 
GROUP BY estados.nome order by Populacao desc