import 'package:http/http.dart' show Client;
import 'package:ScrumBooster/ScrumPhase/SprintEvaluation/Model.dart';
import 'dart:convert';
import 'package:ScrumBooster/Utils/utils.dart';

class SprintEvaluationApiProvider {
  static const int PHASE_ID = 4;
  Client client = Client();
  var response;
  var util = Util();
  SprintEvaluationModel model;
  List<CeremonyItem> ceremonyItemModels;
  List<ProblemItem> problemItemModels;

  fetchPosts() async {
    try {
      response = await client.get(
          util.getConfiguration()['base_url']+"phase/$PHASE_ID/details"
      );
    } catch (e) {
      print("API isn't available");
    }

    var jsonBody = json.decode(utf8.decode(response.bodyBytes));

    model = SprintEvaluationModel.fromJson(jsonBody);

    ceremonyItemModels = [];
    for (Map<String, dynamic> ceremony in model.ceremonies) {
      ceremonyItemModels.add(CeremonyItem.fromJson(ceremony));
    }

    problemItemModels = [];
    for (Map<String, dynamic> problem in model.problems) {
      problemItemModels.add(ProblemItem.fromJson(problem));
    }
  }

  SprintEvaluationModel getModel() {
    return model;
  }

  List<CeremonyItem> getCeremonyItemModel() {
    return ceremonyItemModels;
  }

  List<ProblemItem> getProblemItemModel() {
    return problemItemModels;
  }
}