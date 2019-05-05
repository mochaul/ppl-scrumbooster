import 'package:flutter/material.dart';
import 'package:ScrumBooster/Utils/utils.dart';
import 'package:ScrumBooster/contents/ceremonies.dart';
import 'package:ScrumBooster/contents/problems.dart';

class SearchResultCard extends StatelessWidget {
  final String title;
  final String detail;
  final String imageURL;
  final int phaseID;
  final List<dynamic> mayBeHappenAt;
  final String contentType;

  SearchResultCard({
    Key key,
    @required this.title,
    @required this.detail,
    @required this.imageURL,
    this.phaseID,
    this.mayBeHappenAt,
    @required this.contentType
  }) : super(key: key);

  final util = new Util();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return new Container(
      width: util.fitScreenSize(_width, 0.7),
      height: util.fitScreenSize(_width, 0.4),
      padding: EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
        right: 10.0,
        left: 10.0,
      ),
      child: new InkWell(
        onTap: () {
          switch (this.contentType) {
            case "Problems":
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProblemsContentPage(
                    title: this.title,
                    imagePath: this.imageURL,
                    contents: this.detail,
                  )
                ),
              );
              break;
            case "Ceremonies":
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Ceremonies(
                    title: this.title,
                    imagePath: this.imageURL,
                    contents: this.detail,
                  ),
                ),
              );
              break;
          }
        },
        child: new Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: util.hexToColor("#FFFFFF"),
            boxShadow: <BoxShadow>[
              new BoxShadow(
                color: util.hexToColor("#000000"),
                offset: new Offset(0, 5.0),
                blurRadius: 3.0,
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
                        this.imageURL,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.all(3.0),
                ),
                //Content
                new Container(
                  height: util.fitScreenSize(_height, 0.15),
                  width: util.fitScreenSize(_width, 0.6),
                  child: new Center(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          child: Center(
                            child: Text(
                              this.title,
                              style: TextStyle(
                                color: util.hexToColor("#000000"),
                                fontSize: 20.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        new Padding(padding: EdgeInsets.all(5.0)),
                        new InkWell(
                          child: Text(
                            "see details >",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: util.hexToColor("#3498DB")
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
