/* case, when, then - a partir de um valor nativo posso separar por caso de evidencia - como o swicth cas do java*/
select *, 
case 
	when salario > (1413 * 2) then (salario * 1.107)
    else (salario * 1.15)
end as aumento    
from empregado;


/* usando // como delimitador - vai dar um dissídio, para func de acordo com regra salarial */
/* os empr q tem salário >= 2 sal min - 7%, menor q 2 sm 15% */
/* variáveis no bd */
/*sps - só pesq state procedure select - só pesq, não altera nada no bd/ spu state procedure update - padrão de nomenclatura*/
/* entrará na procedure uma taxa do tp decimal/*
	/* dissídio nao é um dado nativo, preciso calcular e guardar antes de fazer update, como uma variável mas é uma tabela temporária */
/* baseada numa select + campo salario*/
/* equidade salarial*/
/*para aparecer pra gente antes dela morrer*/
/*subquery*/


/* ESTE ESTÁ INCORRETO */
delimiter //  
create procedure spu_dissidio_anual(in taxa1 decimal, in taxa2 decimal, in minimo decimal) 				
begin
    create temporary table tmp_dissidio_anual 
    select *, 
		case 
			when (salario > (minimno * 2)) then (salario * taxa1) 
			else (salario * taxa2)
		end as aumento
    from empregado;
    
/*    select * from tmp_dissidio_anual; */
    
    start transaction;
    
    UPDATE empregado emp
    JOIN tmp_dissidio_anual temp ON emp.cod_emp = temp.cod_emp
    SET emp.salario = temp.aumento;
    
    /*update empregado 
    set salario = (select temp.aumento from tmp_dissidio_anual temp, empregado emp where emp.cod_emp = temp.cod_emp)
    where cod_emp = (select temp.cod_emp from tmp_dissidio_anual temp, empregado emp where emp.cod_emp = temp.cod_emp);*/
    
    select * from empregado;
    drop table tmp_dissidio_anual;    
end	
//

/* ESTE É O CORRETOOOOOOOOOOOOOOOOOOOO */
delimiter //
create procedure spu_dissidio_anual(in taxa1 decimal, in taxa2 decimal, in minimo decimal)
begin
	create temporary table tmp_dissidio_anual
    select *, 
		case
			when (salario > (minimo * 2)) then (salario * taxa1)
			else (salario * taxa2)
		end as aumento
	from empregado;
    
    start transaction;
	update empregado emp
    join tmp_dissidio_anual temp ON emp.cod_emp = temp.cod_emp
    set emp.salario = temp.aumento;
select * from empregado;
drop table tmp_dissidio_anual;
end
//

call spu_dissidio_anual(1.07, 1.15, 1412.12);
