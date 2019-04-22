import 'package:flutter/material.dart';
import 'package:ScrumBooster/Utils/utils.dart';
import 'package:ScrumBooster/components/ScrumPhaseBtn.dart';
import 'package:ScrumBooster/ScrumPhase/ProductBacklog/ProductBacklog.dart';
import 'package:ScrumBooster/ScrumPhase/SprintEvaluation/SprintEvaluation.dart';
import 'package:ScrumBooster/ScrumPhase/SprintExecution/SprintExecution.dart';
import 'package:ScrumBooster/ScrumPhase/SprintPlanning/SprintPlanning.dart';
import 'package:ScrumBooster/search/SearchPage.dart';

class HomePage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var utils = new Util();
  getScaffoldKey() {
    return scaffoldKey;
  }

  final util = new Util();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
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
          child: new Icon(
            Icons.menu,
            color: util.hexToColor("#FFFFFF"),
          ),
          onTap: () {
            scaffoldKey.currentState.openDrawer();
          },
        ),
        centerTitle: true,
        title: Text(
          "Scrum Booster".toUpperCase(),
          style: TextStyle(
            color: util.hexToColor("#FFFFFF"),
            fontWeight: FontWeight.bold,
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
          ),
        ],
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 15.0),
              child: new Text(
                "WHICH SCRUM PHASE ARE YOU IN RIGHT NOW?",
                style: TextStyle(
                  fontSize: util.fitScreenSize(_height, 0.035),
                  fontWeight: FontWeight.bold,
                  color: utils.hexToColor("#000000"),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new ScrumPhaseBtn(
                  title: "Product Backlog",
                  action: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductBacklog()
                      ),
                    );
                  },
                  imgUrl: "assets/homepage/Product_Backlog.png",
                ),
                new Padding(
                  padding: EdgeInsets.all(20.0),
                ),
                new ScrumPhaseBtn(
                  title: "Sprint Planning",
                  action: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SprintPlanning()
                      ),
                    );
                  },
                  imgUrl: "assets/homepage/Sprint_Planning.png",
                ),
              ],
            ),
            new Padding(
              padding: EdgeInsets.all(10.0),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new ScrumPhaseBtn(
                  title: "Sprint Execution",
                  action: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SprintExecution()
                      ),
                    );
                  },
                  imgUrl: "assets/homepage/Sprint_Exe.png",
                ),
                new Padding(
                  padding: EdgeInsets.all(20.0),
                ),
                new ScrumPhaseBtn(
                  title: "Sprint Evaluation",
                  action: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SprintEvaluation()
                      ),
                    );
                  },
                  imgUrl: "assets/homepage/Sprint_Evaluation.png",
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: util.defaultDrawer(context),
    );
  }
}