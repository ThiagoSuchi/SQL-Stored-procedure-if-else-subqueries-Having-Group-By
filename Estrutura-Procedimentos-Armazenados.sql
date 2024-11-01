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