import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  String title;
  Color color = Colors.black;
  double size = 16;
  TextAlign alien = TextAlign.start;
  var line ;

  MyText({this.title, this.color, this.size, this.alien,this.line});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Text(
      "$title",
      textAlign: alien,
      textScaleFactor: 1.0,
//      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: color, fontSize: size - 2, fontFamily: "cairo",decoration: line,),
    );
  }
}
