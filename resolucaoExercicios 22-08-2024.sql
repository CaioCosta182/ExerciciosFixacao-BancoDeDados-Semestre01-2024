-- resolucao exercicios 22/08/2024

-- Criar uma lista em ordem alfabética com o nome de todas as alunas;
select nome from aluno
where sexo = 'F'
order by nome;

-- 2. Criar uma lista com os dados de todos os alunos que nasceramentre 01/01/2000e31/12/2015;
select * from aluno
where nascimento between '2000-01-01' and '2015-12-31';

-- 3. Listar todos os alunos (homens) que trabalham como programador;
select nome, profissao from aluno
where profissao = 'programador' and sexo ='M';

-- 4. Listar todos os dados das alunas (mulheres) que nasceramno Brasil e que tem seu nome iniciado com a letra J;

-- 5. Criar uma lista com o nome e nacionalidade de todos os alunos (homens) quetêm Silva no nome, não nasceram no Brasil e pesam menos de 100kg;
-- 6. Qual é a maior altura entre os aluno (homens) que moram no Brasil;
-- 7. Qual o menor peso cadastrado entre as alunas que nasceramfora do Brasil e entre 01/01/1990 e 31/12/2000;
-- 8. Quantas alunas têm mais de 1.90 de altura;

-- 9. Quantas nacionalidade diferentes há cadastradas na base?
select count(distinct(nacionalidade)) as 'Quantidade'
from aluno;

-- Lista com as profissões dos alunos e seus respectivos quantitativos;
select profissao , count(nome)
from aluno
group by profissao
order by count(nome)desc;

-- • Quantos alunos homens e mulheres que nasceramapós 01/01/2005;
select sexo, count(*) from aluno
where nascimento > '2005-01-01'
group by sexo;

-- • Montar uma lista dos alunos que nasceram fora do Brasil, mostrando país de origem e total de pessoas nascidas la. 
-- Só nos interessa os países que tiverem mais de 3 alunos com essa nacionalidade;
select nacionalidade , count(nome) from aluno
where nacionalidade != 'Brasil'
group by nacionalidade
having count(nome) > 3;

-- • Mostrar quantas pessoas pesam mais de 100kg e agrupálas pela alturas,e que estão acima da media de altura de todos os cadastrados;
select altura, count(nome) from aluno
where peso > 100
group by altura
having altura > (select avg(altura)from aluno);

-- • Selecionar cursos do ano de 2015 e após, agrupá-los pelacarga, masfiltrá-los pela média de carga de todos os cursos.
select carga, count(nome) from curso
where ano = '2015'
group by carga
having carga > (select avg(carga)from curso);