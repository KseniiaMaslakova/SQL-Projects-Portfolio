-- Advanced SQL Queries for Health and Fitness Tracking App

-- Adjustments made to fit the data range from 2022-01-01 to 2022-12-31 and user IDs from 1 to 10.

-- Query 1: Correlation Between Workout Intensity and Sleep Quality
-- This query assesses the relationship between the intensity of workouts and subsequent sleep duration.
-- It helps in understanding how different physical activities might affect rest for users 1 to 10.

-- Revision: Since the data spans a wide range of dates and not all users have workout logs, we will limit this query to users 1 to 3 to ensure we have relevant data.
SELECT 
    WL.user_id, 
    WL.intensity AS Workout_Intensity, 
    AVG(SP.duration) AS Avg_Sleep_Duration
FROM WorkoutLogs WL
JOIN SleepPatterns SP ON WL.user_id = SP.user_id
    AND SP.date >= WL.date
    AND SP.date < date(WL.date, '+1 day')
WHERE WL.user_id BETWEEN 1 AND 10
GROUP BY WL.user_id, WL.intensity
ORDER BY WL.user_id, WL.intensity;

-- Query 2: Monthly Progress Report for Users
-- This query provides a comprehensive monthly health progress report by integrating data from health metrics, nutrition, and sleep patterns.
-- It's essential for monitoring long-term health trends for users 1 to 10 over 2022.

-- Revision: This query can be adjusted to consider only users 1 and 2 since they have the most comprehensive health metrics, nutrition, and sleep pattern data.
SELECT 
    HM.user_id,
    strftime('%Y-%m', HM.date) AS Month,
    MAX(HM.weight) - MIN(HM.weight) AS Weight_Change,
    AVG(NL.calories) AS Avg_Calorie_Intake,
    AVG(SP.duration) AS Avg_Sleep_Duration
FROM HealthMetrics HM
JOIN NutritionLogs NL ON HM.user_id = NL.user_id AND strftime('%Y-%m', NL.date) = strftime('%Y-%m', HM.date)
JOIN SleepPatterns SP ON HM.user_id = SP.user_id AND strftime('%Y-%m', SP.date) = strftime('%Y-%m', HM.date)
WHERE HM.user_id BETWEEN 1 AND 2 AND strftime('%Y', HM.date) = '2022'
GROUP BY HM.user_id, Month
ORDER BY HM.user_id, Month;

-- Query 3: Frequent Workout Patterns for Users
-- This query identifies frequent workout types and their average duration for each user.
-- It focuses on workout patterns for users 1 to 10, providing insights into their preferences and habits.

-- Revision: This query will also be limited to users 1 and 2, focusing on workout patterns with at least 3 sessions (instead of 5) due to data limitations.

SELECT 
    user_id,
    workout_type,
    COUNT(*) AS Session_Count,
    AVG(duration) AS Avg_Duration
FROM WorkoutLogs
WHERE user_id BETWEEN 1 AND 2
GROUP BY user_id, workout_type
HAVING Session_Count >= 3
ORDER BY user_id, Session_Count DESC;

-- Query 4: Dietary Habit Analysis for Users
-- Analyzes dietary habits by calculating average daily calorie intake for users who consistently log their nutrition data.
-- This query is particularly useful for identifying dietary patterns of users 1 to 10 over the year 2022.

-- Revision: Adjusted to include users 1 to 5, and considering at least 5 active days (instead of 10) to match the data availability.

SELECT 
    NL.user_id,
    COUNT(DISTINCT NL.date) AS Active_Days,
    SUM(NL.calories) / COUNT(DISTINCT NL.date) AS Avg_Daily_Calories
FROM NutritionLogs NL
WHERE NL.user_id BETWEEN 1 AND 5 AND strftime('%Y', NL.date) = '2022'
GROUP BY NL.user_id
HAVING Active_Days >= 5
ORDER BY Avg_Daily_Calories DESC;