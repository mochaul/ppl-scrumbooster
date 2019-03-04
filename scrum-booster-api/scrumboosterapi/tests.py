from django.test import TestCase,Client

# Create your tests here. 
class DjangoRestApiTest(TestCase):
    client = Client()

    def test(self):
        response = self.client.get('/')
        self.assertEqual(response.status_code, 200)

