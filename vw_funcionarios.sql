CREATE or replace VIEW vw_funcionarios (nome,idade,matricula, nome_do_cargo,data_contratacao,data_demissao,nome_setor,anos_de_empresa)
 as
 
 with funcionarios	as 
 (SELECT
	f.nome  as "nome"
    ,FLOOR(DATEDIFF(CURRENT_DATE(), f.data_nascimento) / 365) as "IDADE"
    ,f.matricula as "matricula"
    ,f.cargo_id
    ,f.data_contratacao as "data_contratacao"
    ,f.data_demissao as "data_demissao"
    ,f.setor_id
    ,FLOOR(DATEDIFF(CURRENT_DATE(), f.data_contratacao) / 365) AS "anos_de_empresa"
    
     FROM funcionarios f
	
),
cargo as 
(
SELECT
c.descricao as "nome_do_cargo"
,c.id
FROM cargos c
),
setor as
(
SELECT
s.descricao as "nome_do_setor"
,s.id 
from setores s
)



select f.nome, f.idade , f.matricula ,c.nome_do_cargo, f.data_contratacao , f.data_demissao, s.nome_do_setor , f.anos_de_empresa
 FROM funcionarios f  
left JOIN cargo c ON c.id = f.cargo_id 
JOIN setor s on s.id = f.setor_id;