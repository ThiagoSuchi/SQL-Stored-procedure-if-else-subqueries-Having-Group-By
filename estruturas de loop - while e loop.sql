-- LOOP WHILE:
DELIMITER //
create procedure loopWhile (out soma int)
begin
	
    declare x int default 0;
    
	while(x < 10)do
		set x = x + 1;
	end while;
    
	set soma = x;
    
end //
DELIMITER ;

call loopWhile(@ret);
select @ret;

-- Ou posso fazer o mesmocodigo mais de maneira mais intuitiva:
DELIMITER //
create procedure loopWhile2 (in max int, out soma int)
begin
	
    declare x int default 0;
    
	while(x < max)do
		set x = x + 1;
	end while;
    
	set soma = x;
    
end //
DELIMITER ;

drop procedure loopWhile2;
call loopWhile2(20, @res);
select @res;

-- LOOP LOOP:
DELIMITER //
create procedure loopLoop (in max int, out soma int)
begin
	
    declare x int default 0;
    
    meuloop:loop
		if(x >= max)then
			leave meuloop;
		end if;
        set x = x + 1;
    end loop;	
    
    set soma = x;
    
end //
DELIMITER ;

drop procedure loopLoop;
call loopLoop(200, @result);
select @result;