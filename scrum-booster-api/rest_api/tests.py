from rest_framework.test import APITestCase
from django.urls import reverse
from rest_framework import status
from . import models


class ScrumBoosterTest(APITestCase):
    def setUp(self):
        self.phase_test = models.Phase.objects.create(title="test", detail="test")
        self.ceremony_test = models.Ceremony.objects.create(title="test", detail="test", phase=self.phase_test)
        self.process_area_test = models.ProcessArea.objects.create(title="test", related_ceremony=self.ceremony_test)
        # self.goal_test = models.Goal.objects.create(title="test", detail="test", to_satisfy=self.process_area_test)
        self.cmmi_practices_test = models.CMMIPractices.objects.create(title="test", strengthens="test",satisfy="test",demonstrated="test",process_area=self.process_area_test)
        self.problem_test = models.Problem.objects.create(title="test", detail="test")
        self.glossary_test = models.Glossary.objects.create(name="test", detail="test")
        self.quiz_question_test = models.QuizQuestion.objects.create(question_for=self.phase_test, question="test",
                                                                     option_1="test", option_2="test", option_3="test",
                                                                     option_4="test", answer_key=1)

    def test_phase_url_exists(self):
        response = self.client.get(reverse("phase-list"))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_can_read_phase_detail(self):
        response = self.client.get(reverse('phase-detail', args=[self.phase_test.id]))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_process_area_url_exists(self):
        response = self.client.get(reverse("process-area-list"))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_can_read_process_area_detail(self):
        response = self.client.get(reverse('process-area-detail', args=[self.process_area_test.id]))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    # def test_goal_url_exists(self):
    #     response = self.client.get(reverse("goal-list"))
    #     self.assertEqual(response.status_code, status.HTTP_200_OK)

    # def test_can_read_goal_detail(self):
    #     response = self.client.get(reverse('goal-detail', args=[self.goal_test.id]))
    #     self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_cmmi_practices_url_exists(self):
        response = self.client.get(reverse("cmmi-practices-list"))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_can_read_cmmi_practices_detail(self):
        response = self.client.get(reverse('cmmi-practices-detail', args=[self.cmmi_practices_test.id]))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_ceremony_url_exists(self):
        response = self.client.get(reverse("ceremony-list"))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_can_read_ceremony_detail(self):
        response = self.client.get(reverse('ceremony-detail', args=[self.ceremony_test.id]))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_problem_url_exists(self):
        response = self.client.get(reverse("problem-list"))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_can_read_problem_detail(self):
        response = self.client.get(reverse('problem-detail', args=[self.problem_test.id]))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_glossary_url_exists(self):
        response = self.client.get(reverse("glossary-list"))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_can_read_glossary_detail(self):
        response = self.client.get(reverse('glossary-detail', args=[self.glossary_test.id]))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_quiz_question_url_exists(self):
        response = self.client.get(reverse("quiz-question-list"))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_can_read_quiz_question_detail(self):
        response = self.client.get(reverse('quiz-question-detail', args=[self.quiz_question_test.id]))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_get_ceremony_and_problem_by_phase_exists(self):
        response = self.client.get(reverse("phase-ceremony-problem", args=[self.phase_test.id]))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_get_ceremony_and_problem_by_phase_can_handle_error(self):
        response = self.client.get(reverse("phase-ceremony-problem", args=[0]))
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)