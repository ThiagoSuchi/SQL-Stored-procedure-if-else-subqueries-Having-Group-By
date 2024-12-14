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

-- Laço de repetição - Processos armazenados com repeat
 DELIMITER //
create procedure loopComRepeat (limite tinyint unsigned)
begin
	declare contador tinyint unsigned default 0;--  Ao aplicar UNSIGNED, você elimina a capacidade de armazenar números negativos, aumentando a faixa de valores positivos disponíveis.
    declare soma int default 0;
    repeat
		set contador = contador + 1;
        set soma = soma + contador;
	until contador >= limite -- è a condição que faz parte da sintaxe de repeat, serve para para sair do loop quando atender o parâmetro.
    end repeat;
    select soma;
end //
DELIMITER ;

call loopComrepeat(10);
 
-- Ou pode ser feito uma verificação com if para tornar o código intuitivo.
DELIMITER //
create procedure loopComRepeatIf(limite tinyint unsigned)
main: begin
	declare contador tinyint unsigned default 0;
    declare soma tinyint default 0;
    if limite < 1 then
		select 'O valor ínserido deve ser maior que zero' as Erro;
        leave main;
	end if;
    repeat
		set contador = contador + 1;
        set soma = soma + contador;
	until contador >= limite
    end repeat;
    select soma;
end //
DELIMITER ;

call loopComRepeatIf(10);
