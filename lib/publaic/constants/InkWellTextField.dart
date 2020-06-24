import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:flutter/material.dart';

import 'MyColors.dart';

class InkWellTextField extends StatelessWidget{

  TextEditingController controller;
  String label;
  EdgeInsets margin=EdgeInsets.all(0);
  TextInputType type=TextInputType.text;
  Widget icon;
  Function onTab;
  Icon prefix;
  bool dropDown=true;
  InkWellTextField({this.label,this.controller,this.margin,this.type,this.onTab,this.icon,this.prefix,this.dropDown});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 50,
      margin: margin,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey,width: 1.5)
          )
      ),
      child: InkWell(
        onTap: onTab,
        child: Visibility(
          child: TextFormField(
            controller: controller,
            keyboardType: type,
            enabled: false,
            style: TextStyle(fontSize: 14,fontFamily: "cairo",color: Colors.black.withOpacity(.7)),
            decoration: InputDecoration(
                disabledBorder: InputBorder.none,
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: MyColors.Primary.withOpacity(.8),width: 2),
                ),
                labelText: "$label",
                labelStyle: TextStyle(fontFamily: "cairo",fontSize: 12,color: Colors.black45),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                suffixIcon: icon,
              prefixIcon:prefix
            ),
          ),
          visible: dropDown,
          replacement: TextFormField(
            controller: controller,
            keyboardType: type,
            enabled: false,
            style: TextStyle(fontSize: 14,fontFamily: "cairo",color: Colors.black.withOpacity(.7)),
            decoration: InputDecoration(
                disabledBorder: InputBorder.none,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: MyColors.Primary.withOpacity(.8),width: 2),
                ),
                labelText: "$label",
                labelStyle: TextStyle(fontFamily: "cairo",fontSize: 12,color: Colors.black45),
                contentPadding: EdgeInsets.symmetric(horizontal: 10,),
                prefixIcon:prefix
            ),
          ),
        ),
      ),
    );
  }


}