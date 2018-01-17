insert into Dim_Unidades (nomeUnidade)
select 
	regexp_replace(
		regexp_replace(perguntacoluna, '3\) Unidades Parceiras \[[-> ]*', '')
	,']', '')
	from dadospuros.cabecalho
where perguntacoluna LIKE '3%'
order by 1
;
-------------------------------------------------------------------------------
update Dim_Unidades
	set codigoDiretoria = (select codigoDiretoria from Dim_Diretorias
		where nomediretoria = 'Diretoria de Educação Continuada')
	where
		nomeUnidade = 'Diretoria de Educação Continuada' or
		nomeUnidade = 'Coordenação-Geral de Educação a Distância' or
		nomeUnidade = 'Coordenação-Geral de Educação Executiva'
;
-------------------------------------------------------------------------------
update Dim_Unidades
	set codigoDiretoria = (select codigoDiretoria from Dim_Diretorias
				where nomediretoria = 'Diretoria de Formação Profissional e Especialização')
	where
		nomeUnidade = 'Diretoria de Formação Profissional e Especialização' or
		nomeUnidade = 'Coordenação-Geral de Especialização' or
		nomeUnidade = 'Coordenação-Geral de Formação' or
		nomeUnidade = 'Coordenação-Geral de Capacitação de Altos Executivos'
;
-------------------------------------------------------------------------------
update Dim_Unidades
	set codigoDiretoria = (select codigoDiretoria from Dim_Diretorias
				where nomediretoria like 'Diretoria de Pesquisa e Pós%')
	where
		nomeUnidade = 'Diretoria de Pesquisa e Pós' or
		nomeUnidade = 'Coordenação-Geral de Ciência de Dados' or
		nomeUnidade = 'Coordenação-Geral de Pós Graduação Stricto Sensu' or
		nomeUnidade = 'Coordenação-Geral de Pesquisa'
;
-------------------------------------------------------------------------------
update Dim_Unidades
	set codigoDiretoria = (select codigoDiretoria from Dim_Diretorias
				where nomediretoria = 'Diretoria de Gestão Interna')
	where
		nomeUnidade = 'Diretoria de Gestão Interna' or
		nomeUnidade = 'Coordenação-Geral de Gestão de Pessoas e Adm' or
		nomeUnidade = 'Coordenação-Geral de Orçamento, Finanças e Contabilidade' or
		nomeUnidade = 'Coordenação-Geral de Tecnologia da Informação'
;
-------------------------------------------------------------------------------
update Dim_Unidades
	set codigoDiretoria = (select codigoDiretoria from Dim_Diretorias
				where nomediretoria = 'Gabinete')
	where
		nomeUnidade = 'Gabinete' or
		nomeUnidade = 'Assessoria de Comunicação' or
		nomeUnidade = 'Assessoria Internacional' or
		nomeUnidade = 'Auditoria Interna' or
		nomeUnidade = 'Procuradoria Federal'
;
-------------------------------------------------------------------------------
update Dim_Unidades
	set codigoDiretoria = (select codigoDiretoria from Dim_Diretorias
				where nomediretoria = 'Diretoria de Inovação e Gestão do Conhecimento')
	where
		nomeUnidade = 'Diretoria de Inovação e Gestão do Conhecimento' or
		nomeUnidade = 'Coordenação-Geral de Gestão do Conhecimento' or
		nomeUnidade = 'Coordenação-Geral de Inovação' or
		nomeUnidade = 'Coordenação-Geral de Articulação Institucional'
;
-------------------------------------------------------------------------------
update Dim_Unidades
	set codigoDiretoria = (select codigoDiretoria from Dim_Diretorias
				where nomediretoria = 'Comitês')
	where
		nomeUnidade = 'Comissão De Ética' or
		nomeUnidade = 'Comissão Gestora do Plano de Gestão de Logística Sustentável' or
		nomeUnidade = 'Comitê de Gênero' or
		nomeUnidade = 'Comitê de Inclusão'
;
-------------------------------------------------------------------------------
update Dim_Unidades set nomeUnidade = 'Coordenação-Geral de Gestão de Pessoas e Administração'
where nomeUnidade LIKE '%Gestão de Pessoas e Adm';
-------------------------------------------------------------------------------
update Dim_Unidades set nomeUnidade = 'Diretoria de Pesquisa e Pós-Graduação'
where nomeUnidade LIKE '%Pesquisa e Pós';
-------------------------------------------------------------------------------
update Dim_Unidades
    set siglaUnidade='CGEAD' where nomeUnidade = 'Coordenação-Geral de Educação a Distância';
update Dim_Unidades
    set siglaUnidade='CGEE' where nomeUnidade = 'Coordenação-Geral de Educação Executiva';
update Dim_Unidades
    set siglaUnidade='DEC' where nomeUnidade = 'Diretoria de Educação Continuada';
update Dim_Unidades
    set siglaUnidade='CGCAE' where nomeUnidade = 'Coordenação-Geral de Capacitação de Altos Executivos';
update Dim_Unidades
    set siglaUnidade='CGE' where nomeUnidade = 'Coordenação-Geral de Especialização';
update Dim_Unidades
    set siglaUnidade='CGF' where nomeUnidade = 'Coordenação-Geral de Formação';
update Dim_Unidades
    set siglaUnidade='DFPE' where nomeUnidade = 'Diretoria de Formação Profissional e Especialização';
update Dim_Unidades
    set siglaUnidade='CGGPA' where nomeUnidade = 'Coordenação-Geral de Gestão de Pessoas e Administração';
update Dim_Unidades
    set siglaUnidade='CGOFC' where nomeUnidade = 'Coordenação-Geral de Orçamento, Finanças e Contabilidade';
update Dim_Unidades
    set siglaUnidade='CGTI' where nomeUnidade = 'Coordenação-Geral de Tecnologia da Informação';
update Dim_Unidades
    set siglaUnidade='DGI' where nomeUnidade = 'Diretoria de Gestão Interna';
update Dim_Unidades
    set siglaUnidade='CGAI' where nomeUnidade = 'Coordenação-Geral de Articulação Institucional';
update Dim_Unidades
    set siglaUnidade='CGGC' where nomeUnidade = 'Coordenação-Geral de Gestão do Conhecimento';
update Dim_Unidades
    set siglaUnidade='CGI' where nomeUnidade = 'Coordenação-Geral de Inovação';
update Dim_Unidades
    set siglaUnidade='INOVA' where nomeUnidade = 'Diretoria de Inovação e Gestão do Conhecimento';
update Dim_Unidades
    set siglaUnidade='CGCD' where nomeUnidade = 'Coordenação-Geral de Ciência de Dados';
update Dim_Unidades
    set siglaUnidade='CGP' where nomeUnidade = 'Coordenação-Geral de Pesquisa';
update Dim_Unidades
    set siglaUnidade='CGPGSS' where nomeUnidade = 'Coordenação-Geral de Pós Graduação Stricto Sensu';
update Dim_Unidades
    set siglaUnidade='DPPG' where nomeUnidade = 'Diretoria de Pesquisa e Pós Graduação';
update Dim_Unidades
    set siglaUnidade=NULL where nomeUnidade = 'Comissão De Ética';
update Dim_Unidades
    set siglaUnidade=NULL where nomeUnidade = 'Comissão Gestora do Plano de Gestão de Logística Sustentável';
update Dim_Unidades
    set siglaUnidade=NULL where nomeUnidade = 'Comitê de Gênero';
update Dim_Unidades
    set siglaUnidade=NULL where nomeUnidade = 'Comitê de Inclusão';
update Dim_Unidades
    set siglaUnidade='ASCOM' where nomeUnidade = 'Assessoria de Comunicação';
update Dim_Unidades
    set siglaUnidade='AI' where nomeUnidade = 'Assessoria Internacional';
update Dim_Unidades
    set siglaUnidade='AUDIN' where nomeUnidade = 'Auditoria Interna';
update Dim_Unidades
    set siglaUnidade='GABIN' where nomeUnidade = 'Gabinete';
update Dim_Unidades
    set siglaUnidade='PF' where nomeUnidade = 'Procuradoria Federal';


select * from Dim_Unidades order by 4,1;
select * from Dim_Diretorias order by 1;

select codigoUnidade, nomeUnidade, siglaUnidade, nomeDiretoria, siglaDiretoria
from Dim_Unidades, Dim_Diretorias
where Dim_Unidades.codigoDiretoria = Dim_Diretorias.codigoDiretoria
and nomeUnidade = nomeDiretoria
order by 1
