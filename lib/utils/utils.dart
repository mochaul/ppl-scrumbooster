import 'package:flutter/material.dart';
import 'package:ScrumBooster/initScreen/HomeScreen.dart';
import 'package:ScrumBooster/contents/problems.dart';
import 'package:ScrumBooster/contentsList/ListCeremonies.dart';
import 'package:ScrumBooster/contentsList/ListProblems.dart';
import 'package:ScrumBooster/contentsList/GlossaryPage.dart';
import 'package:ScrumBooster/initScreen/AboutPage.dart';

class Util {

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

  String convertToDateString(String startDate, String endDate) {
    String res = "";
    print(startDate);
    print(endDate);
    List<String> startDateSplitted = startDate.split("-");
    List<String> endDateSplitted = endDate.split("-");

    if (startDateSplitted[1] == endDateSplitted[1]) {
      res += "${startDateSplitted[2]}-${endDateSplitted[2]} ${monthNumber[startDateSplitted[1]]} ${startDateSplitted[0]}";
    } else {
      res += "${startDateSplitted[2]} ${monthNumber[startDateSplitted[1]]} - ${endDateSplitted[2]} ${monthNumber[endDateSplitted[1]]} ${startDateSplitted[0]}";
    }
    return res;
  }

  String convertDate({String reviewDate}){
    String newDate;
    reviewDate.substring(0,9);
    List split = reviewDate.substring(0,9).split("-");
    switch (split[1]) {
      case "01": split[1] = "Januari";
      break;
      case "02": split[1] = "Februari";
      break;
      case "03": split[1] = "Maret";
      break;
      case "04": split[1] = "April";
      break;
      case "05": split[1] = "Mei";
      break;
      case "06": split[1] = "Juni";
      break;
      case "07": split[1] = "Juli";
      break;
      case "08": split[1] = "Agustus";
      break;
      case "09": split[1] = "September";
      break;
      case "10": split[1] = "Oktober";
      break;
      case "11": split[1] = "November";
      break;
      case "12": split[1] = "Desember";
      break;
    }
    newDate = split[2]+" "+split[1]+" "+split[0];
    return newDate;
  }
}

