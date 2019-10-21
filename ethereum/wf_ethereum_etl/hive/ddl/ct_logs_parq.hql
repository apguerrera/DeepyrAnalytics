
USE ethereumetl;

CREATE EXTERNAL TABLE IF NOT EXISTS logs_parq (
  log_index BIGINT,
  transaction_hash STRING,
  transaction_index BIGINT,
  block_hash STRING,
  block_number BIGINT,
  address STRING,
  data STRING,
  topics STRING
)
PARTITIONED BY (tx_date STRING)
STORED AS PARQUET
LOCATION 's3://deepyr-eth-etl/ethereumetl/parq/logs'
