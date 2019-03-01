import 'package:flutter/material.dart';
import 'package:scrum_booster/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final util = new Util();

  transitionToHome() async {
    Navigator.of(context).pushReplacementNamed("");
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
              new Padding(
                padding: EdgeInsets.all(util.fitScreenSize(_height, 0.075)),
              ),
              new Text(
                "SCRUM BOOSTER",
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  color: util.hexToColor("#FFFFFF"),
                  fontSize: 25.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



