

CREATE  table block_times
WITH (format = 'PARQUET'
      , external_location = 's3://deepyr-eth-etl/ethereumetl/lookup/block_times')
AS
SELECT
      number AS block_number
      , timestamp
      , date(from_unixtime("timestamp")) tx_date
FROM blocks_raw
