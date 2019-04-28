from django.db import models


class Phase(models.Model):
    title = models.CharField(max_length=255, unique=True)
    detail = models.CharField(max_length=2047)
    image = models.URLField()


# class Goal(models.Model):
#     title = models.CharField(max_length=255, unique=True)
#     detail = models.CharField(max_length=2047)
#     image = models.URLField()
#     to_satisfy = models.ForeignKey(ProcessArea, models.CASCADE)


class Ceremony(models.Model):
    title = models.CharField(max_length=255, unique=True)
    detail = models.CharField(max_length=2047)
    phase = models.ForeignKey(Phase, models.CASCADE)
    image = models.URLField()
    # can_be_enchanched_by_using = models.ManyToManyField(CMMIPractices, blank=True)

class ProcessArea(models.Model):
    title = models.CharField(max_length=255)
    # purpose_statement = models.CharField(max_length=2047)
    # introductory_notes = models.CharField(max_length=2047)
    # related_process_areas = models.ManyToManyField('self', blank=True)
    related_ceremony = models.ForeignKey(Ceremony, models.CASCADE)

class CMMIPractices(models.Model):
    title = models.CharField(max_length=255)
    strengthens = models.CharField(max_length=2047)
    satisfy = models.CharField(max_length=2047)
    demonstrated = models.CharField(max_length=2047)
    image = models.URLField()
    # to_achieve = models.ForeignKey(Goal, models.CASCADE, null=True)
    process_area =  models.ForeignKey(ProcessArea, models.CASCADE)

class Problem(models.Model):
    title = models.CharField(max_length=255, unique=True)
    detail = models.CharField(max_length=2047)
    can_be_solved_by = models.ManyToManyField(Ceremony)
    image = models.URLField()
    # can_be_solved_by_using = models.ManyToManyField(CMMIPractices, blank=True)


class Glossary(models.Model):
    title = models.CharField(max_length=255, unique=True)
    detail = models.CharField(max_length=2047)
    ceremonies_that_contain = models.ManyToManyField(Ceremony, blank=True)
    problem_that_contain = models.ManyToManyField(Problem, blank=True)
    image = models.URLField()


class QuizQuestion(models.Model):
    question_for = models.ForeignKey(Phase, models.CASCADE)
    question = models.CharField(max_length=2047)
    option_1 = models.CharField(max_length=255)
    option_2 = models.CharField(max_length=255)
    option_3 = models.CharField(max_length=255)
    option_4 = models.CharField(max_length=255)
    answer_key = models.IntegerField()