# 20 Stock SP-500 Analysis ~ Machine Learning Model

Samantha Miller 
Nancy Pineda
Kanak Somani
Kevin Xu

## Purpose
The purpose of this analysis is to find trends in randomly chosen S&P 500 Stocks and answer the question, can we predict stock prices or find patterns to help us make better trading decisions?

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
After the data cleaning process, we imported the cleaned data into tableau for visualization. 
At this stage, we wanted to see if there are any direct relationship between trading volume and closing price.

[link to visulizations](https://public.tableau.com/app/profile/zixuan.xu)

[link to dashboard](https://public.tableau.com/views/Dashboard_16747067831160/Dashboard1?:language=en-GB&publish=yes&:display_count=n&:origin=viz_share_link)

[link to dashboard](https://public.tableau.com/views/Dashboard2_16751379538680/Dashboard2?:language=en-US&:display_count=n&:origin=viz_share_link)

From the chart above, we did not find any DIRECT relationship between trading volume and closing price in stock.

### Database

To store and create our database we used SQL. Prior to using SQL, we designed an ERD to identify data relationships, define primary keys and foreign keys that will later be a reference guide when creating queries to access all the data. Once the ERD was made, we prepared the database, we troubleshoot common errors such as defining the correct type of data found in the columns. For example the columns Open, Close, High, and Low are NUMERIC type and not INT as they contain anywhere from 0-255 decimal points. This is important because if these numbers are changed to an INTEGER the accuracy of the stock prices would be compromised. In other words, it's because of the decimal points that we are able to observe the precision in changes of closing prices eliminating possible biases.

We then created queries that allowed us to explore the differences in closing prices across sectors for our Stock data. From the 20 stocks randomly chosen, we created a left-joined table where the avg_stock_price table takes all the columns (‘symbol’ & ‘close’) and it joins with the company_data ‘sector’ by the ‘symbol’ column. Our findings are that the highest average closing price was recorded for BLK (BlackRock Inc) at approximately 437.35 belonging to the Financial Services sector. The lowest average closing price was recorded for F (Ford Motor Company) at approximately 12.44 belonging to the Consumer Cyclical sector. From this table we can note that the Financial Services sector have high closing prices in comparison to other sectors such as Technology which goes as high as 207.18 but also as low as 28.26 in closing price. These findings will be used next in our visualization analysis as we continue to explore that volatility of the randomly chosen stocks and how this plays a role within their predictability.


## Machine Learning Model
Since a machine learning model only deals with numerical data, the first step was to remove any categorical data in our database. The symbol column was categorical, so we found it best to convert each symbol to an integer that corresponds with its index in a seperate list. For instance, AAPL is at index 0, so all instances of AAPL are replaced with the number 0 and so forth until all 20 stocks are replaced with integers. (Since all the following steps must be repeated for each stock, they are all done within a for loop) The next thing was to add an Outcomes column. This column will be populated with 0s and 1s that will be determined by a rolling lambda function. The lambda function checks two dates at a time and assigns a 0 if the closing price has declined between the two dates and a 1 if the closing price has increased. However, before any of this is done, it is important that the data is sorted so the comparisons can actually make sense. Before the lambda function is implemented, the data is sorted by date ascending and symbol(int). The features of the database are established with the output column being the aptly named Outcomes column and the input being all other data, excluding the Outcomes, Date, and Symbol columns. From here the data is split, scaled and then lastly fit into the Random Forest classifier. After all this is done, the final thing is to display our results by showing the confusion matrix and the accuracy score.  

## Results
We found that this model may not be the best at predicting overall performance but it may give us an idea of the stability and volitilty of prices overtime. We may need to investigate models that work best for time series data and forecasting performance. Our 3 lowest performers were Apple (AAPL), Adobe(ADBE), and Amazon(AMZN)
Our 3 highest performers were American Airlines (AAL), IBM(IBM), and Hershey(HSY).

When looking at the 6 stocks mentioned above we can see that over time a stock with higher accuracy like American Airlines has remained fairly stable of the last 10 years. It makes price changes that are closer to $20-$30 in jumps, im comparison to a stock liek Adobe that we see significant jumps in prices over time. We can make an assumption that our model was having a harder time finding a pattern that could be tracked. 


[Powerpoint Presentation](https://docs.google.com/presentation/d/11K56YoS6SCqYIbejt64Zi2piEE9Fm_RQcmFz4qk4gsA/edit?usp=sharing)
