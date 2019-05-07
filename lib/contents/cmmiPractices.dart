import 'package:flutter/material.dart';
import 'package:ScrumBooster/Utils/utils.dart';
import 'package:ScrumBooster/ScrumPhase/ProcessAreaCMMI/Model.dart';
import 'package:ScrumBooster/components/cmmiPracticesDropdown.dart';

class CMMIPracticesPage extends StatelessWidget {
  final String title;
  final List<CMMIPractices> cmmiPractices;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  getScaffoldKey() {
    return scaffoldKey;
  }

  CMMIPracticesPage({
    Key key,
    this.title,
    this.cmmiPractices,
  }) : super(key: key);

  final util = new Util();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    List<Widget> mainWidgets = [
      Text(
        "CMMI Practices",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.5,
            color: util.hexToColor("#000000")
        ),
        textAlign: TextAlign.center,
      ),
      new Padding(
        padding: EdgeInsets.all(10.0),
      ),
    ];

    for (CMMIPractices data in this.cmmiPractices) {
      mainWidgets.add(
        CmmiPracticesDropdown(
          id: data.id,
          title: data.title,
          strengthens: data.strengthens,
          satisfy: data.satisfy,
          demonstrated: data.demonstrated,
        ),
      );
      mainWidgets.add(
        new Padding(
          padding: EdgeInsets.all(10.0),
        ),
      );
    }

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
          "Scrum Booster".toUpperCase(),
          style: TextStyle(
            color: util.hexToColor("#FFFFFF"),
            fontWeight: FontWeight.bold,
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
      drawer: util.defaultDrawer(context),
      body: Stack(
        key: new Key("Main Stack"),
        children: <Widget>[
          new Container(
            key: new Key("Problems Content Image"),
            width: _width,
            height: util.fitScreenSize(_height, 0.45),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRTT3t3Uf-5Axs6lmkoRnVD3xOSuCRmi4hjk_VPVODLQ2AaC0py"
                ),
              ),
            ),
          ),
          ListView(
            key: new Key("CMMI Contents"),
            children: <Widget>[
              new Column(
                key: new Key("Problems Content Column"),
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    key: new Key("Problems Title Container"),
                    width: _width,
                    height: util.fitScreenSize(_height, 0.45),
                    decoration: BoxDecoration(
                        color: Colors.transparent
                    ),
                    child: new Stack(
                      key: new Key("Problems Title Stack"),
                      children: <Widget>[
                        new Align(
                          alignment: Alignment.bottomLeft,
                          child: new Padding(
                            padding: EdgeInsets.only(bottom: 30.0),
                            child: new Container(
                              key: new Key("Problems Title Container"),
                              alignment: Alignment.center,
                              height: util.fitScreenSize(_height, 0.08),
                              width: util.fitScreenSize(_width, 0.75),
                              child: new Text(
                                this.title,
                                key: new Key("Problems Title"),
                                style: TextStyle(
                                  color: util.hexToColor("#3498DB"),
                                  fontWeight: FontWeight.bold,
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
                        ),
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
                      key: new Key("Problems Content Container"),
//                      width: _width,
//                      height: util.fitScreenSize(_height, 3.2),
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
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: mainWidgets,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
