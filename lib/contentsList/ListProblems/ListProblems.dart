import 'package:flutter/material.dart';
import 'package:ScrumBooster/Utils/utils.dart';
import 'package:ScrumBooster/contents/Problems/problems.dart';

import 'package:ScrumBooster/contentsList/ListProblems/ApiProvider.dart';
import 'package:ScrumBooster/contentsList/ListProblems/Model.dart';

import 'dart:async';
import 'package:ScrumBooster/components/loading/loadingData.dart';
import 'package:ScrumBooster/search/SearchPage.dart';

_ListProblemsState _listProblemsState;
class ListProblems extends StatefulWidget {

  final ListProblemsApiProvider apiProvider;
  final util = new Util();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  getScaffoldKey() {
    return scaffoldKey;
  }

  List<Widget> listView = [new Container(),];

  ListProblemsModel listProblemsModel;
  Map<String, dynamic> listProblemsDataAlphabeticJSON;

  ListProblems({
    Key key,
    this.apiProvider,
  }) : super(key: key);

  @override
  _ListProblemsState createState() {
    _listProblemsState = new _ListProblemsState();
    return _listProblemsState;
  }
}

class _ListProblemsState extends State<ListProblems> {

  final util = new Util();

  double loading = 0.0;
  int contentCount;

  Future<Null> refresh() async {
    await loadListProblems(true);
    return null;
  }

  Future<Null> loadListProblems(bool refresh) async {
    final listProblemsApiProvider = widget.apiProvider == null
        ? new ListProblemsApiProvider()
        : widget.apiProvider;
    widget.listView = [];

    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    if (!refresh) {
      _listProblemsState.setState(() {
        loading = _height;
      });
    }

    //Fetch details from API
    await listProblemsApiProvider.fetchPosts();

    widget.listProblemsModel = listProblemsApiProvider.getModel();

    //Get Details
    widget.listProblemsDataAlphabeticJSON = listProblemsApiProvider.getDictProblemsAlphabetic();
    _listProblemsState.setState(() {
      contentCount = widget.listProblemsDataAlphabeticJSON.length;
    });

    List<Widget> listView = widget.listView;
    widget.listView = [];

    List<Widget> contentsList = [];

    for (String alphabet in widget.listProblemsDataAlphabeticJSON.keys) {
      print(alphabet);
      contentsList.add(
        Text(
          alphabet.toUpperCase(),
          style: TextStyle(
            fontSize: util.fitScreenSize(_height, 0.06),
            fontWeight: FontWeight.w500,
          ),
        ),
      );
      contentsList.add(
        Divider(
          color: util.hexToColor("#000000"),
          height: 10.0,
        ),
      );
      for (ProblemItem data in widget.listProblemsDataAlphabeticJSON[alphabet]) {
        contentsList.add(
          new InkWell(
            child: Container(
              width: util.fitScreenSize(_width, 0.8),
              child: Text(
                data.title,
                style: TextStyle(
                  fontSize: util.fitScreenSize(_height, 0.03),
                  fontWeight: FontWeight.w500,
                  color: util.hexToColor("#3498DB"),
                ),
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                  new MaterialPageRoute(
                      builder: (context) => ProblemsContentPage(
                        imagePath: data.image,
                        title: data.title,
                        contents: data.detail,
                      )
                  )
              );
            },
          ),
        );
        contentsList.add(
          Divider(
            color: util.hexToColor("#000000"),
            height: 10.0,
          ),
        );
      }
    }

    listView.add(
      new Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          Text(
            "PROBLEMS",
            style: TextStyle(
              fontSize: util.fitScreenSize(_height, 0.04),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          new Padding(
            padding: EdgeInsets.all(15.0),
          ),
          Image.asset(
            "assets/listProblems/problems.png",
            height: util.fitScreenSize(_height, 0.3),
            width: util.fitScreenSize(_width, 0.3),
          ),
          new Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: contentsList,
            ),
          ),
        ],
      ),
    );

    widget.listView.addAll(listView);

    _listProblemsState.setState(() {
      loading = 0.0;
    });
  }

  @override
  void didChangeDependencies() {
    if (widget.listView.length == 1) {
      loadListProblems(false);
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
      drawer: util.defaultDrawer(context),
      key: widget.scaffoldKey,
      appBar: AppBar(
        leading: new InkWell(
          child: new Icon(
            Icons.menu,
            color: util.hexToColor("#FFFFFF"),
          ),
          onTap: () {
            widget.scaffoldKey.currentState.openDrawer();
          },
        ),
        centerTitle: true,
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
            key: Key("Loading Data"),
            height: loading,
          ),
        ],
      ),
    );
  }
}
