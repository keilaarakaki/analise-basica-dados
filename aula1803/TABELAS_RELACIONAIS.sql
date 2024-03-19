create database empregados; -- pra tabela existir, precisa do bd
use empregados;
create table departamento(
	cod_depto int not null auto-increment, --vamos estipular que vai autocrescer, que é auto-increment --unicidade signfica q chave é unica e obrigatório
    nome varchar(30) not null,
    contraint pk_departamento primary_key(cod_depto)
);
