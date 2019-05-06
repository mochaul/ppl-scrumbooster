from django.shortcuts import render
from rest_framework import viewsets
from . import serializers, models
from rest_framework import views, status, filters
from rest_framework.response import Response
import string


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
    search_fields = ('title',)


class GetCeremonyAndProblemByPhase(views.APIView):
    def get(self, request, id):
        try:
            phase = models.Phase.objects.get(id=id)
        except models.Phase.DoesNotExist:
            return Response({'detail': 'Invalid id'}, status=status.HTTP_400_BAD_REQUEST)

        ceremonies = phase.ceremony_set.all()
        problems = models.Problem.objects.filter(can_be_solved_by__in=ceremonies).distinct()

        ceremonies_serializer = serializers.CeremonySerializer(ceremonies, many=True, context={'request': request})
        problems_serializer = serializers.ProblemSerializer(problems, many=True, context={'request': request})

        return Response({'ceremonies':ceremonies_serializer.data, 'problems':problems_serializer.data},
                        status=status.HTTP_200_OK)


class GetListCeremonyAlphabeticalOrder(views.APIView):
    def get(self, request):
        response = get_list_data_alphabetical_order(request, models.Ceremony, serializers.CeremonySerializer)
        return Response(response, status=status.HTTP_200_OK)


class GetListProblemAlphabeticalOrder(views.APIView):
    def get(self, request):
        response = get_list_data_alphabetical_order(request, models.Problem, serializers.ProblemSerializer)
        return Response(response, status=status.HTTP_200_OK)


class GetListGlossaryAlphabeticalOrder(views.APIView):
    def get(self, request):
        response = get_list_data_alphabetical_order(request, models.Glossary, serializers.GlossarySerializer)
        return Response(response, status=status.HTTP_200_OK)

        
class GetGlossaryByName(views.APIView):
    def get(self, request, title):
        try:
            obj = models.Glossary.objects.get(title=title)
        except models.Glossary.DoesNotExist:
            return Response({'detail': 'Not found'}, status=status.HTTP_400_BAD_REQUEST)

        obj_serializer = serializers.GlossarySerializer(obj, context={'request': request})
        return Response(response, status=status.HTTP_200_OK)

def get_list_data_alphabetical_order(request, model_class, serializer_class):
    dct = {}
    for i in string.ascii_lowercase:
        objects = model_class.objects.filter(title__startswith=i)
        objects_serializer = serializer_class(objects, many=True, context={'request': request})
        dct[i] = objects_serializer.data

    return dct