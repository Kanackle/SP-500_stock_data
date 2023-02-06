# 20 Stock SP-500 Analysis ~ Machine Learning Model

Samantha Miller 
Nancy Pineda
Kanak Somani
Kevin Xu

## Purpose
The purpose of this analysis was to analyze treads in 20 popular S&P 500 Stocks and answer the question, can we predict stock prices or find patterns to help us make better trading decisions?

## Processes

### Data:
The data came from Kaggle.com (link to Kaggle)
It was a CSV file that contained S&P 500 stock data from the last 10 years. The original file contained more than a million rows of data. Due to this, we introduced bias in picking 20 stocks to manage the data. 
The ending result was 20 stocks in a CSV file of about 55,000 rows. The information that was given to us included stock symbols, trading date, open, close, volume, etc.
Additionally, we had a CSV file that contained company data for each of the 20 stocks included above.

### Cleaning

Before visualizing, storing, or using our data for machine learning, we needed to make sure to do some cleaning and check the data types. 
We checked the datatypes to make sure all the columns were in the correct types we needed to move forward. We decided for this data it was important for us to keep duplicates, so that was not part of the cleaning process.
We identified the unique symbols for each stock to make it easier to identify later on. We checked for null values and dropped those. Once the data was cleaned we exported CSV files to be stored and further queried with SQL and Tableau. 

### Visualizations
After the cleaning 

[link to visulizations](https://public.tableau.com/app/profile/zixuan.xu)

[link to dashboard](https://public.tableau.com/views/Dashboard_16747067831160/Dashboard1?:language=en-GB&publish=yes&:display_count=n&:origin=viz_share_link)
[link to dashboard](https://public.tableau.com/views/Dashboard2_16751379538680/Dashboard2?:language=en-US&:display_count=n&:origin=viz_share_link)

### Database

For this project we decided to use PostgreSQL for our relational database system. We created a folder that consists of tables and their predefined relationships. 
Each CSV file's data will be loaded into a table. We will create tables and define relationships as we progress through this project. The database was created and stored in one local server.
For our stock datasets, we told SQL that the values for columns such as Open, Close, High, Low, and Volume are NUMERIC which is the type of integer that contains 0-255 decimal points in order to correctly import the data and create the tables.

Furthermore, through creation of new tables we are able to explore the sectors to which the companies with highest or lowest closing prices belong to. From the 20 stocks randomly chosen, we created a left-joined table where the avg_stock_price table takes all the columns (‘symbol’ & ‘close’) and it joins with the company_data ‘sector’  by the ‘symbol’ column. Our findings are that the highest average closing price was recorded for BLK (BlackRock Inc)at approximately 437.35 belonging to the Financial Services sector. The lowest average closing price was recorded for  F (Ford Motor Company) at  approximately 12.44 belonging to the Consumer Cyclical sector. From this table we can note that the Financial Services sector have pretty high closing prices; when compared to other sectors such as Technology which goes as high as 207.18 but also as low as 28.26 closing price. This information will be used in the next analysis for the machine learning model, as we see that volatility of some of the stocks and how this plays a role within their predictability.

## Machine Learning Model

## Results

## Summary

## Resources

[Powerpoint Presentation](https://docs.google.com/presentation/d/11K56YoS6SCqYIbejt64Zi2piEE9Fm_RQcmFz4qk4gsA/edit?usp=sharing)
