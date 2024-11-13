# Porcedimentos Armazenados
-- Sintaxe da criação de procedimentos:
create procedure nome_procedimento (parametros) declaracoes;

-- Invocando o procedimento:
call nome_procedimento (parametro);

-- Criando procedimento:
create procedure verPreco (varLivro smallint)
select concat('O preço é ', Preco_Livro) as Preco
from tbl_Livro
where ID_Livro = varLivro;

-- Invocando no procedimento:
call verPreco(3);

-- Excluindo Procedimento:
drop procedure verPreco;

-- Stored procedure sem argumento:
DELIMITER //
create procedure select_all_active_users ()
begin

	select * from customer
    where active = 1;

end //
DELIMITER ;

call select_all_active_users();

-- Stored procedure com argumento:
DELIMITER //
create procedure get_movies_from_category (in category_name varchar(100))
begin

	select f.title, c.name
    from film f
	inner join film_category
    using(film_id)
    inner join category c
    using(category_id)
    where c.name = category_name;
    
end //
DELIMITER ;

set @category = 'Comedy';
call get_movies_from_category(@category);
select * from category;

-- Exercício 01 - Crie uma procedure que entrega filmes maior ou igual a um rental_duration que vem de um argumento
DELIMITER //
create procedure film_Duration (in duration int)
begin

	select title, rental_duration
    from film
    where rental_duration >= duration;

end //
DELIMITER ;

call film_Duration(6);
select * from film;
