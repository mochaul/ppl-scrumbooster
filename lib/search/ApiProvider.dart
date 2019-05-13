import 'package:http/http.dart' show Client;
import 'package:ScrumBooster/search/Model.dart';
import 'dart:convert';
import 'package:ScrumBooster/Utils/utils.dart';

class SearchApiProvider {
  Client client = Client();
  String query;
  var util = Util();

  SearchResultModel modelCeremonies;
  SearchResultModel modelProblems;
  SearchResultModel modelPhases;

  List<CeremonyItem> ceremonyItemSearchResults;
  List<ProblemItem> problemItemSearchResults;
  List<PhaseItem> phaseItemSearchResults;

  SearchApiProvider({
    String query,
  }) {
    this.query = query;
  }

  var responseCeremonies;
  var responseProblem;
  var responsePhases;

  fetchSearchResults() async {
    try {
      responseCeremonies = await client.get(
        util.getConfiguration()['base_url']+"ceremony/?search=${this.query}"
      );
      responseProblem = await client.get(
        util.getConfiguration()['base_url']+"problem/?search=${this.query}"
      );
      responsePhases = await client.get(
        util.getConfiguration()['base_url']+"phase/?search=${this.query}"
      );
    } catch (e) {
      print("API isn't available");
    }
    var ceremoniesBody = json.decode(utf8.decode(responseCeremonies.bodyBytes));
    var problemsBody = json.decode(utf8.decode(responseProblem.bodyBytes));
    var phasesBody = json.decode(utf8.decode(responsePhases.bodyBytes));;

    modelCeremonies = SearchResultModel.fromJson(ceremoniesBody, 'ceremonies');
    modelProblems = SearchResultModel.fromJson(problemsBody, 'problems');
    modelPhases = SearchResultModel.fromJson(phasesBody, 'phases');

    ceremonyItemSearchResults = [];
    for (Map<String, dynamic> ceremony in modelCeremonies.ceremonies) {
      ceremonyItemSearchResults.add(CeremonyItem.fromJson(ceremony));
    }

    problemItemSearchResults = [];
    for (Map<String, dynamic> problem in modelProblems.problems) {
      problemItemSearchResults.add(ProblemItem.fromJson(problem));
    }

    phaseItemSearchResults = [];
    for (Map<String, dynamic> phase in modelPhases.phases) {
      phaseItemSearchResults.add(PhaseItem.fromJson(phase));
    }
  }

  SearchResultModel getCeremoniesModel() {
    return modelCeremonies;
  }

  SearchResultModel getProblemsModel() {
    return modelProblems;
  }

  SearchResultModel getPhasesModel() {
    return modelPhases;
  }

  List<CeremonyItem> getCeremonyItemSearchResults() {
    return ceremonyItemSearchResults;
  }

  List<ProblemItem> getProblemItemSearchResults() {
    return problemItemSearchResults;
  }

  List<PhaseItem> getPhaseItemSearchResults() {
    return phaseItemSearchResults;
  }
}