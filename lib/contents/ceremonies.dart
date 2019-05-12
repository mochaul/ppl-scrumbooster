import 'package:ScrumBooster/Utils/utils.dart';
import 'package:ScrumBooster/components/loading/loadingData.dart';
import 'package:flutter/material.dart';
import 'package:ScrumBooster/ScrumPhase/ProcessAreaCMMI/ApiProvider.dart';
import 'package:ScrumBooster/contents/cmmiPractices.dart';
import 'dart:async';

_CeremoniesState _ceremoniesState;
class Ceremonies extends StatefulWidget {
  final int id;
  final String title;
  final String imagePath;
  final String contents;
  final ProcessAreaCMMIFetcher processAreaApiProvider;
  final CMMIPracticesFetcher cmmiPracticesApiProvider;
  List<Widget> listView = [Container(),];

  final util = new Util();
  var cmmiPracticesByProcessArea;
  var processAreaByCeremony;

  Ceremonies({
    Key key,
    this.id,
    this.title,
    this.imagePath,
    this.contents,
    this.processAreaApiProvider,
    this.cmmiPracticesApiProvider
  }) : super(key: key);

  @override
  _CeremoniesState createState() {
    _ceremoniesState = new _CeremoniesState();
    return _ceremoniesState;
  }
}

class _CeremoniesState extends State<Ceremonies> {
  final util = new Util();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  getScaffoldKey() {
    return scaffoldKey;
  }

  double loading = 0.0;

  Future<Null> refresh() async {
    await loadContents(true);
    return null;
  }

  Future<Null> loadContents(bool refresh) async {
    final processAreaApiProvider = widget.processAreaApiProvider == null
      ? new ProcessAreaCMMIFetcher()
      : widget.processAreaApiProvider;

    widget.listView = [];
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    if (!refresh) {
      _ceremoniesState.setState(() {
        loading = _height;
      });
    }

    await processAreaApiProvider.fetchPosts(widget.id);
    widget.processAreaByCeremony = processAreaApiProvider.getProcessAreasByCeremony();

    final cmmiPracticesApiProvider = widget.cmmiPracticesApiProvider == null
      ? new CMMIPracticesFetcher(
          processAreasByCeremony: widget.processAreaByCeremony,
        )
      : widget.cmmiPracticesApiProvider;
    
    await cmmiPracticesApiProvider.fetchPosts();
    widget.cmmiPracticesByProcessArea = cmmiPracticesApiProvider.getCmmiPracticesByProcessArea();

    List<Widget> processAreasList = [];
    for (var data in widget.processAreaByCeremony) {
      processAreasList.add(
        new InkWell(
          onTap: () {
            executeCmmiPages(data.id, data.title);
          },
          child: Text(
            "- ${data.title}",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: util.hexToColor("#3498DB"),
            ),
          ),
        ),
      );
    }
    
    List<Widget> listView = widget.listView;
    widget.listView = [];

    listView.add(
      new Stack(
        children: <Widget>[
          new Container(
            width: _width,
            height: util.fitScreenSize(_height, 0.45),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  widget.imagePath,
                )
              )
            ),
          ),
          Column(
            children: <Widget>[
              new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    width: _width,
                    height: util.fitScreenSize(_height, 0.45),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: new Stack(
                      children: <Widget>[
                        new Align(
                          alignment: Alignment.bottomLeft,
                          child: new Padding(
                            padding: EdgeInsets.only(bottom: 30.0),
                            child: new Container(
                              alignment: Alignment.center,
                              height: util.fitScreenSize(_height, 0.08),
                              width: util.fitScreenSize(_width, 0.75),
                              child: new Text(
                                widget.title,
                                style:TextStyle(
                                  color:util.hexToColor("#3498DB"),
                                  fontWeight:FontWeight.bold,
                                  fontSize: util.fitScreenSize(_height, 0.03),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              decoration: new BoxDecoration(
                                  color: util.hexToColor("#FFFFFF"),
                                  boxShadow: <BoxShadow>[
                                    new BoxShadow(
                                      color: util.hexToColor("#000000"),
                                      offset: new Offset(15.0, 7.5),
                                      blurRadius: 50.0,
                                    )
                                  ]
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.only(
                      left: 15.0,
                      right: 15.0,
                      bottom: 10.0,
                    ),
                    child: new Container(
                      width: _width,
                      decoration: new BoxDecoration(
                        color: util.hexToColor("#FFFFFF"),
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: <BoxShadow>[
                          new BoxShadow(
                            color: util.hexToColor("#000000"),
                            offset: new Offset(10.0, 10.0),
                            blurRadius: 30.0,
                          )
                        ]
                      ),
                      child: new Padding(
                        padding: EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          bottom: 15.0,
                          top: 15.0,
                        ),
                        child: new Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              "${widget.contents}\n\nCMMI Practices that will enhanched this ceremony are:",
                              style:TextStyle(
                                fontSize: util.fitScreenSize(_height, 0.025),
                              )
                            ),
                            new Padding(
                              padding: EdgeInsets.all(10.0),
                            ),
                            new Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: processAreasList,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );

    widget.listView.addAll(listView);
    _ceremoniesState.setState(() {
      loading = 0.0;
    });
  }

  executeCmmiPages(int processAreaID, String processAreaTitle) {
    var cmmiPractices = widget.cmmiPracticesByProcessArea[processAreaID];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => CMMIPracticesPage(
          title: processAreaTitle,
          cmmiPractices: cmmiPractices,
        )
      )
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.listView.length == 1) {
      loadContents(false);
    }
  }


  @override
  Widget build(BuildContext context){
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: new InkWell(
          child: Icon(
            Icons.menu,
            color: util.hexToColor("#FFFFFF"),
          ),
          onTap: () {
            scaffoldKey.currentState.openDrawer();
          },
        ),
        centerTitle: true,
        title: Text(
          "SCRUM BOOSTER",
          style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold,
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
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          new Container(
            height: _height,
            child: new RefreshIndicator(
              child: new ListView(
                children: widget.listView,
              ),
              onRefresh: refresh,
            ),
          ),
          new LoadingData(
            key: Key("Loading data"),
            height: loading,
          ),
        ],
      ),
      drawer: util.defaultDrawer(context),
    );
  }
}