import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'dart:convert';

import 'package:ScrumBooster/ScrumPhase/SprintExecution/SprintExecution.dart';
import 'package:ScrumBooster/ScrumPhase/SprintExecution/ApiProvider.dart';

void main() {
  final SprintExecution sprintExecution = SprintExecution();
  final sprintExecutionApiProvider = SprintExecutionApiProvider();

  test('Utils Call Test', () {
    final util = sprintExecution.util;
    util.callUtil();
    expect(util.call, "call");
  });

  test('API Provider Test', () async {
    sprintExecutionApiProvider.client = MockClient((request) async {
      final mapJSON = {
        "ceremonies": [
          {
            "id": 1,
            "title": "Backlog Grooming",
            "detail": "This is dummy JSON response for Backlog Grooming.",
            "image": "https://images.unsplash.com/photo-1512758017271-d7b84c2113f1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
            "phase": 1,
            "can_be_enchanced_by_using": []
          },
        ],
        "problems": [
          {
            "id": 1,
            "title": "Project Estimates Are Unrealistic or Unknown",
            "detail": "This is dummy JSON response for Project Estimates Are Unrealistic or Unknown.",
            "image": "http://www.hrinasia.com/wp-content/uploads/2016/10/Unhappy-at-work-India.jpg",
            "may_be_happen_at": [
              7
            ],
            "can_be_solved_by_using": []
          },
        ]
      };
      return Response(json.encode(mapJSON), 200);
    });

    await sprintExecutionApiProvider.fetchPosts();
    final ceremonyItemResult = sprintExecutionApiProvider.getCeremonyItemModel();

    expect(ceremonyItemResult[0].id, 1);
    expect(ceremonyItemResult[0].title, "Backlog Grooming");
    expect(
      ceremonyItemResult[0].detail,
      "This is dummy JSON response for Backlog Grooming.",
    );
    expect(
      ceremonyItemResult[0].image,
      "https://images.unsplash.com/photo-1512758017271-d7b84c2113f1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80",
    );
  });
}