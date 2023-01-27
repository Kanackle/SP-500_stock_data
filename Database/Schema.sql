-- Creating Schema and Tables for SP-500-Stock-Data

CREATE TABLE "Company_data" (
    "exchange" varchar(10)   NOT NULL,
    "symbol" varchar(10)   NOT NULL,
    "name" varchar(50)   NOT NULL,
    "sector" varchar(50)   NOT NULL,
    CONSTRAINT "pk_Company_data" PRIMARY KEY (
        "symbol"
     )
);

CREATE TABLE "Stock_data" (
    "rec_date" date   NOT NULL,
    "symbol" varchar(10)   NOT NULL,
    "close" numeric(20,10)   NOT NULL,
    "high" numeric(20,10)   NOT NULL,
    "low" numeric(20,10)   NOT NULL,
    "open" numeric(20,10)   NOT NULL,
    "volume" int   NOT NULL
);

CREATE TABLE "Avg_stock_price" (
    "symbol" varchar(10)   NOT NULL,
    "close" numeric(20,10)   NOT NULL
);

CREATE TABLE "Sector_count" (
    "sector" varchar(50)   NOT NULL,
    "symbol" int   NOT NULL,
    CONSTRAINT "pk_Sector_count" PRIMARY KEY (
        "sector"
     )
);

ALTER TABLE "Company_data" ADD CONSTRAINT "fk_Company_data_sector" FOREIGN KEY("sector")
REFERENCES "Sector_count" ("sector");

ALTER TABLE "Stock_data" ADD CONSTRAINT "fk_Stock_data_symbol" FOREIGN KEY("symbol")
REFERENCES "Company_data" ("symbol");

ALTER TABLE "Avg_stock_price" ADD CONSTRAINT "fk_Avg_stock_price_symbol" FOREIGN KEY("symbol")
REFERENCES "Company_data" ("symbol");

-- Checking correct import of tables

SELECT * FROM "Company_data";
SELECT * FROM "Avg_stock_price";
SELECT * FROM "Sector_count";
SELECT * FROM "Stock_data";
























