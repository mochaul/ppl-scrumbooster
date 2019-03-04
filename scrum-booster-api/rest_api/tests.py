from django.test import TestCase
from rest_framework.test import APITestCase
from django.urls import reverse
from rest_framework import status


class ScrumBoosterTest(APITestCase):
    def test_phase_url_exists(self):
        response = self.client.get(reverse("phase-list"))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_cmmi_practices_url_exists(self):
        response = self.client.get(reverse("cmmi-practices-list"))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_ceremony_url_exists(self):
        response = self.client.get(reverse("ceremony-list"))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_problem_url_exists(self):
        response = self.client.get(reverse("problem-list"))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_glossary_url_exists(self):
        response = self.client.get(reverse("glossary-list"))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_quiz_question_url_exists(self):
        response = self.client.get(reverse("quiz-question-list"))
        self.assertEqual(response.status_code, status.HTTP_200_OK)
