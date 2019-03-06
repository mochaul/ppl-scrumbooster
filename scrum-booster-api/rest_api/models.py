from django.db import models


class Phase(models.Model):
    title = models.CharField(max_length=255)
    detail = models.CharField(max_length=2047)
    image = models.ImageField()


class ProcessArea(models.Model):
    title = models.CharField(max_length=255)
    purpose_statement = models.CharField(max_length=2047)
    introductory_notes = models.CharField(max_length=2047)
    related_process_areas = models.ManyToManyField('self')


class Goal(models.Model):
    title = models.CharField(max_length=255)
    detail = models.CharField(max_length=2047)
    image = models.ImageField()
    to_satisfy = models.ForeignKey(ProcessArea, models.CASCADE, null=False)


class CMMIPractices(models.Model):
    title = models.CharField(max_length=255)
    detail = models.CharField(max_length=2047)
    image = models.ImageField()
    to_achieve = models.ForeignKey(Goal, models.CASCADE, null=True)


class Ceremony(models.Model):
    title = models.CharField(max_length=255)
    detail = models.CharField(max_length=2047)
    phase = models.ForeignKey(Phase, models.CASCADE)
    image = models.ImageField()
    can_be_enchanched_by_using = models.ManyToManyField(CMMIPractices)


class Problem(models.Model):
    title = models.CharField(max_length=255)
    detail = models.CharField(max_length=2047)
    may_be_happen_at = models.ManyToManyField(Ceremony)
    image = models.ImageField()
    can_be_solved_by_using = models.ManyToManyField(CMMIPractices)


class Glossary(models.Model):
    name = models.CharField(max_length=255)
    detail = models.CharField(max_length=2047)
    ceremonies_that_contain = models.ManyToManyField(Ceremony)
    problem_that_contain = models.ManyToManyField(Problem)
    image = models.ImageField()


class QuizQuestion(models.Model):
    question_for = models.ForeignKey(Phase, models.CASCADE)
    question = models.CharField(max_length=2047)
    option_1 = models.CharField(max_length=255)
    option_2 = models.CharField(max_length=255)
    option_3 = models.CharField(max_length=255)
    option_4 = models.CharField(max_length=255)
    answer_key = models.IntegerField()