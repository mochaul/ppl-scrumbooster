import 'package:http/http.dart' show Client;
import 'package:ScrumBooster/contentsList/ListProblems/Model.dart';
import 'dart:convert';
import 'package:ScrumBooster/Utils/utils.dart';

class ListProblemsApiProvider {
  Client client = Client();
  var response;
  var util = new Util();
  ListProblemsModel model;
  Map<String, List<ProblemItem>> dictProblemsAlphabetic;

  fetchPosts() async {
    response = await client.get(
        util.getConfiguration()['base_url']+"problem/alphabetic/"
    );
    var jsonBody = json.decode(utf8.decode(response.bodyBytes));

    model = ListProblemsModel.fromJson(jsonBody);
    dictProblemsAlphabetic = model.dictProblemsAlphabetic;

  }

  ListProblemsModel getModel() {
    return model;
  }

  Map<String, List<ProblemItem>> getDictProblemsAlphabetic() {
    return dictProblemsAlphabetic;
  }
}