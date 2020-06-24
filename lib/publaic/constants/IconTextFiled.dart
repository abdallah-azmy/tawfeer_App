//import 'package:pik/publaic/constants/MyColors.dart';
//import 'package:flutter/material.dart';
//
//import 'MyColors.dart';
//
//class IconTextFiled extends StatelessWidget{
//
//  TextEditingController controller;
//  String label;
//  EdgeInsets margin=EdgeInsets.all(0);
//  TextInputType type=TextInputType.text;
//  Widget icon;
//  bool isPassword=false;
//  Icon prefix;
//  IconTextFiled({this.label,this.controller,this.margin,this.type,this.icon,this.isPassword,this.prefix});
//
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return Container(
//      height: 50,
//      margin: margin,
//      decoration: BoxDecoration(
//          border: Border(
//              bottom: BorderSide(color: Colors.grey,width: 1.5)
//          )
//      ),
//      child: TextFormField(
//        controller: controller,
//        keyboardType: type,
//        enabled: true,
//        obscureText: isPassword,
//        style: TextStyle(fontSize: 16,fontFamily: "cairo",color: Colors.black.withOpacity(.7)),
//        decoration: InputDecoration(
//            enabledBorder: InputBorder.none,
//            focusedBorder: UnderlineInputBorder(
//              borderSide: BorderSide(color: MyColors.Primary,width: 2),
//            ),
//            labelText: "$label",
//            labelStyle: TextStyle(fontFamily: "cairo",fontSize: 14,color: Colors.black45),
//            contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 14),
//          suffixIcon: icon
//        ),
//      ),
//    );
//  }
//
//
//}