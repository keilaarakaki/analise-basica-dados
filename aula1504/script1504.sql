/*subquery retorna um vetor pra usarmos dentro de outra query-usamos chaves entrelaçadas entre 2 unidades*/
use empregados_db;

select * from empregado where cod_depto in(
select cod_depto from departamento where cod_depto % 2 = 0
);
/*extração com subQuery*/
select * from empregado where cod_depto in(
select cod_depto from departamento where cod_depto < 2
);
/*quero listar tds deptos pares*/
/*select * from departamento where cod_depto % 2 = 0;*/
/* pra transformar em vetor:*/
/*select cod_depto from departamento where cod_depto % 2 = 0;*/

/* tds empregados dentro dos deptos que o código é par*/
/*uso esse vetor dentro de outra query, dentro da select do empregado*/


/*cálculo com datas - data não usa conj decimal, usa conj específico, conj de data*/
/*select *, format((datediff(now(),dt_nascimento)/365),0) as idade from dependente ; /*cálculo da idade do dependente*/
select *, truncate((datediff(now(),dt_nascimento)/365),0) as idade from dependente ; /*cálculo da idade do dependente*/
select b.cod_emp from dependente b where (truncate((datediff(now(),b.dt_nascimento)/365),0) < 5); 

/*ceil() ou ceiling- arrendondar para cima; 
floor() - arrendondar para baixo;*/
SELECT *, FLOOR(DATEDIFF(NOW(), dt_nascimento) / 365) AS idade FROM dependente;
select *, floor(datediff(now(), dt_nascimento) / 365) as idade from dependente;
select *, ceiling(datediff(now(), dt_nascimento) / 365) as idade from dependente;


select a.nome from empregado a where a.cod_emp in (
select b.cod_emp from dependente b where (truncate((datediff(now(),b.dt_nascimento)/365),0) < 10)); 

select a.nome from empregado a where a.cod_emp in (
select b.cod_emp from dependente b where (floor(datediff(now(),b.dt_nascimento)/365) < 18)); 

select a.cod_emp, a.nome Empregado, b.nome Dependente, floor(datediff(now(),b.dt_nascimento)/365) idade from empregado a, dependente b 
where a.cod_emp = b.cod_emp and (floor(datediff(now(),b.dt_nascimento)/365) < 10); 