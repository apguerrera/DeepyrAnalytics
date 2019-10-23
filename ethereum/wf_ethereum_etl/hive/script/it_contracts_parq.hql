
USE ethereumetl;
set hive.exec.dynamic.partition.mode=nonstrict;

INSERT OVERWRITE TABLE contracts_parq
PARTITION(start_block,end_block)
SELECT

    cr.address
    , cr.bytecode
    , cr.function_sighashes
    , cr.is_erc20
    , cr.is_erc721
    , cr.start_block
    , cr.end_block

FROM contracts_raw cr
