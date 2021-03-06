import 'package:ScrumBooster/InitialScreen/AboutPage.dart';
import 'package:ScrumBooster/InitialScreen/HomeScreen.dart';
import 'package:ScrumBooster/contentsList/ListGlossary/ListGlossary.dart';
import 'package:ScrumBooster/contentsList/ListProblems/ListProblems.dart';
import 'package:flutter/material.dart';
import 'package:ScrumBooster/Utils/utils.dart';
import 'package:ScrumBooster/contents/ceremonies.dart';

import 'package:ScrumBooster/contentsList/ListCeremonies/ApiProvider.dart';
import 'package:ScrumBooster/contentsList/ListCeremonies/Model.dart';

import 'dart:async';
import 'package:ScrumBooster/components/loading/loadingData.dart';
import 'package:ScrumBooster/search/SearchPage.dart';

_ListCeremoniesState _listCeremoniesState;
class ListCeremonies extends StatefulWidget {

  final ListCeremoniesApiProvider apiProvider;
  final util = new Util();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  getScaffoldKey() {
    return scaffoldKey;
  }

  List<Widget> listView = [new Container(),];

  ListCeremoniesModel listCeremoniesModel;
  Map<String, dynamic> listCeremoniesDataAlphabeticJSON;
  
  ListCeremonies({
    Key key,
    this.apiProvider,
  }) : super(key: key);
  
  @override
  _ListCeremoniesState createState() {
    _listCeremoniesState = new _ListCeremoniesState();
    return _listCeremoniesState;
  }
}

class _ListCeremoniesState extends State<ListCeremonies> {

  final util = new Util();

  double loading = 0.0;
  int contentCount;

  Future<Null> refresh() async {
    await loadListCeremonies(true);
    return null;
  }

  Future<Null> loadListCeremonies(bool refresh) async {
    final listCeremoniesApiProvider = widget.apiProvider == null
      ? new ListCeremoniesApiProvider()
      : widget.apiProvider;
    widget.listView = [];

    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    if (!refresh) {
      _listCeremoniesState.setState(() {
        loading = _height;
      });
    }

    //Fetch details from API
    await listCeremoniesApiProvider.fetchPosts();

    widget.listCeremoniesModel = listCeremoniesApiProvider.getModel();

    //Get Details
    widget.listCeremoniesDataAlphabeticJSON = listCeremoniesApiProvider.getDictProblemsAlphabetic();
    _listCeremoniesState.setState(() {
      contentCount = widget.listCeremoniesDataAlphabeticJSON.length;
    });

    List<Widget> listView = widget.listView;
    widget.listView = [];

    List<Widget> contentsList = [];

    for (String alphabet in widget.listCeremoniesDataAlphabeticJSON.keys) {
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
      for (CeremonyItem data in widget.listCeremoniesDataAlphabeticJSON[alphabet]) {
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
                  builder: (context) => Ceremonies(
                   id: data.id,
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
            "CEREMONIES",
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
            "assets/listCeremonies/ceremonies.png",
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

    _listCeremoniesState.setState(() {
      loading = 0.0;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.listView.length == 1) {
      loadListCeremonies(false);
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
