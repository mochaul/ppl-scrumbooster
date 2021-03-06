import 'package:http/http.dart' show Client;
import 'package:ScrumBooster/ScrumPhase/ProductBacklog/Model.dart';
import 'dart:convert';
import 'package:ScrumBooster/Utils/utils.dart';

class ProductBacklogApiProvider {
  static const int PHASE_ID = 1;
  Client client = Client();
  var response;
  var util = new Util();
  ProductBacklogModel model;
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

    model = ProductBacklogModel.fromJson(jsonBody);

    ceremonyItemModels = [];
    for (Map<String, dynamic> ceremony in model.ceremonies) {
      ceremonyItemModels.add(CeremonyItem.fromJson(ceremony));
    }

    problemItemModels = [];
    for (var problem in model.problems) {
      problemItemModels.add(ProblemItem.fromJson(problem));
    }
  }

  ProductBacklogModel getModel() {
    return model;
  }

  List<CeremonyItem> getCeremonyItemModel() {
    return ceremonyItemModels;
  }

  List<ProblemItem> getProblemItemModel() {
    return problemItemModels;
  }
}