CREATE TABLE IF NOT EXISTS silver.contracts_errors (
    error_id BIGSERIAL PRIMARY KEY,
    contract_id VARCHAR(8),
    error_message VARCHAR(256),
    error_value TEXT,
    is_resolved BOOLEAN, 
    raw_line TEXT,
    ingestion_at TIMESTAMPTZ DEFAULT (NOW() AT TIME ZONE 'UTC'),
    ingestion_source VARCHAR DEFAULT 'bronze.contratos',
    ingestion_user VARCHAR DEFAULT CURRENT_USER
);

COMMENT ON COLUMN silver.contracts_errors.error_id IS 'Unique identifier of the error.';
COMMENT ON COLUMN silver.contracts_errors.contract_id IS 'Contract identifier that caused the error (if available).';
COMMENT ON COLUMN silver.contracts_errors.error_message IS 'Description of the error or violated rule.';
COMMENT ON COLUMN silver.contracts_errors.error_value IS 'The value that triggered the error.';
COMMENT ON COLUMN silver.contracts_errors.is_resolved IS 'Indicates if the error is resolved (True or False).';
COMMENT ON COLUMN silver.contracts_errors.raw_line IS 'Complete raw CSV line that generated the error.';
COMMENT ON COLUMN silver.contracts_errors.ingestion_at IS 'Date and time when the error was recorded.';
COMMENT ON COLUMN silver.contracts_errors.ingestion_source IS 'Origin of the data (table or file name).';
COMMENT ON COLUMN silver.contracts_errors.ingestion_user IS 'User who performed the data ingestion.';