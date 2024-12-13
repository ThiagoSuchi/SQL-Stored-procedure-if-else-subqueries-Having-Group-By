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

-- Iterando com processos armazenados
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