import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:ScrumBooster/components/LinkTextSpan.dart';
import 'package:ScrumBooster/contents/glossary.dart';
import 'package:ScrumBooster/contents/GlossaryText/ApiProvider.dart';
import 'package:ScrumBooster/contentsList/ListGlossary/Model.dart';

class Util {
  String call;

  void callUtil() => call = "call";

  final Map<String, String> monthNumber = {
    "01": "Januari",
    "02": "Februari",
    "03": "Maret",
    "04": "April",
    "05": "Mei",
    "06": "Juni",
    "07": "Juli",
    "08": "Agustus",
    "09": "September",
    "10": "Oktober",
    "11": "November",
    "12": "Desember",
  };

  Future<List<TextSpan>> getFormattedContentDetailsText(BuildContext context, String contentText) async {
    List<String> splittedByDelimiter = contentText.split('#');
    List<TextSpan> formatted = [];
    GlossaryTextApiProvider apiProvider = new GlossaryTextApiProvider();
    for (int i = 0; i < splittedByDelimiter.length; i++) {
      if (i%2!=0) {
        String glossaryID = await apiProvider.getGlossaryIDStringByName(splittedByDelimiter[i]);
        await apiProvider.getGlossaryTextItem(glossaryID);
        GlossaryItem mapped = apiProvider.glossaryItem;
        formatted.add(
          new LinkTextSpan(
            text: splittedByDelimiter[i],
            style: TextStyle(
              color: hexToColor("#3498DB"),
              fontWeight: FontWeight.bold,
              fontSize: 17.5,
              fontFamily: "Montserrat",
            ),
            action: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Glossary(
                    title: mapped.title,
                    imagePath: mapped.image,
                    contents: mapped.detail,
                  )
                ),
              );
            }
          )
        );
      } else {
        formatted.add(
          new TextSpan(
            text: splittedByDelimiter[i],
            style: TextStyle(
              color: hexToColor("#000000"),
              fontSize: 17.5,
              fontFamily: "Montserrat",
            ),
          )
        );
      }
    }
    return formatted;
  }

  Widget makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  Future<Map<String, dynamic>> parseJsonFromAssets(String assetPath) async {
    return rootBundle.loadString(assetPath).then((json) => jsonDecode(json));
  }

  Map<String, String> getConfiguration() {
    return {
      'base_url': "http://152.118.201.222:24100/",
    }; //Staging API
  }

  List<dynamic> getDummyJSONProcessAreas() {
    return [
      {
        "id": 1,
        "title": "Dummy Process Area 1",
        "related_ceremony": 1,
      },
      {
        "id": 2,
        "title": "Dummy Process Area 2",
        "related_ceremony": 1,
      },
      {
        "id": 3,
        "title": "Dummy Process Area 3",
        "related_ceremony": 2,
      }
    ];
  }

  List<dynamic> getDummyJSONCMMIPractices() {
    return [
      {
        "id": 1,
        "title": "Dummy CMMI Practice 1",
        "strengthens": "This CMMI Practice can strengthen dummy",
        "satisfy": "This CMMI Practice can satisfy dummy",
        "demonstrated": "This CMMI Practice can demonstrate dummy",
        "image": "https://static1.squarespace.com/static/56c775ad27d4bd3fdb24775d/t/5a8b201324a694d7071662ee/1519067160925/dummy+logo.jpg",
        "process_area": 1
      },
      {
        "id": 2,
        "title": "Dummy CMMI Practice 2",
        "strengthens": "This CMMI Practice can strengthen dummy",
        "satisfy": "This CMMI Practice can satisfy dummy",
        "demonstrated": "This CMMI Practice can demonstrate dummy",
        "image": "https://static1.squarespace.com/static/56c775ad27d4bd3fdb24775d/t/5a8b201324a694d7071662ee/1519067160925/dummy+logo.jpg",
        "process_area": 1
      },
      {
        "id": 3,
        "title": "Dummy CMMI Practice 3",
        "strengthens": "This CMMI Practice can strengthen dummy",
        "satisfy": "This CMMI Practice can satisfy dummy",
        "demonstrated": "This CMMI Practice can demonstrate dummy",
        "image": "https://static1.squarespace.com/static/56c775ad27d4bd3fdb24775d/t/5a8b201324a694d7071662ee/1519067160925/dummy+logo.jpg",
        "process_area": 2
      }
    ];
  }

  Map<String, dynamic> getDummyJSONContentsList() {
    return {
      "a": [
        {
          "id": 1,
          "title": "A Letter",
          "detail": "This is dummy JSON response for A Letter.",
          "image": "https://static1.squarespace.com/static/56c775ad27d4bd3fdb24775d/t/5a8b201324a694d7071662ee/1519067160925/dummy+logo.jpg",
          "phase": 1,
        }
      ],
      "b": [
        {
          "id": 2,
          "title": "B Letter",
          "detail": "This is dummy JSON response for B Letter.",
          "image": "https://static1.squarespace.com/static/56c775ad27d4bd3fdb24775d/t/5a8b201324a694d7071662ee/1519067160925/dummy+logo.jpg",
          "phase": 1,
        }
      ],
      "c": [
        {
          "id": 3,
          "title": "C Letter",
          "detail": "This is dummy JSON response for C Letter.",
          "image": "https://static1.squarespace.com/static/56c775ad27d4bd3fdb24775d/t/5a8b201324a694d7071662ee/1519067160925/dummy+logo.jpg",
          "phase": 1,
        }
      ]
    };
  }

  Map<String, dynamic> getDummyJSONCeremoniesAndProblems() {
    return {
      "ceremonies": [
        {
          "id": 1,
          "title": "Backlog Grooming",
          "detail": "This is dummy JSON response for Backlog Grooming.",
          "image": "https://static1.squarespace.com/static/56c775ad27d4bd3fdb24775d/t/5a8b201324a694d7071662ee/1519067160925/dummy+logo.jpg",
          "phase": 1,
          "can_be_enchanced_by_using": []
        }
      ],
      "problems": [
        {
          "id": 1,
          "title": "Project Estimates Are Unrealistic or Unknown",
          "detail": "This is dummy JSON response for Project Estimates Are Unrealistic or Unknown.",
          "image": "https://static1.squarespace.com/static/56c775ad27d4bd3fdb24775d/t/5a8b201324a694d7071662ee/1519067160925/dummy+logo.jpg",
          "may_be_happen_at": [
            7
          ],
          "can_be_solved_by_using": []
        }
      ]
    };
  }

  Color hexToColor(String colorCode) {
    return new Color(int.parse(colorCode.substring(1, 7), radix: 16) + 0xFF000000);
  }

  double fitScreenSize(double main, double unit) {
    return main * unit;
  }
  
}

