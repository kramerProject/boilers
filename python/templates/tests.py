import unittest
import json

def load_data():
    with open("tests/files/expected_line.json", "r") as f:
            expected = json.loads(f.read())
    return expected

class ParserTests(unittest.TestCase):


    def test_should_tests(self):
        self.assertEqual([], [])







if __name__ == '__main__':
    unittest.main()