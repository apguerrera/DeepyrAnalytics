
USE ethereumetl;
set hive.exec.dynamic.partition.mode=nonstrict;

INSERT OVERWRITE TABLE blocks_parq
PARTITION(tx_date)
SELECT

    number
    , hash
    , parent_hash
    , nonce
    , sha3_uncles
    , logs_bloom
    , transactions_root
    , state_root
    , receipts_root
    , miner
    , difficulty
    , total_difficulty
    , size
    , extra_data
    , gas_limit
    , gas_used
    , `timestamp`
    , transaction_count
    , date(from_unixtime(`timestamp`)) tx_date

FROM blocks_raw
