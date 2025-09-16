INSERT INTO silver.contracts_errors (
    contract_id,
    error_message,
    error_value,
    is_resolved,
    raw_line
)
SELECT 
    bronze_contract.id AS contract_id,
    error_def.error_message AS error_message,
    error_def.error_value AS error_value,
    CASE 
        WHEN silver_contract.contract_id IS NULL THEN FALSE
        WHEN error_def.column_name = 'revenue_expense' AND silver_contract.revenue_expense IS NOT NULL THEN TRUE
        WHEN error_def.column_name = 'government_level' AND silver_contract.government_level IS NOT NULL THEN TRUE
        WHEN error_def.column_name = 'government_branch' AND silver_contract.government_branch IS NOT NULL THEN TRUE
        WHEN error_def.column_name = 'is_sisg' AND silver_contract.is_sisg IS NOT NULL THEN TRUE
        WHEN error_def.column_name = 'supplier_type' AND silver_contract.supplier_type IS NOT NULL THEN TRUE
        WHEN error_def.column_name = 'signature_date' AND silver_contract.signature_date IS NOT NULL THEN TRUE
        WHEN error_def.column_name = 'publication_date' AND silver_contract.publication_date IS NOT NULL THEN TRUE
        WHEN error_def.column_name = 'start_date' AND silver_contract.start_date IS NOT NULL THEN TRUE
        WHEN error_def.column_name = 'end_date' AND silver_contract.end_date IS NOT NULL THEN TRUE
        ELSE FALSE
    END AS is_resolved,
    bronze_contract.raw_line AS raw_line
FROM bronze.contratos AS bronze_contract
CROSS JOIN LATERAL (
    VALUES
        ('revenue_expense', receita_despesa, NOT LOWER(receita_despesa) IN ('receita','despesa'), 'Invalid revenue_expense'),
        ('government_level', esfera, NOT LOWER(esfera) IN ('municipal','estadual','federal'), 'Invalid government_level'),
        ('government_branch', poder, NOT LOWER(poder) IN ('legislativo','executivo','judiciário'), 'Invalid government_branch'),
        ('is_sisg', sisg, NOT LOWER(sisg) IN ('sim','não'), 'Invalid is_sisg'),
        ('supplier_type', fornecedor_tipo, NOT LOWER(fornecedor_tipo) IN ('fisica','juridica','idgenerico','ug'), 'Invalid supplier_type'),
        ('signature_date', data_assinatura, NOT data_assinatura ~ '^\d{4}-\d{2}-\d{2}$', 'Invalid signature_date'),
        ('publication_date', data_publicacao, NOT data_publicacao ~ '^\d{4}-\d{2}-\d{2}$', 'Invalid publication_date'),
        ('start_date', vigencia_inicio, NOT vigencia_inicio ~ '^\d{4}-\d{2}-\d{2}$', 'Invalid start_date'),
        ('end_date', vigencia_fim, NOT vigencia_fim ~ '^\d{4}-\d{2}-\d{2}$', 'Invalid end_date')
) AS error_def(column_name, error_value, is_error, error_message)
LEFT JOIN silver.contracts AS silver_contract 
    ON silver_contract.contract_id = bronze_contract.id
WHERE error_def.is_error;