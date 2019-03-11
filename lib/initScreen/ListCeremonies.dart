import 'package:flutter/material.dart';
import 'package:ScrumBooster/utils/utils.dart';

class ListCeremonies extends StatelessWidget {
  final List<String> myList = new List();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  getScaffoldKey() {
    return scaffoldKey;
  }

//  ListCeremonies({Key key, List<String> myList}) : super(key: key);
var utils = new Util();

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
          centerTitle: true,
          title: Text("SCRUM BOOSTER", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: utils.hexToColor("#FFFFFF")),)
      ),
      body: Center(
        child: new Column(
          children: <Widget>[
            new Padding(padding: EdgeInsets.all(5.0),),
            new Text("CEREMONIES", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
            new Padding(padding: EdgeInsets.all(5.0),),
            new Image.asset("assets/listCeremonies/ceremonies.png", height: 200,),
            new ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20.0),
              children: <Widget>[
                new Text("A", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                new Text("B", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                new Text("C", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              ],
            )
          ],
        )
      ),
    );
  }
}