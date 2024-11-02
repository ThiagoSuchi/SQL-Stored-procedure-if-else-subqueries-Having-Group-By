DELIMITER //
CREATE PROCEDURE idade(in idAluno int, out idade int, out resultado varchar(50))
begin
	declare dt datetime;
	set dt = (select alun_nascimento from alunos where alun_id = idAluno);
	set idade = year(now()) - year(dt);
        
	if(idade < 18)then
		set resultado = 'O aluno é menor de idade!';
    else
		set resultado = 'O aluno é de maior!';
    end if;
    
end //
DELIMITER ;

select*from alunos;
call idade(2, @idadeAluno, @maiorOuMenor);
select @idadeAluno, @maiorOuMenor;