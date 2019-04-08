from django.core.management.base import BaseCommand
from django.conf import settings
from rest_api.models import (Phase, ProcessArea, Goal, CMMIPractices, Ceremony,
                        Problem, Glossary, QuizQuestion)
from django.db import IntegrityError
from PIL import Image
import csv

class Command(BaseCommand):

    def _create_phase(self):
        print("Creating phase")
        with open('phase.csv') as csv_file:
            print("Opening phase.csv file")
            csv_reader = csv.DictReader(csv_file, delimiter=',')
            line_count = 0
            for row in csv_reader:
                if line_count = 0:
                    line_count += 1
                    continue
                try:
                    Phase.objects.create(title=row["title"], detail=row["detail"])
                    print(f'Phase {row["title"]} has been created successfully')
                except IntegrityError:
                    print(f'Phase {row["title"]} has already been created')
            print("Finish create phase")
            print("===================")
        return

    def _create_process_areas(self):
        print("Creating process area")
        with open('processarea.csv') as csv_file:
            print("Opening processarea.csv")
            csv_reader = csv.DictReader(csv_file, delimiter=',')
            line_count = 0
            for row in csv_reader:
                if line_count = 0:
                    line_count += 1
                    continue
                try:
                    ProcessArea.objects.create(title=row["title"],purpose_statement=row["purpose_statement"],introductory_notes=row["introductory_notes"])
                    print(f'Process Area {row["title"]} has been created successfully')
                except IntegrityError:
                    print(f'Process Area {row["title"]} has already been created')
            line_count = 0
            for row in csv_reader:
                if line_count = 0:
                    line_count += 1
                    continue
                related_process_areas = row["related_process_areas"].split(";")
                for process_area in related_process_areas:
                    ProcessArea.objects.get(title=row["title"]).related_process_areas.add(ProcessArea.objects.get(title=process_area))
            print("Finish create process area")
            print("===================")
        return
    
    def _create_goal(self):
        print("Creating goal")
        with open('goal.csv') as csv_file:
            print("Opening goal.csv")
            csv_reader = csv.DictReader(csv_file, delimiter=',')
            line_count = 0
            for row in csv_reader:
                if line_count = 0:
                    line_count += 1
                    continue
                related_process_areas = row["to_satisfy"].split(";")
                try:
                    goal = Goal.objects.create(title=row["title"],detail=row["detail"])
                    print(f'Goal {row["title"]} has been created successfully')
                    for process_area in related_process_areas:
                        goal.to_satisfy.add(ProcessArea.objects.get(title=process_area))
                except IntegrityError:
                    print(f'Goal {row["title"]} has already been created')
            print("Finish create goal")
            print("===================")
        return
    
    def _create_cmmi_practices(self):
        print("Creating cmmi practices")
        with open('cmmipractices.csv') as csv_file:
            print("Opening cmmipractices.csv")
            csv_reader = csv.DictReader(csv_file, delimiter=',')
            line_count = 0
            for row in csv_reader:
                if line_count = 0:
                    line_count += 1
                    continue
                related_goal = row["to_achieve"].split(";")
                try:
                    cmmi_practice = CMMIPractices.objects.create(title=row["title"],detail=row["detail"])
                    print(f'CMMI Practice {row["title"]} has been created successfully')
                    for goal in related_goal:
                        cmmi_practice.to_achieve.add(Goal.objects.get(title=goal))
                except IntegrityError:
                    print(f'CMMI Practice {row["title"]} has already been created')
            print("Finish create cmmi practice")
            print("===================")
        return

    def _create_ceremony(self):
        print("Creating ceremony")
        with open('ceremony.csv') as csv_file:
            print("Opening ceremony.csv")
            csv_reader = csv.DictReader(csv_file, delimiter=',')
            line_count = 0
            for row in csv_reader:
                if line_count = 0:
                    line_count += 1
                    continue
                related_cmmi_practice = row["can_be_enhanced_by_using"].split(";")
                try:
                    ceremony = Ceremony.objects.create(title=row["title"],detail=row["detail"],phase=Phase.objects.get(title=row["phase"]))
                    print(f'Ceremony {row["title"]} has been created successfully')
                    for cmmi_process in related_cmmi_practice:
                        ceremony.can_be_enhanced_by_using.add(CMMIPractices.objects.get(title=cmmi_process))
                except IntegrityError:
                    print(f'Ceremony {row["title"]} has already been created')
            print("Finish create ceremony")
            print("===================")
        return

    def _create_problem(self):
        print("Creating problem")
        with open('problem.csv') as csv_file:
            print("Opening problem.csv")
            csv_reader = csv.DictReader(csv_file, delimiter=',')
            line_count = 0
            for row in csv_reader:
                if line_count = 0:
                    line_count += 1
                    continue
                related_cmmi_practice = row["can_be_solved_by_using"].split(";")
                related_ceremonies = row["may_be_happen_at"]
                try:
                    problem = Problem.objects.create(title=row["title"],detail=row["detail"])
                    print(f'Problem {row["title"]} has been created successfully')
                    for cmmi_process in related_cmmi_practice:
                        problem.can_be_solved_by_using.add(CMMIPractices.objects.get(title=cmmi_process))
                    for ceremony in related_ceremonies:
                        problem.may_be_happen_at.add(Ceremony.objects.get(title=ceremony))
                except IntegrityError:
                    print(f'Problem {row["title"]} has already been created')
            print("Finish create problem")
            print("===================")
        return

    def _create_glossary(self):
        print("Creating glossary")
        with open('glossary.csv') as csv_file:
            print("Opening glossary.csv")
            csv_reader = csv.DictReader(csv_file, delimiter=',')
            line_count = 0
            for row in csv_reader:
                if line_count = 0:
                    line_count += 1
                    continue
                related_problem = row["problem_that_contain"].split(";")
                related_ceremonies = row["ceremonies_that_contain"]
                try:
                    glossary = Glossary.objects.create(name=row["name"],detail=row["detail"])
                    print(f'Glossary {row["name"]} has been created successfully')
                    for problem in related_problem:
                        glossary.problem_that_contain.add(Problem.objects.get(title=problem))
                    for ceremony in related_ceremonies:
                        glossary.ceremonies_that_contain.add(Ceremony.objects.get(title=ceremony))
                except IntegrityError:
                    print(f'Glossary {row["name"]} has already been created')
            print("Finish create glossary")
            print("===================")
        return

    def _create_quiz_question(self):
        print("Creating quiz question")
        with open('quizquestion.csv') as csv_file:
            print("Opening quizquestion.csv")
            csv_reader = csv.DictReader(csv_file, delimiter=',')
            line_count = 0
            for row in csv_reader:
                if line_count = 0:
                    line_count += 1
                    continue
                try:
                    QuizQuestion.objects.create(question_for=Phase.objects.get(title=row["question_for"]),question=row["question"],
                    option_1=row["option_1"],option_2=row["option_2"],option_2=row["option_2"],option_3=row["option_3"],option_4=row["option_4"],
                    answer_key=int(row["answer_key"]))
                    print(f'Question {row["question"]} has been created successfully')
                except IntegrityError:
                    print(f'Question {row["question"]} has already been created')
            print("Finish create quiz question")
            print("===================")
        return

    def handle(self, *args, **options):
        print("POPULATE DATABASE BEGIN")
        self._create_phase()
        self._create_process_areas()
        self._create_goal()
        self._create_cmmi_practices()
        self._create_ceremony()
        self._create_problem()
        self._create_glossary()
        self._create_quiz_question()
        print("POPULATE DATABASE COMPLETE")