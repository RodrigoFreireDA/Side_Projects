# Google Data Analytics Capstone Project (Cyclistic)

## Analysis of Cyclistic, a successful bike share company based in Chicago.

![](media/f994a77f7df190719769d65370d0cda3.jpg)

This project follows the successful conclusion of my Google Data Analytics Professional Certificate. It is an excellent opportunity to show the skills acquired throughout the course, such as cleaning, analysing and presenting data.

As a work methodology, I followed the data analysis process steps: **ask, prepare, process, analyse, share, and act.**

SCENARIO

Cyclistic is a bike-share program that was launched in 2016 and has grown into a successful venture with a fleet of **5,824 bicycles** across **692 stations in Chicago**. The program offers a range of pricing plans, including single-ride passes, full-day passes, and annual memberships. The finance team has identified that annual members generate higher profits than casual riders, prompting the company to focus on converting casual riders to annual members as a key strategy for future growth.

To this end, Cyclistic's marketing team aims to analyse historical bike trip data to identify trends that can inform the development of effective marketing strategies. The team seeks to understand the differences between annual members and casual riders, as well as the factors that might motivate casual riders to purchase an annual membership. Additionally, they will explore how digital media can be leveraged to optimise marketing tactics for maximum impact.

Overall, the objective of this initiative is to design marketing strategies that will increase the number of annual members, thus driving future growth for Cyclistic.

ROLE

As a Junior Data Analyst within Cyclistic’s Marketing Analyst Team, I am responsible for analysing historical bike trip data in order to understand the differences between casual riders and annual members.

1\. ASK

Business Question: How do annual members and casual riders use Cyclistic bikes differently?

Business Task: Design a marketing strategy that converts casual riders into annual members

Key Stakeholders: My key stakeholders are the Marketing Director, **Lily Moreno,** and the Cyclistic Executive team.

2\. PREPARE

Data Source: The data has been made available and licenced by Motivate International Inc and can be found [here](https://divvy-tripdata.s3.amazonaws.com/index.html). It contains historical data from March 2022 to March 2023.

The data was downloaded and stored on my hard drive. I did a backup of the original data.

Data Organization: Each Excel file contains 13 columns with data such as ride id, rideable type, location and so on.

Limitations: “Data-privacy issues prohibit you from using riders’ personally identifiable information. This means that you won’t be able to connect pass purchases to credit card numbers to determine if casual riders live in the Cyclistic service area or if they have purchased multiple single passes”

3\. PROCESS

First Approach

I used Microsoft Excel to get a first look at the available data. After checking each file I was able to conclude that the data was consistent across all files, which means, all have the same number of columns and similar nomenclature.

Combine the data

Due to the large number of rows, I choose to work with **Python** in **PyCharm.**

In this analysis, I imported the necessary libraries (pandas and glob) and set the path to the folder containing the CSV files. Then, I used the glob module to get a list of all CSV files in the directory and combined them into a single DataFrame using the pandas concat() function.

![](media/2210ed0ac0d75460ce69025b0aa78b02.png)

New column

Creating a column called "ride_length" allows me to have a quantitative measure of the duration of each ride. This column can be useful in analysing the average ride length, identifying patterns in ride lengths based on factors such as day of the week or time of day, and identifying outliers or extreme values in the data. It can also be helpful in visualising the data and identifying trends over time.

To do this, I converted the “started_at” and “ended_at” columns to datetime64 data type and calculated the ride length in seconds as an integer. Then, I calculated the ride length in minutes and rounded it to two decimal places. I also renamed the column to 'ride_length_min'

![](media/5443c3a26a5e86be85ebd143ee1f7f6c.png)

New column

Creating the column "day_of_week" allows me to analyse the day of the week that each ride occurs. This information can be useful for identifying patterns in customer behaviour, such as whether there are certain days of the week with higher demand for bike rentals. Additionally, I can use this information to optimise pricing and marketing strategies based on the day of the week.

To do this, I created a new column called 'day_of_week' and calculated the day of the week that each ride started using the weekday() method in pandas. I shifted the range from 0-6 to 1-7 to match the format where 1 represents Monday and 7 represents Sunday. Finally, I formatted the 'day_of_week' column as a number with no decimals.

![](media/eabd0009506d1bdffde9c568bfc7f923.png)

Drop unnecessary columns

I dropped the 'start_lat', 'start_lng', 'end_lat', and 'end_lng' columns since they were not relevant to the analysis.

![](media/23daa2aaae11657699d4667fbadcbaa3.png)

4\. Analyze

Data Cleaning

To ensure that the data is clean and accurate, several data-cleaning steps were taken. Firstly, any rows with missing values were removed from the dataset using the "dropna" function. Then, any duplicate rows were also removed to avoid any possible biases in the analysis. Finally, any rows where the ride length was either 15 seconds or lower e were removed from the dataset to ensure that only valid ride data was included in the analysis.

![](media/c89253d8eb1cded00a24864cf9d05765.png)

Basic Descriptive Statistics & Dealing with Outliers

The analysis of the ride length in the Cyclistic bike-sharing dataset revealed a fascinating insight. The data revealed that the longest recorded ride lasted for an astonishing 34,354.07 minutes, which is nearly 24 days! However, these extreme values are outliers. In general, bike-sharing services such as Cyclistic are meant for short-term transportation, and it is unlikely that customers would use bikes for such a long duration.

These long rides could be indicative of lost or stolen bikes or improperly docked bicycles. Therefore, these extreme values were removed from the dataset by calculating the z-scores. This means that any ride duration that is more than 3 standard deviations (41.32) from the mean has been considered an outlier and removed from the dataset.

![](media/9332480234a6054135eb3b58cf3d9980.png)

After removing the outliers, the descriptive statistics were recalculated. The mean ride length is now 15.25 minutes, which is slightly lower than the original mean of 16.66 minutes. The maximum ride length is 140.67 minutes, which is much lower than the original maximum of 34,354.07 minutes. The mode day of the week remains the same at 6, indicating that Saturdays are the most popular day for bike rides.

![](media/43122f82d7eff00c941e3df66e67e7bb.png)

SQL **\|** Exploring data

Total rows, Distinct Start Stations, Shortest ride

![](media/c80fe5cad717a0df3e088db4482baa3a.png)![](media/eeb0173fbd86527ef0134f4d55df9aad.png)

Based on the result of the first SQL query, I can conclude that the dataset contains a total of **4,654,151 rows**, which represents the number of individual rides taken during the specified time period.

Based on my analysis, I discovered that the Cyclistic service has a total of **1,585 start stations** available for their clients, which provides valuable insight into the breadth and accessibility of the service.

Additionally, I was surprised to find that the minimum ride duration recorded in the dataset was only **17 seconds**, which suggests that some users may be using the service for very short trips or test rides.

Most Popular Weekday

![](media/6563383f55aa85c7e1839833ae99e9b8.png)![](media/abf67c582bc0cb20a8c046396e32afba.png)

Based on this query, we can conclude that the **weekends** (Saturday and Sunday) have the **highest number of rides**, with Saturday having the highest number of rides at **728,826**. This suggests that Cyclistic bikes may be popular for leisure and recreational activities on weekends. On the other hand, **Monday has the lowest number of rides at 622,141**, indicating that people may be less likely to use Cyclistic bikes for commuting on Mondays.

Top 10 most popular start stations

![](media/9034de89e38fe5633d17e1d0c80a683e.png)

![](media/40e86d8afe0dde152b00285141f5cc2c.png)

To find out what the top 10 most popular start stations are, I used the SQL query above. The query results show that the station with the highest number of rides is **Streeter Dr & Grand Ave with 72,020 rides**, followed by **DuSable Lake Shore Dr & Monroe St** and **DuSable Lake Shore Dr & North Blvd.**

Trends

![](media/3131e073b5abc460c67f84e1bab52e52.png)![](media/ed32aff41ed381d1ecc8556719cd91b2.png)

Based on the output, we can see that the number of rides is generally **higher in the warmer months**, with the peak occurring in July. Additionally, the average ride duration tends to increase in the warmest months, with the **highest average duration being in May and June**. This could be indicative of people taking long leisurely rides in the warmer months, while in the colder months, they may be more focused on getting to their destination quickly. There is a **decline in the number of rides from October to November**, which could be due to colder weather and fewer opportunities for outdoor activities.

5\. Share

Power BI

In order to effectively communicate my analysis, I used the advanced capabilities of Power BI to craft a comprehensive and user-friendly dashboard. The dashboard is easily accessible via this [link](https://app.powerbi.com/view?r=eyJrIjoiY2YwZDk3ZjctNTRmNS00ZDE2LTlmZWItYzcwMTgwYWFkMTg4IiwidCI6ImU0YmQ2OWZmLWU2ZjctNGMyZS1iMjQ3LTQxYjU0YmEyNDkwZSIsImMiOjh9).

To create some of the visualisations, I created new columns and measures, which enabled me to perform a more comprehensive analysis of the data. By utilising these techniques, I was able to extract valuable insights from the available data.

5\. Act

Final Analysis

1.  Annual members represent 61% of the total rides with an average ride duration of 11.88 minutes. Casual members represent 39% with an average ride duration of 20.51 minutes.
2.  The most popular bike among the riders was the classic one, however, casual riders have a preference for electric bikes while annual members prefer the classic type.
3.  Annual members tend to use the bikes more on weekdays while casual members use them more on weekends. This implies that members use bikes to commute to work on a daily basis while casual riders use them for recreation.
4.  We can notice an increase in the number of rides in the warmest months from May to September, this means that the busiest season is the summer, and on the other side, the winter is the season with the lowest number of rides. The main cause for this could be the weather since the cold and rain makes it hard to ride a bike.
5.  The busiest start station is at Streeter Dr & Grand Ave, especially for casual riders.

Business Suggestions

After analyse, my suggestions for the marketing team are:

1.  As casual riders represent 39% of the total rides and have a higher average ride duration, they could be a valuable target market. Consider **offering promotions** that meet their **preference for electric bikes**, and focus on **promoting weekend** use for recreational activities.
2.  Annual members are using the classic bikes more often. We could **promote the benefits of being an annual member**, such as cheaper prices, and advertise the convenience of using bikes for daily commuting during the weekdays.
3.  The busiest starting station is at Streeter Dr & Grand Ave, and it's especially popular for casual riders. We could **advertise this station more** and tell people about the fun places they can go to from there.
4.  The data indicates that there is an increase in the number of rides during the warmest months of the year, especially from May to September. Consider **offering seasonal promotions** and **incentives to encourage ridership** during the summer months.
5.  The data also shows that there is a decrease in the number of rides during the winter months. Consider **offering winter-specific promotions** and **highlighting** the convenience of using bikes for short trips even during colder weather.

Conclusion

This project has been a significant learning experience for me. It has enhanced my analytical abilities and provided me with a deeper understanding of data organization and manipulation techniques using SQL and Python. In addition, I have gained valuable experience working with Power BI, which has allowed me to create insightful visualizations to showcase my findings.

Through this project, I was also able to gain valuable experience in exploring and interpreting data to derive key insights that could answer crucial business questions. This experience has allowed me to become more confident in my ability to work with data and draw meaningful conclusions.
