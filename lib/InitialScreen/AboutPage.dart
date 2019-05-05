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
    double _height = MediaQuery.of(context).size.height;
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
      body : new Container(
        padding: new EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),

        //add column for the content
        child: new Column(
          children: <Widget>[
            new Row(
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
              ], 
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: new Column(
                children: <Widget>[
                  //about content
                  new Text(
                    'Scrum Booster is a software project developed by RSE Labs. RSE Labs is a part of Faculty of Computer Science in University of Indonesia. Scrum Booster is part of software engineering projects developed by:',
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
              ) 
            )
          ],
        ),
      )
    );
  }
}
