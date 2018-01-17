INSERT INTO Dim_FonteOrcamento (nomeFonteOrcamento)
	SELECT	regexp_replace (
			regexp_replace (upper(perguntaColuna), '[A-Z 0-9\)Ç:]+\[', '')
		, '\]', '')
	FROM dadosPuros.cabecalho
	WHERE nomeColuna ~ '.*data_11[1-5]'
;
-------------------------------------------------------------------------------
INSERT INTO Dim_FonteOrcamento (nomeFonteOrcamento)
	SELECT DISTINCT regexp_replace(upper(concat(data_116, data_163, data_175) ), ' {2,}', ' ')
	from dadosPuros.dados
	where concat(data_116, data_163, data_175) != ''
	order by 1
;
-------------------------------------------------------------------------------
select * from Dim_FonteOrcamento;
