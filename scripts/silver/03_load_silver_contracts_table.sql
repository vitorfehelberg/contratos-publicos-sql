INSERT INTO silver.contracts (
    contract_id,
    revenue_expense,
    contract_number,
    agency_code,
    agency_name,
    unit_code,
    government_level,
    government_branch,
    is_sisg,
    management_code,
    unit_abbreviation,
    unit_name,
    unit_origin_code,
    unit_origin_name,
    supplier_type,
    supplier_id,
    supplier_name,
    contract_type_code,
    contract_type_description,
    category,
    process_number,
    object_description,
    legal_basis,
    additional_info,
    bidding_mode_code,
    bidding_mode_description,
    unit_purchase_code,
    bidding_number,
    signature_date,
    publication_date,
    start_date,
    end_date,
    initial_value,
    total_value,
    installments_count,
    installment_value,
    accumulated_value,
    is_active
)
SELECT
    id, 
    CASE WHEN LOWER(receita_despesa) = 'receita' THEN 'Revenue'
         WHEN LOWER(receita_despesa) = 'despesa' THEN 'Expense'
         ELSE NULL
    END, 
    numero, 
    orgao_codigo, 
    orgao_nome, 
    unidade_codigo, 
    CASE WHEN LOWER(esfera) = 'municipal' THEN 'Municipal'
         WHEN LOWER(esfera) = 'estadual' THEN 'State'
         WHEN LOWER(esfera) = 'federal' THEN 'Federal'
         ELSE NULL END, 
    CASE WHEN LOWER(poder) = 'legislativo' THEN 'Legislative'
         WHEN LOWER(poder) = 'executivo' THEN 'Executive'
         WHEN LOWER(poder) = 'judiciário' THEN 'Judiciary'
         ELSE NULL
    END,
    CASE WHEN LOWER(sisg) = 'sim' THEN TRUE
         WHEN LOWER(sisg) = 'não' THEN FALSE
         ELSE NULL
    END, 
    gestao, 
    unidade_nome_resumido, 
    unidade_nome, 
    unidade_origem_codigo, 
    unidade_origem_nome, 
    CASE WHEN LOWER(fornecedor_tipo) = 'fisica' THEN 'Individual'
         WHEN LOWER(fornecedor_tipo) = 'juridica' THEN 'Company'
         WHEN LOWER(fornecedor_tipo) = 'idgenerico' THEN 'Generic ID'
         WHEN LOWER(fornecedor_tipo) = 'ug' THEN 'Management Unit'
         ELSE NULL
    END, 
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
    CASE WHEN id = '202342' AND data_assinatura = '20223-07-10' THEN '2023-07-10'::DATE
         WHEN id = '242949' AND data_assinatura = '12024-10-12' THEN '2024-10-12'::DATE
         WHEN id = '578506' AND data_assinatura = '20205-06-18' THEN '2025-06-18'::DATE
         WHEN data_assinatura ~ '^\d{4}-\d{2}-\d{2}$' THEN data_assinatura::DATE  
         ELSE NULL
    END, 
    CASE WHEN data_publicacao ~ '^\d{4}-\d{2}-\d{2}$' THEN data_publicacao::DATE ELSE NULL END, 
    CASE WHEN vigencia_inicio ~ '^\d{4}-\d{2}-\d{2}$' THEN vigencia_inicio::DATE ELSE NULL END, 
    CASE WHEN vigencia_fim ~ '^\d{4}-\d{2}-\d{2}$' THEN vigencia_fim::DATE ELSE NULL END, 
    NULLIF(valor_inicial, '')::NUMERIC(20,2), 
    NULLIF(valor_global, '')::NUMERIC(20,2), 
    NULLIF(num_parcelas, '')::INT, 
    NULLIF(valor_parcela, '')::NUMERIC(20,2), 
    NULLIF(valor_acumulado, '')::NUMERIC(20,2), 
    CASE WHEN LOWER(situacao) = 'ativo' THEN TRUE
         WHEN LOWER(situacao) = 'inativo' THEN FALSE
         ELSE NULL
    END
FROM bronze.contratos;