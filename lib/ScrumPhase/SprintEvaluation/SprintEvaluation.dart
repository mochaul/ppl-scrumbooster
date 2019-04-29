import 'package:flutter/material.dart';
import 'package:ScrumBooster/Utils/utils.dart';
import 'package:ScrumBooster/contents/ceremonies.dart';
import 'package:ScrumBooster/contents/problems.dart';
import 'package:ScrumBooster/components/ScrumPhaseContentBtn.dart';
import 'package:ScrumBooster/ScrumPhase/SprintEvaluation/ApiProvider.dart';
import 'package:ScrumBooster/ScrumPhase/SprintEvaluation/Model.dart';
import 'package:ScrumBooster/ScrumPhase/ProductBacklog/ProductBacklog.dart';
import 'package:ScrumBooster/ScrumPhase/SprintExecution/SprintExecution.dart';
import 'package:ScrumBooster/ScrumPhase/SprintPlanning/SprintPlanning.dart';

import 'dart:async';
import 'package:ScrumBooster/components/loading/loadingData.dart';

_SprintEvaluationState _sprintEvaluationState;
class SprintEvaluation extends StatefulWidget {
  final util = new Util();
  final SprintEvaluationApiProvider apiProvider;
  List<Widget> listView = [new Container(),];

  SprintEvaluationModel phaseDetailsDataJSON;
  var phaseCeremoniesDataJSON;
  var phaseProblemsDataJSON;

  SprintEvaluation({
    Key key,
    this.apiProvider,
  }) : super(key: key);

  @override
  _SprintEvaluationState createState() {
    _sprintEvaluationState = new _SprintEvaluationState();
    return _sprintEvaluationState;
  }
}

class _SprintEvaluationState extends State<SprintEvaluation> {
  final util = new Util();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  getScaffoldKey() {
    return scaffoldKey;
  }

  double loading = 0.0;
  int ceremoniesRowCount = 0;
  int problemsRowCount = 0;

  int ceremoniesCount;
  int problemsCount;

  Future<Null> refresh() async {
    await loadSprintEvaluation(true);
    return null;
  }

  Future<Null> loadSprintEvaluation(bool refresh) async {
    final sprintEvaluationApiProvider = widget.apiProvider == null
        ? new SprintEvaluationApiProvider()
        : widget.apiProvider;
    widget.listView = [];

    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    if (!refresh) {
      _sprintEvaluationState.setState(() {
        loading = _height;
      });
    }

    //Get Phase Details
    await sprintEvaluationApiProvider.fetchPosts();

    widget.phaseDetailsDataJSON = sprintEvaluationApiProvider.getModel();

    //Get Phase Ceremonies Details
    widget.phaseCeremoniesDataJSON = sprintEvaluationApiProvider.getCeremonyItemModel();
    _sprintEvaluationState.setState(() {
      ceremoniesCount = widget.phaseCeremoniesDataJSON.length;
    });

    //Get Phase Problems Details
    widget.phaseProblemsDataJSON = sprintEvaluationApiProvider.getProblemItemModel();
    _sprintEvaluationState.setState(() {
      problemsCount = widget.phaseProblemsDataJSON.length;
    });

    List<Widget> listView = widget.listView;
    widget.listView = [];

    listView.add(
      new Column(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.all(15.0),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new RawMaterialButton(
                key: new Key("button a"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductBacklog()
                    ),
                  );
                },
                shape: new CircleBorder(),
                elevation: 0,
                fillColor: util.hexToColor("#C4C4C4"),
                padding: const EdgeInsets.all(15.0),
              ),
              new RawMaterialButton(
                key: new Key("button b"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SprintPlanning()
                    ),
                  );
                },
                shape: new CircleBorder(),
                elevation: 0,
                fillColor: util.hexToColor("#C4C4C4"),
                padding: const EdgeInsets.all(15.0),
              ),
              new RawMaterialButton(
                key: new Key("button c"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SprintExecution()
                    ),
                  );
                },
                shape: new CircleBorder(),
                elevation: 0,
                fillColor: util.hexToColor("#C4C4C4"),
                padding: const EdgeInsets.all(15.0),
              ),
              new RawMaterialButton(
                key: new Key("button d"),
                shape: new CircleBorder(),
                elevation: 0,
                fillColor: util.hexToColor("#E74D3B"),
                padding: const EdgeInsets.all(15.0),
              )
            ],
          ),
          new Padding(
            padding: EdgeInsets.all(8.0),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new InkWell(
                child: new Icon(
                    Icons.arrow_back_ios,
                    key: new Key("left arrow"),
                ),
                onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder:
                        (context) => SprintExecution()
                    )
                )
                },
              ),
              new Padding(
                  padding: EdgeInsets.symmetric(horizontal: 23)
              ),
              new Text(
                "Sprint Evaluation".toUpperCase(),
                style: TextStyle(
                  fontSize: util.fitScreenSize(_height, 0.03),
                  fontWeight: FontWeight.bold,
                  color: util.hexToColor("#3498DB"),
                ),
                textAlign: TextAlign.center,
              ),
              new Padding(
                  padding: EdgeInsets.symmetric(horizontal: 23)
              ),
              new InkWell(
                child: new Icon(
                    Icons.arrow_forward_ios,
                    key: new Key("right arrow"),
                ),
                onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder:
                        (context) => ProductBacklog()
                    )
                )
                },
              ),
            ],
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

    listView.add(
      new Padding(
        padding: EdgeInsets.all(10.0),
      ),
    );

    //Adding ceremony items
    Function ceremoniesFunc = (String image, String title, String detail) =>
        Ceremonies(imagePath: image, title: title, contents: detail);
    Widget column = generateColumn(widget.phaseCeremoniesDataJSON, ceremoniesFunc, ceremoniesCount);
    listView.add(column);

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

    listView.add(
      new Padding(
        padding: EdgeInsets.all(10.0),
      ),
    );

    //Adding problem items
    Function problemsFunc = (String image, String title, String detail) =>
        ProblemsContentPage(imagePath: image, title: title, contents: detail);
    column = generateColumn(widget.phaseProblemsDataJSON, problemsFunc, problemsCount);
    listView.add(column);

    listView.add(
      new Padding(
        padding: EdgeInsets.all(25.0),
      ),
    );

    widget.listView.addAll(listView);

    _sprintEvaluationState.setState(() {
      loading = 0.0;
    });
  }

  Widget generateColumn(List<dynamic> json, Function className, int length) {
    List<Widget> columnWidgetList = [];
    List<Widget> rowWidgetList = [];
    Widget column = new Column(
      children: columnWidgetList,
    );
    Widget row = new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: rowWidgetList,
    );

    for (int i = 0; i < length; i++) {
      if (i % 3 == 0 && i > 0) {
        columnWidgetList.add(
            row
        );
        columnWidgetList.add(
          new Padding(
            padding: EdgeInsets.all(10.0),
          ),
        );
        rowWidgetList = [];
        row = new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: rowWidgetList,
        );
      }
      var data = json[i];
      rowWidgetList.add(
        new ScrumPhaseContentBtn(
          title: data.title,
          imageAssetURL: data.image,
          action: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => className(
                  data.image,
                  data.title,
                  data.detail,
                ),
              ),
            );
          },
        ),
      );
    }

    columnWidgetList.add(row);
    return column;
  }

  @override
  void didChangeDependencies() {
    if (widget.listView.length == 1) {
      loadSprintEvaluation(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        leading: new InkWell(
          child: new Icon(
            Icons.menu,
            color: util.hexToColor("#FFFFFF"),
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
            key: new Key("Loading Data"),
            height: loading,
          ),
        ],
      ),
    );
  }
}
