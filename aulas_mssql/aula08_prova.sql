create database pessoas
use pessoas
create table pessoa 
(
codigopessoa int primary key identity,
nome varchar(50) not null,
endereco varchar(70) not null
)

create table pessoafisica
(
codigopessoafisica int primary key identity,
cpf varchar(14) unique not null,
datanasc datetime not null,
codigopessoa int
)

create table pessoajuridica
(
codigopessoajuridica int primary key identity,
nomefantasia varchar(30) not null,
cnpj varchar(18) unique not null,
codigopessoa int
)

alter table pessoafisica add constraint pk_pessoa
foreign key (codigopessoa) references pessoa (codigopessoa)

alter table pessoajuridica add constraint pk_pessoaju
foreign key (codigopessoa) references pessoa (codigopessoa)

insert into pessoa(nome, endereco) values ('Power Guido', 'R. dos Coco Felizes')
insert into pessoa(nome, endereco) values ('Jascinto Mello', 'R. dos Pedros Magros')
insert into pessoa(nome, endereco) values ('Mafrica Lima', 'R. Massas Peligrosas')
insert into pessoa(nome, endereco) values ('Kim Sushitsu', 'R. Milagres')

insert into pessoafisica (cpf, datanasc, codigopessoa) values ('587.698.547-87', '2002/01/02', 2)
insert into pessoafisica (cpf, datanasc, codigopessoa) values ('987.111.000-02', '1992/03/04', 1)

insert into pessoajuridica(nomefantasia, cnpj, codigopessoa) values ('Kokomix', '12.547.987/0001-58', 3)
insert into pessoajuridica(nomefantasia, cnpj, codigopessoa) values ('Juju', '21.457.897/0002-85', 4)

select pessoa.nome [Nome], pessoa.endereco [Endereço], pessoafisica.cpf [CPF], 
pessoafisica.datanasc [Nascimento], pessoajuridica.nomefantasia, pessoajuridica.cnpj 
from pessoa
inner join pessoafisica on pessoafisica.codigopessoafisica = pessoa.codigopessoa
inner join pessoajuridica on pessoajuridica.codigopessoajuridica = pessoa.codigopessoa
where pessoajuridica.nomefantasia = 'juju'