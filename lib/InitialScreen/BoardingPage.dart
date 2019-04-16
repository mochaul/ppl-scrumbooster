import 'package:flutter/material.dart';
import 'package:ScrumBooster/Utils/utils.dart';

class BoardingPage extends StatelessWidget {
  final Widget child;

  BoardingPage({Key key, this.child}) : super(key: key);

  var utils = new Util();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.width;

    return Scaffold(
      //add container 
      body: Container(
        //change background color to blue
        color: utils.hexToColor("#3498DB"),
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
              ),
              //add image asset
              Image.asset(
                "assets/logos/logo-color.png",
                height: utils.fitScreenSize(_height,0.1),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 20.0,
                ),
              ),
              Image.asset(
                "assets/scrum-board-cloud.png",
                height: utils.fitScreenSize(_height, 0.5),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              //add content text of boardingpage 
              Text(
                "WELCOME TO SCRUM BOOSTER!",
                style: TextStyle(
                  fontSize: utils.fitScreenSize(_height, 0.05),
                  fontWeight: FontWeight.bold,
                  color: utils.hexToColor("#ffffff"),
                ),
              ),
              Text(
                "WE'RE HERE TO HELP YOU",
                style: TextStyle(
                  fontSize: utils.fitScreenSize(_height, 0.05),
                  fontWeight: FontWeight.bold,
                  color: utils.hexToColor("#ffffff"),
                ),
              ),
              Text(
                "TO MAXIMIZE",
                style: TextStyle(
                  fontSize: utils.fitScreenSize(_height, 0.05),
                  fontWeight: FontWeight.bold,
                  color: utils.hexToColor("#ffffff"),
                ),
              ),
              Text(
                "YOUR SCRUM CEREMONY",
                style: TextStyle(
                  fontSize: utils.fitScreenSize(_height, 0.05),
                  fontWeight: FontWeight.bold,
                  color: utils.hexToColor("#ffffff"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
              ),
              //add button to navigate to homepage
              new InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/Home');
                }, //navigate to homepage
                child: new Container(
                  width: utils.fitScreenSize(_width, 0.7),
                  height: utils.fitScreenSize(_height, 0.1),
                  decoration: new BoxDecoration(
                    color: utils.hexToColor("#FF0000"),
                    border: new Border.all(
                      color: utils.hexToColor("#FFFFFF"),
                      width: 2.0,
                    ),
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                  child: new Center(
                    child: new Text(
                      'Get Started!',
                      style: new TextStyle(
                        fontSize: 18.0,
                        color: utils.hexToColor("#FFFFFF"),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}