import 'package:flutter/material.dart';
import 'package:ScrumBooster/utils/utils.dart';

class GlossaryPage extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  getScaffoldKey() {
    return scaffoldKey;
  }

  var utils = new Util();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: new InkWell(
          child: new Icon(
            Icons.menu,
            color: utils.hexToColor("#FFFFFF"),
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
            color: utils.hexToColor("#FFFFFF"),
          ),
        ),
        actions: <Widget>[
          new Padding(
            padding: EdgeInsets.only(right: 6.0),
            child: new InkWell(
              child: new Icon(
                Icons.search,
                color: utils.hexToColor("#FFFFFF"),
              ),
              onTap: () => {},
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
            ),
            Text(
              "GLOSSARY",
              style: TextStyle(
                  fontSize: utils.fitScreenSize(_height, 0.04),
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            Image.asset(
              "assets/listGlossary/glossary.png",
              height: utils.fitScreenSize(_height, 0.3),
              width: utils.fitScreenSize(_width, 0.3),
            ),
            Container(
              padding: EdgeInsets.only(
                left: 20.0,
                top: 10.0,
                right: 20.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "A",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  new InkWell(
                    child: Text(
                      "A dummy 1",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                    ),
                    onTap: () {},
                  ),
                  new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  new InkWell(
                    child: Text(
                      "A dummy 2",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                    ),
                    onTap: () {},
                  ),
                  new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  new InkWell(
                    child: Text(
                      "A dummy 3",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                    ),
                    onTap: () {},
                  ),
                  new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  Text(
                    "B",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  new InkWell(
                    child: Text(
                      "B dummy 1",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                    ),
                    onTap: () {},
                  ),
                  new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  new InkWell(
                    child: Text(
                      "B dummy 2",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                    ),
                    onTap: () {},
                  ),
                  new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  new InkWell(
                    child: Text(
                      "B dummy 3",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                    ),
                    onTap: () {},
                  ),
                  new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  Text(
                    "C",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  new InkWell(
                    child: Text(
                      "C dummy 1",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                    ),
                    onTap: () {},
                  ),
                  new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  new InkWell(
                    child: Text(
                      "C dummy 2",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                    ),
                    onTap: () {},
                  ),
                  new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  new InkWell(
                    child: Text(
                      "C dummy 3",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                    ),
                    onTap: () {},
                  ),
                  new Divider(
                    color: utils.hexToColor("#000000"),
                  ),

                  Text(
                    "D",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  new InkWell(
                    child: Text(
                      "D dummy 1",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {},
                  ),
                  new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  new InkWell(
                    child: Text(
                      "D dummy 2",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {},
                  ),
                  new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  new InkWell(
                    child: Text(
                      "D dummy 3",
                      style: TextStyle(
                        fontSize: utils.fitScreenSize(_height, 0.03),
                        fontWeight: FontWeight.w500,
                        color: utils.hexToColor("#3498DB"),
                      ),
                      textAlign: TextAlign.start,
                    ),
                    onTap: () {},
                  ),
                  new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                ],
              ),
            )
          ],
        )
      ),
      drawer: utils.defaultDrawer(context),
    );
  }
}