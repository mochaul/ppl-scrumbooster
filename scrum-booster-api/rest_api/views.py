from django.shortcuts import render
from rest_framework import viewsets
from . import serializers, models
from rest_framework import views, status, filters
from rest_framework.response import Response


class PhaseViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = models.Phase.objects.all()
    serializer_class = serializers.PhaseSerializer
    filter_backends = (filters.SearchFilter,)
    search_fields = ('title',)


class ProcessAreaViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = models.ProcessArea.objects.all()
    serializer_class = serializers.ProcessAreaSerializer
    filter_backends = (filters.SearchFilter,)
    search_fields = ('title',)


# class GoalViewSet(viewsets.ReadOnlyModelViewSet):
#     queryset = models.Goal.objects.all()
#     serializer_class = serializers.GoalSerializer


class CMMIPracticesViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = models.CMMIPractices.objects.all()
    serializer_class = serializers.CMMIPracticesSerializer
    filter_backends = (filters.SearchFilter,)
    search_fields = ('title',)


class CeremonyViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = models.Ceremony.objects.all()
    serializer_class = serializers.CeremonySerializer
    filter_backends = (filters.SearchFilter,)
    search_fields = ('title',)


class ProblemViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = models.Problem.objects.all()
    serializer_class = serializers.ProblemSerializer
    filter_backends = (filters.SearchFilter,)
    search_fields = ('title',)


class GlossaryViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = models.Glossary.objects.all()
    serializer_class = serializers.GlossarySerializer
    filter_backends = (filters.SearchFilter,)
    search_fields = ('name',)


class QuizQuestionViewSet(viewsets.ReadOnlyModelViewSet):
    queryset = models.QuizQuestion.objects.all()
    serializer_class = serializers.QuizQuestionSerializer


class GetCeremonyAndProblemByPhase(views.APIView):
    def get(self, request, id):
        try:
            phase = models.Phase.objects.get(id=id)
        except models.Phase.DoesNotExist:
            return Response({'detail': 'Invalid id'}, status=status.HTTP_400_BAD_REQUEST)

        ceremonies = phase.ceremony_set.all()
        problems = models.Problem.objects.filter(may_be_happen_at__in=ceremonies).distinct()

        ceremonies_serializer = serializers.CeremonySerializer(ceremonies, many=True, context={'request': request})
        problems_serializer = serializers.ProblemSerializer(problems, many=True, context={'request': request})

        return Response({'ceremonies':ceremonies_serializer.data, 'problems':problems_serializer.data},
                        status=status.HTTP_200_OK)