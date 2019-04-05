import 'package:flutter/material.dart';
import 'package:ScrumBooster/utils/utils.dart';

class BoardingPage extends StatelessWidget {
  final Widget child;

  BoardingPage({Key key, this.child}) : super(key: key);

  var utils = new Util();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: utils.hexToColor("#3498DB"),
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(35.0),
              ),
              Image.asset(
                "assets/logos/logo-color.png",
                height: 75.0,
                width: 75.0,
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 35.0,
                ),
              ),
              new Padding(
                padding: EdgeInsets.only(left: 7.5),
                child: new Stack(
                  children: <Widget>[
                    new Container(
                      width: _width,
                      child: new Text(
                        "WELCOME !",
                        style: TextStyle(
                          color: utils.hexToColor("#4DB6AC"),
                          fontWeight: FontWeight.bold,
                          fontSize: 75.0,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    new Positioned(
                      left: utils.fitScreenSize(_width, 0.04),
                      child: new Text(
                        "WELCOME !",
                        style: TextStyle(
                          color: utils.hexToColor("#FFFFFF"),
                          fontSize: 75.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              new Padding(
                padding: EdgeInsets.only(left: 7.5),
                child: new Stack(
                  children: <Widget>[
                    new Container(
                      width: _width,
                      child: new Text(
                        "WE'RE HERE",
                        style: TextStyle(
                          color: utils.hexToColor("#4DB6AC"),
                          fontWeight: FontWeight.bold,
                          fontSize: 75.0,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    new Positioned(
                      left: utils.fitScreenSize(_width, 0.04),
                      child: new Text(
                        "WE'RE HERE",
                        style: TextStyle(
                          color: utils.hexToColor("#FFFFFF"),
                          fontSize: 75.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              new Padding(
                padding: EdgeInsets.only(left: 7.5),
                child: new Stack(
                  children: <Widget>[
                    new Container(
                      width: _width,
                      child: new Text(
                        "TO HELP YOU",
                        style: TextStyle(
                          color: utils.hexToColor("#4DB6AC"),
                          fontWeight: FontWeight.bold,
                          fontSize: 75.0,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    new Positioned(
                      left: utils.fitScreenSize(_width, 0.04),
                      child: new Text(
                        "TO HELP YOU",
                        style: TextStyle(
                          color: utils.hexToColor("#FFFFFF"),
                          fontSize: 75.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              new Padding(
                padding: EdgeInsets.only(left: 7.5),
                child: new Stack(
                  children: <Widget>[
                    new Container(
                      width: _width,
                      child: new Text(
                        "MAXIMIZE",
                        style: TextStyle(
                          color: utils.hexToColor("#4DB6AC"),
                          fontWeight: FontWeight.bold,
                          fontSize: 75.0,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    new Positioned(
                      left: utils.fitScreenSize(_width, 0.04),
                      child: new Text(
                        "MAXIMIZE",
                        style: TextStyle(
                          color: utils.hexToColor("#FFFFFF"),
                          fontSize: 75.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              new Padding(
                padding: EdgeInsets.only(left: 7.5),
                child: new Stack(
                  children: <Widget>[
                    new Container(
                      width: _width,
                      child: new Text(
                        "YOUR SCRUM",
                        style: TextStyle(
                          color: utils.hexToColor("#4DB6AC"),
                          fontWeight: FontWeight.bold,
                          fontSize: 75.0,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    new Positioned(
                      left: utils.fitScreenSize(_width, 0.04),
                      child: new Text(
                        "YOUR SCRUM",
                        style: TextStyle(
                          color: utils.hexToColor("#FFFFFF"),
                          fontSize: 75.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              new Padding(
                padding: EdgeInsets.only(left: 7.5),
                child: new Stack(
                  children: <Widget>[
                    new Container(
                      width: _width,
                      child: new Text(
                        "CEREMONY",
                        style: TextStyle(
                          color: utils.hexToColor("#4DB6AC"),
                          fontWeight: FontWeight.bold,
                          fontSize: 75.0,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    new Positioned(
                      left: utils.fitScreenSize(_width, 0.04),
                      child: new Text(
                        "CEREMONY",
                        style: TextStyle(
                          color: utils.hexToColor("#FFFFFF"),
                          fontSize: 75.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
              ),
              new InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/Home');
                },
                child: new Container(
                  width: 200.0,
                  height: 50.0,
                  decoration: new BoxDecoration(
                    color: utils.hexToColor("#4DB6AC"),
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                  child: new Center(
                    child: new Text(
                      'Get Started',
                      style: new TextStyle(
                        fontSize: 18.0,
                        color: utils.hexToColor("#FFFFFF"),
                        fontWeight: FontWeight.bold,
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