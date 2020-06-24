import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:flutter/material.dart';

class LabelTextField extends StatelessWidget{

  TextEditingController controller;
  String label;
  EdgeInsets margin=EdgeInsets.all(0);
  bool isPassword=false;
  TextInputType type=TextInputType.text;
  Icon prefix;
  var suffix;
  double borderRadius;
  var fillColor ;
  var align ;
  bool enableBorder ;

  LabelTextField({this.label,this.enableBorder,this.align,this.controller,this.margin,this.isPassword,this.type,this.prefix,this.borderRadius,this.suffix,this.fillColor});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 55,
      margin: margin,
//      decoration: BoxDecoration(
//        border: Border.all(
//           color: Colors.grey,width: 1.5
//
//        ),
//        borderRadius: BorderRadius.circular(borderRadius?? 50),
//
//      ),
      child: TextFormField(


        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        textAlign: align ?? TextAlign.start,

        style: TextStyle(fontSize: 14,fontFamily: "cairo",color: Colors.black.withOpacity(.7)),


        decoration: InputDecoration(
            filled: fillColor != null ? true : false,
            fillColor: fillColor ?? Colors.white,
          enabledBorder: enableBorder != null ? OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.grey.withOpacity(.5)),
            borderRadius: BorderRadius.circular(borderRadius?? 50),
          ): null,
          focusedBorder: enableBorder != null ? OutlineInputBorder(
            borderSide: BorderSide(color:  MyColors.blue),
            borderRadius: BorderRadius.circular(borderRadius??50),
          ): null,
          hintText: "$label",
          prefixIcon: prefix,
          suffixIcon: suffix,

          labelStyle: TextStyle(fontFamily: "cairo",fontSize: 14,),
          contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10)
        ),
      ),
    );
  }


}