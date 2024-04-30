/*start transaction;
insert into empregado(cod_depto, nome, dt_nascimento, sexo, dt_admissao, civil, salario) values(1,'VICTOR SENA ICOMA','1981-10-31','M','2021-02-02','C',2800);
insert into dependente(cod_emp, nome, dt_nascimento, sexo) values(17,'LETÍCIA ICOMA','2003-12-08','F');
*/

/*select * from empregado where cod_emp = 17;*/
/*select * from dependente where cod_emp = 17;*/

/*rollback;
commit;
*/

/*drop trigger gatilho_exclusao_emp ;*/

/* td gatilho vai pedir um delimiter q vamos usar &&*/
delimiter &&
create trigger gatilho_exclusao_emp before delete /* tabela q comanda o gatilho mas nao pode usar nome tabela aqui delete_empregado on empregado  */ /*cria um gatilho qdo excluir empregado */
on empregado
for each row /* a cd linha q for deletada - linha por linha, cd linha de empregado q excluir irá executar*/
begin
	delete from dependente dep where dep.cod_emp = old.cod_emp;
end
&&


/*
start transaction;
delete from empregado where cod_emp=17;
select * from empregado;
select * from dependente;
rollback;
commit;

*/


