import 'package:http/http.dart' show Client;
import 'package:ScrumBooster/contentsList/ListProblems/Model.dart';
import 'dart:convert';
import 'package:ScrumBooster/Utils/utils.dart';

class ProductBacklogApiProvider {
  Client client = Client();
  var response;
  var util = new Util();
  ListProblemsModel model;
  List<ProblemItem> problemAlphabeticModels;

  fetchPosts() async {
    try {
      response = await client.get(
          util.getConfiguration()['base_url']+"problem/alphabetic"
      );
    } catch (e) {
      print("API isn't available");
    }

    var jsonBody = json.decode(response.body);

    model = ListProblemsModel.fromJson(jsonBody);

    problemAlphabeticModels = [];
    for (int i = 0; i < model.listProblemsAplhabetic.length; i++) {
      for(int j = 0; j< model.listProblemsAplhabetic[i].length; j++) {
        problemAlphabeticModels.add(ProblemItem.fromJson(model.listProblemsAplhabetic[i][j]));
      }
    }
  }

  ListProblemsModel getModel() {
    return model;
  }

  List<ProblemItem> getProblemItemModel() {
    return problemAlphabeticModels;
  }
}