-- HAVING:
select e.hire_date, count(hire_date) as 'Data da contratação'
from employees e
group by e.hire_date
having count(hire_date) > 80;
-- O HAVING filtra grupos após serem formados com GROUP BY e pode utilizar funções de agregação (como COUNT, SUM, AVG).

select title, count(title) as 'Titulos'
from titles
group by title
having count(title) > 100000;

# Exercício 01 - Agrupe novamente os trabalhadores por data de contratação, porém exiba que tem menos ou 50 colaboradores contratados.
select hire_date, count(hire_date) as "Data de contratação"
from employees
group by hire_date
having count(hire_date) <= 50;

