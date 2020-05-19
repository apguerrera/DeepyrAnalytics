
USE bitcoinetl;

CREATE EXTERNAL TABLE IF NOT EXISTS btc_blocks_parq (
    hash STRING                       
    , size BIGINT      
    , stripped_size BIGINT     
    , weight BIGINT      
    , number BIGINT     
    , version  BIGINT        
    , `timestamp` BIGINT         
    , nonce STRING         
    , bits STRING         
    , coinbase_param  STRING              
    , transaction_count BIGINT    
)
PARTITIONED BY (year STRING)
STORED AS PARQUET
LOCATION 's3://deepyr-eth-etl/bitcoinetl/parq/blocks'
