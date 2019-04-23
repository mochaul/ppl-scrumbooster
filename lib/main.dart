import 'package:flutter/material.dart';
import 'package:ScrumBooster/InitialScreen/splashScreen.dart';
import 'package:flutter/services.dart';
import 'package:ScrumBooster/InitialScreen/HomeScreen.dart';
import 'package:ScrumBooster/InitialScreen/AboutPage.dart';
import 'package:ScrumBooster/InitialScreen/BoardingPage.dart';
import 'package:ScrumBooster/contentsList/ListGlossary/ListGlossary.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
        runApp(ScrumBoosterApp());
  });
}

class ScrumBoosterApp extends StatefulWidget {
  @override
  _ScrumBoosterAppState createState() => _ScrumBoosterAppState();
}

class _ScrumBoosterAppState extends State<ScrumBoosterApp> {
  final appTitle = "Scrum Booster";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: new ThemeData(
        primarySwatch: Colors.lightBlue,
        primaryColor: Colors.lightBlue,
        cursorColor: Colors.lightBlue,
        fontFamily: 'Montserrat',
      ),
      home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => new HomePage(),
        '/About':(BuildContext context) => new AboutPage(),
        '/Boarding':(BuildContext context) => new BoardingPage(),
        '/Glossary':(BuildContext context) => new GlossaryPage(),
        '/SearchPage':(BuildContext context) => new SearchPage(),
      },
    );
  }
}