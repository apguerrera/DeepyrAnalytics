
USE ethereumetl;

CREATE EXTERNAL TABLE IF NOT EXISTS contracts_parq (
    address STRING,
    bytecode STRING,
    function_sighashes STRING,
    is_erc20 BOOLEAN,
    is_erc721 BOOLEAN
)

PARTITIONED BY (start_block BIGINT, end_block BIGINT)
STORED AS PARQUET
LOCATION 's3://deepyr-eth-etl/ethereumetl/parq/contracts'
;
