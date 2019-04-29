from django.core.management.base import BaseCommand
from rest_api.models import (Phase, ProcessArea, CMMIPractices, Ceremony,
                             Problem, Glossary)
from django.db import IntegrityError
import csv


# phaseTitle = ["Product Backlog","Sprint Planning","Sprint Execution","Sprint Evaluation"]

# for i in phaseTitle:

class Command(BaseCommand):
    dct_manytomany = {'can_be_solved_by': Ceremony,'ceremonies_that_contain': Ceremony, 'problem_that_contain': Problem}
    dct_foreignkey = {'to_satisfy': ProcessArea, 'phase': Phase, 'question_for': Phase,
                      'related_ceremony': Ceremony,'process_area':ProcessArea}
    dct_combinedforeignkey = {'containing_ceremony':Ceremony,'containing_process_area':ProcessArea}

    def _create_models(self, models, file_name):
        
        with open(file_name) as csv_file:
            csv_reader = csv.reader(csv_file, delimiter=',')
            line_count = 0
            lst = []

            for row in csv_reader:
                attr = {}

                if line_count == 0:
                    for col in row:
                        lst.append(col)
                    line_count += 1

                else:
                    many_to_many = {}
                    for i in range(len(row)):

                        if row[i] == '':
                            continue
                        
                        if lst[i] in self.dct_combinedforeignkey:
                            if self.dct_combinedforeignkey[lst[i]] == Ceremony:
                                attr['process_area'] = ProcessArea.objects.get(related_ceremony=Ceremony.objects.get(title=row[i]),title=row[i+1])

                        elif lst[i] in self.dct_manytomany:
                            many_to_many[lst[i]] = row[i].split(';')

                        elif lst[i] in self.dct_foreignkey:
                            attr[lst[i]] = self.dct_foreignkey[lst[i]].objects.get(title=row[i])

                        else:
                            attr[lst[i]] = row[i]

                    try:
                        obj = models.objects.create(**attr)
                        if (many_to_many):
                            for key, values in many_to_many.items():
                                many_to_many_field = getattr(obj, key)
                                for value in values:
                                    value_class = self.dct_manytomany[key]
                                    value_obj = value_class.objects.get(title=value)
                                    many_to_many_field.add(value_obj)

                        print(models.__name__, obj.title, 'has been created successfully')

                    except IntegrityError:
                        print(models.__name__, attr[lst[0]], 'has already been created')

    def handle(self, *args, **options):
        print("POPULATE DATABASE BEGIN!")
        self._create_models(Phase, 'rest_api/management/commands/Phase.csv')
        self._create_models(Ceremony, 'rest_api/management/commands/Ceremony.csv')
        self._create_models(Problem, 'rest_api/management/commands/Problem.csv')
        self._create_models(ProcessArea, 'rest_api/management/commands/ProcessArea.csv')
        self._create_models(CMMIPractices, 'rest_api/management/commands/CMMIPractice.csv')
        self._create_models(Glossary, 'rest_api/management/commands/Glossary.csv')
        print("POPULATE DATABASE COMPLETE!")
        print("""``````¶0````1¶1_```````````````````````````````````````
```````¶¶¶0_`_¶¶¶0011100¶¶¶¶¶¶¶001_````````````````````
````````¶¶¶¶¶00¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶0_````````````````
`````1_``¶¶00¶0000000000000000000000¶¶¶¶0_`````````````
`````_¶¶_`0¶000000000000000000000000000¶¶¶¶¶1``````````
```````¶¶¶00¶00000000000000000000000000000¶¶¶_`````````
````````_¶¶00000000000000000000¶¶00000000000¶¶`````````
`````_0011¶¶¶¶¶000000000000¶¶00¶¶0¶¶00000000¶¶_````````
```````_¶¶¶¶¶¶¶00000000000¶¶¶¶0¶¶¶¶¶00000000¶¶1````````
``````````1¶¶¶¶¶000000¶¶0¶¶¶¶¶¶¶¶¶¶¶¶0000000¶¶¶````````
```````````¶¶¶0¶000¶00¶0¶¶`_____`__1¶0¶¶00¶00¶¶````````
```````````¶¶¶¶¶00¶00¶10¶0``_1111_`_¶¶0000¶0¶¶¶````````
``````````1¶¶¶¶¶00¶0¶¶_¶¶1`_¶_1_0_`1¶¶_0¶0¶¶0¶¶````````
````````1¶¶¶¶¶¶¶0¶¶0¶0_0¶``100111``_¶1_0¶0¶¶_1¶````````
```````1¶¶¶¶00¶¶¶¶¶¶¶010¶``1111111_0¶11¶¶¶¶¶_10````````
```````0¶¶¶¶__10¶¶¶¶¶100¶¶¶0111110¶¶¶1__¶¶¶¶`__````````
```````¶¶¶¶0`__0¶¶0¶¶_¶¶¶_11````_0¶¶0`_1¶¶¶¶```````````
```````¶¶¶00`__0¶¶_00`_0_``````````1_``¶0¶¶_```````````
``````1¶1``¶¶``1¶¶_11``````````````````¶`¶¶````````````
``````1_``¶0_¶1`0¶_`_``````````_``````1_`¶1````````````
``````````_`1¶00¶¶_````_````__`1`````__`_¶`````````````
````````````¶1`0¶¶_`````````_11_`````_``_``````````````
`````````¶¶¶¶000¶¶_1```````_____```_1``````````````````
`````````¶¶¶¶¶¶¶¶¶¶¶¶0_``````_````_1111__``````````````
`````````¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶01_`````_11____1111_```````````
`````````¶¶0¶0¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶1101_______11¶_```````````
``````_¶¶¶0000000¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶0¶0¶¶¶1````````````
`````0¶¶0000000¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶1`````````````
````0¶0000000¶¶0_````_011_10¶110¶01_1¶¶¶0````_100¶001_`
```1¶0000000¶0_``__`````````_`````````0¶_``_00¶¶010¶001
```¶¶00000¶¶1``_01``_11____``1_``_`````¶¶0100¶1```_00¶1
``1¶¶00000¶_``_¶_`_101_``_`__````__````_0000001100¶¶¶0`
``¶¶¶0000¶1_`_¶``__0_``````_1````_1_````1¶¶¶0¶¶¶¶¶¶0```
`_¶¶¶¶00¶0___01_10¶_``__````1`````11___`1¶¶¶01_````````
`1¶¶¶¶¶0¶0`__01¶¶¶0````1_```11``___1_1__11¶000`````````
`1¶¶¶¶¶¶¶1_1_01__`01```_1```_1__1_11___1_``00¶1````````
``¶¶¶¶¶¶¶0`__10__000````1____1____1___1_```10¶0_```````
``0¶¶¶¶¶¶¶1___0000000```11___1__`_0111_```000¶01```````
```¶¶¶00000¶¶¶¶¶¶¶¶¶01___1___00_1¶¶¶`_``1¶¶10¶¶0```````
```1010000¶000¶¶0100_11__1011000¶¶0¶1_10¶¶¶_0¶¶00``````
10¶000000000¶0________0¶000000¶¶0000¶¶¶¶000_0¶0¶00`````
¶¶¶¶¶¶0000¶¶¶¶_`___`_0¶¶¶¶¶¶¶00000000000000_0¶00¶01````
¶¶¶¶¶0¶¶¶¶¶¶¶¶¶_``_1¶¶¶00000000000000000000_0¶000¶01```
1__```1¶¶¶¶¶¶¶¶¶00¶¶¶¶00000000000000000000¶_0¶0000¶0_``
```````¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶00000000000000000000010¶00000¶¶_`
```````0¶¶¶¶¶¶¶¶¶¶¶¶¶¶00000000000000000000¶10¶¶0¶¶¶¶¶0`
````````¶¶¶¶¶¶¶¶¶¶0¶¶¶00000000000000000000010¶¶¶0011```
````````1¶¶¶¶¶¶¶¶¶¶0¶¶¶0000000000000000000¶100__1_`````
`````````¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶000000000000000000¶11``_1``````
`````````1¶¶¶¶¶¶¶¶¶¶¶0¶¶¶00000000000000000¶11___1_`````
``````````¶¶¶¶¶¶0¶0¶¶¶¶¶¶¶0000000000000000¶11__``1_````
``````````¶¶¶¶¶¶¶0¶¶¶0¶¶¶¶¶000000000000000¶1__````__```
``````````¶¶¶¶¶¶¶¶0¶¶¶¶¶¶¶¶¶0000000000000000__`````11``
`````````_¶¶¶¶¶¶¶¶¶000¶¶¶¶¶¶¶¶000000000000011_``_1¶¶¶0`
`````````_¶¶¶¶¶¶0¶¶000000¶¶¶¶¶¶¶000000000000100¶¶¶¶0_`_
`````````1¶¶¶¶¶0¶¶¶000000000¶¶¶¶¶¶000000000¶00¶¶01`````
`````````¶¶¶¶¶0¶0¶¶¶0000000000000¶0¶00000000011_``````_
````````1¶¶0¶¶¶0¶¶¶¶¶¶¶000000000000000000000¶11___11111
````````¶¶¶¶0¶¶¶¶¶00¶¶¶¶¶¶000000000000000000¶011111111_
```````_¶¶¶¶¶¶¶¶¶0000000¶0¶00000000000000000¶01_1111111
```````0¶¶¶¶¶¶¶¶¶000000000000000000000000000¶01___`````
```````¶¶¶¶¶¶0¶¶¶000000000000000000000000000¶01___1````
``````_¶¶¶¶¶¶¶¶¶00000000000000000000000000000011_111```
``````0¶¶0¶¶¶0¶¶0000000000000000000000000000¶01`1_11_``
``````¶¶¶¶¶¶0¶¶¶0000000000000000000000000000001`_0_11_`
``````¶¶¶¶¶¶¶¶¶00000000000000000000000000000¶01``_0_11`
``````¶¶¶¶0¶¶¶¶00000000000000000000000000000001```_1_11""")