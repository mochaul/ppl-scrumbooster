import 'package:flutter/material.dart';
import 'package:ScrumBooster/utils/utils.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Scrum Booster", style: TextStyle(color: Colors.black12),),
      ),
      
      //add new cotainer for page's contents
      body : new Container(
        padding: new EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),

        //add column for the content
        child: new Column(
          children: <Widget>[

            //create row for the image for the 1st column 
            new Row(
              children: <Widget>[
                //add padding for the leftside of the logo
                Padding(padding: EdgeInsets.only(left: 30.0),),

                //import scrum-booster logo from the assets
                new Image.asset(
                  'assets/logos/logo-color.png', 
                    height: 120,
                  ),
                  
                //add space with padding object between the logo 
                Padding(padding: EdgeInsets.all(10.0),),

                //import University logo from the assets
                new Image.asset(
                  'assets/logos/logo-color.png', 
                    height: 120,
                  ),
              ], 
            ),


            //add padding for content 
            Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: new Column(
                children: <Widget>[

                    //about content
                    new Text('Scrum Booster is a software project developed by RSE Labs. RSE Labs is a part of Faculty of Computer Science in University of Indonesia. Scrum Booster is part of software engineering projects by:',
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 16,)),

                    Padding(padding: EdgeInsets.all(10.0),), // add space between 

                    //name for each members
                    new Text('Mochamad Aulia Akbar Praditomo',
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 16,)),

                    new Text('Fajrin Maulana Kingwijati',
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 16,)),

                    new Text('Izzan Fakhril Islam',
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 16,)),

                    new Text('Muhammad Rezki',
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 16,)),

                    new Text('Khoirul Kholuqi',
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 16,)),

                    new Text('Wildan Fahmi Gunawan',
                    textAlign: TextAlign.center, style: TextStyle(fontSize: 16,)),
                ],

              ) 
            )
          ],
        ),
      )
    );
  }
}
