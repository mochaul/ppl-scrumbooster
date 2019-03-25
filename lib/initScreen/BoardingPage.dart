import 'package:flutter/material.dart';
import 'package:ScrumBooster/utils/utils.dart';

class BoardingPage extends StatelessWidget {
  final Widget child;

  BoardingPage({Key key, this.child}) : super(key: key);

  var utils = new Util();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: utils.hexToColor("#3498DB"),
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(20.0),),
              Image.asset("assets/logos/logo-color.png", height: 50),
              Padding(padding: EdgeInsets.only(bottom: 20.0),),
              Image.asset("assets/scrum-board-cloud.png", height: 200,),
              Padding(padding: EdgeInsets.all(10.0),),
              Text("WELCOME TO SCRUM BOOSTER!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: utils.hexToColor("#ffffff")),),
              Text("WE'RE HERE TO HELP YOU", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: utils.hexToColor("#ffffff")),),
              Text("TO MAXIMIZE", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: utils.hexToColor("#ffffff")),),
              Text("YOUR SCRUM CEREMONY", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: utils.hexToColor("#ffffff")),),
              Padding(padding: EdgeInsets.all(20.0),),
              new InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).pushNamed('/Home');},
                child: new Container(
                  width: 200.0,
                  height: 50.0,
                  decoration: new BoxDecoration(
                    // color: utils.hexToColor("#4DB6AC"),
                    color: Colors.red,
                    border: new Border.all(color: Colors.white, width: 2.0),
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                  child: new Center(child: new Text('Get Started!', style: new TextStyle(fontSize: 18.0, color: Colors.white),),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}