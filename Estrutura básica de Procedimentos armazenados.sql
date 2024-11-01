-- DELIMITER é um comando usado no MySQL para definir um novo delimitador temporário.
-- OBS: O delimitador padrão é ponto e vírgula (;), mas ao criar uma procedure (ou função) que contém múltiplos comandos SQL, usamos um delimitador diferente (neste caso, //) para evitar que o MySQL interprete cada linha como um comando separado.
DELIMITER //
create procedure github(in commites varchar(50))
begin 
	-- 'declare' declara uma variável x com um tipo VARCHAR de até 50 caracteres.
	declare x varchar(50);
    -- 'set' atribui o valor 'github.com/ThiagoSuchi' à variável x.
	set x = 'github.com/ThiagoSuchi';
    -- 'select' exibe o valor da variável x. Como se fosse um return.
    select x,commites;

end //
DELIMITER ;

-- 'call' executa a procedure github.
call github('Comitando arquivos SQL'); 

-- Tudo dentro de BEGIN e END será executado quando a procedure for chamada.