
USE bitcoinetl;

CREATE EXTERNAL TABLE IF NOT EXISTS btc_transactions_raw (
    hash  STRING
    , size BIGINT   
    , virtual_size BIGINT   
    , version BIGINT    
    , lock_time BIGINT    
    , block_number BIGINT     
    , block_hash  STRING
    , block_timestamp BIGINT    
    , is_coinbase STRING
    , index BIGINT    
    , inputs ARRAY<
        STRUCT<
            index:BIGINT     
            , spent_transaction_hash:STRING
            , spent_output_index:BIGINT      
            , script_asm:STRING         
            , script_hex:STRING     
            , sequence:BIGINT      
            , required_signatures:STRING       
            , type:STRING       
            , addresses:ARRAY<STRING>    
            , value:BIGINT 
        >
    >
    , outputs ARRAY<
        STRUCT<   
            index:BIGINT                      
            , script_asm:STRING                      
            , script_hex:STRING                     
            , required_signatures:INT                       
            , type:STRING                     
            , addresses:ARRAY<STRING> 
            , value:BIGINT
        >
    >
    , input_count INT
    , output_count  INT
    , input_value BIGINT    
    , output_value BIGINT     
    , fee BIGINT      
   
)
PARTITIONED BY (start_block BIGINT, end_block BIGINT)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
LOCATION 's3://deepyr-eth-etl/bitcoinetl/export/transactions'
;

MSCK REPAIR TABLE btc_transactions_raw;

