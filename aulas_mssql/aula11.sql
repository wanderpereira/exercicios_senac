
select 'Quem nasce em ' + nome + ' É ' + dbo.[InitCap](gentilico)[Descritivo]  from cidades

select 'Quem nasce em ' + nome + ' É ' + UPPER(SUBSTRING(gentilico, 1, 1)) + LOWER(SUBSTRING(gentilico, 2, LEN(gentilico))) from cidades

update cidades set gentilico = 'bRASILEENSE' where id = 1

select * from cidades

/**/
SELECT 
cid.nome [CIDADE],
cid.populacao_2010 [POPULACAO],
CASE   
      WHEN cid.populacao_2010 < 100000 THEN 'CIDADE PEQUENA' 
	  WHEN cid.populacao_2010 > 100000 AND cid.populacao_2010 <= 1000000 THEN 'CIDADE MÉDIA'
      WHEN cid.populacao_2010 > 1000000 THEN 'CIDADE GRANDE'   
END
   
[PORTE],est.nome [ESTADO] from cidades cid
inner join estados est on est.id = cid.estado_id
order by POPULACAO
