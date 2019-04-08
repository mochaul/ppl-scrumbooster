import 'package:flutter/material.dart';
import 'package:ScrumBooster/utils/utils.dart';
import 'package:ScrumBooster/components/ScrumListBtn.dart';
import 'package:ScrumBooster/contents/ceremonies.dart';
import 'package:ScrumBooster/contents/problems.dart';
import 'package:ScrumBooster/components/ScrumPhaseContentBtn.dart';

class ProductBacklog extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var utils = new Util();

  getScaffoldKey() {
    return scaffoldKey;
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        leading: new InkWell(
          child: new Icon(
            Icons.menu,
            color: utils.hexToColor("#FFFFFF"),
          ),
          onTap: () {
            scaffoldKey.currentState.openDrawer();
          },
        ),
        title: Text(
          "Scrum Booster".toUpperCase(),
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: utils.hexToColor("#FFFFFF"),
          ),
        ),
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
          ),
        ],
      ),
      body: new ListView(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.all(15.0),
          ),
          new Text(
            "PRODUCT BACKLOG",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: utils.hexToColor("#3498DB"),
            ),
            textAlign: TextAlign.center,
          ),
          new Padding(
            padding: EdgeInsets.all(15.0),
          ),
          new Container(
            width: _width,
            height: 50,
            child: Center(
              child: new Text(
                "Things you should be doing:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: utils.hexToColor("#FFFFFF")), textAlign: TextAlign.center,
              ),
            ),
            color: utils.hexToColor("#3498DB"),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new ScrumPhaseContentBtn(
                    title: "Backlog Grooming",
                    imageAssetURL: "assets/scrumPhase/content_a.png",
                    action: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Ceremonies(
                            imagePath: "assets/scrumPhase/content_a.png",
                            title: "BACKLOG GROOMING",
                            contents: "Backlog grooming is when the product owner and some, or all, of the rest of the team review items on the backlog to ensure the backlog contains the appropriate items, that they are prioritized, and that the items at the top of the backlog are ready for delivery.",
                          )
                        ),
                      );
                    },
                  ),
                  new ScrumPhaseContentBtn(
                    title: "content b",
                    imageAssetURL: "assets/scrumPhase/content_b.png",
                    action: () {}, //TODO: Implement masuk ke page content b
                  ),
                  new ScrumPhaseContentBtn(
                    title: "content c",
                    imageAssetURL: "assets/scrumPhase/content_c.png",
                    action: () {} //TODO: Implement masuk ke page content c
                  ),
                ],
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new ScrumPhaseContentBtn(
                    title: "content d",
                    imageAssetURL: "assets/scrumPhase/content_d.png",
                    action: () {},
                  ),
                  new ScrumPhaseContentBtn(
                    title: "content e",
                    imageAssetURL: "assets/scrumPhase/content_e.png",
                    action: () {},
                  ),
                  new ScrumPhaseContentBtn(
                    title: "content f",
                    imageAssetURL: "assets/scrumPhase/content_a.png",
                    action: () {},
                  ),
                ],
              ),
            ],
          ),
          new Padding(
            padding: EdgeInsets.all(15.0),
          ),
          new Container(
            width: _width,
            height: 50.0,
            child: Center(
              child: new Text(
                "Problems you might have face:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: utils.hexToColor("#FFFFFF"),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            color: utils.hexToColor("#E74D3B"),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new ScrumPhaseContentBtn(
                    title: "Poor Project Communication",
                    imageAssetURL: "assets/scrumPhase/problem_a.png",
                    action: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProblemsContentPage(
                            imagePath: "assets/scrumPhase/problem_a.png",
                            title: "POOR PROJECT COMMUNICATION",
                            contents: "One of the primary advantages of adopting agile approaches is the superior way it deals with real-time communications. Agile ceremonies and techniques such as Release / Sprint Planning, Daily Stand Up, Spring Demo / Reviews, and Retrospectives encourage communication between team members on a daily, incremental basis. Any additional decisions regarding frequency of communication can be captured in the Team Agreement.",
                          )
                        ),
                      );
                    },
                  ),
                  new ScrumPhaseContentBtn(
                    title: "problem b",
                    imageAssetURL: "assets/scrumPhase/problem_b.png",
                    action: () {},
                  ),
                  new ScrumPhaseContentBtn(
                    title: "problem c",
                    imageAssetURL: "assets/scrumPhase/problem_c.png",
                    action: () {},
                  ),
                ],
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new ScrumPhaseContentBtn(
                      title: "problem d",
                      imageAssetURL: "assets/scrumPhase/problem_d.png",
                      action: () {},
                    ),
                    new ScrumPhaseContentBtn(
                      title: "problem e",
                      imageAssetURL: "assets/scrumPhase/problem_e.png",
                      action: () {},
                    ),
                    new ScrumPhaseContentBtn(
                      title: "problem f",
                      imageAssetURL: "assets/scrumPhase/problem_f.png",
                      action: () {},
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      drawer: utils.defaultDrawer(context),
    );
  }
}