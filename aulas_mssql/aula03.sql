use clinica
select * from especialidade
select * from medico
insert into medico (crm, nome, codespecialidade) values ('87895', 'Bruno Cestno', 6)
select med.nome, med.crm, es.nome from medico med
inner join especialidade es on es.codespecialidade = med.codespecialidade
WHERE es.nome = 'Pediatra' and med.nome LIKE '%A%'
