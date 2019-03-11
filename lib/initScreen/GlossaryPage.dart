import 'package:flutter/material.dart';
import 'package:ScrumBooster/utils/utils.dart';

class GlossaryPage extends StatelessWidget {
  final Widget child;

  GlossaryPage({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Scrum Booster", style: TextStyle(color: Colors.white),),
      ),
      body : Center(
        child : new Column(
        children: <Widget>[
          new Padding(padding: EdgeInsets.all(10),),
          new Text("Glossary", style: TextStyle(fontSize: 26, fontFamily: "Montserrat", fontWeight: FontWeight.bold),),
          new Padding(padding: EdgeInsets.all(10),),
          new Image.asset("assets/listGlossary/glossary.png"),
          new Padding(padding: EdgeInsets.all(10),),
          new Text("A", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold), textAlign: TextAlign.left,)
          
        ],
        )
      )
    );
  }
}