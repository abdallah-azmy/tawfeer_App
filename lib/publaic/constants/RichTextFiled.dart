import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:flutter/material.dart';

class RichTextFiled extends StatelessWidget{

  TextEditingController controller;
  String label;
  EdgeInsets margin=EdgeInsets.all(0);
  TextInputType type=TextInputType.text;
  int min,max;
  double height;
  var filledColorr ;

  RichTextFiled({this.label,this.controller,this.margin,this.type,this.max,this.min,this.height,this.filledColorr});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: height,
      margin: margin,
      decoration: BoxDecoration(
          color: MyColors.Grey,
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        minLines: min,
        maxLines: max,
        style: TextStyle(fontSize: 14,fontFamily: "cairo",color: Colors.black.withOpacity(.7)),
        decoration: InputDecoration(
          filled: true,
            fillColor: filledColorr ?? MyColors.white,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.Primary,width: 1),
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.Primary,width: 2),
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            hintText: "$label",
            hintStyle: TextStyle(fontFamily: "cairo",fontSize: 14)
        ),
      ),
    );
  }


}