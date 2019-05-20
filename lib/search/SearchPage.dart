import 'package:flutter/material.dart';
import 'package:ScrumBooster/Utils/utils.dart';
import 'package:ScrumBooster/InitialScreen/AboutPage.dart';
import 'package:ScrumBooster/InitialScreen/HomeScreen.dart';
import 'package:ScrumBooster/contentsList/ListCeremonies/ListCeremonies.dart';
import 'package:ScrumBooster/contentsList/ListGlossary/ListGlossary.dart';
import 'package:ScrumBooster/contentsList/ListProblems/ListProblems.dart';
import 'package:ScrumBooster/components/SearchResultCard.dart';
import 'package:ScrumBooster/search/ApiProvider.dart';
import 'package:ScrumBooster/search/Model.dart';

import 'dart:async';
import 'package:ScrumBooster/components/loading/loadingData.dart';

_SearchPageState _searchPageState;
class SearchPage extends StatefulWidget {
  final util = new Util();
  final SearchApiProvider apiProvider;

  bool firstBuild;
  var resultCeremonies;
  var resultProblems;
  var resultPhases;

  SearchResultModel problemDetailsDataJSON;
  SearchResultModel ceremonyDetailsDataJSON;
  SearchResultModel phaseDetailsDataJSON;
  var problemModels;
  var ceremonyModels;
  var phaseModels;

  List<Widget> listView = [new Container(),];

  List<Widget> searchResultProblems = new List<Widget>();
  List<Widget> searchResultCeremonies = new List<Widget>();
  List<Widget> searchResultPhases = new List<Widget>();

  SearchPage({
    Key key,
    this.apiProvider,
  }) : super(key: key);

  @override
  _SearchPageState createState() {
    _searchPageState = new _SearchPageState();
    firstBuild = true;
    return _searchPageState;
  }
}

class _SearchPageState extends State<SearchPage> {
  final util = new Util();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  getScaffoldKey() {
    return scaffoldKey;
  }

  double loading = 0.0;
  int ceremoniesCount;
  int problemsCount;
  int phasesCount;

  String searchQuery;

  Future<Null> refresh() async {
    await search(searchQuery, true);
    return null;
  }

  Future<Null> search(String query, bool refresh) async {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    widget.searchResultCeremonies = new List<Widget>();
    widget.searchResultPhases = new List<Widget>();
    widget.searchResultProblems = new List<Widget>();

    searchQuery = query;
    print("query: $searchQuery");

    final searchPageApiProvider = widget.apiProvider == null
      ? new SearchApiProvider(query: searchQuery)
      : widget.apiProvider;

    if (!refresh) {
      _searchPageState.setState(() {
        loading = _height;
      });
    }

    await searchPageApiProvider.fetchSearchResults();
    //Get Models
    widget.problemDetailsDataJSON = searchPageApiProvider.getProblemsModel();
    widget.ceremonyDetailsDataJSON = searchPageApiProvider.getCeremoniesModel();
    widget.phaseDetailsDataJSON = searchPageApiProvider.getProblemsModel();

    //Get List of Individual Models (Problem, Ceremony, Phase)
    widget.problemModels = searchPageApiProvider.getProblemItemSearchResults();
    widget.ceremonyModels = searchPageApiProvider.getCeremonyItemSearchResults();
    widget.phaseModels = searchPageApiProvider.getPhaseItemSearchResults();

    _searchPageState.setState(() {
      problemsCount = widget.problemModels.length;
      ceremoniesCount = widget.ceremonyModels.length;
      phasesCount = widget.phaseModels.length;
    });

    List<Widget> listView = widget.listView;
    widget.listView = [];

    List<Widget> problemsList = [];
    List<Widget> ceremonyList = [];
    List<Widget> phaseList = [];

    if (widget.problemModels.length != 0 || widget.ceremonyModels.length != 0) {
      listView.add(
        new Padding(
          padding: EdgeInsets.only(
            top: 15.0,
            left: 10.0,
            right: 6.0,
            bottom: 10.0,
          ),
          child: new Text(
            "Maybe this is what you looking for:",
            style: TextStyle(
              color: util.hexToColor("#000000"),
              fontSize: 25.0,
            ),
          ),
        ),
      );

      //Adding Problem Items
      for (ProblemItem data in widget.problemModels) {
        problemsList.add(
          SearchResultCard(
            id: data.id,
            title: data.title,
            detail: data.detail,
            imageURL: data.image,
            canBeSolvedUsing: data.canBeSolvedUsing,
            contentType: "Problems",
          )
        );
      }

      //Adding Ceremony Items
      for (CeremonyItem data in widget.ceremonyModels) {
        ceremonyList.add(
          SearchResultCard(
            id: data.id,
            title: data.title,
            detail: data.detail,
            imageURL: data.image,
            contentType: "Ceremonies",
          )
        );
      }
    } else {
      print("empty!");
      listView = [
        Container(
          height: util.fitScreenSize(_height, 0.9),
          width: util.fitScreenSize(_width, 0.6),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Oops, we can't find your desired item!\nTry searching again.",
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ];
    }

    listView.addAll(problemsList);
    listView.addAll(ceremonyList);
    widget.listView.addAll(listView);

    _searchPageState.setState(() {
      loading = 0.0;
    });

    return null;
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: new Container(
          height: 45.0,
          width: util.fitScreenSize(_width, 0.9),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: util.hexToColor("#FFFFFF")
          ),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                child: Container(
                  height: 45.0,
                  width: 25.0,
                  padding: EdgeInsets.only(left: 5.0, right: 5.0),
                  child: InkWell(
                    child: Icon(
                      Icons.arrow_back,
                      color: util.hexToColor("#000000"),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Container(
                width: util.fitScreenSize(_width, 0.78),
                height: 50.0,
                color: util.hexToColor("#FFFFFF"),
                child: TextFormField(
                  key: new Key("Search Field"),
                  autocorrect: false,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search...",
                    hintStyle: TextStyle(
                      color: util.hexToColor("#CCCCCC"),
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 17.5,
                    color: util.hexToColor("#000000")
                  ),
                  maxLines: 1,
                  onFieldSubmitted: (String query) {
                    search(query, false);
                  },
                ),
              ),
            ],
          ),
        ),
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
            key: Key("Searching..."),
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