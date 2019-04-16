import 'package:flutter/material.dart';
import 'package:ScrumBooster/Utils/utils.dart';
import 'package:ScrumBooster/contents/ceremonies.dart';
import 'package:ScrumBooster/contents/problems.dart';
import 'package:ScrumBooster/components/ScrumPhaseContentBtn.dart';
import 'package:ScrumBooster/ScrumPhase/SprintExecution/ApiProvider.dart';
import 'package:ScrumBooster/ScrumPhase/SprintExecution/Model.dart';

import 'dart:async';
import 'package:ScrumBooster/components/loading/loadingData.dart';

_SprintExecutionState _sprintExecutionState;
class SprintExecution extends StatefulWidget {

  final SprintExecutionApiProvider apiProvider;
  final util = new Util();
  List<Widget> listView = [new Container(),];

  SprintExecutionModel phaseDetailsDataJSON;
  var phaseCeremoniesDataJSON;
  var phaseProblemsDataJSON;

  SprintExecution({
    Key key,
    this.apiProvider,
  }) : super(key: key);

  @override
  _SprintExecutionState createState() {
    _sprintExecutionState = new _SprintExecutionState();
    return _sprintExecutionState;
  }
}

class _SprintExecutionState extends State<SprintExecution> {

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
    await loadSprintExecution(true);
    return null;
  }

  Future<Null> loadSprintExecution(bool refresh) async {
    final sprintExecutionApiProvider = widget.apiProvider == null
        ? new SprintExecutionApiProvider()
        : widget.apiProvider;
    widget.listView = [];

    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    if (!refresh) {
      _sprintExecutionState.setState(() {
        loading = _height;
      });
    }

    //Get Phase Details
    await sprintExecutionApiProvider.fetchPosts();

    widget.phaseDetailsDataJSON = sprintExecutionApiProvider.getModel();

    //Get Phase Ceremonies Details
    widget.phaseCeremoniesDataJSON = sprintExecutionApiProvider.getCeremonyItemModel();
    _sprintExecutionState.setState(() {
      ceremoniesCount = widget.phaseCeremoniesDataJSON.length;
    });

    //Get Phase Problems Details
    widget.phaseProblemsDataJSON = sprintExecutionApiProvider.getProblemItemModel();
    _sprintExecutionState.setState(() {
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
          new Text(
            "Sprint Execution".toUpperCase(),
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

    _sprintExecutionState.setState(() {
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
      loadSprintExecution(false);
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