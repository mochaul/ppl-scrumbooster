import 'package:flutter/material.dart';
import 'package:ScrumBooster/utils/utils.dart';

class ListCeremonies extends StatelessWidget {
  final List<String> myList = new List();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  getScaffoldKey() {
    return scaffoldKey;
  }

//  ListCeremonies({Key key, List<String> myList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
          centerTitle: true,
          title: Text("SCRUM BOOSTER")
      ),
      body: Center(
        child: new Column(
          children: <Widget>[
            new Padding(padding: EdgeInsets.all(10.0),),
            new Text("Ceremonies", style: TextStyle(fontSize: 26),),
            new Padding(padding: EdgeInsets.all(10.0),),
            new Image.asset("assets/logos/logo-color.png")
          ],
        )
      ),
    );
  }
}