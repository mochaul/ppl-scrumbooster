import 'package:flutter/material.dart';
import 'package:ScrumBooster/utils/utils.dart';

class ListProblems extends StatelessWidget {
  final List<String> myList = new List();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  getScaffoldKey() {
    return scaffoldKey;
  }

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
            Padding(padding: EdgeInsets.all(10),),
            Text("PROBLEMS", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            Image.asset("assets/listProblems/problems.png", height: 200,),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("A", style: TextStyle(fontSize: 46, fontWeight: FontWeight.w500),),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Text("A dummy 1", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: utils.hexToColor("#3498DB")),),
                        Text("A dummy 2", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: utils.hexToColor("#3498DB")),),
                        Text("A dummy 3", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: utils.hexToColor("#3498DB")),),
                      ],
                    ),),
                  Text("B", style: TextStyle(fontSize: 46, fontWeight: FontWeight.w500),),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Text("B dummy 1", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: utils.hexToColor("#3498DB")),),
                        Text("B dummy 2", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: utils.hexToColor("#3498DB")),),
                        Text("B dummy 3", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: utils.hexToColor("#3498DB")),),
                      ],
                    ),),
                  Text("C", style: TextStyle(fontSize: 46, fontWeight: FontWeight.w500),),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Text("C dummy 1", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: utils.hexToColor("#3498DB")),),
                        Text("C dummy 2", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: utils.hexToColor("#3498DB")),),
                        Text("C dummy 3", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: utils.hexToColor("#3498DB")),),
                      ],
                    ),),
                  Text("D", style: TextStyle(fontSize: 46, fontWeight: FontWeight.w500),),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Text("D dummy 1", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: utils.hexToColor("#3498DB")),),
                        Text("D dummy 2", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: utils.hexToColor("#3498DB")),),
                        Text("D dummy 3", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: utils.hexToColor("#3498DB")),),
                      ],
                    ),),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
