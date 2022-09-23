/*
Faça uma consulta que traga o nome do paciente, a datadenascimento, remédio, receitada, datadaconsulta, médico que atendeu, crm, especialidade e a doença
de todos os pacientes que tenham 'c' nome e a especialidade seja ortopedia, ordene pelo nome do paciente.
*/

				SELECT
					   pad.nome, 
					   pad.datanasc [datadenascimento],
					   pres.descricao [remedio],
					   atend.descricao[consulta],
					   atend.datahora [hora da consulta],
					   med.nome[medico],
					   med.crm,
					   es.nome [especialidade],
					   doe.nome [doenca]  
					   FROM paciente pad 
						INNER JOIN atendimento atend ON atend.codigopaciente   = pad.codigopaciente
						INNER JOIN prescricao pres   ON pres.codigoatendimento = atend.codigoatendimento
						INNER JOIN medico med        ON med.codigomedico       = atend.codigomedico
						INNER JOIN especialidade es  ON es.codespecialidade    = med.codespecialidade
						INNER JOIN doenca doe        ON doe.codigodoenca       = atend.codigodoenca
					   WHERE es.nome = 'Ortopedia' and pad.nome LIKE 'C%' --que começa com C
					   ORDER BY pad.nome DESC




select * from paciente
select * from medico
select * from doenca
select * from especialidade
select * from atendimento
select * from prescricao


insert into prescricao(descricao, codigoatendimento) values ('odontologia', 2)
insert into especialidade (nome) values ('Ortopedia')
insert into medico (crm, nome, codespecialidade) values ('69874', 'Daniela Amaral', 7)
insert paciente (cpf, datanasc, nome, peso, sexo) values ('335.005.699-00', '1992-03-05', 'Amanda Oliveira', 9.5, 'F')
insert atendimento (datahora, codigopaciente, codigomedico,descricao)
values ('2020-22-08', 3, 13,'Dores no corpo')

update atendimento set codigodoenca = 2  where codigoatendimento = 4
update doenca set nome = 'Artrose' where codigodoenca = 4

