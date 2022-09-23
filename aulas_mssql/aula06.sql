/* faça uma consulta que retorne todas as cidades, habitantes e nome do estado com mais 
de 100.000 e ordene pelos habitantes */
select cidades.nome [cidade], estados.nome [estado], cidades.populacao_2010 [populacao] from cidades
inner join estados on estados.id = cidades.estado_id where estados.nome = 'Ceará' and cidades.populacao_2010 > 100000
order by cidades.populacao_2010

/* faça uma consulta que retorne a maior cidade(área) do 
Norte(nome da cidade, habitantes, tamanho, estato e sigla) */

select top 1 cidades.nome [cidade], cidades.populacao_2010 [populacao], cidades.area [tamanho], estados.nome [estado], estados.sigla [sigla]  from cidades
inner join estados on estados.id = cidades.estado_id 
where estados.sigla IN ('AC', 'AP', 'AM', 'PA', 'RO', 'RR', 'TO') order by cidades.area desc

/*Qual é menor cidade do brasil*/

select top 1 cidades.nome [cidade], cidades.populacao_2010 [habitantes], estados.nome [estado], estados.sigla [sigla]  from cidades
inner join estados on estados.id = cidades.estado_id 
order by cidades.area 

/*Qual a cidade com menos habitantes*/
select top 1 cidades.nome [cidade], cidades.populacao_2010 [habitantes], estados.nome [estado], estados.sigla [sigla]  from cidades
inner join estados on estados.id = cidades.estado_id 
order by cidades.populacao_2010

/*Faça uma consulta que retorne todas as cidades (nome da cidade, habitantes, gentilico e nome do estado)
com menos de 50000 habitantes que seja mato grosso ou Rio de Janeiro, que o nome da cidade
termine com A e que a area maior que 22641
*/

select cidades.nome [cidade], cidades.populacao_2010 [habitantes], cidades.gentilico [gentilico], estados.nome [estado], estados.sigla [sigla]  from cidades
inner join estados on estados.id = cidades.estado_id 
where cidades.populacao_2010 < 50000 and estados.sigla IN ('MT', 'RJ') and cidades.nome LIKE '%a' and cidades.area > 22641


/*Faça uma consulta que retorne as cidades com habitantes dentre 300000 à 1000000
1 - cidade: Paulista
64 - cidade: São Gonçalo
 */
select cidades.nome [cidade], cidades.populacao_2010 [habitantes] from cidades 
where cidades.populacao_2010 between 300000 and 1000000 order by cidades.populacao_2010