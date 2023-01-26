-- Creating tables for SP-500-StockData

-- SQUEMA

-- First table
CREATE TABLE company_data (
	exchange VARCHAR NOT NULL,
	symbol VARCHAR NOT NULL,
	shortname VARCHAR NOT NULL,
	sector VARCHAR NOT NULL,
	industry VARCHAR NOT NULL, 
	PRIMARY KEY (symbol),
	UNIQUE (symbol)
);

-- Checking for creation of the table

SELECT * FROM company_data;

-- Second table

CREATE TABLE stock_data (
	"date" DATE NOT NULL,
	"symbol" VARCHAR NOT NULL,
	"close" INT NOT NULL,
	"high" INT NOT NULL,
	"low" INT NOT NULL,
	"open" INT NOT NULL,
	"volume" INT NOT NULL,
FOREIGN KEY (symbol) REFERENCES company_data (symbol)
);

-- Checking for creation of the table

SELECT * FROM stock_data;

-- QUERIES

-- Merging both tables
SELECT cd.symbol,
			cd.exchange,
			cd.symbol,
			cd.shortname,
			cd.sector,
			cd.industry,
			s.date,
			s.close,
			s.high,
			s.low, 
			s.open,
			s.volume
INTO merged_data
FROM company_data AS cd
		INNER JOIN stock_data AS s
				ON (cd.symbol = s.date)
ORDER BY "close" DESC;

-- Using Distinct with OrderBy to remove duplicate rows
SELECT DISTINCT ON (mt.company_data) mt.company_data,
mt.exchange,
mt.shortname,
mt.symbol,

















