-- SUBQUERY: 
-- 	 Subqueries, ou subconsultas, são consultas SQL aninhadas dentro de outras consultas SQL. 
-- Elas são usadas para obter resultados intermediários que podem ser usados pela consulta principal,
-- permitindo construir consultas mais complexas e obter dados de forma indireta. Subqueries podem ser 
-- usadas em várias cláusulas, como SELECT, FROM, WHERE, HAVING, e até mesmo JOIN, dependendo do contexto e 
-- do banco de dados.
select first_name, (select sum(salary)
					from salaries s
                    where employees.emp_no = s.emp_no) as soma_salario from employees;


                    
-- Subquery - selecionar os filmes que tem a maior duração
select title 
from film
where length = 
		 (select max(length)
		  from film);

select * from film;

-- Exercício 01 - Selecionar filmes com o tempo de aluguel acima da media AVG
select title, rental_duration
from film 
where rental_duration > 
                (select avg(rental_duration)
				 from film);
        
-- Média:
select avg(rental_duration)
from film;