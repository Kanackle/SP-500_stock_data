-- QUERIES

-- To better understand if there is any relationship in between the volume and closing price on
-- the Stock Data, we will create a table that only contains the following columns:
-- Close, Rec_Date, Volume, Name, and Symbol.

SELECT sd.close, sd.rec_date, sd.volume, cd.name, cd.symbol
FROM stock_data as sd
JOIN company_data as cd
ON cd.symbol = sd.symbol;

