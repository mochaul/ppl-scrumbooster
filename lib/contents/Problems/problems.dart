import 'package:flutter/material.dart';
import 'package:ScrumBooster/Utils/utils.dart';
import 'package:ScrumBooster/components/loading/loadingData.dart';
import 'package:ScrumBooster/contentsList/ListCeremonies/Model.dart';
import 'package:ScrumBooster/contents/Problems/ApiProvider.dart';
import 'dart:async';

_ProblemsContentPageState _problemsContentPageState;
class ProblemsContentPage extends StatefulWidget {
  final int id;
  final String title;
  final String imagePath;
  final String contents;
  final List<dynamic> canBeSolvedBy;
  final ProblemsDetailPageApiProvider apiProvider;
  List<Widget> listView = [Container(),];

  final util = new Util();
  var ceremoniesByProblem;

  ProblemsContentPage({
    Key key,
    this.id,
    this.title,
    this.imagePath,
    this.contents,
    this.canBeSolvedBy,
    this.apiProvider,
  }) : super(key: key);

  @override
  _ProblemsContentPageState createState() {
    _problemsContentPageState = new _ProblemsContentPageState();
    return _problemsContentPageState;
  }
}

class _ProblemsContentPageState extends State<ProblemsContentPage> {
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
    final contentPageApiProvider = widget.apiProvider == null
      ? new ProblemsDetailPageApiProvider()
      : widget.apiProvider;
    widget.listView = [];
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    if (!refresh) {
      _problemsContentPageState.setState(() {
        loading = _height;
      });
    }

    await contentPageApiProvider.getCeremoniesByProblemsList(widget.canBeSolvedBy);
    widget.ceremoniesByProblem = contentPageApiProvider.listCeremoniesByProblem;

    List<Widget> ceremoniesList = [];
    for (var data in widget.ceremoniesByProblem) {
      ceremoniesList.add(
        new InkWell(
          onTap: () {},
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
                                "${widget.contents}\n\nScrum ceremonies that can help you with this problem are:",
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
                              children: ceremoniesList,
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
    _problemsContentPageState.setState(() {
      loading = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


