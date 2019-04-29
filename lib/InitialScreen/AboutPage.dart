import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scrum Booster", style: TextStyle(color: Colors.white),),
      ),
      
      //add new cotainer for page's contents
      body : new Container(
        padding: new EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),

        //add column for the content
        child: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Image.asset(
                  'assets/logos/logo-color.png', 
                  height: 120,
                  key: new Key("Scrum Booster Logo"),
                ),
                Padding(padding: EdgeInsets.all(10.0),),
                new Image.asset(
                  'assets/logos/Makara-UI.png', 
                  height: 120,
                  key: new Key("Makara UI Logo"),
                ),
              ], 
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: new Column(
                children: <Widget>[
                  //about content
                  new Text(
                    'Scrum Booster is a software project developed by RSE Labs. RSE Labs is a part of Faculty of Computer Science in University of Indonesia. Scrum Booster is part of software engineering projects developed by:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    key: new Key("Explanation"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  new Text(
                    'Eko K. Budiardjo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  new Text(
                    'Suci Fadhilah',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                
                  new Text(
                    'Arfi Renaldi',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  //name for each members
                  new Text(
                    'Mochamad Aulia Akbar Praditomo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  new Text(
                    'Fajrin Maulana Kingwijati',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    )
                  ),
                  new Text(
                    'Izzan Fakhril Islam',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  new Text(
                    'Muhammad Rezki',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  new Text(
                    'Khoirul Khuluqi Abdulloh',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  new Text(
                    'Wildan Fahmi Gunawan',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ) 
            )
          ],
        ),
      )
    );
  }
}
