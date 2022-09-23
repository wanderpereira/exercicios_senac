create table fabricante
(
codigofabricante int primary key identity,
nome varchar(40) not null,
cnpj varchar(18) unique not null
)

create table remedio
(
codigoremedio int primary key identity,
nome varchar(60) not null,
datavalidade datetime not null,
codigofabricante int
)

alter table remedio add constraint pk_fabricante 
foreign key (codigofabricante) references fabricante (codigofabricante)


insert into fabricante (nome, cnpj) values ('Moderna', '23.125.587/0001-21')
insert into fabricante (nome, cnpj) values ('Astra zenica', '98.478.365/0001-61')

insert into remedio (nome, datavalidade, codigofabricante) values ('Dipirona', '2023/04/06', 2)
insert into remedio (nome, datavalidade, codigofabricante) values ('Paracetamol', '2023/06/03', 2)

select * from fabricante


select remedio.codigoremedio [CODIGO REMEDIO], remedio.nome [REMEDIO], remedio.datavalidade, 
fab.nome [FABRICANTE], fab.cnpj from fabricante fab
inner join remedio on remedio.codigofabricante = fab.codigofabricante
where fab.nome = 'Moderna' and remedio.nome like '%pan'

