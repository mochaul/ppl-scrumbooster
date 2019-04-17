from django.contrib import admin
from . import models

# Register your models here.
admin.site.register(models.Phase)
admin.site.register(models.ProcessArea)
admin.site.register(models.CMMIPractices)
admin.site.register(models.Ceremony)
admin.site.register(models.Problem)
admin.site.register(models.Glossary)
admin.site.register(models.QuizQuestion)