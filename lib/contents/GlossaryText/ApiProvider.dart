import 'package:http/http.dart' show Client;
import 'package:ScrumBooster/contentsList/ListGlossary/Model.dart';
import 'dart:convert';
import 'package:ScrumBooster/Utils/utils.dart';

class GlossaryTextApiProvider {
  Client client = Client();
  var response;
  var util = Util();

  GlossaryItem _glossaryItem;

  getGlossaryTextItem(String glossaryName) async {
    response = await client.get(
      util.getConfiguration()['base_url']+'glossary/$glossaryName',
    );
    var jsonBody = json.decode(utf8.decode(response.bodyBytes));

    _glossaryItem =  GlossaryItem.fromJson(jsonBody);
  }

  GlossaryItem get glossaryItem => _glossaryItem;
}
