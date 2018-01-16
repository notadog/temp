insert into Dim_Diretorias (nomeDiretoria)
select 
	regexp_replace(
		regexp_replace(perguntacoluna, '3\) Unidades Parceiras \[[-> ]*', '')
	,']', '')
	from dadospuros.cabecalho
where perguntacoluna LIKE '3%Diretoria%'
order by 1
;

update Dim_Diretorias
	set siglaDiretoria='DEC'
	where nomeDiretoria = 'Diretoria de Educação Continuada'
;

update Dim_Diretorias
	set siglaDiretoria='DGI'
	where nomeDiretoria = 'Diretoria de Gestão Interna'
;

update Dim_Diretorias
	set siglaDiretoria='DPPG', nomeDiretoria='Diretoria de Pesquisa e Pós Graduação'
	where nomeDiretoria = 'Diretoria de Pesquisa e Pós'
;

update Dim_Diretorias
	set siglaDiretoria='INOVA'
	where nomeDiretoria = 'Diretoria de Inovação e Gestão do Conhecimento'
;

update Dim_Diretorias
	set siglaDiretoria='DFPE'
	where nomeDiretoria = 'Diretoria de Formação Profissional e Especialização'
;

select * from Dim_Diretorias order by 1;