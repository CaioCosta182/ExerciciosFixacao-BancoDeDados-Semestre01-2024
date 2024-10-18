-- Aula 25/07
use Aula01DB;
-- Mostrar todos os bancos
show databases;

-- Comando para apagar banco de dados drop database seguido pelo nome do banco a ser deletado
drop database Aula01DB;

-- Comando para criar um banco
create database Aula01DB
default character set utf8
default collate utf8_general_ci;

-- comandos para criar tabela
create table Pessoa(
id int not null auto_increment,
nome varchar(30) not null,
nascimento date,
sexo enum ('M','F'),
peso decimal(5,2),
altura decimal(3,2),
nacionalidade varchar(20) default 'Brasileira', 
primary key (id)
)
default charset= utf8;
-- comando para descrever uma tabela
describe Pessoa; 

-- Aula 31/07

-- comando para inserir dados em uma tabela
insert into Pessoa
(nome, nascimento, sexo, peso, altura, nacionalidade)
values
('Pereira', '1984-06-01', 'M','87.5','1.78', 'Brasil');

-- comando para corrigir algum campo
update Pessoa  
set nacionalidade = 'Brasileira'
where id ='1';

-- comando para exibir a tabela completa
select * from Pessoa;

insert into Pessoa
(id,nome, nascimento, sexo, peso, altura, nacionalidade)
values
(default,'Cleuza', '1924-09-01','F','47.5','1.60',default)
;

-- inserindo varias pessoas a tabela
insert into Pessoa values
(default, 'Claudio', '1994-04-01','M','88.0','2.15', ' Irlandês'),
(default, 'Farley' , '1987-12-01' , 'M' , '98.0' , '1.95','Italia'),
(default, 'Pedro' , '1999-12-03' , 'M' , '87' , '2' , default),
(default, 'Janaina' , '1987-11-12' , 'F' , '75' , '1.66','EUA')
;

insert into pessoa
(nome, nascimento,sexo,peso,altura,nacionalidade) 
values 
('Ana' ,current_date(), 'F' , '3.5' , '0.51','Brasileira');

-- Comando para inserir uma nova coluna na tabela de forma automatica na ultima posição
alter table Pessoa
add column Profissão varchar(10);

-- Comando para deletar uma coluna de uma tabela
alter table Pessoa
drop column Profissão;

-- Comando para inserir uma coluna na primeira posição
alter table Pessoa
add column Profissão varchar(10) first;

-- Comando para inserir uma coluna após um campo especifico
alter table Pessoa
add column Profissão varchar(10)
after nome;

-- Aula 01/08

select * from Pessoa;

desc Pessoa;

-- Comando para alterar uma tabela
alter table Pessoa
modify Profissão varchar(20);

-- comando para renomear uma coluna
alter table Pessoa
change Profissão prof varchar(30);

-- Comando para renomear tabela
alter table Pessoa
rename to Aluno;

-- comandos para criar tabela curso
create table Curso(
nome varchar(30) not null unique,
descricao text,
carga int unsigned,
totalAula int unsigned,
ano year default '2016'
 )
default charset= utf8mb4;

alter table Curso
add id_curso int primary key auto_increment first;


-- adicionando registros na tabela

insert into Curso values
(1, 'HTML4' , 'Curso de HTML5' , 40, 37, '2014'),
(2, 'Algoritmos' , 'Lógica de programação' , '20' , '15','2014'),
(3, 'Photoshop' , 'Dicas de Photoshop' , 10, 8, '2014'),
(4, 'PGP' , 'PHP para iniciantes' , 40, 20, '2010'), 
(5, 'JARVA' , 'Introdução Linguagem Java' , 40, 29, '2000'),
(6, 'MySQL' , 'Banco de Dados MySQL' , 30, 15, '2016'),
(7, 'Word' , 'Curso Completo de Word' , 40, 30, '2016'),
(8, 'Sapateado' , 'Dança Rítmica' , 40, 30, '2018'), 
(9, 'Cozinha árabe' , 'Aprenda a cozinhar' , 40, 30, '2018'),
(10, 'YOUTuber' , 'Ganhar seguidores' , 5, 2, '2018');

-- comando para corrigir HTML4 para HTML5
update Curso  
set nome = 'HTML5'
where id_curso ='1';

-- comando para corrigir PHG para PHP
update Curso  
set nome = 'PHP', ano='2015'
where id_curso ='4';

-- comando para corrigir Jarva carga horaria 80 e ano 2015
update Curso  
set nome = 'JAVA', carga= 80, ano='2015'
where id_curso ='5';

-- comando que limita o numero de linha que serao afetadas pela alteracao de registros
update Curso
set ano = '2050', carga = 800
where ano = 2018
limit 2;

-- comando para apagar linhas
delete from Curso
where ano = 2018
limit 1;
select * from Curso;

-- Aula 07/08
-- add chave estrangeira

alter table Aluno
add Column cursoPreferido int,
add constraint fk_curso
foreign key (cursoPreferido)references curso (id_curso);

desc Aluno;

select * from aluno;

update Aluno
set cursoPreferido = 6
where id = 2;
