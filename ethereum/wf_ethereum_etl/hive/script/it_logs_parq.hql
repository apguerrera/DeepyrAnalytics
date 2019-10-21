
USE ethereumetl;
set hive.exec.dynamic.partition.mode=nonstrict;

INSERT OVERWRITE TABLE logs_parq
PARTITION(tx_date)
SELECT

    lr.log_index
    , lr.transaction_hash
    , lr.transaction_index
    , lr.block_hash
    , lr.block_number
    , lr.address
    , lr.data
    , lr.topics
    , bt.tx_date

FROM logs_raw lr
LEFT JOIN block_times bt
  ON lr.block_number = bt.block_number
