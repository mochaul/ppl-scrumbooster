import 'package:http/http.dart' show Client;
import 'package:ScrumBooster/contentsList/ListCeremonies/Model.dart';
import 'dart:convert';
import 'package:ScrumBooster/Utils/utils.dart';

class ListCeremoniesApiProvider {
  Client client = Client();
  var response;
  var util = new Util();
  ListCeremoniesModel model;
  Map<String, List<ProblemItem>> dictCeremoniesAlphabetic;

  fetchPosts() async {
    response = await client.get(
      util.getConfiguration()['base_url']+"ceremony/alphabetic/"
    );
    var jsonBody = json.decode(response.body);

    model = ListCeremoniesModel.fromJson(jsonBody);
    dictCeremoniesAlphabetic = model.dictCeremoniesAlphabetic;

  }

  ListCeremoniesModel getModel() {
    return model;
  }
  
  Map<String, List<ProblemItem>> getDictProblemsAlphabetic() {
    return dictCeremoniesAlphabetic;
  }
}