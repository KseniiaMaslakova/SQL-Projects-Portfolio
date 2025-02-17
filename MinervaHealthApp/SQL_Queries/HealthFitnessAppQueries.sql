-- SQL Queries for Health and Fitness Tracking App

-- Query 1: Retrieves workout details for User ID: 1
-- This query fetches workout records for a specific user (User ID: 1).
-- It includes workout type, duration, intensity, and date.
SELECT workout_type, duration, intensity, date 
FROM WorkoutLogs 
WHERE user_id = 1
ORDER BY date DESC;

-- Query 2: Summarizes total calorie intake per day for User ID: 1 between 2022-11-10 and 2022-11-16
-- This query calculates the total daily calorie intake for a user (User ID: 1) within a specified date range.
-- It provides a summary of nutrition data, showing the date and the total calories consumed.
SELECT date, SUM(calories) as Total_Calories
FROM NutritionLogs 
WHERE user_id = 1 AND date BETWEEN '2022-11-10' AND '2022-11-16'
GROUP BY date
ORDER BY date DESC;

-- Query 3: Calculates average sleep duration over October 2022 for User ID: 1
-- This query computes the average sleep duration for a user (User ID: 1) during October 2022.
-- It helps assess sleep patterns for a specific month.
SELECT AVG(duration) as Average_Sleep_Hours
FROM SleepPatterns 
WHERE user_id = 1 AND date BETWEEN '2022-10-01' AND '2022-10-31';

-- Query 4: Tracks weight changes over three months (August to October 2022) for User ID: 1
-- This query retrieves weight data for a user (User ID: 1) over a three-month period.
-- It helps monitor changes in weight over time.
SELECT date, weight 
FROM HealthMetrics 
WHERE user_id = 1 AND date BETWEEN '2022-08-01' AND '2022-10-31'
ORDER BY date;

-- Query 5: Identifies the most frequent workout type in March 2022 for User ID: 1
-- This query identifies the most frequently performed workout type by a user (User ID: 1) in March 2022.
-- It can help understand user preferences and trends.
SELECT workout_type, COUNT(*) as Frequency
FROM WorkoutLogs
WHERE user_id = 1 AND date BETWEEN '2022-03-01' AND '2022-03-31'
GROUP BY workout_type
ORDER BY Frequency DESC
LIMIT 1;

-- Query 6: Lists days with calorie intake below 2000 for User ID: 1
-- This query lists the days when a user (User ID: 1) consumed fewer than 2000 calories.
-- It can help identify days with lower calorie intake for further analysis.
SELECT date
FROM NutritionLogs
WHERE user_id = 1 
GROUP BY date
HAVING SUM(calories) < 2000
ORDER BY date;
