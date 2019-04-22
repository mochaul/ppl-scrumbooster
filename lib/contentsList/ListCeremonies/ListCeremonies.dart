import 'package:flutter/material.dart';
import 'package:ScrumBooster/Utils/utils.dart';
import 'package:ScrumBooster/contents/ceremonies.dart';

import 'package:ScrumBooster/contentsList/ListCeremonies/ApiProvider.dart';
import 'package:ScrumBooster/contentsList/ListCeremonies/Model.dart';

import 'dart:async';
import 'package:ScrumBooster/components/loading/loadingData.dart';

_ListCeremoniesState _listCeremoniesState;
class ListCeremonies extends StatefulWidget {

  final ListCeremoniesApiProvider apiProvider;
  final util = new Util();
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
  
  final scaffoldKey = GlobalKey<ScaffoldState>();
  getScaffoldKey() {
    return scaffoldKey;
  }

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
    widget.listCeremoniesDataAlphabeticJSON = listCeremoniesApiProvider.getDictCeremoniesAlphabetic();
    _listCeremoniesState.setState(() {
      contentCount = widget.listCeremoniesDataAlphabeticJSON.length;
    });

    List<Widget> listView = widget.listView;
    widget.listView = [];

    List<Widget> contentsList = [];

    for (String alphabet in widget.listCeremoniesDataAlphabeticJSON.keys) {
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
    if (widget.listView.length == 1) {
      loadListCeremonies(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: util.defaultDrawer(context),
      key: scaffoldKey,
      appBar: AppBar(
        leading: new InkWell(
          child: new Icon(
            Icons.menu,
            color: util.hexToColor("#FFFFFF"),
          ),
          onTap: () {
            scaffoldKey.currentState.openDrawer();
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
              onTap: () {},
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
