-- UNION:
select dept_no from departments
union select dept_no from dept_emp;

insert into departments values('d010', 'SEO');
-- OBS: As colunas precisam ter o mesmo nome.
-- 	 O operador UNION é usado para combinar o resultado de duas ou mais subconsultas (subqueries) em uma 
-- única lista de resultados.

-- UNION ALL:
select dept_no from departments
union all select dept_no from departments;
-- 	 UNION ALL retorna todos os resultados, sem remover duplicatas, o que pode ser útil para análises onde 
-- os dados duplicados têm significado.


-- GROUP BY:
select gender, count(gender) as 'Qtd por gênero'
from employees
group by gender;
-- 	 O objetivo do GROUP BY é permitir que você resuma ou agregue dados, mostrando apenas um resultado 
-- por grupo em vez de uma linha para cada registro.
-- 	 O GROUP BY é uma cláusula SQL que agrupa linhas que têm valores em comum em uma ou mais colunas e 
-- é frequentemente usado em conjunto com funções de agregação, como COUNT, SUM, AVG, MIN, e MAX.


# Exercício 01 - Agrupe os trabalhadores por data de contratação, para ver se muitas pessoas foram contratadas
-- no mesmo dia. Dica a coluna é hire_date;
select e.hire_date, count(hire_date) as 'Data da contratação:'
from employees e
group by e.hire_date
order by count(e.hire_date) desc;





