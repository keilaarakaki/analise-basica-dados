use empregados_db;
/*Operadores Matemáticos Baseados em Funções*/
/*documentação recomendada mysql docs originais - mysql docs - documentação oficial - bem complexa, complicada, toda em inglês, bem avançada*/
/*documentação mais simples w3schools.com/MySQL/default.asp*/

/*funções estatísticas */
/*acumuladores avg-entrega um valor numérico - média arimética ponderada */
/*atributo numerico salario*/
/*acumulador entrega de grupo*/
select avg(salario) as media_renda from empregado where sexo = 'F';
select avg(salario) as media_renda from empregado where sexo = 'M';

/*outras funções MIN e MAX*/
/*as rótulo da coluna da busca*/
select max(salario) as maior_renda, min(salario)as menor_renda from empregado where sexo = 'F';
select max(salario) as maior_renda, min(salario)as menor_renda from empregado where sexo = 'M';

/* max - min interseção dos salários*/
select (max(salario)-min(salario)) as inter_renda from empregado where sexo = 'F';
select (max(salario)-min(salario)) as inter_renda from empregado where sexo = 'M';

desc empregado;
describe empregado;

select sum(salario) as total_renda from empregado where sexo = 'F';
select sum(salario) as total_renda from empregado where sexo = 'M';

/*Funções de Formatação e Padronização         ---Modificação */
/*select nome from empregado;*/
select nome as empregado, salario as renda, format((salario * 0.12),2) as inss, format((salario * 0.15),2) as irpf from empregado;
/*retornar o número de caracateres para gerar um número*/
select char_length(nome) as tamanho_nome, (char_length(nome)+ (rand()* char_length(nome)) * cod_emp ) as id_aleatorio from empregado;
/*replace remove elementos dentro de uma string */
select replace(nome,"A","") as nome_modificado from empregado;
/*3 dados dinâmicos nome_modificado - funcional gerado pra exibição e dps desaparece nome é um dado nativo = nativo está na tab sgbd e dinamico é gerado*/
select 
	replace(nome,"A","") as nome_modificado,
    char_length(replace(nome,"A","")) as tamanho_nome, 
    (char_length(replace(nome,"A",""))+ (rand()* char_length(replace(nome,"A",""))) * cod_emp ) as id_aleatorio 
from empregado;

