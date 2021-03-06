"""api URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.urls import path, include, re_path
from rest_api import views

urlpatterns = [
    path('admin/', admin.site.urls),
    re_path(r'^phase/(?P<id>\d+)/details/$', views.GetCeremonyAndProblemByPhase.as_view(), name='phase-ceremony-problem'),
    path('ceremony/alphabetic/', views.GetListCeremonyAlphabeticalOrder.as_view(), name='ceremony-list-alphabetic'),
    path('problem/alphabetic/', views.GetListProblemAlphabeticalOrder.as_view(), name='problem-list-alphabetic'),
    path('glossary/alphabetic/', views.GetListGlossaryAlphabeticalOrder.as_view(), name='glossary-list-alphabetic'),
    path('glossary/<str:title>/', views.GetGlossaryByName.as_view(), name='glossary-detail-by-name'),
    path('', include('rest_api.urls'), name='api'),
]

urlpatterns += staticfiles_urlpatterns()