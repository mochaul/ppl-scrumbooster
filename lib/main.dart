import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ScrumBooster/InitialScreen/splashScreen.dart';
import 'package:ScrumBooster/InitialScreen/BoardingPage.dart';
import 'package:ScrumBooster/Utils/utils.dart';
//routes
import 'package:ScrumBooster/InitialScreen/AboutPage.dart';
import 'package:ScrumBooster/InitialScreen/HomeScreen.dart';
import 'package:ScrumBooster/contentsList/ListGlossary/ListGlossary.dart';
import 'package:ScrumBooster/contentsList/ListCeremonies/ListCeremonies.dart';
import 'package:ScrumBooster/contentsList/ListProblems/ListProblems.dart';

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
  final util = new Util();
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
        cursorColor: Colors.white,
        fontFamily: 'Montserrat',
      ),
      home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => new HomePage(),
        '/Ceremony': (BuildContext context) => new ListCeremonies(),
        '/Problem': (BuildContext context) => new ListProblems(),
        '/Glossary':(BuildContext context) => new ListGlossary(),
        '/About':(BuildContext context) => new AboutPage(),
        '/Boarding':(BuildContext context) => new BoardingPage(),
      },
    );
  }
}