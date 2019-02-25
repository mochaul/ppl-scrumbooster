from rest_framework import serializers
from . import models

class PhaseSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Phase
        fields = ('__all__')

class CMMIPracticesSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.CMMIPractices
        fields = ('__all__')

class CeremonySerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Ceremony
        fields = ('__all__')

class ProblemSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Problem
        fields = ('__all__')

class GlossarySerializer(serializers.ModelSerializer):

    class Meta:
        model = models.Glossary
        fields = ('__all__')

class QuizQuestionSerializer(serializers.ModelSerializer):

    class Meta:
        model = models.QuizQuestion
        fields = ('__all__')