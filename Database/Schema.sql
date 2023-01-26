-- Creating Schema for Stock Data

CREATE TABLE "Stock_data" (
    "date" DATE   NOT NULL,
    "symbol" VARCHAR(10)   NOT NULL,
    "close" NUMERIC   NOT NULL,
    "high" NUMERIC   NOT NULL,
    "low" NUMERIC   NOT NULL,
    "open" NUMERIC   NOT NULL,
    "volume" NUMERIC   NOT NULL,
    CONSTRAINT "pk_Stock_data" PRIMARY KEY (
        "symbol"
     )
);

CREATE TABLE "Company_data" (
    "exchange" VARCHAR(10)   NOT NULL,
    "symbol" VARCHAR(10)   NOT NULL,
    "name" VARCHAR(20)   NOT NULL,
    "sector" VARCHAR(20)   NOT NULL,
    CONSTRAINT "pk_Company_data" PRIMARY KEY (
        "symbol"
     ),
    CONSTRAINT "uc_Company_data_exchange" UNIQUE (
        "exchange"
    )
);

CREATE TABLE "Avg_stock_price" (
    "symbol" VARCHAR(10)   NOT NULL,
    "close" NUMERIC   NOT NULL
);

CREATE TABLE "Sector_amount" (
    "sector" VARCHAR(20)   NOT NULL,
    "symbol" VARCHAR(10)   NOT NULL
);

ALTER TABLE "Company_data" ADD CONSTRAINT "fk_Company_data_symbol" FOREIGN KEY("symbol")
REFERENCES "Stock_data" ("symbol");

ALTER TABLE "Avg_stock_price" ADD CONSTRAINT "fk_Avg_stock_price_symbol" FOREIGN KEY("symbol")
REFERENCES "Company_data" ("symbol");

ALTER TABLE "Avg_stock_price" ADD CONSTRAINT "fk_Avg_stock_price_close" FOREIGN KEY("close")
REFERENCES "Stock_data" ("close");

ALTER TABLE "Sector_amount" ADD CONSTRAINT "fk_Sector_amount_sector" FOREIGN KEY("sector")
REFERENCES "Company_data" ("sector");

ALTER TABLE "Sector_amount" ADD CONSTRAINT "fk_Sector_amount_symbol" FOREIGN KEY("symbol")
REFERENCES "Avg_stock_price" ("symbol");

-- Checking that the creation of the tables is correct

SELECT * FROM "Company_data";
SELECT * FROM "Stock_data";
SELECT * FROM "Avg_stock_price";
SELECT * FROM "Sector_amount";


