import 'package:flutter/material.dart';
import 'package:ScrumBooster/Utils/utils.dart';
import 'package:ScrumBooster/contents/ceremonies.dart';
import 'package:ScrumBooster/contents/problems.dart';
import 'package:ScrumBooster/components/ScrumPhaseContentBtn.dart';
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
  var focusNode = new FocusNode();

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

    listView.add(
      new Padding(
        padding: EdgeInsets.only(
          top: 15.0,
          left: 6.0,
          right: 6.0,
          bottom: 10.0,
        ),
        child: new Text(
          "Maybe this is what you looking for:",
          style: TextStyle(
            color: util.hexToColor("#000000"),
            fontSize: 15.0,
          ),
        ),
      ),
    );

    //Adding Problem Items
    for (ProblemItem data in widget.problemModels) {
      problemsList.add(
        new Container(
          width: util.fitScreenSize(_width, 0.7),
          height: util.fitScreenSize(_width, 0.4),
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0, right: 10.0, left: 10.0),
          child: new InkWell(
            onTap: () {},
            child: new Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: util.hexToColor("#FFFFFF"),
                boxShadow: <BoxShadow>[
                  new BoxShadow(
                    color: util.hexToColor("#000000"),
                    offset: new Offset(0, 0.0),
                    blurRadius: 20.0,
                  ),
                ],
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //Picture
                    Container(
                      height: util.fitScreenSize(_width, 0.23),
                      width: util.fitScreenSize(_width, 0.23),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        image: DecorationImage(
                          image: NetworkImage(
                            data.image,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    new Padding(
                      padding: EdgeInsets.all(3.0),
                    ),
                    //Content
                    new Column(
                      children: <Widget>[
                        new Container(
                          height: util.fitScreenSize(_height, 0.1),
                          width: util.fitScreenSize(_width, 0.6),
                          child: Center(
                            child: Text(
                              data.title,
                              style: TextStyle(
                                color: util.hexToColor("#000000"),
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                        new Padding(padding: EdgeInsets.all(1.0)),
                        new InkWell(
                          child: Text("Testes"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    listView.addAll(problemsList);
    widget.listView.addAll(listView);

    _searchPageState.setState(() {
      loading = 0.0;
    });

    return null;
  }

  @override
  void didChangeDependencies() {
    if (widget.listView.length == 1) {
      search(searchQuery, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: util.defaultDrawer(context),
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
                height: 45.0,
                color: util.hexToColor("#FFFFFF"),
                child: TextFormField(
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
            key: Key("Loading Data"),
            height: loading,
          ),
        ],
      ),
    );
  }
}
