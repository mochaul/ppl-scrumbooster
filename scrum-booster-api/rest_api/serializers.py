from rest_framework import serializers
from . import models


class PhaseSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Phase
        fields = '__all__'


class ProcessAreaSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.ProcessArea
        fields = '__all__'


# class GoalSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = models.Goal
#         fields = '__all__'


class CMMIPracticesSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.CMMIPractices
        fields = '__all__'


class CeremonySerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Ceremony
        fields = '__all__'


class ProblemSerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Problem
        fields = '__all__'


class GlossarySerializer(serializers.ModelSerializer):
    class Meta:
        model = models.Glossary
        fields = '__all__'

