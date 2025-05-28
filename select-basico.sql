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
* Foi estabelecido um novo critério para pontuação geral, seguindo a fórmula abaixo:
(32.4+2*PONTUACAO_GERAL/3.1)
Aplique ela e diga qual é a pontuação geral nova dos 3 primeiros jogadores?

select nome, (32.4+2*PONTUACAO_GERAL/3.1) as pontuacao from fifa limit 3

* A metragem dos bairros estava incorreta. Faça uma correção no select aumentando em 120 a população de cada
bairro

select numero_habitante, (numero_habitante + 120) as habitantescom120 
from bairros

*Faça a soma dos campos de controle de bola, arrancada e agilidade e divida por 3 para trazer uma média dos 3 atributos
por jogador?

select (controle_de_bola + arrancada + agilidade) /3 as resultado 
from fifa

* Queremos saber qual é o bairro mais denso de curitiba. Para isso, realize uma pesquisa na tabela bairros diivdindo o
número de pessoas pela área (km/2). Qual é o bairro mais denso em população?

select nome, (numero_habitante/area) as resultado from bairros

*Quantos jogadores temos com mais de 35 anos?

select nome, idade from fifa where idade > 35

*Quantos jogadores temos com pontuação geral maior que 90?

select nome, pontuacao_geral from fifa where pontuacao_geral > 90 order by pontuacao_geral desc

*Analisando os dados do 156, traga os bairros que tiveram problema com morcegos.

select BAIRRO_ASS, SUBDIVISAO from chamados156 where SUBDIVISAO='Morcegos'

* Quantos jogadores temos com mais de 38 anos e que possuem mais de 80 na pontuação geral na tabela fifa?

select * from fifa where idade > 38 and pontuacao_geral >80

* Quantos jogadores temos da itália que jogam em um dos principais times de lá, juventus ou milan?

select nome, id_nacionalidade  from fifa where id_nacionalidade = 112 and (time='juventus' or time ='Milan')

*função 'in' para usar como lista para facilitar a pesquisa
select nome, id_nacionalidade  from fifa where id_nacionalidade = 112 and time in('juventus','milan')

*Quantos jogadores possuem energia a partir de 60, idade maior que 30 anos e que não jogam nas posições de
atacante e zagueiro.
select * from nacionalidade
select nome, energia, idade, posicao from fifa where energia >= 60 and idade > 30 and not(posicao='zagueiro' )and not (posicao='atacante')

* Realize uma consulta do nome e pontuação dos jogadores, mas renomeie estes campos com outros nomes(sugestão:
para o inglês)
select nome as name, pontuacao_geral as point from fifa 

* Crie no select um campo que representa a densidade populacional por bairro e especifique para ele como nome:
densidadebairro.

select numero_habitante as densidadedebairro, nome from bairros

* Na tabela de chamados do 156 quantos registros tem o campo orgão nulos?

select * from chamados156 where orgao is not null

* Jogadores sem time são uma ótima oportunidade de compra. Encontre os jogadores sem time e que tenham
pontuação geral maior ou igual a 80.

* Quantas são e quais as posições possíveis para os jogadores?
select distinct(posicao) from fifa  

* Quais são as categorias possíveis na tabela do 156?
select distinct(Tipo) from chamados156

*Qual o jogador com maior arrancada?
select nome,arrancada from fifa order by arrancada desc

*Qual jogador da Roma tem o maior potencial?
select nome,potencial,time from fifa where time ='roma' order by potencial desc

* Quem tem a maior média de energia, jogadores da Juventus ou do Milan?

select avg(energia),time from fifa where time ='juventus' 
72.76
select avg(energia),time from fifa where time ='Milan'
68.5925925925926  

* Quanto é a soma de pontuação geral dos jogadores do Everton?
select sum(pontuacao_geral),time from fifa where time='everton'

* Quantos times tem Atletico em seu nome?
select count(*),nome , time   from fifa where time like'%atletico%'

* Quais jogadores que jogam em posições da direita do campo e o nome do time começa com a letra A?
select nome,posicao from fifa where (posicao) like'%direit%' and (time)like'a%'

* Quais são os jogadores com a maior pontuação geral no Brasil e na Argentina?
select fifa.nome, fifa.pontuacao_geral, nacionalidade.pais 
from fifa join nacionalidade on fifa.id_nacionalidade = nacionalidade.id 
where nacionalidade.pais in('Brasil','Argentina') order by fifa.pontuacao_geral desc

* Calcule a quantidade de jogadores, separados por país,no time da Roma?
select fifa.time, nacionalidade.pais, count(nacionalidade.pais) as quantidade 
from fifa 
join nacionalidade on fifa.id_nacionalidade = nacionalidade.id 
where fifa.time = 'Roma' 
group by fifa.time, nacionalidade.pais
order by quantidade desc

* Selecione os chamados do 156 retornando o número da solicitação,bairro e area do bairro associado a coluna
bairro_ass. Porém retornando também os registros que tem bairro_ass nulo.
select c.solicitacao, c.bairro_ass, b.area 
from chamados156 c left join bairros b on c.bairro_ass = b.nome 
order by b.nome

* Os jogadores da Ásia tiveram a pontuação geral aumentada em 1 a mais devido a um erro do sistema. Como ficaria
agora a média geral da pontuação geral juntando os jogadores da Ásia com os demais?
select avg(pontuacao_geral) as pontuacao
from fifa f
join nacionalidade n on f.id_nacionalidade = n.id
where n.continente = 'Asia'
union all 
select avg(pontuacao_geral) from fifa f join nacionalidade n on f.id_nacionalidade = n.id

* Imprima a data do chamado no 156 no formato mês e ano.
select (date_format(dt_nasc,"%m-%y")) as data_formatada from funcionario 

* Selecione os jogadores do Brasil com peso acima de 150 lbs. Quantos são?
select f.nome, replace(f.peso,'lbs','kg') as peso, n.pais  
from fifa f 
join nacionalidade n on f.id_nacionalidade = n.id
where n.pais = 'Brazil' and replace(cast(peso as integer),'lbs','')  > 150 
order by f.peso

* Qual país da europa tem a média de pontuação geral mais alta? E quais são o segundo e o terceiro colocado?

select n.pais, avg(f.pontuacao_geral)
from fifa f 
join nacionalidade n 
on f.id_nacionalidade = n.id
where n.continente = 'europa'
group by  n.pais
order by 2 desc

* comando para não traser as informações null
select coalesce(orgao,'sem dados') from chamados156
* por padrão as informações aparecem "null"
select orgao from chamados156
