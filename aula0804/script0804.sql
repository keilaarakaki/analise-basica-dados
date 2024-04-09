use empregados_db;
/*Seletores Acumuladores e Filtros segue segmentação de ordem matemática, segue uma expressão matem tautologia segmentação bolinha cheia e vazia no 2 e 5 pra bolinha cheia coloca igual aí o segmento fará parte */
/*select * from departamento where cod_depto between 2 and 5;*/
select * from departamento where cod_depto >= 2 and cod_depto <= 5;
select * from departamento where cod_depto % 2 = 0; /*model 2 = 0 somente depto módulo 2 = 0 serão representados - somente pares*/
select * from departamento where cod_depto % 2 = 1; /*model 2 = 0 somente depto módulo 2 = 0 serão representados - somente ímpares*/

/*Acumuladores - count é uma função tem parâmetro*/
select count(*) as numero_depto, (2 + 3) as conta from departamento;
select count(*) numero_depto, (2 + 3) conta from departamento;
/* select count(*) numero_depto, (2 + 3) conta, nome from departamento;  --Error Code: 1140. In aggregated query without GROUP BY, expression #3 of SELECT list contains nonaggregated column 'empregados_db.departamento.nome'; this is incompatible with sql_mode=only_full_group_by	0.016 sec anacronismo tautológico - anomalia de dado*/
select count(*) as numero_depto from departamento;

/*ocultar colunas*/
select nome as Nome_Depto from departamento where cod_depto > 3;
select nome Nome_Depto from departamento where cod_depto > 3;


/*Prática de Acumulares e Filtros*/
select * from empregado;
select * from empregado where salario <= (1413 * 4);/*valor do salário mínimo*/
select nome from departamento;
select * from empregado where cod_depto = 1;
select * from empregado where cod_depto = (select cod_depto from departamento where nome = 'Informática');
select * from empregado where cod_depto in (1,2,5);/*in agrupador - não usar and nem or qdo o resultado for um vetor, uma linha vetorial de valores*/
select * from empregado where cod_depto not in (1,2,5);
select * from empregado where not salario <= (1413 * 4);/*valor do salário mínimo exibirá os que recebem mais q 4 SM*/

/*rastreadores que funcionam mais com strings vão percorrer unidades geralmente de string e vão rastrear se o dado q queremos está láxa*/
select * from empregado where nome like "ANA %";
select * from empregado where nome like "ANA%";
select * from empregado where nome like "%ANA%";
select * from empregado where nome like "%an%";