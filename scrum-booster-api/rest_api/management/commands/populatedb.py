from django.core.management.base import BaseCommand
from django.conf import settings
from rest_api.models import (Phase, ProcessArea, Goal, CMMIPractices, Ceremony,
                        Problem, Glossary, QuizQuestion)
from django.db import IntegrityError

# phaseTitle = ["Product Backlog","Sprint Planning","Sprint Execution","Sprint Evaluation"]

# for i in phaseTitle:

class Command(BaseCommand):
    def handle(self, *args, **options):
        product_backlog_phase = Phase.objects.create(title="Product Backlog", detail="")
        sprint_planning_phase = Phase.objects.create(title="Sprint Planning", detail="")
        sprint_execution_phase = Phase.objects.create(title="Sprint Execution", detail="")
        sprint_evaluation_phase = Phase.objects.create(title="Sprint Evaluation", detail="")


        backlog_grooming = Ceremony.objects.create(title="Backlog Grooming", detail='Backlog grooming (sometimes called “story time”) is a common agile technique used by Scrum teams to produce a prioritized backlog of epics and user stories before and during a sprint. Grooming that takes place during a sprint is sometimes referred to as micro-grooming”. Backlog grooming typically includes a negotiation between the product owner and Scrum team on the epics or user stories that will be added, removed, or revised for each sprint. All relevant stakeholders have input into this collaborative decision. As such, it is a critical activity related to the planning and execution of a sprint. CMMI can strengthen backlog grooming by guiding team members toward better and stronger ways to produce a streamlined backlog with robust user stories. If the purpose of backlog grooming is to ensure clarity and readiness for the sprint planning, then Requirements Management (REQM) offers a framework for ensuring that an agile team can agree to, understand, and manage its requirements using criteria that identify a “Definition of Done” for each story or epic.', phase=product_backlog_phase)
        Ceremony.objects.create(title="Epics", detail='In agile terms, an “epic” is simply a large user story that will require later breakdown into individual user stories. Typically, a team will choose to break down an epic into smaller, more easily manageable user stories that can be completed in a single sprint. An epic is a work product that is created as a result of a requirements elicitation and development process and therefore has close ties to Requirements Development (RD) SP1.1 and RD SP1.2. Epics can be created in a joint development workshop (JAD), conference room pilot (CRP), via reverse engineering, brainstorming session, or via other requirements elicitation technique.', phase=product_backlog_phase)
        Ceremony.objects.create(title="Product Backlog", detail="The product backlog is a prioritized list of everything that may be included in the product. It includes features, bugs, documentation changes, and any other tasks required by the product owner. The establishment of the contents of the product backlog, user stories, initial estimates, and priorities demonstrates that the product owner understands and is committed to the requirements of the product. This data also provides the foundation for the development of project plans and the integration of related plans.", phase=product_backlog_phase)
        Ceremony.objects.create(title="Release Planning", detail="The purpose of release planning is to commit to a plan for delivering an increment of product value. During Release Planning the team does not plan for each detailed activity, but defers the detailed commitments such as determining who is going to do what and when for the iteration/sprint planning.", phase=product_backlog_phase)
        Ceremony.objects.create(title="User Stories", detail='A user story is a simple-language description of a discreet piece of functionality, described from the user’s standpoint. Typically broken down from a larger “epic,” or simply a larger user story, it is a self-contained piece of functionality that can be delivered in a single sprint. In environments where Test Driven Development (TDD) is employed, and there is a robust Definition of Done (DOD) that identifies the criteria for acceptance of the story, agile teams experience lower defects injected during the requirements development process.', phase=product_backlog_phase)


        Ceremony.objects.create(title="Team Estimating Game (Fibonacci Game) & Planning Poker", detail="The Team Estimating Game (sometimes called the “Fibonacci Game”) is an agile estimation technique that establishes relative sizing using story points and rough order of magnitude estimation. The Team Estimating Game primarily reflects the use of Project Planning SP1.1 when placed within the context of the product backlog, but only if the user stories are fleshed out with tasks and a completed Definition of Done.", phase=sprint_planning_phase)
        # Ceremony.objects.create(title="Velocity", detail="", phase=sprint_planning_phase)
        sprint_planning = Ceremony.objects.create(title="Sprint Planning", detail='The Sprint Planning Meeting occurs at the beginning of each sprint, and is a negotiation between the agile team and the product owner (or customer) as to what value will be delivered in the upcoming sprint. Sprint planning occurs frequently during an agile project, and is an iterative and incremental form of planning, as well as a validation of the product backlog.', phase=sprint_planning_phase)
        Ceremony.objects.create(title="Definition of Done", detail="The Definition of Done (DOD) is a critical element of any agile project. It is an agreement within the agile team that indicates what must be completed for the product to be ready for the sprint review by the product owner. For most agile projects, the definition of “Done” is at the user story level, agreed to by the team and defined within each story. A story is considered “Done” when the DOD defined within the story is complete. The DOD is a powerful tool that, when implemented properly, can provide valuable information while attempting to verify practices in Requirements Management (SP1.1 in particular), Project Monitoring and Control, Validation, Product Integration, and Technical Solution.", phase=sprint_planning_phase)


        daily_standup = Ceremony.objects.create(title="Daily Standup / Daily Scrum", detail='The Daily Standup Meeting (aka “Daily Scrum” or “Daily Meeting”) is an agile technique that is often identified with Scrum but is popular with all types of agile approaches. It is used as a way to identify issues and risks earlier than a traditional project (“fail fast”), and to increase collaboration between agile team members. The Daily Standup can demonstrate practices within Project Monitoring and Control, Risk Management, Measurement and Analysis, Integrated Project Management, and Generic Practices GP2.8 and GP2.10 from various process areas depending on attendance.', phase=sprint_execution_phase)
        Ceremony.objects.create(title="Velocity", detail='“Velocity” is a tool used by agile teams for capacity planning and tracking of ongoing work during sprints and releases. Based on an agreed-upon unit of work, usually a story point, velocity is an indicator of how much value a given Scrum team can be expected to deliver in an upcoming sprint, or how much value they have actually delivered. Velocity is a core metric for any agile team, but it is also the foundation for estimating and tracking of project work. Because agile teams work in a “fixed-time-box,” “fixed-team-size” environment, measurements such as CPI and SPI are superfluous, making velocity an important measure of project success.', phase=sprint_execution_phase)
        Ceremony.objects.create(title="Technical Debt", detail='Technical Debt is incurred when the agile team proactively determines that a less optimum, less efficient, or less elegant solution is appropriate given constraints of time, budget, or resources. As technical debt increases, the costs and effort to continue development, or maintain an existing system, become too high, and a “technical debt sprint” can be scheduled within a release to improve code quality.', phase=sprint_execution_phase)
        Ceremony.objects.create(title="Test Driven Development", detail='Test Driven Development, or TDD, is an agile technique most commonly used as part of an Extreme Programming (XP) project. Used as both an early Validation and Verification technique, an individual developer will write a basic test case to verify the desired functionality, knowing that it will fail, and then writes the minimum amount of code to pass the test. The developer will then clean up the code to ensure that it meets acceptable performance and coding standards and principles. TDD is a powerful technique that can improve the quality of code and requirements, so therefore has a strong relationship to Validation, Verification, and Requirements Development.', phase=sprint_execution_phase)
        Ceremony.objects.create(title="Continuous Build / Continuous Integration", detail='Continuous build/continuous integration is an approach to continuous testing and product integration popular with agile teams that were first introduced in Extreme Programming (XP). CB/CI can be used in any type of software engineering environment and is not limited to agile teams. In a CB/CI environment, an application is built, and unit and (in some cases integration) tested, using automated tools each time new code is “checked-in” to the code management system. It was originally introduced as a companion to “test-driven development (TDD),” technique in which test cases are written concurrently with user stories. CMMI’s Product Integration practices support the iterative and incremental nature of continuous build environments. When a project assembles product components in incremental stages, using a purposeful strategy and defined procedures, successful integration is highly likely.', phase=sprint_execution_phase)
        Ceremony.objects.create(title="Refactoring", detail='Refactoring is a technique that is focused on improving the internal structure, style, operations, and condition of software code while maintaining its external functionality and behavior. Being focused on continuously improving the products, refactoring can be improved by applying the guidelines present in Integrated Project Management (SP1.7), Generic Goal 3 (GP3.2), and Technical Solution (SP3.1).', phase=sprint_execution_phase)

        team_agreements = Ceremony.objects.create(title="Team Agreements", detail='A Team Agreement is a social contract entered into by members of an agile team to define team behaviors, expectations, and agreed norms. Sometimes it is referred to as a “Working Agreement.” Team Agreements can be improved through the application of practices in the CMMI from Integrated Project Management and Organizational Process Definition, where guidance for assembling teams can be found.', phase=sprint_evaluation_phase)
        Ceremony.objects.create(title="Release Burn-Down Chart", detail='A Release Burn-Down chart is an information radiator that visually depicts the trajectory of the overall release by sprint. Release burn chart is a mechanism to monitor the release implementation progress on a high level across the sprints or iterations. The sprint burn charts and daily standups track the detailed activities during the sprint.', phase=sprint_evaluation_phase)
        Ceremony.objects.create(title="Sprint / Iteration", detail='The primary construct for getting work done with an agile team is the fixed-length Sprint. A Sprint is a time-boxed event where team members self-subscribe to User Stories and all work, including design, coding, testing, and backlog grooming takes place. Scrum teams vary on the inclusion of Sprint Planning, Sprint Demo, and Sprint Retrospective within the confines of a Sprint, with most reserving time inside the timebox to accomplish those tasks.', phase=sprint_evaluation_phase)
        Ceremony.objects.create(title="Sprint Burn-Down Chart", detail='A Sprint Burn-Down chart is an information radiator that visually depicts the effort remaining to complete the sprint. The Sprint Burn-Down chart helps the agile team to understand whether or not it will deliver the desired functionality by the end of the sprint as planned. The use of burn charts in sprint tracking is to monitor teamwork progress and to manage the risks of achieving the iteration goal to deliver potentially shippable product. The team can benefit from the CMMI’s Measurement and Analysis process area to enhance its capabilities for analyzing the burn chart. ', phase=sprint_evaluation_phase)
        Ceremony.objects.create(title="Sprint Demo / Sprint Review", detail='A Sprint Demo (“Sprint Review”) is an iterative and incremental collaborative technique to ensure that all stakeholders are aware of the value that is being delivered at the end of each sprint by an agile team. The Sprint Review/Sprint Demo can be improved through the application of practices from Project Monitoring and Control, Integrated Project Management, Verification, and Validation.', phase=sprint_evaluation_phase)

        #Product Backlog
        backlog_grooming.problem_set.create(title="PROJECT ESTIMATES ARE UNREALISTIC OR UNKNOWN", detail="PROJECT ESTIMATES ARE UNREALISTIC OR UNKNOWN.")
        backlog_grooming.problem_set.create(title="REQUIREMENTS ARE ALWAYS CHANGING", detail="REQUIREMENTS ARE ALWAYS CHANGING.")
        backlog_grooming.problem_set.create(title="UNABLE TO SECURE OR RETAIN PROJECT RESOURCES", detail="UNABLE TO SECURE OR RETAIN PROJECT RESOURCES.")
        backlog_grooming.problem_set.create(title="LACK OF INTERNAL AND EXTERNAL SUPPORT FOR PROJECT", detail="LACK OF INTERNAL AND EXTERNAL SUPPORT FOR PROJECT.")
        backlog_grooming.problem_set.create(title="POOR PROJECT COMMUNICATION", detail="POOR PROJECT COMMUNICATION.")
        backlog_grooming.problem_set.create(title="REQUIREMENTS ARE VAGUE OR OPEN-ENDED", detail="REQUIREMENTS ARE VAGUE OR OPEN-ENDED.") 

        #Sprint Planing
        sprint_planning.problem_set.create(title="CUSTOMERS WON’T COMMIT TO PROJECT.", detail="CUSTOMERS WON’T COMMIT TO PROJECT.")
        #Problem.objects.create(title="POOR PROJECT COMMUNICATION", detail="POOR PROJECT COMMUNICATION")
        sprint_planning.problem_set.create(title="PROJECT TEAM RESPONSIBILITIES ARE NOT CLEAR", detail="PROJECT TEAM RESPONSIBILITIES ARE NOT CLEAR")
        sprint_planning.problem_set.create(title="PROJECT INFORMATION ISN'T AVAILABLE WHEN NEEDED", detail="PROJECT INFORMATION ISN'T AVAILABLE WHEN NEEDED")
        sprint_planning.problem_set.create(title="FAILURE TO SUCCESSFULLY PLAN THE PROJECT", detail="FAILURE TO SUCCESSFULLY PLAN THE PROJECT")

        #Sprint Execution
        daily_standup.problem_set.create(title="PROJECTS DO NOT GET DELIVERED ON SCHEDULE.", detail="PROJECTS DO NOT GET DELIVERED ON SCHEDULE.")
        daily_standup.problem_set.create(title="CUSTOMERS ARE NOT SATISFIED WITH THE END PRODUCT.", detail="CUSTOMERS ARE NOT SATISFIED WITH THE END PRODUCT.")
        daily_standup.problem_set.create(title="THERE ARE TOO MANY BUGS DURING A PROJECT OR POST PROJECT.", detail="THERE ARE TOO MANY BUGS DURING A PROJECT OR POST PROJECT.")
        daily_standup.problem_set.create(title="FAILURE TO FORESEE POTENTIAL PROBLEMS.", detail="FAILURE TO FORESEE POTENTIAL PROBLEMS.")
        daily_standup.problem_set.create(title="CODE QUALITY IS POOR.", detail="CODE QUALITY IS POOR.")
        daily_standup.problem_set.create(title="PROJECT TEAM MEMBER TRAINING IS INADEQUATE FOR THE TASK.", detail="PROJECT TEAM MEMBER TRAINING IS INADEQUATE FOR THE TASK.")

        #Sprint Evaluation
        #team_agreements.problem_set.create(title="CUSTOMERS WON’T COMMIT TO PROJECT.", detail="CUSTOMERS WON’T COMMIT TO PROJECT.")
        team_agreements.problem_set.create(title="CUSTOMERS ARE FRUSTRATED WITH PROGRESS.", detail="CUSTOMERS ARE FRUSTRATED WITH PROGRESS.")
        team_agreements.problem_set.create(title="LACK OF INTERNAL AND EXTERNAL SUPPORT FOR PROJECT.", detail="LACK OF INTERNAL AND EXTERNAL SUPPORT FOR PROJECT.")
        team_agreements.problem_set.create(title="ORGANIZATIONAL PERFORMANCE ISN’T IMPROVING.", detail="ORGANIZATIONAL PERFORMANCE ISN’T IMPROVING.")
