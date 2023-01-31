-- QUERIES

-- To better understand if there is any relationship in between the volume and closing price on
-- the Stock Data, we will create a table that only contains the following columns:
-- Close, Rec_Date, Volume, Name, and Symbol.

SELECT sd.close, sd.rec_date, sd.volume, cd.name, cd.symbol
INTO closing_price_relationship
FROM stock_data as sd
JOIN company_data as cd
ON cd.symbol = sd.symbol;

-- Building relationships through tables from Schema

-- a. Adding SELECT * FROM to be able to check back into the data output 
--for the already done tables.

SELECT * FROM avg_stock_price;

SELECT * FROM company_data;

SELECT * FROM sector_count;

SELECT * FROM stock_data;

-- b. Creating tables for Closing price order by sector for the 20 random 
-- selected companies 

SELECT asp.symbol, asp.close, cd.sector, cd.name
INTO closing_price_sectors
FROM avg_stock_price as asp
LEFT JOIN company_data as cd
ON asp.symbol = cd.symbol

SELECT * FROM closing_price_sectors;

-- Adding the column 'name' from the 'company_data' for an easier analysis,
-- first by dropping the table and recreating it again,

DROP TABLE closing_price_sectors;

SELECT asp.symbol, asp.close, cd.sector, cd.name
INTO closing_price_sectors
FROM avg_stock_price as asp
LEFT JOIN company_data as cd
ON asp.symbol = cd.symbol


SELECT * FROM closing_price_sectors;

-- Findings: 
-- From the 20 stocks randomly chosen, we created a left-joined table where the 
-- avg_stock_price table takes all the columns (‘symbol’ & ‘close’) and it joins with the company_data ‘sector’ 
-- by the ‘symbol’ column. Our findings are that the highest average closing price was recorded for BLK (Adobe) 
-- at approximately 437.35 belonging to the Financial Services sector.
--The lowest average closing price was recorded for  F (Ford Motor Company) at  approximately 12.44
-- belonging to the Consumer Cyclical sector. From this table we can note that the Financial Services 
-- sector have pretty high closing prices; Compared to other sectors such as Technology which goes as high as 207.18 
-- but also as low as 28.26 closing price.

-- Creating a table with only 20 randomly chosen stocks, combined with the
-- date, closing, and volume columns from the stock_data.

SELECT asp.symbol, sd.close, sd.volume
INTO random_stocks_data
FROM avg_stock_price as asp
INNER JOIN stock_data as sd
ON asp.symbol = asp.symbol

-- Checking creation of new table

SELECT * FROM random_stocks_data;


-- Dropping table to recreate

DROP TABLE random_stocks_data;

SELECT asp.symbol, asp.close, sd.volume
INTO random_stocks_data
FROM avg_stock_price as asp
INNER JOIN stock_data as sd
ON asp.symbol = asp.symbol


-- Checking creation of new table

SELECT * FROM random_stocks_data;
