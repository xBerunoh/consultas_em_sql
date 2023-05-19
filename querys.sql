/*1) Faça uma query que liste o nome do funcionário, nome do seu setor e o nome do seu cargo. */
SELECT
F.NOME AS "NOME"
,S.DESCRICAO AS "SETOR"
,C.DESCRICAO AS "CARGO"
FROM funcionarios F
LEFT JOIN cargos C ON C.ID = F.CARGO_ID
JOIN setores S ON S.ID = F.SETOR_ID


/* 2) Faça uma query que liste o nome do funcionário e a sua idade. */
SELECT
F.NOME AS "NOME"
,FLOOR(DATEDIFF(CURRENT_DATE(),F.data_nascimento) / 365) AS "IDADE"

FROM FUNCIONARIOS F

/* 3) Faça uma query que liste os funcionários demitidos. */

SELECT
F.NOME AS "NOME"
, f.data_demissao as "data da demissao"
FROM funcionarios F
WHERE F.data_demissao is not null

/* 4) Faça uma query que mostre o funcionário mais antigo que ainda está na empresa. */

SELECT
F.NOME AS "NOME"
,MIN(F.data_contratacao) AS "DATA CONTRATAÇÃO"

FROM funcionarios F
WHERE F.data_demissao IS NULL

GROUP BY F.NOME,F.data_contratacao
ORDER BY 2
LIMIT 1;

/* 5)  Faça uma query que some os salários de todos os setores e que saiba quais os setores que possuem o maior salário. */
SELECT
s.descricao as "nome_setor"
, SUM(f.salario) as "soma_salarios"

FROM setores s
JOIN funcionarios f on f.setor_id = s.id
GROUP BY s.descricao
ORDER BY  2 DESC

/* HAVING SUM(f.salario) = (
SELECT MAX(soma_salarios)
  FROM(
  SELECT SUM(f.salario) as "soma_salarios"
   FROM setores s
JOIN funcionarios f on f.setor_id = s.id
    GROUP BY s.descricao
  ) AS setores_salarios
); */

/* 6) Faça uma query que conte quantos funcionários foram demitidos. */
SELECT
 COUNT(f.data_demissao) as "Qts Demissões"

FROM  funcionarios f 
WHERE f.data_demissao is not null

/* 7) Faça uma query que some os salários do setor de RH sem usar o código do RH e sem usar uma subquery. */
SELECT
s.descricao as "nome_setor"
, SUM(f.salario) as "soma_salarios"

FROM setores s
JOIN funcionarios f on f.setor_id = s.id
WHERE s.descricao = 'RH'
GROUP BY s.descricao

/* 8) Faça uma query que mostre o salário de todos os responsáveis de setores. */
SELECT
f.NOME AS "Nome"
,c.descricao as "Nome do cargo"
,s.descricao as "Setor"
,f.salario as "Salarios"
,c.id as "id"

FROM setores s
JOIN funcionarios f on f.setor_id = s.id
left JOIN cargos c on c.id = f.cargo_id
where c.id in (4,8,6,7)

/* 9) Faça uma query que mostre os funcionários que farão aniversário nesse mês. */

SELECT  f.nome as "nome"
FROM funcionarios f
WHERE MONTH(f.data_nascimento) = MONTH(CURDATE());

/* 10) Faça uma query que mostre os funcionários que foram contratados no mesmo dia. */

SELECT data_contratacao
,GROUP_CONCAT(f.nome) AS funcionarios_contratados
FROM funcionarios f
GROUP BY data_contratacao
HAVING COUNT(*) > 1;

/*
SELECT data_contratacao
,GROUP_CONCAT(fnome) AS funcionarios_contratados
FROM funcionarios f
GROUP BY data_contratacao
HAVING COUNT(*) > 1;
*/

/* 11)  Faça uma query que preencha corretamente a matrícula em até 3 caracteres. */

SELECT LPAD(f.matricula, 3, '0') AS "Matricula"
FROM funcionarios f;

/* 12)   Faça uma query que mostre o tempo de empresa de todos os funcionários (inclusive dos demitidos). */
SELECT
    f.id
    ,f.nome
    ,f.data_contratacao
    ,DATEDIFF(CURRENT_DATE(), f.data_contratacao) AS "Tempo em dias"
  	 , FLOOR(DATEDIFF(CURRENT_DATE(), f.data_contratacao) / 30) AS "Tempo em meses"
	,FLOOR(DATEDIFF(CURRENT_DATE(), f.data_contratacao) / 365) AS "Tempo em anos"
FROM
    funcionarios f;

/* 13)  Faça uma query que verifica se o salário dos homens são maiores que o salário das mulheres para o mesmo cargo. */
SELECT
    c.descricao AS cargo,
    CASE
        WHEN SUM(CASE WHEN f.sexo = 'M' THEN f.salario END) >
             SUM(CASE WHEN f.sexo = 'F' THEN f.salario END)
        THEN 'Sim'
        ELSE 'Não'
    END AS salario_homens_maior
FROM
    funcionarios f
     JOIN cargos c ON f.cargo_id = c.id
	GROUP BY  c.descricao
