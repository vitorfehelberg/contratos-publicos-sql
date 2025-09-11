DROP SCHEMA IF EXISTS bronze CASCADE;

CREATE SCHEMA IF NOT EXISTS bronze;

CREATE TABLE IF NOT EXISTS bronze.contracts ( 
    id VARCHAR,
    receita_despesa VARCHAR, 
    numero VARCHAR, 
    orgao_codigo VARCHAR, 
    orgao_nome VARCHAR, 
    unidade_codigo VARCHAR, 
    esfera VARCHAR, 
    poder VARCHAR, 
    sisg VARCHAR, 
    gestao VARCHAR, 
    unidade_nome_resumido VARCHAR, 
    unidade_nome VARCHAR, 
    unidade_origem_codigo VARCHAR, 
    unidade_origem_nome VARCHAR, 
    fornecedor_tipo VARCHAR, 
    fornecedor_cnpj_cpf_idgener VARCHAR, 
    fornecedor_nome VARCHAR, 
    codigo_tipo VARCHAR, 
    tipo VARCHAR, 
    categoria VARCHAR, 
    processo VARCHAR, 
    objeto VARCHAR, 
    fundamento_legal VARCHAR, 
    informacao_complementar VARCHAR, 
    codigo_modalidade VARCHAR, 
    modalidade VARCHAR, 
    unidade_compra VARCHAR, 
    licitacao_numero VARCHAR, 
    data_assinatura VARCHAR, 
    data_publicacao VARCHAR, 
    vigencia_inicio VARCHAR, 
    vigencia_fim VARCHAR, 
    valor_inicial VARCHAR, 
    valor_global VARCHAR, 
    num_parcelas VARCHAR, 
    valor_parcela VARCHAR, 
    valor_acumulado VARCHAR, 
    situacao VARCHAR, 
    raw_line VARCHAR, 
    ingestao_data TIMESTAMP DEFAULT NOW(), 
    ingestao_origem VARCHAR DEFAULT 'comprasnet-contratos-anual-contratos-latest.csv', 
    ingestao_usuario VARCHAR DEFAULT CURRENT_USER ); 

    
COMMENT ON COLUMN bronze.contracts.id IS 'ID do contrato'; 
COMMENT ON COLUMN bronze.contracts.receita_despesa IS 'Tipo de contrato (Receita ou Despesa).'; 
COMMENT ON COLUMN bronze.contracts.numero IS 'Numero do contrato/empenho.'; 
COMMENT ON COLUMN bronze.contracts.orgao_codigo IS 'Código do órgão contratante.'; 
COMMENT ON COLUMN bronze.contracts.orgao_nome IS 'Nome do órgão contratante.'; 
COMMENT ON COLUMN bronze.contracts.unidade_codigo IS 'Código da unidade contratante atual.'; 
COMMENT ON COLUMN bronze.contracts.esfera IS 'Esfera política da unidade (Federal, Estadual ou Municipal).'; 
COMMENT ON COLUMN bronze.contracts.poder IS 'Poder político da unidade (Legislativo, Executivo ou Judiciário).'; 
COMMENT ON COLUMN bronze.contracts.sisg IS 'Indicada se a unidade faz parte do sistema SISG (Sim ou Não).'; 
COMMENT ON COLUMN bronze.contracts.gestao IS 'Identificador da gestão orçamentária da unidade.'; 
COMMENT ON COLUMN bronze.contracts.unidade_nome_resumido IS 'Nome abreviado da unidade contratante atual.'; 
COMMENT ON COLUMN bronze.contracts.unidade_nome IS 'Nome da unidade contratante atual.'; 
COMMENT ON COLUMN bronze.contracts.unidade_origem_codigo IS 'Código da unidade contratante de origem.'; 
COMMENT ON COLUMN bronze.contracts.unidade_origem_nome IS 'Nome da unidade contratante de origem.'; 
COMMENT ON COLUMN bronze.contracts.fornecedor_tipo IS 'Tipo de fornecedor (FISICA, JURIDICA, IDGENERICO, UG).'; 
COMMENT ON COLUMN bronze.contracts.fornecedor_cnpj_cpf_idgener IS 'Identificador do fornecedor.'; 
COMMENT ON COLUMN bronze.contracts.fornecedor_nome IS 'Razão social ou nome do identificador.'; 
COMMENT ON COLUMN bronze.contracts.codigo_tipo IS 'Tipo do contrato.'; 
COMMENT ON COLUMN bronze.contracts.tipo IS 'Descrição do tipo de contrato.'; 
COMMENT ON COLUMN bronze.contracts.categoria IS 'Categoria do objeto do contrato.'; 
COMMENT ON COLUMN bronze.contracts.processo IS 'Número do processo administrativo da contratação.'; 
COMMENT ON COLUMN bronze.contracts.objeto IS 'Descrição do objeto contratado.'; 
COMMENT ON COLUMN bronze.contracts.fundamento_legal IS 'Fundamento legal da contratação.'; 
COMMENT ON COLUMN bronze.contracts.informacao_complementar IS 'Informação complementar da contratação.'; 
COMMENT ON COLUMN bronze.contracts.codigo_modalidade IS 'Código da modalidade da licitação.'; 
COMMENT ON COLUMN bronze.contracts.modalidade IS 'Descrição da modalidade da licitação.'; 
COMMENT ON COLUMN bronze.contracts.unidade_compra IS 'Código da unidade de compra.'; 
COMMENT ON COLUMN bronze.contracts.licitacao_numero IS 'Identificador da licitação.'; 
COMMENT ON COLUMN bronze.contracts.data_assinatura IS 'Data de assinatura do contrato no formato AAAA-MM-DD.'; 
COMMENT ON COLUMN bronze.contracts.data_publicacao IS 'Data de publicação do contrato no formato AAAA-MM-DD.'; 
COMMENT ON COLUMN bronze.contracts.vigencia_inicio IS 'Data de início de vigência do contrato no formato AAAA-MM-DD.'; 
COMMENT ON COLUMN bronze.contracts.vigencia_fim IS 'Data de término de vigência do contrato no formato AAAA-MM-DD.'; 
COMMENT ON COLUMN bronze.contracts.valor_inicial IS 'Valor inicial do contrato.'; 
COMMENT ON COLUMN bronze.contracts.valor_global IS 'Valor global do contrato.'; 
COMMENT ON COLUMN bronze.contracts.num_parcelas IS 'Número de parcelas do contrato.'; 
COMMENT ON COLUMN bronze.contracts.valor_parcela IS 'Valor de cada parcela do contrato.'; 
COMMENT ON COLUMN bronze.contracts.valor_acumulado IS 'Valor acumulado do contrato consideradas todas as alterações realizadas na vigência do contrato.'; 
COMMENT ON COLUMN bronze.contracts.situacao IS 'Status do contrato.'; 
COMMENT ON COLUMN bronze.contracts.raw_line IS 'Linha completa do CSV original para realização de auditoria.'; 
COMMENT ON COLUMN bronze.contracts.ingestao_data IS 'Data e hora em que a linha foi carregada no banco de dados.'; 
COMMENT ON COLUMN bronze.contracts.ingestao_origem IS 'Fonte do dado (nome do arquivo CSV).'; 
COMMENT ON COLUMN bronze.contracts.ingestao_usuario IS 'Usuário que realizou a ingestão dos dados.'; 

COPY bronze.contracts( 
    id, 
    receita_despesa, 
    numero, 
    orgao_codigo, 
    orgao_nome, 
    unidade_codigo, 
    esfera, 
    poder, 
    sisg, 
    gestao, 
    unidade_nome_resumido, 
    unidade_nome, 
    unidade_origem_codigo, 
    unidade_origem_nome, 
    fornecedor_tipo, 
    fornecedor_cnpj_cpf_idgener, 
    fornecedor_nome, 
    codigo_tipo, 
    tipo, 
    categoria, 
    processo, 
    objeto, 
    fundamento_legal, 
    informacao_complementar, 
    codigo_modalidade, 
    modalidade, 
    unidade_compra, 
    licitacao_numero, 
    data_assinatura, 
    data_publicacao, 
    vigencia_inicio, 
    vigencia_fim, 
    valor_inicial, 
    valor_global, 
    num_parcelas, 
    valor_parcela, 
    valor_acumulado, 
    situacao 
)
FROM '/datasets/raw/comprasnet-contratos-anual-contratos-latest.csv' 
WITH ( 
    FORMAT CSV, 
    HEADER TRUE, 
    DELIMITER ';', 
    ENCODING 'LATIN1' 
);

UPDATE bronze.contracts
SET raw_line = CONCAT_WS(';',
    id,
    receita_despesa,
    numero,
    orgao_codigo,
    orgao_nome,
    unidade_codigo,
    esfera,
    poder,
    sisg,
    gestao,
    unidade_nome_resumido,
    unidade_nome,
    unidade_origem_codigo,
    unidade_origem_nome,
    fornecedor_tipo,
    fornecedor_cnpj_cpf_idgener,
    fornecedor_nome,
    codigo_tipo,
    tipo,
    categoria,
    processo,
    objeto,
    fundamento_legal,
    informacao_complementar,
    codigo_modalidade,
    modalidade,
    unidade_compra,
    licitacao_numero,
    data_assinatura,
    data_publicacao,
    vigencia_inicio,
    vigencia_fim,
    valor_inicial,
    valor_global,
    num_parcelas,
    valor_parcela,
    valor_acumulado,
    situacao
);