import 'package:flutter/material.dart';
import 'package:ScrumBooster/Utils/utils.dart';

class ListCeremonies extends StatelessWidget {
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
      drawer: utils.defaultDrawer(context),
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
              onTap: () {},
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
              "CEREMONIES",
              style: TextStyle(
                fontSize: utils.fitScreenSize(_height, 0.04),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            new Padding(
              padding: EdgeInsets.all(15.0),
            ),
            Image.asset(
              "assets/listCeremonies/ceremonies.png",
              height: utils.fitScreenSize(_height, 0.3),
              width: utils.fitScreenSize(_width, 0.3),
            ),
            Container(
              padding: EdgeInsets.all(20),
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
                      "Backlog Grooming",
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
                      "Continuous Build / Integration",
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
                      "Daily Standup / Daily Scrum",
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
                        "Definition of Done",
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
                    "E",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  new InkWell(
                    child: Text(
                      "Epics",
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
                    "F",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                   Text(
                    "G",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                   Text(
                    "H",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                   Text(
                    "I",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                   Text(
                    "J",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                   Text(
                    "K",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  Text(
                    "L",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                   Text(
                    "M",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                   Text(
                    "N",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  Text(
                    "O",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  Text(
                    "P",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  new InkWell(
                    child: Text(
                      "Product Backlog",
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
                   Text(
                    "Q",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                  Text(
                    "R",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  new InkWell(
                    child: Text(
                      "Refactoring",
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
                      "Release Burn-Down Chart",
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
                      "Release Planning",
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
                   Text(
                    "S",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  new InkWell(
                    child: Text(
                      "Sprint / Iteration",
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
                      "Sprint Burn-Down Chart",
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
                      "Sprint Demo / Sprint Review",
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
                      "Sprint Planning",
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
                  Text(
                    "T",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                   new InkWell(
                    child: Text(
                      "Team Agreements",
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
                      "Team Estimating Game (Fibonacci Game) & Planning Poker",
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
                      "Technical Debt",
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
                      "Test Driven Development",
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
                  Text(
                    "U",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                   new InkWell(
                    child: Text(
                      "User Stories",
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
                   Text(
                    "V",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                   new InkWell(
                    child: Text(
                      "Velocity",
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
                  ), Text(
                    "W",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                   Text(
                    "X",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                   Text(
                    "Y",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                    new Divider(
                    color: utils.hexToColor("#000000"),
                  ),
                   Text(
                    "Z",
                    style: TextStyle(
                      fontSize: utils.fitScreenSize(_height, 0.06),
                      fontWeight: FontWeight.w500,
                    ),
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
    );
  }
}
