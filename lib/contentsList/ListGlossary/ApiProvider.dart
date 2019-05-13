import 'package:http/http.dart' show Client;
import 'package:ScrumBooster/contentsList/ListGlossary/Model.dart';
import 'dart:convert';
import 'package:ScrumBooster/Utils/utils.dart';

class ListGlossaryApiProvider {
  Client client = Client();
  var response;
  var util = new Util();
  ListGlossaryModel model;
  Map<String, List<GlossaryItem>> dictGlossaryAlphabetic;

  fetchPosts() async {
    response = await client.get(
      util.getConfiguration()['base_url']+"glossary/alphabetic/"
    );
    var jsonBody = json.decode(response.body);

    model = ListGlossaryModel.fromJson(jsonBody);
    dictGlossaryAlphabetic = model.dictGlossaryAlphabetic;

  }

  ListGlossaryModel getModel() {
    return model;
  }

  Map<String, List<GlossaryItem>> getDictGlossaryAlphabetic() {
    return dictGlossaryAlphabetic;
  }
}