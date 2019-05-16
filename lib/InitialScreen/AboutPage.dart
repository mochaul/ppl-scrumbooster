import 'package:ScrumBooster/InitialScreen/HomeScreen.dart';
import 'package:ScrumBooster/contentsList/ListCeremonies/ListCeremonies.dart';
import 'package:ScrumBooster/contentsList/ListGlossary/ListGlossary.dart';
import 'package:ScrumBooster/contentsList/ListProblems/ListProblems.dart';
import 'package:flutter/material.dart';
import 'package:ScrumBooster/Utils/utils.dart';
import 'package:ScrumBooster/search/SearchPage.dart';

class AboutPage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var utils = new Util();
  getScaffoldKey() {
    return scaffoldKey;
  }

  final util = new Util();

  @override
  Widget build(BuildContext context) {
    void _searchpage() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SearchPage()
        ),
      );
    }
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: new InkWell(
          child: new Icon(
            Icons.menu,
            color: util.hexToColor("#FFFFFF"),
          ),
          onTap: () {
            scaffoldKey.currentState.openDrawer();
          },
        ),
        centerTitle: true,
        title: Text(
          "Scrum Booster".toUpperCase(),
          style: TextStyle(
            color: util.hexToColor("#FFFFFF"),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          new Padding(
            padding: EdgeInsets.only(right: 6.0),
            child: new InkWell(
              child: new Icon(
                Icons.search,
                color: util.hexToColor("#FFFFFF"),
              ),
              onTap: _searchpage,
            ),
          ),
        ],
      ),
      body : new ListView(
        children: <Widget>[
          //about content
          new Padding(
            padding: EdgeInsets.only(
              top: 25.0,
              bottom: 25.0,
            ),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Image.asset(
                  'assets/logos/logo-color.png',
                  height: 120,
                  key: new Key("Scrum Booster Logo"),
                ),
                Padding(padding: EdgeInsets.all(10.0),),
                new Image.asset(
                  'assets/logos/Makara-UI.png',
                  height: 120,
                  key: new Key("Makara UI Logo"),
                ),
                Padding(padding: EdgeInsets.all(10.0),),
                new Image.asset(
                  'assets/logos/cmmi.png',
                  height: 120,
                  key: new Key("CMMI Institue Logo"),
                ),
              ],
            ),
          ),
          new Padding(
            padding: EdgeInsets.only(
              left: 15.0,
              right: 15.0,
              top: 10.0,
              bottom: 10.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Text(
                  'Scrum Booster is a software project developed by RSE Labs.\nRSE Labs is a part of Faculty of Computer Science, Universitas Indonesia.\nScrum Booster is part of software engineering projects developed by:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  key: new Key("Explanation"),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                new Text(
                  'Eko K. Budiardjo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                new Text(
                  'Suci Fadhilah',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

                new Text(
                  'Arfi Renaldi',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                //name for each members
                new Text(
                  'Mochamad Aulia Akbar Praditomo',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                new Text(
                    'Fajrin Maulana Kingwijati',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    )
                ),
                new Text(
                  'Izzan Fakhril Islam',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                new Text(
                  'Muhammad Rezki',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                new Text(
                  'Khoirul Khuluqi Abdulloh',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                new Text(
                  'Wildan Fahmi Gunawan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                new Text(
                  'All contents are taken from CMMI Institute',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
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
                    color: util.hexToColor("#979797"),
                  ),
                  new Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  new Text(
                    "Home",
                    style: TextStyle(
                      color: util.hexToColor("#979797"),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/Home');
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
                    color: util.hexToColor("#979797"),
                  ),
                  new Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  new Text(
                    "Ceremonies",
                    style: TextStyle(
                      color: util.hexToColor("#979797"),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).popUntil(ModalRoute.withName('/Home'));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListCeremonies(),
                  ),
                );
              },
              //TODO: Implement fungsi buat callback kalo mencet Ceremonies di drawer
            ),
            ListTile(
              key: new Key("Problems"),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Icon(
                    Icons.warning,
                    color: util.hexToColor("#979797"),
                  ),
                  new Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  new Text(
                    "Problems",
                    style: TextStyle(
                      color: util.hexToColor("#979797"),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).popUntil(ModalRoute.withName('/Home'));
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
                    color: util.hexToColor("#979797"),
                  ),
                  new Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  new Text(
                    "Glossary",
                    style: TextStyle(
                      color: util.hexToColor("#979797"),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).popUntil(ModalRoute.withName('/Home'));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListGlossary()
                  ),
                );
              }, //TODO: Implement fungsi buat callback kalo mencet Glossary di drawer
            ),
            ListTile(
              key: new Key("About"),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Icon(
                    Icons.info,
                    color: util.hexToColor("#979797"),
                  ),
                  new Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  new Text(
                    "About",
                    style: TextStyle(
                      color: util.hexToColor("#979797"),
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
      ),
    );
  }
}
