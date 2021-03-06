import 'package:flutter/material.dart';
import 'package:ScrumBooster/Utils/utils.dart';

class ScrumPhaseBtn extends StatelessWidget {
  final String title;
  final VoidCallback action;
  final String imgUrl;

  ScrumPhaseBtn({
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
      width: util.fitScreenSize(_width, 0.4),
      height: util.fitScreenSize(_height, 0.3),
      child: InkWell(
        onTap: this.action,
      ),
    );
  }
}