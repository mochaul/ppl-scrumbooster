from rest_framework import routers
from django.urls import path, include
from . import views

router = routers.DefaultRouter()
router.register(r'phase', views.PhaseViewSet, base_name="phase")
router.register(r'process-area', views.ProcessAreaViewSet, base_name="process-area")
# router.register(r'goal', views.GoalViewSet, base_name="goal")
router.register(r'cmmi-practices', views.CMMIPracticesViewSet, base_name="cmmi-practices")
router.register(r'ceremony', views.CeremonyViewSet, base_name="ceremony")
router.register(r'problem', views.ProblemViewSet, base_name="problem")
router.register(r'glossary', views.GlossaryViewSet, base_name="glossary")

urlpatterns = [
    path('', include(router.urls), name='api')
]