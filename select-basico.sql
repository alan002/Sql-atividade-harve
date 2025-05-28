*Realize uma consulta que retorne o nome e time de todos os jogadores da tabela fifa. Quantos jogadores temos nessa
tabela?
select nome,time from fifa

select * from fifa where 1=2

*Realize uma consulta que retorne o nome e apenas os campos que permitem valores numéricos com casas decimais dos
jogadores da tabela fifa. Quantos campos temos nessa condição?

select nome, reputacao_internacional, camisa, controle_de_bola, arrancada, agilidade, equilibrio, energia, forca 
from fifa

*Realize uma consulta que retorno o nome e apenas os campos numéricos (int ou float) da tabela Bairros. Quantos
campos temos nessa condição?

select nome, numero_habitante, id, area 
from bairros 
