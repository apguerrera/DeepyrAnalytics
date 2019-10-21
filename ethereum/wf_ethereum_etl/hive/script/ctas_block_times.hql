
USE ethereumetl;

CREATE EXTERNAL TABLE block_times
LOCATION 's3://deepyr-eth-etl/ethereumetl/lookup/block_times'
STORED AS PARQUET
AS
SELECT number AS block_number,
         timestamp,
         date(from_unixtime(timestamp)) tx_date
FROM blocks_raw
