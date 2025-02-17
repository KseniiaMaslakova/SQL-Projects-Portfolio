# Health and Fitness Tracking App for Minerva University

## A Detailed Overview and Technical Design

**Abstract**

This document presents a comprehensive design for a Health and Fitness Tracking App tailored for Minerva University's international students (Class of 2024 and 2025), having their next semester in London. The app aims to facilitate students in tracking health metrics, logging workouts, monitoring nutrition, recording sleep patterns, and offering personalized fitness recommendations.

## General Setup

**Project Structure**

Make sure you have downloaded or cloned the MinervaHealthApp project folder to your local machine. Here's the project structure:

```
MinervaHealthApp
│
├── Database
│ ├── HealthFitnessAppSchema.sql
│ └── MinervaHealthApp.db
│
├── Diagram
│ ├── output.png
│ └── schema.dot
│
├── SQL_Queries
│ ├── Analysis_HealthFitnessAppQueries.sql
│ └── HealthFitnessAppQueries.sql
│
├── Tests
│ ├── test_database.py
│ └── test_sql_queries.py
│
├── populate_database.py
│
└── requirements.txt
```

**Python Execution**

- **macOS**

1. Open Terminal: Navigate to the MinervaHealthApp directory.

```
cd path/to/MinervaHealthApp
```

2. Create a Virtual Environment (if not already created, but also can check the code without Virtual Environment):

```
python3 -m venv venv
```

3. Activate the Virtual Environment:

```
source venv/bin/activate
```

4. Install Required Packages:

```
pip3 install -r requirements.txt
```

5. Create a MockUp data (if needed, but the folder already contains generated data):

```
python3 populate_database.py
```

6. Run Test Scripts (optional and other tests included):

```
python3 Tests/test_database.py
```

- **Windows**

1. Open Command Prompt: Navigate to the MinervaHealthApp directory.

```
cd path\to\MinervaHealthApp
```

2. Create a Virtual Environment (if not already created):

```
python -m venv venv
```

3. Activate the Virtual Environment:

```
venv\Scripts\activate
```

4. Install Required Packages:

```
pip install -r requirements.txt
```

5. Run Python Scripts (if applicable):

```
python populate_database.py
```

6. Run Test Scripts (optional):

```
python Tests\test_database.py
```

**SQLite Execution**

These instructions are for executing SQL queries using SQLite.

1. Open SQLite Command Line. On macOS and Windows, open your terminal or command prompt and navigate to the directory containing your SQLite database file. Then, start the SQLite command line interface:

```
sqlite3 Database/MinervaHealthApp.db
```

2. Execute SQL Queries. Within the SQLite CLI, run the SQL script files using the .read command:

```
.read SQL_Queries/HealthFitnessAppQueries.sql
```
```
.read SQL_Queries/Analysis_HealthFitnessAppQueries.sql
```

4. Exit SQLite:

To exit the SQLite CLI, use the .quit command:

```
.quit
```

## 1. Introduction

**Objective:** The Health and Fitness Tracking App is designed to support Minerva University's international students in maintaining a balanced, healthy lifestyle. It integrates various health aspects into one platform, offering personalized insights and recommendations.

**Target Audience:** International students aged 20-25 at Minerva University in London, characterized by diverse fitness levels and cultural backgrounds, with the need for a tailored health management approach.

## 2. App Features and Metrics

- **Workout Logs:** Track types of exercise, duration, intensity, and progress.
- **Nutrition Tracking:** Monitor daily food and water intake with a focus on caloric and nutritional content.
- **Sleep Patterns:** Record sleep duration and quality, correlating it with exercise and diet habits.
- **Health Metrics:** Include weight, BMI, heart rate, and mental well-being indicators.
- **Personalized Fitness Recommendations:** Provide customized plans and tips for a balanced lifestyle.

## 3. Data Requirements and Relationships

**Key Data Elements:**

- **User Data:** Personal information, physical attributes, preferences, and login credentials.
- **Workout Information:** Types, duration, frequency, and intensity of workouts.
- **Nutrition Logs:** Food intake, nutritional values, hydration data.
- **Sleep Patterns:** Duration, quality, and regularity.
- **Health Metrics:** Biometric data and mental health indicators.

**Data Relationships:**

- User data is central, linking to all other categories.
- Workout information and nutrition logs directly impact health metrics.
- Sleep patterns influence overall health and fitness performance.

## 4. SQL Data Schema Design

The SQL data schema includes tables for Users, Workout Logs, Nutrition Logs, Sleep Patterns, and Health Metrics. The design emphasizes normalization to reduce redundancy, uses indices for performance optimization, and incorporates transactions for data integrity.

**Schema Breakdown:**

- **Users table:** Stores personal and authentication information.
- **Workout Logs, Nutrition Logs, and Sleep Patterns tables:** Linked to the Users table through foreign keys.
- **Health Metrics table:** Captures biometric and mental health data.

**Normalization and Index Usage:**

- The design follows normalization principles to ensure data integrity and minimize redundancy.
- Indices are used on primary keys and critical search fields for faster query execution.
- Transaction handling is incorporated for maintaining consistency, particularly in multi-step operations.

**Security and Scalability:**

- Passwords are stored as hashes for security.
- The schema is scalable, accommodating future expansions and complex analytics.

**Error Handling:**

- Application-level error handling is crucial for managing constraint violations and ensuring data quality.

## 5. Sample Data Generation for Health and Fitness Tracking App

The Python script utilizes SQLite and Faker libraries to populate the database with diverse and realistic sample data. This data is essential for testing the functionality and performance of the SQL queries designed for the Health and Fitness Tracking App.

**Data Diversity**

- **User Profiles**
  - Randomly generates num_users = 10 diverse user profiles.
  - Includes attributes such as age, gender, and personal details, reflecting the international student body at Minerva University.

- **Workout Sessions**
  - Assigns each user 5-15 workout logs with varied types (Cardio, Strength, Yoga), durations (20-120 minutes), and intensities (Light, Moderate, Intense).
  - Simulates different workout preferences and intensities.

- **Nutrition Logs**
  - Generates nutrition logs with a mix of random food items and caloric values.
  - Varies the number of logs (5-15 per user) and calorie counts (100-500) to mimic realistic dietary patterns.

- **Sleep Patterns**
  - Records sleep data, including duration (6-9 hours) and quality (Good, Average, Poor).
  - Mirrors real-life sleep habits and variations.

- **Health Metrics**
  - Encompasses a range of realistic values for weight, BMI, heart rate, and blood pressure.
  - Essential for assessing users' physical health status and applicable to a wide range of health profiles.

**Realism in Test Data**

  - Realistic values in test data accurately simulate real-world application scenarios.
  - Facilitates effective and meaningful testing of the app's functionalities, particularly in terms of data analytics and personalized recommendations.

**Diverse Health Profiles**

  - Incorporates a broad spectrum of values to capture a wide range of health and fitness profiles.
  - Essential for testing the app’s ability to handle and provide relevant insights across different user demographics.

## 6.SQL Query Scenarios and Optimization

**Process of Creating SQL Queries**

We produced two files in folder SQL_Queries , work both of them we checked: HealthFitnessAppQueries.sql and Analysis_HealthFitnessAppQueries.sql. The SQL queries were designed to address specific scenarios relevant to the Health and Fitness Tracking App. These include workout tracking, nutrition analysis, sleep pattern assessment, user progress monitoring, and personalized recommendations.

**Process of Creating SQL Queries**

- Initially, we focused on understanding the requirements of the Health and Fitness Tracking App, including the needed insights (workout tracking, nutrition analysis, sleep pattern assessment, user progress monitoring, and personalized recommendations). We also reviewed the database schema to understand the data structure and relationships between tables.

- Based on the requirements, we developed a series of SQL queries designed to extract a wide range of data, including workout details, calorie intake, average sleep duration, weight changes, most common workouts, low-calorie intake days, the impact of workout intensity on sleep quality, and monthly health overviews.

- These queries were rigorously tested with mock data, identifying issues like syntax errors, incorrect date ranges, and mismatches in expected vs. actual results. Debugging involved correcting syntax errors, adjusting date ranges, and ensuring correct table joins.

- To enhance performance, we optimized queries by:
  - Selecting Only Required Columns
  - Using Efficient JOINs
  - Filtering Data with WHERE Clauses

**Performance Issues and Solutions**

- **Indexing:** One common performance issue was slow query execution due to the lack of indices on frequently queried columns. Creating indices, especially on columns used in JOIN operations or WHERE clauses, significantly speed up query execution.

- **Optimizing JOIN Operations:** Ensuring JOIN operations are only performed on indexed columns and avoiding unnecessary JOINs can improve performance.

- **Query Caching:** Implementing caching mechanisms at the application level to store the results of frequently executed queries can reduce database load and improve response times.

**Covering a Range of Scenarios**

The final set of queries covered a comprehensive range of scenarios:

- **Workout Tracking:** Queries analyzed workout types, durations, intensities, and frequency.

- **Nutrition Analysis:** Insights into daily calorie intake and identification of low-calorie consumption days.

- **Sleep Pattern Assessment:** Examination of average sleep duration and the relationship between workout intensity and sleep quality.

- **User Progress Monitoring:** Tracking weight changes and providing monthly health overviews, integrating data from various health metrics.

- **Personalized Recommendations:** By analyzing frequent workout patterns and dietary habits, we laid the groundwork for personalized fitness and nutrition recommendations.

I would like to highlight this area as where the requirements are exceeded. The process was indeed iterative, focusing on both accuracy and performance. The final queries not only extracted meaningful insights but were also optimized for performance. This approach ensured a comprehensive analysis across multiple dimensions of health and fitness for the app users.

## 7. Testing

In the development of the MinervaHealthApp, a comprehensive approach to testing has been employed, emphasizing the robustness and reliability of the application. This is evident from the two key documents, `test_sql_queries.py` and `test_database.py`, which collectively form the backbone of the application's testing process.

1. **SQL Query Testing (`test_sql_queries.py`):**

   - **Focus:** This document is dedicated to ensuring the accuracy and efficiency of the SQL queries used in the application. Each test case in this script evaluates a specific query, scrutinizing its ability to retrieve and manipulate data correctly.

   - **Methodology:** The testing methodology here is granular and isolated, aligning with the principles of unit testing. By isolating each query, the tests efficiently pinpoint potential errors or inefficiencies in data retrieval mechanisms.

   - **Impact:** This thorough testing of SQL queries significantly enhances the reliability of data management within the app, a critical aspect for an application dealing with health and fitness data.

2. **Database Schema Validation (`test_database.py`):**

   - **Focus:** This document is responsible for validating the database schema. It includes tests for verifying the existence of tables, their structural integrity, and the enforcement of relationships and constraints.

   - **Methodology:** The tests apply an automated approach to validate the database schema. This not only ensures that the database conforms to the required design but also helps maintain data integrity.

   - **Impact:** By rigorously testing the database schema, the application ensures robust data storage, retrieval, and relationship management, crucial for an app handling complex and sensitive user data.

**Areas of Excellence**

- **Automated and Repeatable Tests:** Both testing scripts are designed to be automated, allowing for consistent and frequent validation of the application’s critical components.

- **Isolation of Components:** The tests effectively isolate individual components (SQL queries and database schema elements), allowing for precise identification and resolution of issues.

- **Maintainability:** The structure of the tests promotes easy maintenance and updates, an essential feature for the evolving nature of the application.

**Areas for Improvement and Solutions**

- **Expanding Test Coverage:** While current tests provide a strong foundation, expanding them to cover more edge cases, especially in SQL query testing, would further enhance the application's robustness. Incorporating randomized inputs and testing for unusual or unexpected scenarios can help in achieving this.

- **Integration Testing:** Augmenting the existing unit tests with integration tests could provide additional validation for how different parts of the application interact with each other. This could be crucial in catching issues that arise from the interaction of different components.

- **Performance Testing:** Implementing performance tests, particularly for SQL queries, could help optimize the application's responsiveness and efficiency. This is especially important for applications dealing with large datasets.

- **Continuous Integration (CI) Setup:** Integrating these tests into a CI pipeline would ensure that they are run automatically with every update, maintaining the application's quality consistently.

## 8. Reflection

**Break It Down**

The project followed a structured approach to break down complex problems into manageable components. In the SQL Data Schema Design phase, the data was organized into tables, like Users, Workout Logs, Nutrition Logs, Sleep Patterns, and Health Metrics. Each table was designed to minimize redundancy, with well-defined relationships. This approach facilitated a clear data flow representation, evident in the SQL schema design file (SQLSchemaDesign.sql).

In the Sample Data Generation phase (SampleDataGeneration.py), data generation was divided into categories: User Profiles, Workout Sessions, Nutrition Logs, Sleep Patterns, and Health Metrics. This precise categorization enabled the creation of a diverse and realistic dataset, crucial for meaningful testing of the app's functionalities.

**SQL Mastery**

SQL proficiency played a pivotal role in the project's success, guided by the #cs162_sql concept. In the SQL schema design (SQLSchemaDesign.sql), the application of normalization principles and index usage were pivotal. For instance, the Users table was designed efficiently to store personal and authentication information while adhering to normalization principles, thus eliminating redundancy.

In the SQL queries (HealthFitnessAppQueries.sql), the focus extended beyond data extraction to performance optimization. Take the example of the query test_query_3_frequent_workout_patterns in the testing file. It analyzed frequent workout patterns for users, ensuring accuracy and efficiency. The use of HAVING clauses and proper indexing demonstrated SQL mastery.

**Rigorous Testing**

The #cs162_testing concept was rigorously applied through two key documents: test_sql_queries.py and test_database.py. In test_sql_queries.py, each SQL query underwent testing to ensure accurate data retrieval and efficiency. For instance, in the test_query_1_workout_sleep_correlation test case, the query's ability to calculate the correlation between workout intensity and sleep quality was examined in detail. Testing encompassed edge cases, such as scenarios with no results or unexpected data.

In test_database.py, database schema validation was the primary focus. The tests automated the validation process, ensuring table existence, structural adherence, and constraint enforcement. For example, the test_tables_existence test method verified the presence of expected tables in the schema, upholding data integrity and reliability.

**Communication Matters**

Effective communication was consistently prioritized throughout the project. In the SQL Query Scenarios and Optimization section (Analysis_HealthFitnessAppQueries.sql), SQL queries were explained, outlining their purpose and expected outcomes. This level of detail ensured that developers and stakeholders alike could comprehend the logic and significance of these queries.

In the Testing phase, specifically in the test_database.py and test_sql_queries.py files, clear communication was maintained. Descriptive test case names made it explicit what each test was evaluating. For instance, in test_database.py, the test test_tables_existence straightforwardly communicated its purpose: to verify table existence in the database schema.
