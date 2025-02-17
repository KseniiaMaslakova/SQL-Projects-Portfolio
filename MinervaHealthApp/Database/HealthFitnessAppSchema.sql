-- SQL Data Schema for Health and Fitness Tracking App

-- Creating the Users table
CREATE TABLE IF NOT EXISTS Users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,  -- Unique user identifier
    name VARCHAR(255) NOT NULL,  -- User's name
    age INTEGER,  -- User's age
    gender VARCHAR(50),  -- User's gender
    contact_details VARCHAR(255),  -- User's contact details
    university_id VARCHAR(100) UNIQUE NOT NULL,  -- Unique university identifier
    username VARCHAR(100) UNIQUE NOT NULL,  -- Unique username for login
    password VARCHAR(255) NOT NULL,  -- Stored as a hash for security
    CONSTRAINT chk_age CHECK (age >= 16)  -- Assuming minimum age is 16
);

-- Creating the Workout Logs table
CREATE TABLE IF NOT EXISTS WorkoutLogs (
    workout_id INTEGER PRIMARY KEY AUTOINCREMENT,  -- Unique workout log identifier
    user_id INTEGER NOT NULL,  -- Foreign key referencing Users table
    workout_type VARCHAR(100) NOT NULL,  -- Type of workout
    duration INTEGER NOT NULL,  -- Duration in minutes
    intensity VARCHAR(50),  -- Intensity level
    date DATE NOT NULL,  -- Date of the workout
    FOREIGN KEY (user_id) REFERENCES Users(user_id)  -- Relationship with Users table
);

-- Creating the Nutrition Logs table
CREATE TABLE IF NOT EXISTS NutritionLogs (
    nutrition_id INTEGER PRIMARY KEY AUTOINCREMENT,  -- Unique nutrition log identifier
    user_id INTEGER NOT NULL,  -- Foreign key referencing Users table
    food_item VARCHAR(255) NOT NULL,  -- Consumed food item
    quantity VARCHAR(100),  -- Quantity consumed (e.g., grams, pieces)
    calories INTEGER,  -- Calories consumed
    date DATE NOT NULL,  -- Date of the nutrition log
    FOREIGN KEY (user_id) REFERENCES Users(user_id)  -- Relationship with Users table
);

-- Creating the Sleep Patterns table
CREATE TABLE IF NOT EXISTS SleepPatterns (
    sleep_id INTEGER PRIMARY KEY AUTOINCREMENT,  -- Unique sleep pattern identifier
    user_id INTEGER NOT NULL,  -- Foreign key referencing Users table
    duration INTEGER NOT NULL,  -- Duration of sleep in hours
    quality VARCHAR(100),  -- Sleep quality (e.g., good, poor)
    date DATE NOT NULL,  -- Date of the sleep pattern record
    FOREIGN KEY (user_id) REFERENCES Users(user_id)  -- Relationship with Users table
);

-- Creating the Health Metrics table
CREATE TABLE IF NOT EXISTS HealthMetrics (
    metric_id INTEGER PRIMARY KEY AUTOINCREMENT,  -- Unique health metric identifier
    user_id INTEGER NOT NULL,  -- Foreign key referencing Users table
    weight FLOAT,  -- User's weight in kilograms
    BMI FLOAT,  -- Body Mass Index
    heart_rate INTEGER,  -- User's heart rate in beats per minute
    blood_pressure VARCHAR(100),  -- User's blood pressure (systolic/diastolic)
    date DATE NOT NULL,  -- Date of the health metric record
    FOREIGN KEY (user_id) REFERENCES Users(user_id)  -- Relationship with Users table
);

-- Error Handling
-- SQLite does not have built-in stored procedure support for error handling like other SQL dialects.
-- However, application-level error handling should be implemented to manage:
-- 1. Unique constraint violations (e.g., duplicate usernames).
-- 2. Foreign key constraint violations (e.g., inserting a workout log with a non-existent user_id).
-- 3. Check constraint violations (e.g., age below the minimum allowed).

-- Summary
-- This SQL schema is designed for the Health and Fitness Tracking App, aiming to support Minerva University students.
-- It includes tables for users, workout logs, nutrition logs, sleep patterns, and health metrics.
-- Each table has primary keys for unique identification and foreign keys for relational integrity.
-- The schema is normalized to avoid redundancy and ensure data integrity.
-- Security considerations are observed, especially in storing sensitive data like passwords.
-- Scalability and flexibility for future expansion and complex analytics are integral parts of this design.
