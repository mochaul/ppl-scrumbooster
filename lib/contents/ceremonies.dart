import 'package:ScrumBooster/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:ScrumBooster/search/SearchPage.dart';

class Ceremonies extends StatelessWidget {
  final String title;
  final String imagePath;
  final String contents;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  getScaffoldKey() {
    return scaffoldKey;
  }

  final util = new Util();

  Ceremonies({
    Key key,
    this.title,
    this.imagePath,
    this.contents,
  }) : super(key:key);

  @override
  Widget build(BuildContext context){
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    void _searchpage() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SearchPage()
        ),
      );
    }
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: new InkWell(
          child: Icon(
            Icons.menu,
            color: util.hexToColor("#FFFFFF"),
          ),
          onTap: () {
            scaffoldKey.currentState.openDrawer();
          },
        ),
        centerTitle: true,
        title: Text(
          "SCRUM BOOSTER",
          style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold,
            color: util.hexToColor("#FFFFFF"),
          ),
        ),
        actions: <Widget>[
          new Padding(
            padding: EdgeInsets.only(right: 6.0),
            child: new InkWell(
              child: new Icon(
                Icons.search,
                color: util.hexToColor("#FFFFFF"),
              ),
              onTap: _searchpage,
            ),
          )
        ],
      ),
      drawer: util.defaultDrawer(context),
      body: Stack(
        children: <Widget>[
          new Container(
            width: _width,
            height: util.fitScreenSize(_height, 0.45),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
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
                    height: util.fitScreenSize(_height, 0.45),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: new Stack(
                      children: <Widget>[
                        new Align(
                          alignment: Alignment.bottomLeft,
                          child: new Padding(
                            padding: EdgeInsets.only(bottom: 30.0),
                            child: new Container(
                              alignment: Alignment.center,
                              height: util.fitScreenSize(_height, 0.08),
                              width: util.fitScreenSize(_width, 0.75),
                              child: new Text(
                                this.title,
                                style:TextStyle(
                                  color:util.hexToColor("#3498DB"),
                                  fontWeight:FontWeight.bold,
                                  fontSize: util.fitScreenSize(_height, 0.03),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              decoration: new BoxDecoration(
                                color: util.hexToColor("#FFFFFF"),
                                boxShadow: <BoxShadow>[
                                  new BoxShadow(
                                    color: util.hexToColor("#000000"),
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
                        color: util.hexToColor("#FFFFFF"),
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: <BoxShadow>[
                          new BoxShadow(
                            color: util.hexToColor("#000000"),
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
                            fontSize: util.fitScreenSize(_height, 0.025),
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