
USE ethereumetl;

CREATE EXTERNAL TABLE IF NOT EXISTS token_transfers_parq (
    token_address STRING,
    from_address STRING,
    to_address STRING,
    value DECIMAL(38,0),
    transaction_hash STRING,
    log_index BIGINT,
    block_number BIGINT
)
PARTITIONED BY (tx_date STRING)
STORED AS PARQUET
LOCATION 's3://deepyr-eth-etl/ethereumetl/parq/token_transfers'
