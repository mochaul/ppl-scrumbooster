import 'package:flutter/material.dart';
import 'package:ScrumBooster/utils/utils.dart';
import 'package:ScrumBooster/components/ScrumListBtn.dart';

class ProductBacklog extends StatelessWidget {
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

      body: new ListView(
        children: <Widget>[
          new Padding(padding: EdgeInsets.all(15.0),),
          new Text("PRODUCT BACKLOG", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: utils.hexToColor("#3498DB")), textAlign: TextAlign.center,),
          new Padding(padding: EdgeInsets.all(15.0),),
          new Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Center(
              child: new Text(
                "Things you should be doing:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: utils.hexToColor("#FFFFFF")), textAlign: TextAlign.center,
              ),
            ),
            color: utils.hexToColor("#3498DB"),
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(right: 0),
                child: new Row(
                  children: <Widget>[
                    new Column(
                      children: <Widget>[
                        new ScrumListBtn(
                          title: "Content A",
                          action: () => {},
                          imgUrl: "assets/scrumPhase/content_a.png",
                        ),
                        new Text("content a", textAlign: TextAlign.center,)
                      ],
                    ),
                    new Padding(
                      padding: EdgeInsets.all(12),
                    ),
                    new Column(
                      children: <Widget>[
                        new ScrumListBtn(
                          title: "Content B",
                          action: () => {},
                          imgUrl: "assets/scrumPhase/content_b.png",
                        ),
                        new Text("content b", textAlign: TextAlign.center,)
                      ],
                    ),
                    new Padding(
                      padding: EdgeInsets.all(12),
                    ),
                    new Column(
                      children: <Widget>[
                        new ScrumListBtn(
                          title: "Content C",
                          action: () => {},
                          imgUrl: "assets/scrumPhase/content_c.png",
                        ),
                        new Text("content c", textAlign: TextAlign.center,)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(right: 0),
                child: new Row(
                  children: <Widget>[
                    new Column(
                      children: <Widget>[
                        new ScrumListBtn(
                          title: "Content D",
                          action: () => {},
                          imgUrl: "assets/scrumPhase/content_d.png",
                        ),
                        new Text("content d", textAlign: TextAlign.center,)
                      ],
                    ),
                    new Padding(
                      padding: EdgeInsets.all(12),
                    ),
                    new Column(
                      children: <Widget>[
                        new ScrumListBtn(
                          title: "Content E",
                          action: () => {},
                          imgUrl: "assets/scrumPhase/content_e.png",
                        ),
                        new Text("content e", textAlign: TextAlign.center,)
                      ],
                    ),
                    new Padding(
                      padding: EdgeInsets.all(12),
                    ),
                    new Column(
                      children: <Widget>[
                        new ScrumListBtn(
                          title: "Content F",
                          action: () => {},
                          imgUrl: "assets/scrumPhase/content_a.png",
                        ),
                        new Text("content f", textAlign: TextAlign.center,)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          new Padding(padding: EdgeInsets.all(15.0),),
          new Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Center(
              child: new Text(
                "Problems you might have face:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: utils.hexToColor("#FFFFFF")), textAlign: TextAlign.center,
              ),
            ),
            color: utils.hexToColor("#E74D3B"),
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(right: 0),
                child: new Row(
                  children: <Widget>[
                    new Column(
                      children: <Widget>[
                        new ScrumListBtn(
                          title: "Problem A",
                          action: () => {},
                          imgUrl: "assets/scrumPhase/problem_a.png",
                        ),
                        new Text("problem a", textAlign: TextAlign.center,)
                      ],
                    ),
                    new Padding(
                      padding: EdgeInsets.all(12),
                    ),
                    new Column(
                      children: <Widget>[
                        new ScrumListBtn(
                          title: "Problem B",
                          action: () => {},
                          imgUrl: "assets/scrumPhase/problem_b.png",
                        ),
                        new Text("problem b", textAlign: TextAlign.center,)
                      ],
                    ),
                    new Padding(
                      padding: EdgeInsets.all(12),
                    ),
                    new Column(
                      children: <Widget>[
                        new ScrumListBtn(
                          title: "Problem C",
                          action: () => {},
                          imgUrl: "assets/scrumPhase/problem_c.png",
                        ),
                        new Text("problem c", textAlign: TextAlign.center,)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          new Row(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(right: 0),
                child: new Row(
                  children: <Widget>[
                    new Column(
                      children: <Widget>[
                        new ScrumListBtn(
                          title: "Problem D",
                          action: () => {},
                          imgUrl: "assets/scrumPhase/problem_d.png",
                        ),
                        new Text("problem d", textAlign: TextAlign.center,)
                      ],
                    ),
                    new Padding(
                      padding: EdgeInsets.all(12),
                    ),
                    new Column(
                      children: <Widget>[
                        new ScrumListBtn(
                          title: "Problem E",
                          action: () => {},
                          imgUrl: "assets/scrumPhase/problem_e.png",
                        ),
                        new Text("problem e", textAlign: TextAlign.center,)
                      ],
                    ),
                    new Padding(
                      padding: EdgeInsets.all(12),
                    ),
                    new Column(
                      children: <Widget>[
                        new ScrumListBtn(
                          title: "Problem F",
                          action: () => {},
                          imgUrl: "assets/scrumPhase/problem_f.png",
                        ),
                        new Text("problem f", textAlign: TextAlign.center,)
                      ],
                    ),
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
              },
            ),
            ListTile(
              title: Text('Problems'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
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