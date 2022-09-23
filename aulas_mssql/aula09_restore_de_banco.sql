use cidades

select sum(cidades.populacao_2010) [populacao], estados.nome [estados] from cidades
inner join estados on estados.id = cidades.estado_id
group by estados.nome 
having sum(cidades.populacao_2010) > 10000000
order by estados.nome

select cidades.populacao_2010 [POPULACAO], estados.nome [ESTADO], cidades.nome [CIDADES] 
from cidades
inner join estados on estados.id = cidades.estado_id
where estados.sigla IN ('SP', 'MG') and cidades.populacao_2010 > 100000
order by populacao_2010

select count(*) from cidades

/* 5461 */
delete cidades from cidades
inner join estados on estados.id = cidades.estado_id
where estados.sigla = 'MG' and cidades.populacao_2010 > 100000

/*5450*/
delete cidades from cidades where populacao_2010 > 20000 and nome like 'porto%'

select * 
from cidades
inner join estados on estados.id = cidades.estado_id
where estados.sigla = 'SP' and cidades.populacao_2010 > 100000

/*Restaure o banco de dados com Backup como Cidades2*/

INSERT INTO dbo.cidades(nome, codigo_ibge, estado_id, populacao_2010, densidade_demo, gentilico, area)
   SELECT cidades.nome,codigo_ibge, estado_id, populacao_2010, densidade_demo, gentilico, area
     FROM CIDADES2.dbo.cidades
	 inner join estados on estados.id = cidades.estado_id
     WHERE estados.sigla IN ('SP', 'MG') and cidades.populacao_2010 > 100000

insert into dbo.cidades(nome, codigo_ibge, estado_id, populacao_2010, densidade_demo, gentilico, area)
 select cidades.nome, codigo_ibge, estado_id, populacao_2010, densidade_demo, gentilico, area
 FROM CIDADES2.dbo.cidades
 where populacao_2010 > 20000 and nome like 'porto%'

 drop database CIDADES2