-- Exercício 01 de BD:
DELIMITER //
create procedure atualizaPrecoLivro (in num_Livro varchar(50), in novo_Preco decimal(10,2))
begin

	declare livro varchar(50);
    
    select count(*) into livro
    from livros
    where numero = num_Livro;
    
    if livro = 0 then
		select 'Livro não existe' as mensagem;
	else 
		update livros
        set preco = novo_Preco
        where numero = num_Livro;
		
		select 'Atualizado com sucesso' as mensagem;
    end if;

end//
DELIMITER ;
drop procedure atualizaPrecoLivro;
call atualizaPrecoLivro(10277843, 20.00);
select*from livros;

-- Exercício 02 de BD:
DELIMITER $$
create procedure functionPrecoPercent (in salario decimal(10,2), in porcentAumento decimal(5,2), out novoSalario decimal(10,2))
begin

	set	novoSalario = salario + (salario * (porcentAumento / 100));

end $$
DELIMITER ; 

set @novoSalario = 0;
call functionPrecoPercent(1300.00, 10, @novoSalario);
select @novoSalario;