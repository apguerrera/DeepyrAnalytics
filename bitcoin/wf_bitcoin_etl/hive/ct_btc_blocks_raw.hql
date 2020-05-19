
USE bitcoinetl;

CREATE EXTERNAL TABLE IF NOT EXISTS btc_blocks_raw (
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
PARTITIONED BY (start_block BIGINT, end_block BIGINT)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION 's3://deepyr-eth-etl/bitcoinetl/export/blocks'
;

MSCK REPAIR TABLE btc_blocks_raw;

