-- Revisao SQL join

-- 1. Selecionar o código das peças (sem repetição) cuja a quantidade embarcada esteja entre 5 e 10 inclusive.
SELECT DISTINCT cod_peça 
FROM Embarque 
WHERE qtde_peça BETWEEN 5 AND 10;

 --  2. Selecionar o código das peças (sem repetição) cuja a quantidade embarcada seja diferente de 100.
SELECT DISTINCT cod_peça 
FROM Embarque 
WHERE qtde_peça <> 100;

 -- 3. Elabore uma lista de nomes de fornecedores cujo o nome:

-- a) se inicie com 'BO'
SELECT nome_fornec 
FROM Fornecedor 
WHERE nome_fornec LIKE 'BO%';

-- b) tenha 'info'no nome
SELECT nome_fornec 
FROM Fornecedor 
WHERE nome_fornec LIKE '%info%';

-- c) termine com 'dor'  
SELECT nome_fornec 
FROM Fornecedor 
WHERE nome_fornec LIKE '%dor';

-- 4. Elaborar uma lista com o nome das peças embarcadas com quantidade superior a 1000. 
SELECT DISTINCT P.nome_peça 
FROM Peça P 
JOIN Embarque E 
ON P.cod_peça = E.cod_peça 
WHERE E.qtde_peça > 1000;

-- 5. Elaborar uma lista com o nome do empregado e o nome o seu chefe. 
SELECT E1.nome_emp AS Empregado, E2.nome_emp AS Chefe 
FROM Empregado E1 
LEFT JOIN Empregado E2 
ON E1.cod_empGer = E2.cod_emp;

-- 6. Elaborar uma lista com o nome das peças de cor 'vermelha' embarcadas comquantidade superior a 1000 pelos fornecedores 'Bosch' e 'Skol'. 
SELECT P.nome_peça 
FROM Peça P 
JOIN Embarque E 
ON P.cod_peça = E.cod_peça 
JOIN Fornecedor F 
ON E.cod_fornec = F.cod_fornec 
WHERE P.cor_peça = 'vermelha' 
AND E.qtde_peça > 1000 
AND F.nome_fornec IN ('Bosch', 'Skol');


-- 7. Elaborar uma lista com o nome ds peçs da cor 'azul', fabricadas em 'Ouro Branco' e as'vermelhas' fabroicadas em lafaiete. 
SELECT nome_peça 
FROM Peça 
WHERE (cor_peça = 'azul' AND cidade_peça = 'Ouro Branco') 
OR (cor_peça = 'vermelha' AND cidade_peça = 'Lafaiete');

-- 8. Liste o nome dos fornecedores cujo a quantidade de peças embracadas (por embarque) sejam menor que 1000. (faça uma consulta com subquery e a mesma consulta usandojoin)
SELECT nome_fornec 
FROM Fornecedor 
WHERE cod_fornec IN (
    SELECT cod_fornec 
    FROM Embarque 
    WHERE qtde_peça < 1000
);
-- com join 
SELECT DISTINCT F.nome_fornec 
FROM Fornecedor F 
JOIN Embarque E ON F.cod_fornec = E.cod_fornec 
WHERE E.qtde_peça < 1000;


-- 9. Listar o nome das peças, o nome do fornecedor e data de embraque para todos os embarques com quantidades superior a 1000. 
SELECT P.nome_peça, F.nome_fornec, E.dth_embarque 
FROM Embarque E 
JOIN Peça P ON E.cod_peça = P.cod_peça 
JOIN Fornecedor F ON E.cod_fornec = F.cod_fornec 
WHERE E.qtde_peça > 1000;

-- 10. Listar o nome do fornecedor e o código das peças embarcadas para ele. Caso o fornecedor não possua embarque, p seu nome deve ser listado com 'NULL'' para o
-- código da peça. 
SELECT F.nome_fornec, E.cod_peça 
FROM Fornecedor F 
LEFT JOIN Embarque E ON F.cod_fornec = E.cod_fonec;

-- 11. Liste os códigos dos fornecedores e o código das peças cujo embarque obteve maior número de peças
SELECT cod_fornec, cod_peça 
FROM Embarque 
WHERE qtde_peça = (SELECT MAX(qtde_peça) FROM Embarque);

-- 12. Liste os nome dos fornecedores e o total de peças que ele já embarcou. 
SELECT F.nome_fornec, SUM(E.qtde_peça) AS total_peças 
FROM Fornecedor F 
JOIN Embarque E ON F.cod_fornec = E.cod_fornec 
GROUP BY F.nome_fornec;

-- 13. Liste os nomes das peças e a média de suas quantidades embarcadas, desde que estamédia seja superior a 1000. 
SELECT P.nome_peça, AVG(E.qtde_peça) AS media_quantidade 
FROM Peça P 
JOIN Embarque E ON P.cod_peça = E.cod_peça 
GROUP BY P.nome_peça 
HAVING AVG(E.qtde_peça) > 1000;

-- 14. Liste os nomes dos fornecedores, os nome das peças e a quantidade total embarcadaspara cada fornecedor-peça.-- 
SELECT F.nome_fornec, P.nome_peça, SUM(E.qtde_peça) AS total_embarcado 
FROM Fornecedor F 
JOIN Embarque E ON F.cod_fornec = E.cod_fornec 
JOIN Peça P ON E.cod_peça = P.cod_peça 
GROUP BY F.nome_fornec, P.nome_peça;
