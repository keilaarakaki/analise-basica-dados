/*Encadeamento de chaves relativas-relacionais - composição - select composto - composto por 2 tabelas*/
/*lados-checar left e right-tab externa p interna - forte fraco - left fraco dpto possui empregados*/
/*estrutura*/
/*chave 1 para mtos - 1 empre p/ cd depto - 1 depto tem mtos empregados*/
/*depto é left e empregado é right*/
/*aqui o contexto é indiferente, não tem peso, o resultado não muda, a pesquisa está sem peso*/
/*com o join muda, quem está após join é left, quem está antes, é right*/
/*left join-todos q estão dentro do campo, espaço amostral-campo amostral-*/
/*multiplos de 14 são de 7, mas nem todos os de 7 são de 14*/
/*todos os unos são fiat, mas nem todos os fiats são uno*/
/*concatenção inner-qdo 2 grupos tem conincidencias concatenadas*/
/*mult 8 e 2 sao pares existem pares em tds grupos*/
/*fulano pertence ao depto tal*/
/*right é quem possui - quem fornece a caso estrangeira é right*/
/*quem recebe a chave estrangeira é left*/
/*qdo troca inner é pra trocar o campo amostral */
use empregados_db;

select 
	emp.nome as empregado, 
    emp.cod_depto as codigo_departamento,
    depto.nome as departamento,    
    depto.cod_depto as departamento_numero
from 
empregado emp, 
departamento depto 
where 
	depto.cod_depto = emp.cod_depto;
    
/*reversão*/    
/*Join Inner e Left*/
/*lado q escrevemos empregado esq dependente direita*/
/*usaremos os agrupadores com mais sensibilidade*/
/*quem tem 1 p/ mtos = empregados tem mtos dep*/
/*right é quem tem foreing key
left é quem tem a primary key
comecei fazendo o empregado-left 
dps fiz o dependente é o right*/
SELECT 
    emp.nome as empregado, 
    count(dep.cod_emp) as dependentes /*sempre conta pela chave primária pois certeza q não dará erro*/
FROM
    empregado emp
        INNER JOIN
    dependente dep
WHERE
    emp.cod_emp = dep.cod_emp
group by emp.nome;    /*agrupador pelo nome do empregado, se não colocar.... olhar p/ tab left e agrupar por cada agrupamento relacional*/