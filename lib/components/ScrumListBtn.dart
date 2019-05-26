import 'package:flutter/material.dart';
import 'package:ScrumBooster/Utils/utils.dart';

class ScrumListBtn extends StatelessWidget {
  final String title;
  final VoidCallback action;
  final String imgUrl;

  ScrumListBtn({
    Key key,
    @required this.title,
    @required this.action,
    @required this.imgUrl,
  }) : super(key: key);

  var util = new Util();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          image: new DecorationImage(
            image: NetworkImage(this.imgUrl),
            fit: BoxFit.cover,
          ),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: util.hexToColor("#000000"),
              offset: new Offset(1.0, 1.0),
              blurRadius: 15.0,
            ),
          ]
        ),
      ),
      onTap: this.action,
    );
  }
}