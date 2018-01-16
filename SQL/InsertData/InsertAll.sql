insert into Dim_Diretorias (codigoDiretoria, nomeDiretoria, siglaDiretoria)
values
	(1, 'Diretoria de Educação Continuada',                    'DEC'),
	(2, 'Diretoria de Formação Profissional e Especialização', 'DFPE'),
	(3, 'Diretoria de Gestão Interna',                         'DGI'),
	(4, 'Diretoria de Inovação e Gestão do Conhecimento',      'INOVA'),
	(5, 'Diretoria de Pesquisa e Pós-Graduação',               'DPPG'),
	(6, 'Gabinete',                                            'Gabin')
;

insert into Dim_Unidades (codigoUnidade, nomeUnidade, siglaUnidade, codigoDiretoria)
values
	(11,'Coordenação-Geral de Educação a Distância'                   ,,1)
	(12,'Coordenação-Geral de Educação Executiva'                     ,,1)
	(22,'Diretoria de Educação Continuada'                            ,,1)
	(9 ,'Coordenação-Geral de Capacitação de Altos Executivos'        ,,2)
	(13,'Coordenação-Geral de Especialização'                         ,,2)
	(14,'Coordenação-Geral de Formação'                               ,,2)
	(23,'Diretoria de Formação Profissional e Especialização'         ,,2)
	(15,'Coordenação-Geral de Gestão de Pessoas e Adm'                ,,3)
	(18,'Coordenação-Geral de Orçamento, Finanças e Contabilidade'    ,,3)
	(21,'Coordenação-Geral de Tecnologia da Informação'               ,,3)
	(24,'Diretoria de Gestão Interna'                                 ,,3)
	(8 ,'Coordenação-Geral de Articulação Institucional'              ,,4)
	(16,'Coordenação-Geral de Gestão do Conhecimento'                 ,,4)
	(17,'Coordenação-Geral de Inovação'                               ,,4)
	(25,'Diretoria de Inovação e Gestão do Conhecimento'              ,,4)
	(10,'Coordenação-Geral de Ciência de Dados'                       ,,5)
	(19,'Coordenação-Geral de Pesquisa'                               ,,5)
	(20,'Coordenação-Geral de Pós Graduação Stricto Sensu'            ,,5)
	(26,'Diretoria de Pesquisa e Pós'                                 ,,5)
	(1 ,'Assessoria de Comunicação'                                   ,,6)
	(2 ,'Assessoria Internacional'                                    ,,6)
	(3 ,'Auditoria Interna'                                           ,,6)
	(4 ,'Comissão De Ética'                                           ,,6)
	(5 ,'Comissão Gestora do Plano de Gestão de Logística Sustentável',,6)
	(6 ,'Comitê de Gênero'                                            ,,6)
	(7 ,'Comitê de Inclusão'                                          ,,6)
	(27,'Gabinete'                                                    ,,6)
	(28,'Procuradoria Federal'                                        ,,6)
;

insert into Dim_Tipo (codigoTipoEntrega, tipoEntrega)
values
	(1, 'Produto'),
	(2, 'Servico'),
	(3, 'Novo Servico'),
	(4, 'Aperfeicoamento')
;
