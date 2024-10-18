-- Criar uma lista em ordem alfabética com o nome de todas as alunas;
select nome from aluno
where sexo = 'f'
order by nome;

-- 2. Criar uma lista com os dados de todos os alunos que nasceramentre 01/01/2000e31/12/2015;
select * from aluno
where nascimento between '2000-01-01' and '2015-12-31'
order by nome
;
-- 3. Listar todos os alunos (homens) que trabalham como programador;
select * from aluno
where sexo = 'm' and profissao = 'programador'
order by nome;

-- 4. Listar todos os dados das alunas (mulheres) que nasceram no Brasil e que tem seu nome iniciado com a letra J;
select * from aluno
where sexo = 'f' 
and nacionalidade = 'Brasil' 
and nome like 'j%';

-- 5. Criar uma lista com o nome e nacionalidade de todos os alunos (homens) que têm Silva no nome, não nasceram no Brasil e pesam menos de 100kg;
select nome, nacionalidade from aluno
where sexo = 'm'
and nacionalidade <> 'Brasil'
and peso < 100
order by nome;

-- 6. Qual é a maior altura entre os aluno (homens) que moram no Brasil;
select max(altura) as 'Maior altura' from aluno
where sexo = 'm'
and nacionalidade = 'Brasil';

-- 7. Qual o menor peso cadastrado entre as alunas que nasceram fora do Brasil e entre 01/01/1990 e 31/12/2000;
select min(peso) as 'Menor Peso' from aluno
where sexo = 'f'
and nacionalidade <> 'Brasil'
and nascimento between '1990-01-01' and '2000-12-31';

-- 8. Quantas alunas têm mais de 1.90 de altura;
select count(peso) as 'Qtd alunas com + 1,9m' from aluno
where sexo = 'f';

-- 9. Quantas nacionalidade diferentes há cadastradas na base?
select count(distinct(nacionalidade)) as 'Diferentes nacionalidades'from aluno;

select nacionalidade from aluno;

-- Listar o nome dos alunos que preferem os cursos que têm carga horária acima da média;
select nome from aluno
where cursopreferido 
in (select idcurso from curso
where carga > (select avg(carga)from curso));

-- Listar os alunos que preferem o curso que possui maior carga horaria.
select nome from aluno
where cursopreferido
in (select idcurso from curso
where carga = (select max(carga) from curso));

-- Crie uma lista onde seja possível identificar o número de alunos para cada nacionalidade registrada na base. 
select nacionalidade, count(nome) from aluno
group by nacionalidade;

-- Crie uma lista onde seja possível verificar o número de alunos que fazem determinado curso. 
select cursopreferido, count(nome) from aluno
group by cursopreferido;

-- E se eu quisesse verificar a preferência dos alunos Americanos?
select cursopreferido, count(nome) from aluno
where nacionalidade = 'EUA'
group by cursopreferido;

-- Lista com as profissões dos alunos e seus respectivos quantitativos;
select profissao, count(*) from aluno
group by profissao; 

-- Quantos alunos homens e mulheres que nasceram após 01/01/2005;
select count(*) as 'Alunos que nasceram após 2005'from aluno
where nascimento > '2005-01-01';

-- Montar uma lista dos alunos que nasceram fora do Brasil, 
-- mostrando país de origem e total de pessoas nascidas la. 
-- Só nos interessa os países que tiverem mais de 3 alunos com essa nacionalidade;
select nacionalidade, count(*) from aluno
where nacionalidade <> 'Brasil'
group by nacionalidade
having count(*) > 3;

-- Mostrar quantas pessoas pesam mais de 100kg e agrupálas pelas alturas,
-- e que estão acima da media de altura de todos os cadastrados;
select altura,count(*) from aluno
where peso > 100
group by altura 
having altura > (select avg(altura)from aluno);

-- Selecionar cursos do ano de 2015 e após, agrupá-los pela carga, 
-- filtrá-los pela média de carga de todos os cursos.
select carga, count(nome) from curso
where ano = '2015'
group by carga
having carga >= (select avg(carga)from curso);