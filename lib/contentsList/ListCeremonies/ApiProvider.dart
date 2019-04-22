import 'package:http/http.dart' show Client;
import 'package:ScrumBooster/contentsList/ListCeremonies/Model.dart';
import 'dart:convert';
import 'package:ScrumBooster/Utils/utils.dart';

class ListCeremoniesApiProvider {
  Client client = Client();
  var response;
  var util = new Util();
  ListCeremoniesModel model;
  List<CeremonyAlphabet> ceremonyAlphabeticModels;

  fetchPosts() async {
    response = await client.get(
      util.getConfiguration()['base_url']+"ceremony/alphabetic/"
    );

    var jsonBody = json.decode(response.body);

    model = ListCeremoniesModel.fromJson(jsonBody);

    ceremonyAlphabeticModels = [];
    for (int i = 0; i < model.listCeremoniesAlphabetic.length; i++) {
      for (int j = 0; j < model.listCeremoniesAlphabetic[i].length; j++) {
        ceremonyAlphabeticModels.add(CeremonyAlphabet.fromJson(model.listCeremoniesAlphabetic[i][j]));
      }
    }
  }

  List<CeremonyAlphabet> getCeremonyItemModel() {
    return ceremonyAlphabeticModels;
  }
}