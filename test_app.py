import unittest
from app import create_app

class FlaskTestCase(unittest.TestCase):

    def setUp(self):
        """Set up a test client before each test."""
        self.app = create_app()
        self.client = self.app.test_client()
        self.app.testing = True

    def tearDown(self):
        """Clean up after each test."""
        pass

    def test_ping(self):
        """Test the /ping endpoint."""
        response = self.client.get('/ping')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.data.decode('utf-8'), 'pong')

if __name__ == '__main__':
    unittest.main()
