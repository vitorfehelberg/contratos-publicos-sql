DROP SCHEMA IF EXISTS silver CASCADE;

CREATE SCHEMA IF NOT EXISTS silver;

CREATE TABLE IF NOT EXISTS silver.contracts ( 
    contract_id VARCHAR(8) PRIMARY KEY,
    revenue_expense VARCHAR(7),
    contract_number VARCHAR(20),
    agency_code CHAR(5),  
    agency_name VARCHAR(120), 
    unit_code CHAR(6),
    government_level VARCHAR(9),
    government_branch VARCHAR(11),
    is_sisg BOOLEAN,
    management_code CHAR(5), 
    unit_abbreviation VARCHAR(60),
    unit_name VARCHAR(150),
    unit_origin_code CHAR(6), 
    unit_origin_name VARCHAR(150),
    supplier_type VARCHAR(15), 
    supplier_id VARCHAR(100),
    supplier_name VARCHAR(180), 
    contract_type_code CHAR(2), 
    contract_type_description VARCHAR(60),  
    category VARCHAR(30),
    process_number VARCHAR(220), 
    object_description TEXT,
    legal_basis VARCHAR(80),
    additional_info TEXT, 
    bidding_mode_code VARCHAR(20),
    bidding_mode_description VARCHAR(50), 
    unit_purchase_code CHAR(6),  
    bidding_number VARCHAR(12), 
    signature_date DATE,
    publication_date DATE, 
    start_date DATE, 
    end_date DATE, 
    initial_value NUMERIC(20, 2),
    total_value NUMERIC(20, 2), 
    installments_count INT,
    installment_value NUMERIC(20, 2), 
    accumulated_value NUMERIC(20, 2), 
    is_active BOOLEAN, 
    ingestion_at TIMESTAMPTZ DEFAULT (NOW() AT TIME ZONE 'UTC'), 
    ingestion_source VARCHAR DEFAULT 'bronze.contratos', 
    ingestion_user VARCHAR DEFAULT CURRENT_USER
);

COMMENT ON COLUMN silver.contracts.contract_id IS 'Contract identifier.';
COMMENT ON COLUMN silver.contracts.revenue_expense IS 'Type of contract (Revenue or Expense).';
COMMENT ON COLUMN silver.contracts.contract_number IS 'Contract or commitment number.';
COMMENT ON COLUMN silver.contracts.agency_code IS 'Code of the contracting agency.';
COMMENT ON COLUMN silver.contracts.agency_name IS 'Name of the contracting agency.';
COMMENT ON COLUMN silver.contracts.unit_code IS 'Code of the current contracting unit.';
COMMENT ON COLUMN silver.contracts.government_level IS 'Government level of the unit (Federal, State, or Municipal).';
COMMENT ON COLUMN silver.contracts.government_branch IS 'Government branch of the unit (Legislative, Executive, or Judiciary).';
COMMENT ON COLUMN silver.contracts.is_sisg IS 'Indicates if the unit is part of the SISG system (True or False).';
COMMENT ON COLUMN silver.contracts.management_code IS 'Identifier of the unit’s budget management.';
COMMENT ON COLUMN silver.contracts.unit_abbreviation IS 'Abbreviated name of the current contracting unit.';
COMMENT ON COLUMN silver.contracts.unit_name IS 'Name of the current contracting unit.';
COMMENT ON COLUMN silver.contracts.unit_origin_code IS 'Code of the origin contracting unit.';
COMMENT ON COLUMN silver.contracts.unit_origin_name IS 'Name of the origin contracting unit.';
COMMENT ON COLUMN silver.contracts.supplier_type IS 'Type of supplier (Individual, Company, Generic ID, Management Unit).';
COMMENT ON COLUMN silver.contracts.supplier_id IS 'Identifier of the supplier.';
COMMENT ON COLUMN silver.contracts.supplier_name IS 'Legal name or name of the identifier.';
COMMENT ON COLUMN silver.contracts.contract_type_code IS 'Contract type code.';
COMMENT ON COLUMN silver.contracts.contract_type_description IS 'Description of the contract type.';
COMMENT ON COLUMN silver.contracts.category IS 'Category of the contract object.';
COMMENT ON COLUMN silver.contracts.process_number IS 'Administrative process number of the contract.';
COMMENT ON COLUMN silver.contracts.object_description IS 'Description of the contracted object.';
COMMENT ON COLUMN silver.contracts.legal_basis IS 'Legal basis of the contract.';
COMMENT ON COLUMN silver.contracts.additional_info IS 'Additional information about the contract.';
COMMENT ON COLUMN silver.contracts.bidding_mode_code IS 'Bidding mode code.';
COMMENT ON COLUMN silver.contracts.bidding_mode_description IS 'Description of the bidding mode.';
COMMENT ON COLUMN silver.contracts.unit_purchase_code IS 'Code of the purchasing unit.';
COMMENT ON COLUMN silver.contracts.bidding_number IS 'Bidding identifier.';
COMMENT ON COLUMN silver.contracts.signature_date IS 'Contract signature date in the format YYYY-MM-DD.';
COMMENT ON COLUMN silver.contracts.publication_date IS 'Contract publication date in the format YYYY-MM-DD.';
COMMENT ON COLUMN silver.contracts.start_date IS 'Contract start date in the format YYYY-MM-DD.';
COMMENT ON COLUMN silver.contracts.end_date IS 'Contract end date in the format YYYY-MM-DD.';
COMMENT ON COLUMN silver.contracts.initial_value IS 'Initial contract value.';
COMMENT ON COLUMN silver.contracts.total_value IS 'Total contract value.';
COMMENT ON COLUMN silver.contracts.installments_count IS 'Number of contract installments.';
COMMENT ON COLUMN silver.contracts.installment_value IS 'Value of each contract installment.';
COMMENT ON COLUMN silver.contracts.accumulated_value IS 'Accumulated contract value considering all changes during its term.';
COMMENT ON COLUMN silver.contracts.is_active IS 'Indicates if the contract is active (True or False).';
COMMENT ON COLUMN silver.contracts.ingestion_at IS 'Date and time when the row was loaded into the database.';
COMMENT ON COLUMN silver.contracts.ingestion_source IS 'Data source (name of the CSV file).';
COMMENT ON COLUMN silver.contracts.ingestion_user IS 'User who performed the data ingestion.';