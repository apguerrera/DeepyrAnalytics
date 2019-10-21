
USE ethereumetl;

CREATE EXTERNAL TABLE IF NOT EXISTS receipts_parq (
  transaction_hash STRING,
  transaction_index BIGINT,
  block_hash STRING,
  block_number BIGINT,
  cumulative_gas_used BIGINT,
  gas_used BIGINT,
  contract_address STRING,
  root STRING,
  status BIGINT
)
PARTITIONED BY (tx_date STRING)
STORED AS PARQUET
LOCATION 's3://deepyr-eth-etl/ethereumetl/parq/receipts'
