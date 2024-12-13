DELIMITER //
create procedure nomeSalarioFuncionario (out nome varchar(50), out salario int)
begin
	select f.nome, f.salario
    into nome, salario
    from funcionarios f;
end //
DELIMITER ;

call nomeSalarioFuncionario (@nome, @salario);
select @nome, @salario;

-- Laço de repetição - processos armazenados com loop
DELIMITER //
create procedure iterate_Procedure(limite tinyint unsigned)
begin
	declare contador tinyint unsigned default 0;
    declare soma tinyint unsigned default 0;
	iterando:loop
		set contador = contador + 1;
        set soma = soma + contador;
        if(contador < limite) then
			iterate iterando;
		end if;
        leave iterando;
	end loop;
    select soma;
end //
DELIMITER ;

call iterate_Procedure(10);

-- Laço de repetição - Processos armazenados com while
DELIMITER //
create procedure loopComWhile (limite tinyint unsigned)
begin
	declare contador tinyint default 0;
    lacoRepeticao: while contador < limite do-- o 'do' é faça em inglês, e faz parte da sintaxe do while.
		set contador = contador + 1;
        if mod(contador, 2) then-- O 'mod' é o % em outras linguagens, ou seja, ele pega o resto de uma dívisão.
			iterate lacoRepeticao;
		end if;
        select concat(contador, ' É um número par') as Valor;
	end while;
end //
DELIMITER ;

call loopComWhile(25);