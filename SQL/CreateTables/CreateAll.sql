-- CREATE FULL SCHEMA
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

-------------------------------------------------------------------------------
CREATE TABLE Dim_Diretorias (
    codigoDiretoria        serial PRIMARY KEY,
    nomeDiretoria          text UNIQUE,
    siglaDiretoria         text UNIQUE
);
-------------------------------------------------------------------------------
CREATE TABLE Dim_Unidades (
    codigoUnidade          serial PRIMARY KEY,
    nomeUnidade            text UNIQUE,
    siglaUnidade           text UNIQUE,
    codigoDiretoria        integer REFERENCES Dim_Diretorias     (codigoDiretoria)
);
-------------------------------------------------------------------------------
CREATE TABLE Dim_Mes (
    codigoMes              serial PRIMARY KEY,
    nomeMes                text UNIQUE
);
-------------------------------------------------------------------------------
CREATE TABLE Dim_FonteOrcamento (
    codigoFonteOrcamento   serial PRIMARY KEY,
    nomeFonteOrcamento     text UNIQUE
);
-------------------------------------------------------------------------------
CREATE TABLE Dim_Publico (
    codigoPublico          serial PRIMARY KEY,
    nomePublico            text UNIQUE
);
-------------------------------------------------------------------------------
CREATE TABLE Dim_Temas (
    codigoTema             serial PRIMARY KEY,
    nomeFonteOrcamento     text UNIQUE
);
-------------------------------------------------------------------------------
CREATE TABLE Dim_Tipo (
    codigoTipoEntrega      serial PRIMARY KEY,
    tipoEntrega            text UNIQUE
);
-------------------------------------------------------------------------------
CREATE TABLE Fato_Entregas (
    idEntrega              serial PRIMARY KEY,
    codigoTipoEntrega      integer REFERENCES Dim_Tipo           (codigoTipoEntrega),
    nome                   text,
    descricao              text,
    instituicoesEnvolvidas text,
    quantidade             text,
    codigoUnidadeLider     integer REFERENCES Dim_Unidades       (codigoUnidade),
    observacoes            text
);
-------------------------------------------------------------------------------
CREATE TABLE Entrega_Temas (
	idEntrega          integer REFERENCES Fato_Entregas      (idEntrega),
	codigoTema         integer REFERENCES Dim_Temas          (codigoTema)
);
-------------------------------------------------------------------------------
CREATE TABLE Entrega_Publicos (
	idEntrega          integer REFERENCES Fato_Entregas      (idEntrega),
	codigoPublico      integer REFERENCES Dim_Publico        (codigoPublico),
	detalhe            text
);
-------------------------------------------------------------------------------
CREATE TABLE Entrega_Orcamentos (
	idEntrega          integer REFERENCES Fato_Entregas      (idEntrega),
	codigoOrcamento    integer REFERENCES Dim_FonteOrcamento (codigoFonteOrcamento)
);
-------------------------------------------------------------------------------
CREATE TABLE Entrega_Meses (
	idEntrega          integer REFERENCES Fato_Entregas      (idEntrega),
	codigoMes          integer REFERENCES Dim_Mes            (codigoMes)
);
-------------------------------------------------------------------------------
CREATE TABLE Entrega_UnidadesParceiras (
	idEntrega          integer REFERENCES Fato_Entregas      (idEntrega),
	codigoUnidade      integer REFERENCES Dim_Unidades       (codigoUnidade)
);
