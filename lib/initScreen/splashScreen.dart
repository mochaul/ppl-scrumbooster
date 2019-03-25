import 'package:flutter/material.dart';
import 'package:ScrumBooster/utils/utils.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final util = new Util();

  Future transitionToHome() {
    return new Future.delayed(
      const Duration(seconds: 2),
        () => Navigator.of(context).pushReplacementNamed('/Boarding'),
    );
  }

  @override
  void initState() {
    super.initState();
    transitionToHome();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new Container(
        height: _height,
        width: _width,
        decoration: new BoxDecoration(
          color: util.hexToColor("#3498DB"),
        ),
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Image(
                image: new AssetImage('assets/logos/logo-white.png'),
                height: util.fitScreenSize(_height, 0.5),
                width: util.fitScreenSize(_width, 0.5),
              ),
              new Text(
                "SCRUM",
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  color: util.hexToColor("#FFFFFF"),
                  fontSize: 50.0,
                ),
              ),
              new Text(
                "BOOSTER",
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  color: util.hexToColor("#FFFFFF"),
                  fontSize: 50.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



