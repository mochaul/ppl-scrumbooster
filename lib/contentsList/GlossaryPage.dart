import 'package:flutter/material.dart';
import 'package:ScrumBooster/utils/utils.dart';

class GlossaryPage extends StatelessWidget {
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
        child: ListView(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10.0),),
            Text("GLOSSARY", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            Padding(padding: EdgeInsets.all(10.0),),
            Image.asset("assets/listGlossary/glossary.png", height: 200,),
            Container(
              padding :EdgeInsets.all(10),
              child : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                Text("A", style: TextStyle(fontSize: 46, fontWeight: FontWeight.w500),),
                Text("B", style: TextStyle(fontSize: 46, fontWeight: FontWeight.w500),),
                Text("C", style: TextStyle(fontSize: 46, fontWeight: FontWeight.w500),),
                ],
                
              )
            )
          ],
        )
      ),
    );
  }
}
