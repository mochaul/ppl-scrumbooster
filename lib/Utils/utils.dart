import 'package:flutter/material.dart';
import 'package:ScrumBooster/InitialScreen/HomeScreen.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:ScrumBooster/contentsList/ListCeremonies.dart';
import 'package:ScrumBooster/contentsList/ListProblems.dart';
import 'package:ScrumBooster/contentsList/GlossaryPage.dart';
import 'package:ScrumBooster/InitialScreen/AboutPage.dart';

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

  Map<String, dynamic> getDummyJSONFile() {
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

  Widget defaultDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          new DrawerHeader(
            child: Center(
              child: new Image.asset(
                "assets/logos/logo-color.png",
              ),
            ),
          ),
          ListTile(
            key: new Key("Home"),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Icon(
                  Icons.home,
                  color: hexToColor("#979797"),
                ),
                new Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                new Text(
                  "Home",
                  style: TextStyle(
                    color: hexToColor("#979797"),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage()
                ),
              );
            },
          ),
          ListTile(
            key: new Key("Ceremonies"),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Icon(
                  Icons.graphic_eq,
                  color: hexToColor("#979797"),
                ),
                new Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                new Text(
                  "Ceremonies",
                  style: TextStyle(
                    color: hexToColor("#979797"),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListCeremonies()
                ),
              );
            }, //TODO: Implement fungsi buat callback kalo mencet Ceremonies di drawer
          ),
          ListTile(
            key: new Key("Problems"),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Icon(
                  Icons.warning,
                  color: hexToColor("#979797"),
                ),
                new Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                new Text(
                  "Problems",
                  style: TextStyle(
                    color: hexToColor("#979797"),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListProblems()
                ),
              );
            },
          ),
          ListTile(
            key: new Key("Glossary"),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Icon(
                  Icons.book,
                  color: hexToColor("#979797"),
                ),
                new Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                new Text(
                  "Glossary",
                  style: TextStyle(
                    color: hexToColor("#979797"),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GlossaryPage()
                ),
              );
            }, //TODO: Implement fungsi buat callback kalo mencet Glossary di drawer
          ),
          ListTile(
            key: new Key("Pop Quiz!"),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Icon(
                  Icons.question_answer,
                  color: hexToColor("#979797"),
                ),
                new Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                new Text(
                  "Pop Quiz!",
                  style: TextStyle(
                    color: hexToColor("#979797"),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            onTap: () {}, //TODO: Implement fungsi buat callback kalo mencet Pop Quiz di drawer
          ),
          ListTile(
            key: new Key("About"),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Icon(
                  Icons.info,
                  color: hexToColor("#979797"),
                ),
                new Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                new Text(
                  "About",
                  style: TextStyle(
                    color: hexToColor("#979797"),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutPage()
                ),
              );
            }, //TODO: Implement fungsi buat callback kalo mencet About di drawer
          ),
        ],
      ),
    );
  }

  Color hexToColor(String colorCode) {
    return new Color(int.parse(colorCode.substring(1, 7), radix: 16) + 0xFF000000);
  }

  double fitScreenSize(double main, double unit) {
    return main * unit;
  }
  
}

