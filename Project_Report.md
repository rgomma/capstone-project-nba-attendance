# Capstone Project Report - Understanding and Predicting NBA Arena Attendance
### By Razaq Gomma

## Elevator Pitch
For my project, I will create a predictive model for NBA attendance that helps NBA teams account for the uncertainty in game attendance, which can lead to lost revenue.
## Subfields of ISBA
Within the Information Systems and Business Analytics (ISBA) department, there are many subfields relevant to the major. For the capstone project, I addressed 3 of them.
### IT Business and Strategy
The subfield of IT Business and Strategy is very applicable. I applied this by developing a predictive model that aligns with the strategic goals of NBA teams, primarily focused on maximizing game attendance, business operations, and revenue. 
### Storage and Data
The Storage and Data subfield is essential for managing the data associated with this project, including historical attendance figures, team performance metrics, and other relevant game-day variables. I used a MySQL database, hosted on Amazon Web Services (AWS) Relational Database Service (RDS) to store and manage the data, for easy analysis.
### Services and Infrastructure
The Services and Infrastructure is integral to the project’s execution. Python is utilized for its libraries such as BeautifulSoup, requests, and Pandas, which are necessary for web scraping and data manipulation. Which enabled the extraction and processing of game-related data from online sources. Additionally, the project leverages PowerBI for data visualization, transforming analytical results into interactive dashboards
## The Problem
### The Real Problem
The unpredictability of game attendance in NBA matches can create operational inefficiencies negatively impacting the organization. The variability in attendance not only affects ticket sales but also has broader implications on staffing and marketing strategies for NBA teams and venues.
### Previous Work and Its Limitations
While there have been independent efforts to predict game attendance, most have relied on basic historical data analysis and trend observation. These methods are often insufficient in capturing the complex interplay of factors influencing game attendance, such as team performance, opponent strength, and external factors including when the game is scheduled or player injuries.
### Impact on Customers
NBA teams and venue operators are directly impacted by this unpredictability. Fluctuations in attendance numbers can lead to revenue losses and operational inefficiencies. Marketing teams also face challenges in planning effective campaigns without a clear understanding of expected audience sizes.
### Current Solutions and Their Shortcomings
Currently, there is no enterprise solution publicly available, but NBA teams and venues likly estimate attendance based on historical data and simplistic trend analysis which can lead to inaccurate predictions, either overestimating or underestimating actual attendance, as it fails to consider the multitude of influencing factors. 
### Resource Cost of the Problem
The unpredictability of attendance can result in significant financial losses. Unsold tickets directly impact revenue, while operational challenges such as staffing and resource allocation based on inaccurate attendance predictions add to the costs. Additionally, the time and effort invested in manual analysis and estimation processes represent a resource expenditure.

This comprehensive view of the problem and subfields highlights the need for an advanced, data-driven approach to predict NBA game attendance more accurately, addressing the challenges faced by teams and venues in optimizing their operations and maximizing revenue.

## The Solution
### Non-Technical Explanation
The core objective of this project was to develop a solution that could predict attendance at NBA games, a task that, while complex, can be broken down into more understandable components. Focusing specifically on one team/arena, to narrow the scope of the project, I decided on the Portland Trail Blazers.
#### Data Collection and Preparation
The first step involved gathering a wide range of data relevant to NBA games, such as team performance statistics, game schedules, and historical attendance records. This was done using web scraping techniques, primarily with Python, to extract data from basketball-reference.com. 
#### Data Storage 
All the collected data was then stored in a MySQL database hosted on AWS. This provided a secure and efficient way to manage the data I was dealing with.
#### Data Analysis and Model Building 
Using SQL queries, I conducted exploratory analysis of the data to identify patterns and correlations. This involved looking at how different factors, like the day of the week, the opposing team, the performance of the teams, and the number of inactive players might affect attendance. Based on this analysis, I developed a predictive model using machine learning techniques, with the help of ChatGPT and Python, particularly focusing on 3 types of regression models.
#### Visualization and Reporting 
To make my findings accessible and actionable, I used PowerBI to create interactive dashboards. These dashboards allowed users to visualize the historical trends and with future updates view the results of our predictive model, showing the influences on NBA game attendance.
#### Practical Use of the Model
The final product is a tool that can be used by NBA teams and venue managers to predict game attendance better informing various aspects of their operations on game days.
#### Technology Stack:
##### Programming Languages: <br>
- Python <br>
##### Packages Include: <br>
- BeautifulSoup 
- Requests 
- Pandas 
- Sci-kit Learn 
- SQL <br>
##### Data Storage: <br>
- MySQL 
- AWS RDS <br>
##### Software/Tools: <br>
- ChatGPT 
- DBeaver 
- Excel 
- PowerBI 
- Zoom 
### Technical Explanation
#### Data Point Selection
The project focused on collecting matchup data for every game played by the Portland Trail Blazers from the 2017-18 season to the end of the 2022-23 season, excluding games affected by COVID-19. The chosen data points were start time, date, home and away teams, final score, win-loss record of each team, arena, inactive players, and players who had made All-Star teams. The rationale behind these choices was rooted in the assumption that factors like team performance, player availability, and player popularity significantly influence fan attendance at games.
#### Data Acquisition
A combination of methods was used for data collection. Some data, such as game start times, dates, team names, and final scores, were directly downloaded as CSV files from basketball-reference.com. As well as a separate table that contained players with All-Star appearances.
Web Scraping Implementation 
Utilizing Python, I created a script that was tailored to scrape specific data points from basketball-reference.com. The targeted data included game start times, dates, team names, win-loss records, arenas, and inactive players. One of the significant challenges encountered was the website's rate limit, which initially led to temporary IP blocking. To address this, a delay was strategically incorporated into the script to comply with the site's request rate limits.

#### Error Handling and Data Extraction
Robust error handling was crucial in the scraping process. The BeautifulSoup library was used to parse HTML content and extract required data. The script was designed to continue running even if specific data points were missing or if certain HTML elements were not found, thereby ensuring data was collected and did not return an error ending the program.
#### Game Identifier List and URL Construction
A critical step involved compiling a list of game identifiers, which were necessary for constructing the URLs to scrape individual game data. This task was accomplished with the assistance of ChatGPT, which generated a list based on the 'YYYYMMDD0AAA' format (where 'AAA' represents the team's abbreviation). However, this automated process required careful verification and correction due to initial inaccuracies from ChatGPT.
#### Data Structuring and Cleaning
Once the data was scraped, it was organized into two separate Pandas DataFrames. The first data frame contained general game information, while the second was dedicated to details about inactive players. This structuring was essential for maintaining data clarity and ease of analysis. Further data cleaning was conducted, by uploading the CSV’s to ChatGPT and having it remove null values, split combined win-loss records into separate columns, and reformatting the inactive players' data. Each player was given a distinct row in the DataFrame, linked to the specific game and team, facilitating a normalized database with a more straightforward analysis.
#### Exploratory Data Analysis
Using SQL queries, we analyzed basic aggregate information about the games to understand how different factors influenced average attendance. Our findings indicated a positive correlation between attendance and certain variables:
Day and Month Impact: Higher attendance was noted on Saturdays and weekends, suggesting a trend where fans are more likely to attend games during these periods.
Opponent Effect: Certain teams, notably the Golden State Warriors, Charlotte Hornets, Milwaukee Bucks, Los Angeles Lakers, and Phoenix Suns, attracted higher average attendance when they played at the Moda Center.

#### Predictive Model Selection and Testing
With limited prior experience in complex machine learning models, assistance from ChatGPT's data analysis and code interpreter tools was employed. Several models were tested including Linear Regression, Random Forest Regression, and Gradient Boosting Regression. Linear Regression is a straightforward model ideal for simple, linear relationships between variables, but may struggle with complex, non-linear data. Random Forest Regression, an ensemble of decision trees, offers greater accuracy for complex datasets with a non-linear nature but is less interpretable. Gradient Boosting Regression, another ensemble method, excels in accuracy for intricate datasets but is computationally intensive and prone to overfitting, making it less straightforward to interpret than simpler models. The focus was particularly on the Random Forest model, where hyperparameter tuning was conducted using a random search approach. Key parameters like the number of trees and tree depth were adjusted, aiming to optimize the model's performance.
#### Model Performance and Refinement
After several iterations, the Random Forest Regressor emerged as the most effective, explaining approximately 60% of the variance in attendance data. The Mean Squared Error (MSE) was approximately 600,000, translating to an average variance of 775. The addition of a running three-day average as a feature significantly enhanced the model's predictive accuracy. Early iterations often yielded a negative R-squared value, necessitating multiple adjustments in parameters and retraining. The introduction of the rolling average feature was a turning point, achieving a substantial positive correlation and increasing the r-squared to around .6 versus never reaching above .3 in all other tests.

#### Visualization and Reporting in Power BI
Interactive dashboards in Power BI were developed to visualize historical trends found during exploratory analysis. These dashboards were linked to the SQL database and augmented with DAX expressions to add additional data dimensions. Visualization features included: Attendance Trend Line Graphs displaying attendance across five seasons, offering a longitudinal view of attendance patterns in each season. Bar Charts of Average attendance by day of the week, highlighting peak attendance days and average attendance per away team, showing variations based on the opponent. Attendance Summary Card showing the total average attendance, which adjusts with manipulation of any of the slicers.


## Future Improvements
With future improvements these advancements will elevate the model's robustness and utility, offering NBA teams a comprehensive tool for strategic planning and enhancing our understanding of fan behavior dynamics.
### Integration with Power BI
Future enhancements include developing functionality for inputting future game scenarios and enabling real-time attendance predictions within Power BI.
### Advanced Visualizations
The introduction of new visualizations focusing on win percentages and player availability facilitates a deeper understanding of their correlation with attendance.
### Data Expansion
Expanding the dataset to include social media interactions, betting odds prior to the game, and team popularity metrics will provide additional insights into factors affecting attendance.
### League-Wide Application
Extending the model to encompass multiple teams and stadiums will allow for broader analysis, identifying key drivers of attendance across different venues.

These advancements will elevate the model's robustness and utility, offering NBA teams a comprehensive tool for strategic planning and enhancing our understanding of fan behavior dynamics.

## Learning Resources
To complete this project, I had to learn about regression models and how to create interactive dashboards in PowerBI. These skills were acquired through various online resources, including educational tutorials on YouTube, guidance from ChatGPT, and my ISBA course knowledge.


## How To
### Using the (Random Forest Regression) NBA Attendance Prediction Model
#### Introduction
This how-to guide focuses on running a Random Forest Regression model in Python, a powerful method for predicting NBA game attendance. This topic is crucial for data analysts and enthusiasts in sports analytics, as it combines machine learning with real-world data to enhance decision-making in sports management. Understanding the basics of Python programming and some familiarity with data analysis and machine learning concepts are prerequisites for this task.
#### Prerequisites
- Knowledge of Python
#### Materials Needed
- Ensure Python is installed on your system.
- Have the trained Random Forest model in a .py file.
- Install necessary Python libraries (pandas, sklearn, joblib).
- Prepare your input features (X parameters) for prediction.
  - Can use my basketball-reference webscraping .ipynb to gather data
#### Step-by-Step Instructions
- Load the Model:
  - Import the trained Random Forest model from the .py file. 
- Prepare Your Input Data:
  - Create a dictionary or a DataFrame with the input values for which you want to predict attendance. These should match the features your model was trained on.
- Run the Prediction:
  - Use the predict method of the model object with your input data to get the predicted attendance.
- View the Results:
  - The output will be the predicted attendance based on the input parameters you provided.
- Visualize
  - Use Pandas to export the DataFrame containing input parameters and predictions.
  - You can then open this CSV file in Excel, PowerBI, or other visualization software for further analysis.
  - Alternatively, you can create visualizations within Python using pandas and matplotlib.


## Challenges
The challenges that arose throughout the project included technical complexities and logistical issues, while demanding at times they provided valuable learning experiences and insights into managing and executing a data-driven project.
### Web Scraping Complexities
The web scraping process was intricate, involving the identification and extraction of specific elements from the HTML structure of the website. Challenges were particularly pronounced when extracting data points not enclosed within distinct HTML tags. Additionally, the project faced minor hurdles due to the rate limit on basketball-reference.com, leading to temporary IP blocking. This was solved by implementing a delay in the scraping script, ensuring compliance with the site's request rate limits, and avoiding further access issues.
### Database Migration
The project encountered a slight inconvenience due to needing to migrate the database from LMU build to AWS RDS. This migration, was necessary for leveraging advanced database features like window functions in MySQL 8, requiring additional setup and configuration efforts.
### Challenges with ChatGPT
While using ChatGPT was generally beneficial, particularly in data cleaning and analysis, it occasionally posed problems. There were instances of errors during the data analysis process, leading to the loss of progress and, in some cases, entire conversations. This not only slowed down the project but also added an element of unpredictability to the workflow.
### Time Management Issues
A significant challenge was time management, particularly in the final few weeks of the project. This period was critical as it involved learning and implementing complex aspects of the project, such as advanced data analysis and dashboard creation in Power BI. The condensed timeline limited the ability to extensively test the predictive model and refine the dashboard, impacting the overall depth and polish of the project.

## Lessons Learned
### Refining Existing Technical Skills
The project enhanced my existing skills in coding, web scraping, analytics processes, and SQL techniques. It provided an opportunity to integrate previously acquired knowledge with new skills in a comprehensive, practical application. This project reinforced my foundational abilities and broadened my technical skill set, laying a foundation for future work in data analytics.
### Regression Analysis
The project served as an extensive learning experience in regression analysis, covering the training, testing, tuning, and modeling of various types. It provided valuable insights into the selection and application of different regression models, enhancing my understanding of predictive modeling.
### PowerBI Skills
Significant learning was achieved in using PowerBI for dashboard creation. This involved creating diverse graphs, implementing slicers for interactive data exploration, integrating multiple data sources, and utilizing DAX expressions for data manipulation, all of which enhanced my data visualization capabilities.
### Time Management and Problem Solving
The project highlighted the importance of time management and problem-solving skills. Balancing different components under deadlines and solving unforeseen challenges were critical aspects of the project, emphasizing adaptability and strategic planning.

