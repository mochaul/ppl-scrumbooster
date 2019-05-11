import 'package:http/http.dart' show Client;
import 'package:ScrumBooster/ScrumPhase/ProcessAreaCMMI/Model.dart';
import 'dart:convert';
import 'package:ScrumBooster/Utils/utils.dart';

class ProcessAreaCMMIFetcher {
  Client client = Client();
  var processAreasResponse;
  var cmmiPracticesResponse;
  var util = Util();

  ProcessArea processAreaModel;
  CMMIPractices cmmiPracticeModel;

  Map<int, List<CMMIPractices>> cmmiPracticesByProcessArea = {};
  List<ProcessArea> processAreasByCeremony = [];

  fetchPosts(int ceremonyID) async {
    //Fetch all Process Areas data (not depending on ceremony)
    processAreasResponse = await client.get(
      util.getConfiguration()['base_url']+"process-area/"
    );
    var processAreaJsonBody = json.decode(utf8.decode(processAreasResponse.bodyBytes));

    //Scanning all the Process Area which have the same ID as desired
    List<String> names = [];
    for (var data in processAreaJsonBody) {
      if (data['related_ceremony'] == ceremonyID && !names.contains(data['title'])) {
        names.add(data['title']);
        processAreaModel = ProcessArea.fromJson(data);
        processAreasByCeremony.add(processAreaModel);
      }
    }

    int processAreasByCeremonyCount = processAreasByCeremony.length;

    cmmiPracticesResponse = await client.get(
      util.getConfiguration()['base_url']+"cmmi-practices/"
    );
    var cmmiPracticeJsonBody = json.decode(utf8.decode(cmmiPracticesResponse.bodyBytes));

    for (int i = 0; i < processAreasByCeremonyCount; i++) {
      cmmiPracticesByProcessArea.putIfAbsent(processAreasByCeremony[i].id, () => []);
      for (var data in cmmiPracticeJsonBody) {
        if (data["process_area"] == processAreasByCeremony[i].id) {
          cmmiPracticeModel = CMMIPractices.fromJson(data);
          cmmiPracticesByProcessArea[processAreasByCeremony[i].id].add(cmmiPracticeModel);
        }
      }
    }
  }

  Map<int, List<CMMIPractices>> getCmmiPracticesByProcessArea() {
    return cmmiPracticesByProcessArea;
  }

  List<ProcessArea> getProcessAreasByCeremony() {
    return processAreasByCeremony;
  }
}