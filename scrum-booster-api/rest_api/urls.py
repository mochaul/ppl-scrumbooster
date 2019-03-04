from rest_framework import routers
from django.urls import path, include
from . import views

router = routers.DefaultRouter()
router.register(r'phase', views.PhaseViewSet, base_name="phase")
router.register(r'cmmi-practices', views.CMMIPracticesViewSet, base_name="cmmi-practices")
router.register(r'ceremony', views.CeremonyViewSet, base_name="ceremony")
router.register(r'problem', views.ProblemViewSet, base_name="problem")
router.register(r'glossary', views.GlossaryViewSet, base_name="glossary")
router.register(r'quiz-question', views.QuizQuestionViewSet, base_name="quiz-question")

urlpatterns = [
    path('', include(router.urls), name='api')
]