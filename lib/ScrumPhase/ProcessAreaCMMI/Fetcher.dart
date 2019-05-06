import 'package:flutter/material.dart';
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

  Map<int, List<CMMIPractices>> cmmiPracticesByProcessArea;
  List<ProcessArea> processAreasByPhase;

  fetchPosts(int ceremonyID) async {
    processAreasResponse = await client.get(
      util.getConfiguration()['base_url']+"process-area/"
    );
    var processAreaJsonBody = json.decode(processAreasResponse.body);

    for (var data in processAreaJsonBody) {
      if (data['id'] == ceremonyID) {
        processAreaModel = ProcessArea.fromJson(data);
        processAreasByPhase.add(processAreaModel);
      }
    }

    int processAreaCount = processAreaJsonBody.length;

    cmmiPracticesResponse = await client.get(
      util.getConfiguration()['base_url']+"cmmi-practices/"
    );
    var cmmiPracticeJsonBody = json.decode(cmmiPracticesResponse.body);

    for (int i = 0; i < processAreaCount; i++) {
      cmmiPracticesByProcessArea.putIfAbsent(i, () => []);
      for (var data in cmmiPracticeJsonBody) {
        if (data["id"] == i) {
          cmmiPracticeModel = CMMIPractices.fromJson(data);
          cmmiPracticesByProcessArea[i].add(cmmiPracticeModel);
        }
      }
    }
  }

  Map<int, List<CMMIPractices>> getCmmiPracticesByProcessArea() {
    return cmmiPracticesByProcessArea;
  }

  List<ProcessArea> getProcessAreasByPhase() {
    return processAreasByPhase;
  }
}