import 'package:http/http.dart' show Client;
import 'package:ScrumBooster/contentsList/ListGlossary/Model.dart';
import 'dart:convert';
import 'package:ScrumBooster/Utils/utils.dart';

class ListProblemsApiProvider {
  Client client = Client();
  var response;
  var util = new Util();
  ListGlossaryModel model;
  Map<String, List<GlossaryItem>> dictProblemsAlphabetic;

  fetchPosts() async {
    response = await client.get(
        util.getConfiguration()['base_url']+"problem/alphabetic/"
    );
    var jsonBody = json.decode(response.body);

    model = ListGlossaryModel.fromJson(jsonBody);
    dictProblemsAlphabetic = model.dictGlossaryAlphabetic;

  }

  ListGlossaryModel getModel() {
    return model;
  }

  Map<String, List<GlossaryItem>> getDictProblemsAlphabetic() {
    return dictProblemsAlphabetic;
  }
}