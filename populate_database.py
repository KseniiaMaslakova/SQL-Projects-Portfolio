import sqlite3
from faker import Faker
import random
from datetime import timedelta, date

# Initialize Faker
fake = Faker()

# Function to generate a random date
def random_date(start, end):
    return start + timedelta(
        seconds=random.randint(0, int((end - start).total_seconds())),
    )

# Connect to your SQLite database
conn = sqlite3.connect('Database/MinervaHealthApp.db')
cursor = conn.cursor()

# Generate sample data
num_users = 10  # number of users to generate
for _ in range(num_users):
    # Inserting data into Users table
    cursor.execute("INSERT INTO Users (name, age, gender, contact_details, university_id, username, password) VALUES (?, ?, ?, ?, ?, ?, ?)", 
                   (fake.name(), random.randint(18, 25), random.choice(['Male', 'Female', 'Other']), fake.email(), fake.uuid4(), fake.user_name(), fake.password()))

    user_id = cursor.lastrowid

    # Generate workout logs
    for _ in range(random.randint(5, 15)):  # each user gets 5-15 workout logs
        cursor.execute("INSERT INTO WorkoutLogs (user_id, workout_type, duration, intensity, date) VALUES (?, ?, ?, ?, ?)",
                       (user_id, random.choice(['Cardio', 'Strength', 'Yoga']), random.randint(20, 120), random.choice(['Light', 'Moderate', 'Intense']), random_date(date(2022, 1, 1), date(2023, 1, 1))))

    # Generate nutrition logs
    for _ in range(random.randint(5, 15)):  # each user gets 5-15 nutrition logs
        cursor.execute("INSERT INTO NutritionLogs (user_id, food_item, quantity, calories, date) VALUES (?, ?, ?, ?, ?)",
                       (user_id, fake.sentence(nb_words=2), fake.word(), random.randint(100, 500), random_date(date(2022, 1, 1), date(2023, 1, 1))))

    # Generate sleep patterns
    for _ in range(random.randint(5, 15)):  # each user gets 5-15 sleep pattern records
        cursor.execute("INSERT INTO SleepPatterns (user_id, duration, quality, date) VALUES (?, ?, ?, ?)",
                       (user_id, random.randint(6, 9), random.choice(['Good', 'Average', 'Poor']), random_date(date(2022, 1, 1), date(2023, 1, 1))))

    # Generate health metrics
    for _ in range(random.randint(5, 15)):  # each user gets 5-15 health metric records
        cursor.execute("INSERT INTO HealthMetrics (user_id, weight, BMI, heart_rate, blood_pressure, date) VALUES (?, ?, ?, ?, ?, ?)",
                       (user_id, random.uniform(50.0, 90.0), random.uniform(18.5, 30.0), random.randint(60, 100), f"{random.randint(100, 140)}/{random.randint(60, 90)}", random_date(date(2022, 1, 1), date(2023, 1, 1))))

# Commit and close the connection
conn.commit()
conn.close()
