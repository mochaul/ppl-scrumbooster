import 'package:http/http.dart' show Client;
import 'package:ScrumBooster/ScrumPhase/SprintPlanning/Model.dart';
import 'dart:convert';
import 'package:ScrumBooster/Utils/utils.dart';

class SprintPlanningApiProvider {
  static const int PHASE_ID = 2;
  Client client = Client();
  var response;
  var util = new Util();
  SprintPlanningModel model;
  List<CeremonyItem> ceremonyItemModels;
  List<ProblemItem> problemItemModels;

  fetchPosts() async {
    response = await client.get(
        util.getConfiguration()['base_url']+"phase/$PHASE_ID/details"
    );

    var jsonBody = json.decode(response.body);

    model = SprintPlanningModel.fromJson(jsonBody);

    ceremonyItemModels = [];
    for (Map<String, dynamic> ceremony in model.ceremonies) {
      ceremonyItemModels.add(CeremonyItem.fromJson(ceremony));
    }

    problemItemModels = [];
    for (var problem in model.problems) {
      problemItemModels.add(ProblemItem.fromJson(problem));
    }
  }

  SprintPlanningModel getModel() {
    return model;
  }

  List<CeremonyItem> getCeremonyItemModel() {
    return ceremonyItemModels;
  }

  List<ProblemItem> getProblemItemModel() {
    return problemItemModels;
  }
}