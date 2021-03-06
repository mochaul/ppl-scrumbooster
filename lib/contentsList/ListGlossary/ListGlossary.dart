import 'package:ScrumBooster/InitialScreen/AboutPage.dart';
import 'package:ScrumBooster/InitialScreen/HomeScreen.dart';
import 'package:ScrumBooster/contentsList/ListCeremonies/ListCeremonies.dart';
import 'package:ScrumBooster/contentsList/ListProblems/ListProblems.dart';
import 'package:ScrumBooster/search/SearchPage.dart';
import 'package:flutter/material.dart';
import 'package:ScrumBooster/Utils/utils.dart';
import 'package:ScrumBooster/contents/glossary.dart';

import 'package:ScrumBooster/contentsList/ListGlossary/ApiProvider.dart';
import 'package:ScrumBooster/contentsList/ListGlossary/Model.dart';

import 'dart:async';
import 'package:ScrumBooster/components/loading/loadingData.dart';

_ListGlossaryState _listGlossaryState;
class ListGlossary extends StatefulWidget {

  final ListGlossaryApiProvider apiProvider;
  final util = new Util();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  getScaffoldKey() {
    return scaffoldKey;
  }

  List<Widget> listView = [new Container(),];

  ListGlossaryModel listGlossaryModel;
  Map<String, dynamic> listGlossaryDataAlphabeticJSON;
  
  ListGlossary({
    Key key,
    this.apiProvider,
  }) : super(key: key);
  
  @override
  _ListGlossaryState createState() {
    _listGlossaryState = new _ListGlossaryState();
    return _listGlossaryState;
  }
}

class _ListGlossaryState extends State<ListGlossary> {

  final util = new Util();

  double loading = 0.0;
  int contentCount;

  Future<Null> refresh() async {
    await loadListGlossary(true);
    return null;
  }

  Future<Null> loadListGlossary(bool refresh) async {
    final listGlosaryApiProvider = widget.apiProvider == null
      ? new ListGlossaryApiProvider()
      : widget.apiProvider;
    widget.listView = [];

    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    if (!refresh) {
      _listGlossaryState.setState(() {
        loading = _height;
      });
    }

    //Fetch details from API
    await listGlosaryApiProvider.fetchPosts();

    widget.listGlossaryModel = listGlosaryApiProvider.getModel();

    //Get Details
    widget.listGlossaryDataAlphabeticJSON = listGlosaryApiProvider.getDictGlossaryAlphabetic();
    _listGlossaryState.setState(() {
      contentCount = widget.listGlossaryDataAlphabeticJSON.length;
    });

    List<Widget> listView = widget.listView;
    widget.listView = [];

    List<Widget> contentsList = [];

    for (String alphabet in widget.listGlossaryDataAlphabeticJSON.keys) {
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
      for (GlossaryItem data in widget.listGlossaryDataAlphabeticJSON[alphabet]) {
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
                  builder: (context) => Glossary(
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
            "GLOSSARY",
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
            "assets/listGlossary/glossary.png",
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

    _listGlossaryState.setState(() {
      loading = 0.0;
    });
  }

  @override
  void didChangeDependencies() {
    if (widget.listView.length == 1) {
      loadListGlossary(false);
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
