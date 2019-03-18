import 'package:ScrumBooster/utils/utils.dart';
import 'package:flutter/material.dart';

class Ceremonies extends StatelessWidget {
  final String title;
  final String imagePath;
  final String contents;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  getScaffoldKey() {
    return scaffoldKey;
  }

  final utils = new Util();

  Ceremonies({
    Key key,
    this.title,
    this.imagePath,
    this.contents,
  }) : super(key:key);

  @override
  Widget build(BuildContext context){
    double _height =MediaQuery.of(context).size.height;
    double _width =MediaQuery.of(context).size.width;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "SCRUM BOOSTER", style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, 
              color: utils.hexToColor("#FFFFFF"))
              ,),
          actions: <Widget>[
            new Padding(
              padding: EdgeInsets.only(right: 6.0),
              child: new InkWell(
                child: new Icon(
                  Icons.search,
                  color: utils.hexToColor("#FFFFFF"),
                ),
                onTap: () => {},
              ),
            )
          ],
      ),
      drawer: Drawer(
        child: ListView(
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
      body: Stack(
        children: <Widget>[
          new Container(
            width: _width,
            height: utils.fitScreenSize(_height, 0.45),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  this.imagePath,
                )
              )
            ),
          ),
          ListView(
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    width: _width,
                    height: utils.fitScreenSize(_height, 0.45),
                    decoration: BoxDecoration(
                      color: Colors.transparent
                    ),
                    child: new Stack(
                      children: <Widget>[
                        new Align(
                          alignment: Alignment.bottomLeft,
                          child: new Padding(
                            padding: EdgeInsets.only(bottom: 30.0),
                            child: new Container(
                              alignment: Alignment.center,
                              height: utils.fitScreenSize(_height, 0.08),
                              width: utils.fitScreenSize(_width, 0.75),
                              child: new Text(
                                this.title,
                                style:TextStyle(
                                  color:utils.hexToColor("#3498DB"),
                                  fontWeight:FontWeight.bold,
                                  fontSize: 25.0,
                                )
                              ),
                              decoration: new BoxDecoration(
                                color: utils.hexToColor("#FFFFFF"),
                                boxShadow: <BoxShadow>[
                                  new BoxShadow(
                                    color: utils.hexToColor("#000000"),
                                    offset: new Offset(15.0, 7.5),
                                    blurRadius: 50.0,
                                  )
                                ]
                              ),
                            ),
                          ),
                        )
                      ],
                      ),
                  ),
                  new Padding(
                    padding: EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                      bottom: 10.0,
                    ),
                    child: new Container(
                      width: _width,
                      height: _height,
                      decoration: new BoxDecoration(
                        color: utils.hexToColor("#FFFFFF"),
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: <BoxShadow>[
                          new BoxShadow(
                            color: utils.hexToColor("#000000"),
                            offset: new Offset(10.0, 10.0),
                            blurRadius: 30.0,
                          )
                        ]
                      ),
                      child: new Padding(
                        padding: EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          bottom: 15.0,
                          top: 15.0,
                        ),
                        child: new Text(
                          this.contents,
                          style:TextStyle(
                            fontSize: 20.0,
                          )
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
            )
        ],
      ),
    );}
}