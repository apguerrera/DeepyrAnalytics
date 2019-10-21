
USE ethereumetl;
set hive.exec.dynamic.partition.mode=nonstrict;

INSERT OVERWRITE TABLE receipts_parq
PARTITION(tx_date)
SELECT

    rr.transaction_hash
    , rr.transaction_index
    , rr.block_hash
    , rr.block_number
    , rr.cumulative_gas_used
    , rr.gas_used
    , rr.contract_address
    , rr.root
    , rr.status
    , bt.tx_date

FROM receipts_raw rr
LEFT JOIN block_times bt
  ON rr.block_number = bt.block_number
