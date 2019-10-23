
USE ethereumetl;
set hive.exec.dynamic.partition.mode=nonstrict;

INSERT OVERWRITE TABLE transactions_parq
PARTITION(tx_date)
SELECT

    tr.hash
    , tr.nonce
    , tr.block_hash
    , tr.block_number
    , tr.transaction_index
    , tr.from_address
    , tr.to_address
    , tr.value
    , tr.gas
    , tr.gas_price
    , tr.input
    , bt.`timestamp`
    , bt.tx_date

FROM transactions_raw tr
LEFT JOIN block_times bt
  ON tr.block_number = bt.block_number
