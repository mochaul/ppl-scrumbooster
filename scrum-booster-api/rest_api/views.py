from django.shortcuts import render
from rest_framework import viewsets
from . import serializers, models


class PhaseViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = models.Phase.objects.all()
    serializer_class = serializers.PhaseSerializer


class ProcessAreaViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = models.ProcessArea.objects.all()
    serializer_class = serializers.ProcessAreaSerializer


class GoalViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = models.Goal.objects.all()
    serializer_class = serializers.GoalSerializer


class CMMIPracticesViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = models.CMMIPractices.objects.all()
    serializer_class = serializers.CMMIPracticesSerializer


class CeremonyViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = models.Ceremony.objects.all()
    serializer_class = serializers.CeremonySerializer


class ProblemViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = models.Problem.objects.all()
    serializer_class = serializers.ProblemSerializer


class GlossaryViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = models.Glossary.objects.all()
    serializer_class = serializers.GlossarySerializer


class QuizQuestionViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = models.QuizQuestion.objects.all()
    serializer_class = serializers.QuizQuestionSerializer
