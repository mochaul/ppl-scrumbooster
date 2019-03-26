import 'package:flutter/material.dart';
import 'package:ScrumBooster/utils/utils.dart';

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
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Ink.image(
      image: AssetImage(this.imgUrl),
      fit: BoxFit.cover,
      width: 120.0,
      height: 120.0,
      child: InkWell(
        onTap: this.action,
        child: null,
      ),
    );
  }
}