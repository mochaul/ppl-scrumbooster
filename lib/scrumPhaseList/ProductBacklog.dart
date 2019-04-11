import 'package:flutter/material.dart';
import 'package:ScrumBooster/utils/utils.dart';
import 'package:ScrumBooster/contents/ceremonies.dart';
import 'package:ScrumBooster/contents/problems.dart';
import 'package:ScrumBooster/components/ScrumPhaseContentBtn.dart';

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:ScrumBooster/components/loading/loadingData.dart';

_ProductBacklogState _productBacklogState;
class ProductBacklog extends StatefulWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  List<dynamic> cookies;
  final util = new Util();
  List<Widget> listView = [new Container(),];
  List<Widget> widgets = [new Container(),];

  var phaseDetailsDataJSON;
  var phaseCeremoniesDataJSON;
  var phaseProblemsDataJSON;

  getScaffoldKey() {
    return scaffoldKey;
  }

  @override
  _ProductBacklogState createState() {
    _productBacklogState = new _ProductBacklogState();
    return _productBacklogState;
  }
}

class _ProductBacklogState extends State<ProductBacklog> {

  final util = new Util();
  static const int PHASE_ID = 1;

  Directory dir;
  File cookieFile;
  bool cookiesExists;
  List<dynamic> cookies;
  double loading = 0.0;
  int ceremoniesRowCount = 0;
  int problemsRowCount = 0;

  Future<Null> refresh() async {
    await loadProductBacklog(true);
    return null;
  }

  Future<Null> loadProductBacklog(bool refresh) async {
    widget.listView = [];
    widget.widgets = [];

    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    if (!refresh) {
      _productBacklogState.setState(() {
        loading = _height;
      });
    }

    //Get Phase Details
    var phaseDetails = await http.get(
      util.getConfiguration()['base_url']+"phase/${PHASE_ID.toString()}/details/",
    );
    print(phaseDetails.body);
    widget.phaseDetailsDataJSON = json.decode(phaseDetails.body);

    //Get Phase Ceremonies Details
    widget.phaseCeremoniesDataJSON = widget.phaseDetailsDataJSON["ceremonies"];
    _productBacklogState.setState(() {
      ceremoniesRowCount = (widget.phaseCeremoniesDataJSON.length/3).ceil();
    });

    //Get Phase Problems Details
    widget.phaseProblemsDataJSON = widget.phaseDetailsDataJSON["problems"];
    _productBacklogState.setState(() {
      problemsRowCount = (widget.phaseProblemsDataJSON.length/3).ceil();
    });

    List<Widget> listView = widget.listView;
    widget.listView = [];

    listView.add(
      new Column(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.all(15.0),
          ),
          new Text(
            "PRODUCT BACKLOG",
            style: TextStyle(
              fontSize: util.fitScreenSize(_height, 0.03),
              fontWeight: FontWeight.bold,
              color: util.hexToColor("#3498DB"),
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
                "Things you should be doing:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: util.hexToColor("#FFFFFF"),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            color: util.hexToColor("#3498DB"),
          ),
        ],
      )
    );
    print(widget.phaseCeremoniesDataJSON);
    //Adding phase ceremony items
    int idx = 0;
    for (int i = 0; i < ceremoniesRowCount; i++) {
      if (i == ceremoniesRowCount-1) {
        listView.add(
          new Column(
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new ScrumPhaseContentBtn(
                        title: widget.phaseCeremoniesDataJSON[idx]["title"],
                        imageAssetURL: widget.phaseCeremoniesDataJSON[idx]["image"],
                        action: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Ceremonies(
                                imagePath: widget.phaseCeremoniesDataJSON[idx]["image"],
                                title: widget.phaseCeremoniesDataJSON[idx]["title"],
                                contents: widget.phaseCeremoniesDataJSON[idx]["detail"],
                              )
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
//        idx += 2;
      } else {
        listView.add(
          new Column(
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new ScrumPhaseContentBtn(
                        title: widget.phaseCeremoniesDataJSON[idx]["title"],
                        imageAssetURL: widget.phaseCeremoniesDataJSON[idx]["image"],
                        action: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Ceremonies(
                                  imagePath: widget.phaseCeremoniesDataJSON[idx]["image"],
                                  title: widget.phaseCeremoniesDataJSON[idx]["title"],
                                  contents: widget.phaseCeremoniesDataJSON[idx]["detail"],
                                )
                            ),
                          );
                        },
                      ),
                      new ScrumPhaseContentBtn(
                        title: widget.phaseCeremoniesDataJSON[idx+1]["title"],
                        imageAssetURL: widget.phaseCeremoniesDataJSON[idx+1]["image"],
                        action: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Ceremonies(
                                  imagePath: widget.phaseCeremoniesDataJSON[idx+1]["image"],
                                  title: widget.phaseCeremoniesDataJSON[idx+1]["title"],
                                  contents: widget.phaseCeremoniesDataJSON[idx+1]["detail"],
                                )
                            ),
                          );
                        },
                      ),
                      new ScrumPhaseContentBtn(
                        title: widget.phaseCeremoniesDataJSON[idx+2]["title"],
                        imageAssetURL: widget.phaseCeremoniesDataJSON[idx+2]["image"],
                        action: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Ceremonies(
                                  imagePath: widget.phaseCeremoniesDataJSON[idx+2]["image"],
                                  title: widget.phaseCeremoniesDataJSON[idx+2]["title"],
                                  contents: widget.phaseCeremoniesDataJSON[idx+2]["detail"],
                                )
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
        idx += 3;
      }
    }

    listView.add(
      new Padding(
        padding: EdgeInsets.all(15.0),
      ),
    );

    listView.add(
      new Container(
        width: _width,
        height: 50.0,
        child: Center(
          child: new Text(
            "Problems you might have face:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: util.hexToColor("#FFFFFF"),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        color: util.hexToColor("#E74D3B"),
      ),
    );

    //Adding phase ceremony items
    int idx1 = 0;
    for (int i = 0; i < problemsRowCount; i++) {
      if (i == problemsRowCount-1) {
        listView.add(
          new Column(
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new ScrumPhaseContentBtn(
                        title: widget.phaseProblemsDataJSON[idx1]["title"],
                        imageAssetURL: widget.phaseProblemsDataJSON[idx1]["image"],
                        action: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Ceremonies(
                                  imagePath: widget.phaseProblemsDataJSON[idx1]["image"],
                                  title: widget.phaseProblemsDataJSON[idx1]["title"],
                                  contents: widget.phaseProblemsDataJSON[idx1]["detail"],
                                )
                            ),
                          );
                        },
                      ),
                      new ScrumPhaseContentBtn(
                        title: widget.phaseProblemsDataJSON[idx1+1]["title"],
                        imageAssetURL: widget.phaseProblemsDataJSON[idx1+1]["image"],
                        action: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Ceremonies(
                                  imagePath: widget.phaseProblemsDataJSON[idx1+1]["image"],
                                  title: widget.phaseProblemsDataJSON[idx1+1]["title"],
                                  contents: widget.phaseProblemsDataJSON[idx1+1]["detail"],
                                )
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
//        idx += 2;
      } else {
        listView.add(
          new Column(
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new ScrumPhaseContentBtn(
                        title: widget.phaseProblemsDataJSON[idx1]["title"],
                        imageAssetURL: widget.phaseProblemsDataJSON[idx1]["image"],
                        action: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Ceremonies(
                                  imagePath: widget.phaseProblemsDataJSON[idx1]["image"],
                                  title: widget.phaseProblemsDataJSON[idx1]["title"],
                                  contents: widget.phaseProblemsDataJSON[idx1]["detail"],
                                )
                            ),
                          );
                        },
                      ),
                      new ScrumPhaseContentBtn(
                        title: widget.phaseProblemsDataJSON[idx1+1]["title"],
                        imageAssetURL: widget.phaseProblemsDataJSON[idx1+1]["image"],
                        action: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Ceremonies(
                                  imagePath: widget.phaseProblemsDataJSON[idx1+1]["image"],
                                  title: widget.phaseProblemsDataJSON[idx1+1]["title"],
                                  contents: widget.phaseProblemsDataJSON[idx1+1]["detail"],
                                )
                            ),
                          );
                        },
                      ),
                      new ScrumPhaseContentBtn(
                        title: widget.phaseProblemsDataJSON[idx1+2]["title"],
                        imageAssetURL: widget.phaseProblemsDataJSON[idx1+2]["image"],
                        action: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Ceremonies(
                                  imagePath: widget.phaseProblemsDataJSON[idx1+2]["image"],
                                  title: widget.phaseProblemsDataJSON[idx1+2]["title"],
                                  contents: widget.phaseProblemsDataJSON[idx1+2]["detail"],
                                )
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
        idx1 += 3;
      }
    }

    widget.listView.addAll(listView);

    _productBacklogState.setState(() {
      loading = 0.0;
    });
  }

  @override
  void didChangeDependencies() {
    if (widget.listView.length == 1) {
      loadProductBacklog(false);
    }
  }

  @override
  Widget build(BuildContext context) {

    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: widget.scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        leading: new InkWell(
          child: new Icon(
            Icons.menu,
            color: util.hexToColor("#FFFFFF"),
          ),
          onTap: () {
            widget.scaffoldKey.currentState.openDrawer();
          },
        ),
        title: Text(
          "Scrum Booster".toUpperCase(),
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
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
              onTap: () => {},
            ),
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          new Container(
            child: new RefreshIndicator(
              child: new ListView(
                children: widget.listView,
              ),
              onRefresh: refresh,
            ),
          ),
          new LoadingData(
            height: loading,
          ),
        ],
      ),
    );
  }
}


//class ProductBacklog extends StatelessWidget {
//  final scaffoldKey = GlobalKey<ScaffoldState>();
//  var utils = new Util();
//
//  getScaffoldKey() {
//    return scaffoldKey;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    double _height = MediaQuery.of(context).size.height;
//    double _width = MediaQuery.of(context).size.width;
//    return Scaffold(
//      key: scaffoldKey,
//      appBar: AppBar(
//        centerTitle: true,
//        leading: new InkWell(
//          child: new Icon(
//            Icons.menu,
//            color: utils.hexToColor("#FFFFFF"),
//          ),
//          onTap: () {
//            scaffoldKey.currentState.openDrawer();
//          },
//        ),
//        title: Text(
//          "Scrum Booster".toUpperCase(),
//          style: TextStyle(
//              fontSize: 20,
//              fontWeight: FontWeight.bold,
//              color: utils.hexToColor("#FFFFFF"),
//          ),
//        ),
//        actions: <Widget>[
//          new Padding(
//            padding: EdgeInsets.only(right: 6.0),
//            child: new InkWell(
//              child: new Icon(
//                Icons.search,
//                color: utils.hexToColor("#FFFFFF"),
//              ),
//              onTap: () => {},
//            ),
//          ),
//        ],
//      ),
//      body: new ListView(
//        children: <Widget>[
//          new Padding(
//            padding: EdgeInsets.all(15.0),
//          ),
//          new Text(
//            "PRODUCT BACKLOG",
//            style: TextStyle(
//              fontSize: utils.fitScreenSize(_height, 0.03),
//              fontWeight: FontWeight.bold,
//              color: utils.hexToColor("#3498DB"),
//            ),
//            textAlign: TextAlign.center,
//          ),
//          new Padding(
//            padding: EdgeInsets.all(15.0),
//          ),
//          new Container(
//            width: _width,
//            height: 50,
//            child: Center(
//              child: new Text(
//                "Things you should be doing:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: utils.hexToColor("#FFFFFF")), textAlign: TextAlign.center,
//              ),
//            ),
//            color: utils.hexToColor("#3498DB"),
//          ),
//          new Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
//              new Row(
//                children: <Widget>[
//                  new ScrumPhaseContentBtn(
//                    title: "Backlog Grooming",
//                    imageAssetURL: "assets/scrumPhase/content_a.png",
//                    action: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) => Ceremonies(
//                            imagePath: "assets/scrumPhase/content_a.png",
//                            title: "BACKLOG GROOMING",
//                            contents: "Backlog grooming is when the product owner and some, or all, of the rest of the team review items on the backlog to ensure the backlog contains the appropriate items, that they are prioritized, and that the items at the top of the backlog are ready for delivery.",
//                          )
//                        ),
//                      );
//                    },
//                  ),
//                  new ScrumPhaseContentBtn(
//                    title: "content b",
//                    imageAssetURL: "assets/scrumPhase/content_b.png",
//                    action: () {}, //TODO: Implement masuk ke page content b
//                  ),
//                  new ScrumPhaseContentBtn(
//                    title: "content c",
//                    imageAssetURL: "assets/scrumPhase/content_c.png",
//                    action: () {} //TODO: Implement masuk ke page content c
//                  ),
//                ],
//              ),
//            ],
//          ),
//          new Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
//              new Row(
//                children: <Widget>[
//                  new ScrumPhaseContentBtn(
//                    title: "content d",
//                    imageAssetURL: "assets/scrumPhase/content_d.png",
//                    action: () {},
//                  ),
//                  new ScrumPhaseContentBtn(
//                    title: "content e",
//                    imageAssetURL: "assets/scrumPhase/content_e.png",
//                    action: () {},
//                  ),
//                  new ScrumPhaseContentBtn(
//                    title: "content f",
//                    imageAssetURL: "assets/scrumPhase/content_a.png",
//                    action: () {},
//                  ),
//                ],
//              ),
//            ],
//          ),
//          new Padding(
//            padding: EdgeInsets.all(15.0),
//          ),
//          new Container(
//            width: _width,
//            height: 50.0,
//            child: Center(
//              child: new Text(
//                "Problems you might have face:",
//                style: TextStyle(
//                  fontSize: 20,
//                  fontWeight: FontWeight.bold,
//                  color: utils.hexToColor("#FFFFFF"),
//                ),
//                textAlign: TextAlign.center,
//              ),
//            ),
//            color: utils.hexToColor("#E74D3B"),
//          ),
//          new Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
//              new Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  new ScrumPhaseContentBtn(
//                    title: "Poor Project Communication",
//                    imageAssetURL: "assets/scrumPhase/problem_a.png",
//                    action: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) => ProblemsContentPage(
//                            imagePath: "assets/scrumPhase/problem_a.png",
//                            title: "POOR PROJECT COMMUNICATION",
//                            contents: "One of the primary advantages of adopting agile approaches is the superior way it deals with real-time communications. Agile ceremonies and techniques such as Release / Sprint Planning, Daily Stand Up, Spring Demo / Reviews, and Retrospectives encourage communication between team members on a daily, incremental basis. Any additional decisions regarding frequency of communication can be captured in the Team Agreement.",
//                          )
//                        ),
//                      );
//                    },
//                  ),
//                  new ScrumPhaseContentBtn(
//                    title: "problem b",
//                    imageAssetURL: "assets/scrumPhase/problem_b.png",
//                    action: () {},
//                  ),
//                  new ScrumPhaseContentBtn(
//                    title: "problem c",
//                    imageAssetURL: "assets/scrumPhase/problem_c.png",
//                    action: () {},
//                  ),
//                ],
//              ),
//            ],
//          ),
//          new Row(
//            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//            children: <Widget>[
//              new Padding(
//                padding: EdgeInsets.only(top: 25.0),
//                child: new Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                  children: <Widget>[
//                    new ScrumPhaseContentBtn(
//                      title: "problem d",
//                      imageAssetURL: "assets/scrumPhase/problem_d.png",
//                      action: () {},
//                    ),
//                    new ScrumPhaseContentBtn(
//                      title: "problem e",
//                      imageAssetURL: "assets/scrumPhase/problem_e.png",
//                      action: () {},
//                    ),
//                    new ScrumPhaseContentBtn(
//                      title: "problem f",
//                      imageAssetURL: "assets/scrumPhase/problem_f.png",
//                      action: () {},
//                    ),
//                  ],
//                ),
//              ),
//            ],
//          )
//        ],
//      ),
//      drawer: utils.defaultDrawer(context),
//    );
//  }
//}