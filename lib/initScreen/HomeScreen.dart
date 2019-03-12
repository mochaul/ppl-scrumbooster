import 'package:flutter/material.dart';
import 'package:ScrumBooster/utils/utils.dart';
import 'package:ScrumBooster/components/ScrumPhaseBtn.dart';
import 'package:ScrumBooster/scrumPhaseList/ProductBacklog.dart';

class HomePage extends StatelessWidget {
  final List<String> myList = new List();
  final List<String> homeImageList = new List();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var utils = new Util();

  getScaffoldKey() {
    return scaffoldKey;
  }

//  HomePage({Key key, List<String> myList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
          centerTitle: true,
          title: Text("SCRUM BOOSTER", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: utils.hexToColor("#FFFFFF")),)
    ),
      body: new Column(
        children: <Widget>[
          new Padding(padding: EdgeInsets.all(15.0),),
          new Text("WHICH SCRUMPHASE ARE YOU IN RIGHT NOW?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: utils.hexToColor("#000000")), textAlign: TextAlign.center,),
          new Row(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(right: 0),
                child: new Row(
                  children: <Widget>[
                    new ScrumPhaseBtn(
                      title: "Product Backlog",
                      action: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductBacklog()
                          )
                        );
                      },
                      imgUrl: "assets/homepage/Product_Backlog.png",
                    ),
                    new Padding(
                      padding: EdgeInsets.all(0),
                    ),
                    new ScrumPhaseBtn(
                      title: "Sprint Planning",
                      action: () => {},
                      imgUrl: "assets/homepage/Sprint_Planning.png",
                    )
                  ],
                ),
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(right: 10),
                child: new Row(
                  children: <Widget>[
                    new ScrumPhaseBtn(
                      title: "Sprint Execution",
                      action: () => {},
                      imgUrl: "assets/homepage/Sprint_Exe.png",
                    ),
                    new Padding(
                      padding: EdgeInsets.all(0),
                    ),
                    new ScrumPhaseBtn(
                      title: "Sprint Evaluation",
                      action: () => {},
                      imgUrl: "assets/homepage/Sprint_Evaluation.png",
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Ceremonies'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                // redirect
                Navigator.of(context).pushNamed('/ListCeremonies');
              },
            ),
            ListTile(
              title: Text('Problems'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
                //redirect
                Navigator.of(context).pushNamed('/ListProblems');
              },
            ),
            ListTile(
              title: Text('Glossary'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Pop Quiz!'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}