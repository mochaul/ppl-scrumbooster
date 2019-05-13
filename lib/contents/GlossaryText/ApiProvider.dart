import 'package:http/http.dart' show Client;
import 'package:ScrumBooster/contentsList/ListGlossary/Model.dart';
import 'dart:convert';
import 'package:ScrumBooster/Utils/utils.dart';

class GlossaryTextApiProvider {
  Client client = Client();
  var response;
  var util = Util();
  var allGlossaryJson;

  GlossaryItem _glossaryItem;

  getGlossaryTextItem(String glossaryName) async {
    response = await client.get(
      util.getConfiguration()['base_url']+'glossary/$glossaryName',
    );
    var jsonBody = json.decode(utf8.decode(response.bodyBytes));

    _glossaryItem =  GlossaryItem.fromJson(jsonBody);
  }

  Future<String> getGlossaryIDStringByName(String glossaryName) async {
    String res = "";

    if (allGlossaryJson == null) {
      response = await client.get(
        util.getConfiguration()['base_url']+'glossary/',
      );
      allGlossaryJson = json.decode(utf8.decode(response.bodyBytes));
    }

    for (var data in allGlossaryJson) {
      if (glossaryName == data['title']) {
        res = data['id'].toString();
      }
    }
    return res;
  }

  GlossaryItem get glossaryItem => _glossaryItem;
}
