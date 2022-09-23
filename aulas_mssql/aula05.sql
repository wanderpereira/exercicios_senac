-- Clinica
select top 1 atend.datahora[Data da Consulta], pad.nome[paciente], med.nome[medico], pres.descricao[receitado] from paciente pad
INNER JOIN atendimento atend ON atend.codigopaciente   = pad.codigopaciente
INNER JOIN prescricao pres   ON pres.codigoatendimento = atend.codigoatendimento
INNER JOIN medico med        ON med.codigomedico       = atend.codigomedico
ORDER BY atend.datahora 

-- Cidades
use cidades
select cidades.nome [cidade], estados.nome [estado] from cidades
inner join estados on estados.id = cidades.estado_id where cidades.nome LIKE '%Bom Jesus'

select cidades.nome [cidade], estados.nome [estado] from cidades
inner join estados on estados.id = cidades.estado_id where cidades.nome = 'Bauru'
