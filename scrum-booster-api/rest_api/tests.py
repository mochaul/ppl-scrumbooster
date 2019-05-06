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
        self.glossary_test = models.Glossary.objects.create(title="test", detail="test")

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

    def test_get_ceremony_and_problem_by_phase_exists(self):
        response = self.client.get(reverse("phase-ceremony-problem", args=[self.phase_test.id]))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_search_on_phase_exists(self):
        response = self.client.get(reverse("phase-list"), {"search": "test"})
        self.assertNotEqual(response.data, [])

    def test_search_on_phase_works(self):
        response = self.client.get(reverse("phase-list"), {"search": "wrong title"})
        self.assertEqual(response.data, [])

    def test_search_on_ceremony_exists(self):
        response = self.client.get(reverse("ceremony-list"), {"search": "test"})
        self.assertNotEqual(response.data, [])

    def test_search_on_ceremony_works(self):
        response = self.client.get(reverse("ceremony-list"), {"search": "wrong title"})
        self.assertEqual(response.data, [])

    def test_search_on_process_area_exists(self):
        response = self.client.get(reverse("process-area-list"), {"search": "test"})
        self.assertNotEqual(response.data, [])

    def test_search_on_process_area_works(self):
        response = self.client.get(reverse("process-area-list"), {"search": "wrong title"})
        self.assertEqual(response.data, [])

    def test_search_on_cmmi_practices_exists(self):
        response = self.client.get(reverse("cmmi-practices-list"), {"search": "test"})
        self.assertNotEqual(response.data, [])

    def test_search_on_cmmi_practices_works(self):
        response = self.client.get(reverse("cmmi-practices-list"), {"search": "wrong title"})
        self.assertEqual(response.data, [])

    def test_search_on_problem_exists(self):
        response = self.client.get(reverse("problem-list"), {"search": "test"})
        self.assertNotEqual(response.data, [])

    def test_search_on_problem_works(self):
        response = self.client.get(reverse("problem-list"), {"search": "wrong title"})
        self.assertEqual(response.data, [])

    def test_search_on_glossary_exists(self):
        response = self.client.get(reverse("glossary-list"), {"search": "test"})
        self.assertNotEqual(response.data, [])

    def test_search_on_glossary_works(self):
        response = self.client.get(reverse("glossary-list"), {"search": "wrong title"})
        self.assertEqual(response.data, [])

    def test_get_ceremony_and_problem_by_phase_can_handle_error(self):
        response = self.client.get(reverse("phase-ceremony-problem", args=[0]))
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)

    def test_get_list_ceremony_alphabetic_order_exists(self):
        response = self.client.get(reverse("ceremony-list-alphabetic"))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_get_list_problem_alphabetic_order_exists(self):
        response = self.client.get(reverse("problem-list-alphabetic"))
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_get_glossary_by_name_exists(self):
        response = self.client.get(reverse("glossary-detail-by-name"), args=[self.glossary_test.title])
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_get_glossary_by_name_can_handle_error(self):
        response = self.client.get(reverse("glossary-detail-by-name", args=[0]))
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)


