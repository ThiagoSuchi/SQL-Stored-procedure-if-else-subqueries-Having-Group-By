# Questão 1:
DELIMITER //
create procedure selecionarLivro (in id_livro int)
begin

	select
    l.titulo as Livro,
    e.nome_editora as Editora,
    a.nome as Autor
    from
    livros as l
    inner join 
    editoras as e on l.codigo_editora = e.codigo_editora
    inner join
    livros_autores as la on l.numero = la.numero_livro
    inner join
    autores as a on la.codigo_autor = a.codigo
    where
    l.numero = id_livro;
    
end // 
DELIMITER ;

call selecionarLivro(10277843);

-----------------------------------------------------------------------------------------------
# Questão 2:
DELIMITER //
create procedure cadastroFuncionario (in f_CPF varchar(11),
									   in f_nome varchar(100),
                                        in f_endereco varchar(200),
                                         in f_telefone varchar(15),
                                          in f_salario decimal(10, 2),
                                           in f_funcao varchar(50))
begin

	if exists (select 1 from funcionarios where CPF = f_CPF) then
		select 'Funcionáro já cadastrado!';
	else
		insert into funcionarios (CPF, nome, endereco, telefone, salario, funcao)
        values (f_CPF, f_nome, f_endereco, f_telefone, f_salario, f_funcao);
	end if;
    
end //
DELIMITER ;
call cadastroFuncionario('0519229203', 'Thiago Hens Suchi', 'Jardim América - Rua Vila Nova num 504', '98434-1888', 2500, 'Dev Back-end');

-------------------------------------------------------------------------------------------------
# Questão 3:
DELIMITER $$
create procedure deletarLivro (in id_Livro int)
begin

	declare contagem int;
    select count(*) into contagem
    from livros
    where numero = id_Livro;
    if contagem = 0 then
		select 'Exclusão não realizada livro inexistente!';
	else 
		delete from livros
        where numero = id_Livro;
        select 'Excluído com sucesso!';
	end if;
    
end$$
DELIMITER ;

select*from livros;
call deletarLivro(67554421);

--------------------------------------------------------------------------------------------------------
# Questão 4:
DELIMITER $$
create procedure atualizaLivro (in id_Livro int,
								 in l_preco decimal(10, 2))
begin

	declare contagem int;
    select count(*) into contagem
    from livros
    where numero = id_Livro;
    if contagem = 0 then
		select 'Livro inexistente';
	else
		update livros
        set preco = l_preco
        where numero = id_Livro;
        select 'Atualizado com sucesso!';
	end if;
    
end $$
DELIMITER ;

select*from livros;
call atualizaLivro(32176500, 72.25);