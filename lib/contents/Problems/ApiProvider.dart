import 'package:http/http.dart' show Client;
import 'package:ScrumBooster/contentsList/ListCeremonies/Model.dart';
import 'dart:convert';
import 'package:ScrumBooster/Utils/utils.dart';

class ProblemsDetailPageApiProvider {
  Client client = Client();
  var response;
  var util = new Util();
  List<CeremonyItem> _listCeremoniesByProblem = [];

  getCeremoniesByProblemsList(List<dynamic> ceremonyIDs) async {
    response = await client.get(
      util.getConfiguration()['base_url']+'ceremony/'
    );
    var jsonBody = json.decode(utf8.decode(response.bodyBytes));

    for (var data in jsonBody) {
      for (int i = 0; i < ceremonyIDs.length; i++) {
        if (data['id'] == ceremonyIDs[i]) {
          CeremonyItem mapped = CeremonyItem.fromJson(data);
          _listCeremoniesByProblem.add(mapped);
        }
      }
    }
  }

  List<CeremonyItem> get listCeremoniesByProblem => _listCeremoniesByProblem;
}