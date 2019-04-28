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

  List<CeremonyItem> ceremonyItemSearchResults;
  List<ProblemItem> problemItemSearchResults;

  SearchApiProvider({
    String query,
  }) {
    this.query = query;
  }

  var responseCeremonies;
  var responseProblem;

  fetchSearchResults() async {
    try {
      responseCeremonies = await client.get(
        util.getConfiguration()['base_url']+"ceremony/?search=${this.query}"
      );
      responseProblem = await client.get(
        util.getConfiguration()['base_url']+"problem/?search=${this.query}"
      );
    } catch (e) {
      print("API isn't available");
    }
    var ceremoniesBody = json.decode(responseCeremonies.body);
    var problemsBody = json.decode(responseProblem.body);

    modelCeremonies = SearchResultModel.fromJson(ceremoniesBody, 'ceremonies');
    modelProblems = SearchResultModel.fromJson(problemsBody, 'problems');

    ceremonyItemSearchResults = [];
    for (Map<String, dynamic> ceremony in modelCeremonies.ceremonies) {
      ceremonyItemSearchResults.add(CeremonyItem.fromJson(ceremony));
    }

    problemItemSearchResults = [];
    for (Map<String, dynamic> problem in modelProblems.problems) {
      problemItemSearchResults.add(ProblemItem.fromJson(problem));
    }
  }

  SearchResultModel getCeremoniesModel() {
    return modelCeremonies;
  }

  SearchResultModel getProblemsModel() {
    return modelProblems;
  }

  List<CeremonyItem> getCeremonyItemSearchResults() {
    return ceremonyItemSearchResults;
  }

  List<ProblemItem> getProblemItemSearchResults() {
    return problemItemSearchResults;
  }
}