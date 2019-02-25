from django.shortcuts import render
from rest_framework import viewsets
from . import serializers, models

# Create your views here.
class PhaseViewSet(viewsets.ModelViewSet) :
    queryset = models.Phase.objects.all()
    serializer_class = serializers.PhaseSerializer

class CMMIPracticesViewSet(viewsets.ModelViewSet) :
    queryset = models.CMMIPractices.objects.all()
    serializer_class = serializers.CMMIPracticesSerializer

class CeremonyViewSet(viewsets.ModelViewSet) :
    queryset = models.Ceremony.objects.all()
    serializer_class = serializers.CeremonySerializer

class ProblemViewSet(viewsets.ModelViewSet) :
    queryset = models.Problem.objects.all()
    serializer_class = serializers.ProblemSerializer

class GlossaryViewSet(viewsets.ModelViewSet) :
    queryset = models.Glossary.objects.all()
    serializer_class = serializers.GlossarySerializer

class QuizQuestionViewSet(viewsets.ModelViewSet) :
    queryset = models.QuizQuestion.objects.all()
    serializer_class = serializers.QuizQuestionSerializer