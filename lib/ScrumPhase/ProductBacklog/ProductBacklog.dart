import 'package:flutter/material.dart';
import 'package:ScrumBooster/Utils/utils.dart';
import 'package:ScrumBooster/InitialScreen/AboutPage.dart';
import 'package:ScrumBooster/components/transitions/SlideRightRoute.dart';
import 'package:ScrumBooster/contentsList/ListCeremonies/ListCeremonies.dart';
import 'package:ScrumBooster/contentsList/ListGlossary/ListGlossary.dart';
import 'package:ScrumBooster/contentsList/ListProblems/ListProblems.dart';
import 'package:ScrumBooster/contents/ceremonies.dart';
import 'package:ScrumBooster/contents/Problems/problems.dart';
import 'package:ScrumBooster/components/ScrumPhaseContentBtn.dart';
import 'package:ScrumBooster/ScrumPhase/ProductBacklog/ApiProvider.dart';
import 'package:ScrumBooster/ScrumPhase/ProductBacklog/Model.dart';
import 'package:ScrumBooster/ScrumPhase/SprintEvaluation/SprintEvaluation.dart';
import 'package:ScrumBooster/ScrumPhase/SprintExecution/SprintExecution.dart';
import 'package:ScrumBooster/ScrumPhase/SprintPlanning/SprintPlanning.dart';

import 'dart:async';
import 'package:ScrumBooster/components/loading/loadingData.dart';
import 'package:ScrumBooster/search/SearchPage.dart';

_ProductBacklogState _productBacklogState;
class ProductBacklog extends StatefulWidget {
  final ProductBacklogApiProvider apiProvider;
  final util = new Util();
  List<Widget> listView = [new Container(),];
  ProductBacklogModel phaseDetailsDataJSON;

  var phaseCeremoniesDataJSON;
  var phaseProblemsDataJSON;

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  getScaffoldKey() {
    return scaffoldKey;
  }

  ProductBacklog({
    Key key,
    this.apiProvider,
  }) : super(key: key);

  @override
  _ProductBacklogState createState() {
    _productBacklogState = new _ProductBacklogState();
    return _productBacklogState;
  }
}

class _ProductBacklogState extends State<ProductBacklog> {
  final util = new Util();

  double loading = 0.0;
  int ceremoniesRowCount = 0;
  int problemsRowCount = 0;

  int ceremoniesCount;
  int problemsCount;

  Future<Null> refresh() async {
    await loadProductBacklog(true);
    return null;
  }

  Future<Null> loadProductBacklog(bool refresh) async {
    final productBacklogApiProvider = widget.apiProvider == null
        ? new ProductBacklogApiProvider()
        : widget.apiProvider;
    widget.listView = [];

    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    if (!refresh) {
      _productBacklogState.setState(() {
        loading = _height;
      });
    }

    //Get Phase Details
    await productBacklogApiProvider.fetchPosts();

    widget.phaseDetailsDataJSON = productBacklogApiProvider.getModel();

    //Get Phase Ceremonies Details
    widget.phaseCeremoniesDataJSON = productBacklogApiProvider.getCeremonyItemModel();
    _productBacklogState.setState(() {
      ceremoniesCount = widget.phaseCeremoniesDataJSON.length;
    });

    //Get Phase Problems Details
    widget.phaseProblemsDataJSON = productBacklogApiProvider.getProblemItemModel();
    _productBacklogState.setState(() {
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
                shape: new CircleBorder(),
                elevation: 0,
                fillColor: util.hexToColor("#E74D3B"),
                padding: const EdgeInsets.all(15.0),
                onPressed: () {},
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
                onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SprintEvaluation()
                  ),
                );},
                shape: new CircleBorder(),
                elevation: 0,
                fillColor: util.hexToColor("#C4C4C4"),
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
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      new CustomRoute(
                          builder: (context) => SprintEvaluation()
                      )
                  );
                },
              ),
              new Padding(
                  padding: EdgeInsets.symmetric(horizontal: 23)
              ),
              new Text(
                "Product Backlog".toUpperCase(),
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
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    new CustomRoute(
                      builder: (context) => SprintPlanning()
                    )
                  );
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
    Function ceremoniesFunc = (int id, String image, String title, String detail) =>
      Ceremonies(
        id: id,
        imagePath: image,
        title: title,
        contents: detail,
      );
    Widget column = generateColumn(
      widget.phaseCeremoniesDataJSON,
      ceremoniesFunc,
      ceremoniesCount,
    );
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
    Function problemsFunc = (int id, String title, String image, String detail, List<dynamic> canBeSolvedUsing) =>
      ProblemsContentPage(
        id: id,
        title: title,
        imagePath: image,
        contents: detail,
        canBeSolvedUsing: canBeSolvedUsing,
      );
    column = generateColumn(widget.phaseProblemsDataJSON, problemsFunc, problemsCount);
    listView.add(column);

    listView.add(
      new Padding(
        padding: EdgeInsets.all(25.0),
      ),
    );

    widget.listView.addAll(listView);

    _productBacklogState.setState(() {
      loading = 0.0;
    });
  }

  Widget generateColumn(List<dynamic> json, Function className, int length) {
    List<Widget> columnWidgetList = [];
    List<Widget> rowWidgetList = [];

    print("class name: ${className.toString()}");

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
            switch (className.toString()) {
              case "Closure: (int, String, String, String) => Ceremonies":
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => className(
                      data.id,
                      data.image,
                      data.title,
                      data.detail,
                    ),
                  ),
                );
                break;
              case "Closure: (int, String, String, String, List<dynamic>) => ProblemsContentPage":
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => className(
                      data.id,
                      data.title,
                      data.image,
                      data.detail,
                      data.canBeSolvedUsing,
                    ),
                  ),
                );
                break;
            }
          },
        ),
      );
    }

    columnWidgetList.add(row);
    return column;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.listView.length == 1) {
      loadProductBacklog(false);
    }
  }

  @override
  Widget build(BuildContext context) {
     void _searchpage() {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SearchPage()
        ),
      );
    }
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
              onTap: _searchpage,
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new DrawerHeader(
              child: Center(
                child: new Image.asset(
                  "assets/logos/logo-color.png",
                ),
              ),
            ),
            ListTile(
              key: new Key("Home"),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Icon(
                    Icons.home,
                    color: util.hexToColor("#979797"),
                  ),
                  new Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  new Text(
                    "Home",
                    style: TextStyle(
                      color: util.hexToColor("#979797"),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/Home');
              },
            ),
            ListTile(
              key: new Key("Ceremonies"),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Icon(
                    Icons.graphic_eq,
                    color: util.hexToColor("#979797"),
                  ),
                  new Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  new Text(
                    "Ceremonies",
                    style: TextStyle(
                      color: util.hexToColor("#979797"),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).popUntil(ModalRoute.withName('/Home'));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListCeremonies(),
                  ),
                );
              },
              //TODO: Implement fungsi buat callback kalo mencet Ceremonies di drawer
            ),
            ListTile(
              key: new Key("Problems"),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Icon(
                    Icons.warning,
                    color: util.hexToColor("#979797"),
                  ),
                  new Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  new Text(
                    "Problems",
                    style: TextStyle(
                      color: util.hexToColor("#979797"),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).popUntil(ModalRoute.withName('/Home'));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListProblems()
                  ),
                );
              },
            ),
            ListTile(
              key: new Key("Glossary"),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Icon(
                    Icons.book,
                    color: util.hexToColor("#979797"),
                  ),
                  new Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  new Text(
                    "Glossary",
                    style: TextStyle(
                      color: util.hexToColor("#979797"),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).popUntil(ModalRoute.withName('/Home'));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ListGlossary()
                  ),
                );
              }, //TODO: Implement fungsi buat callback kalo mencet Glossary di drawer
            ),
            ListTile(
              key: new Key("About"),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Icon(
                    Icons.info,
                    color: util.hexToColor("#979797"),
                  ),
                  new Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  new Text(
                    "About",
                    style: TextStyle(
                      color: util.hexToColor("#979797"),
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AboutPage()
                  ),
                );
              }, //TODO: Implement fungsi buat callback kalo mencet About di drawer
            ),
          ],
        ),
      ),
    );
  }
}