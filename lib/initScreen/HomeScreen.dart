import 'package:flutter/material.dart';
import 'package:ScrumBooster/utils/utils.dart';
import 'package:ScrumBooster/contents/ceremonies.dart';
import 'package:ScrumBooster/contents/problems.dart';
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
  final util = new Util();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: new Icon(
          Icons.menu,
          color: util.hexToColor("#FFFFFF"),
        ),
        centerTitle: true,
        title: Text(
          "Scrum Booster",
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
              onTap: () => {},
            ),
          ),
        ],
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
        ]
      ),
      drawer: util.defaultDrawer(context),
    );
  }
}