import sqlite3
import unittest

class TestSQLQueries(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        """ 
        Set up a connection to the database before running tests.
        """
        cls.conn = sqlite3.connect('Database/MinervaHealthApp.db')
        cls.cursor = cls.conn.cursor()

    @classmethod
    def tearDownClass(cls):
        """ 
        Close the database connection after running tests.
        """
        cls.conn.close()

    def test_query_1_workout_sleep_correlation(self):
        """ 
        Test Query 1: Correlation Between Workout Intensity and Sleep Quality 
        """
        # ... (Same as before)

    def test_query_2_monthly_progress_report(self):
        """ 
        Test Query 2: Monthly Progress Report for Users 
        """
        # Define Query 2 SQL statement to analyze monthly health progress
        query = """
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
        """
        # Execute Query 2 and retrieve results
        self.cursor.execute(query)
        results = self.cursor.fetchall()
        
        # Assertions to validate results (adjust based on expected results)
        self.assertTrue(len(results) > 0, "No results returned")
        for row in results:
            self.assertIn(row[0], [1, 2], "User ID not in the expected range")

    def test_query_3_frequent_workout_patterns(self):
        """ 
        Test Query 3: Frequent Workout Patterns for Users 
        """
        # Define Query 3 SQL statement to identify frequent workout patterns
        query = """
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
        """
        # Execute Query 3 and retrieve results
        self.cursor.execute(query)
        results = self.cursor.fetchall()
        
        # Assertions to validate results
        self.assertTrue(len(results) > 0, "No results returned")
        for row in results:
            self.assertIn(row[0], [1, 2], "User ID not in the expected range")
            self.assertIsInstance(row[3], float, "Average Duration is not a float")
            self.assertGreaterEqual(row[2], 3, "Session count is less than 3")

if __name__ == '__main__':
    unittest.main()
