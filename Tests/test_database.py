import sqlite3
import unittest

class TestDatabaseSchema(unittest.TestCase):
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

    def test_tables_existence(self):
        """ 
        Test if all expected tables exist in the database.
        """
        expected_tables = ['Users', 'WorkoutLogs', 'NutritionLogs', 'SleepPatterns', 'HealthMetrics']
        
        # Retrieve the list of tables in the database
        self.cursor.execute("SELECT name FROM sqlite_master WHERE type='table'")
        tables = [row[0] for row in self.cursor.fetchall()]
        
        for table in expected_tables:
            self.assertIn(table, tables, f"Table {table} does not exist")

    def test_users_table_structure(self):
        """ 
        Test the structure of the Users table.
        """
        expected_columns = [
            ('user_id', 'INTEGER'), 
            ('name', 'VARCHAR(255)'), 
            ('age', 'INTEGER'),
            ('gender', 'VARCHAR(50)'), 
            ('contact_details', 'VARCHAR(255)'), 
            ('university_id', 'VARCHAR(100)'), 
            ('username', 'VARCHAR(100)'), 
            ('password', 'VARCHAR(255)')
        ]
        
        # Check the structure of the Users table
        self.check_table_structure('Users', expected_columns)

    def test_workoutlogs_table_structure(self):
        """ 
        Test the structure of the WorkoutLogs table.
        """
        expected_columns = [
            ('workout_id', 'INTEGER'), 
            ('user_id', 'INTEGER'), 
            ('workout_type', 'VARCHAR(100)'), 
            ('duration', 'INTEGER'),
            ('intensity', 'VARCHAR(50)'), 
            ('date', 'DATE')
        ]
        
        # Check the structure of the WorkoutLogs table
        self.check_table_structure('WorkoutLogs', expected_columns)

    def test_foreign_key_constraints(self):
        """ 
        Test foreign key constraints to ensure data integrity.
        """
        # Example: Checking foreign key in WorkoutLogs
        self.cursor.execute("PRAGMA foreign_key_list(WorkoutLogs)")
        fk_constraints = self.cursor.fetchall()
        
        # Ensure that there is a foreign key constraint from WorkoutLogs to Users table
        self.assertTrue(any(['Users' in constraint for constraint in fk_constraints]), "Foreign key to Users table not found in WorkoutLogs")

    def check_table_structure(self, table_name, expected_columns):
        """ 
        Helper function to check the structure of a specific table.
        """
        self.cursor.execute(f"PRAGMA table_info({table_name})")
        columns = [(row[1], row[2]) for row in self.cursor.fetchall()]
        
        # Check if all expected columns are present in the specified table
        for col in expected_columns:
            self.assertIn(col, columns, f"Column {col[0]} not found or mismatch in type in {table_name} table")

if __name__ == '__main__':
    unittest.main()
