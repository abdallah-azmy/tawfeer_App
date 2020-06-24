import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:flutter/material.dart';

class DisabledTextField extends StatelessWidget{

  TextEditingController controller;
  String label;
  EdgeInsets margin=EdgeInsets.all(0);
  bool isPassword=false;
  TextInputType type=TextInputType.text;

  DisabledTextField({this.label,this.controller,this.margin,this.isPassword,this.type});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 55,
      margin: margin,
      decoration: BoxDecoration(
          color: MyColors.Grey,
          borderRadius: BorderRadius.all(Radius.circular(30))
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        enabled: false,
        style: TextStyle(fontSize: 16,fontFamily: "cairo",color: Colors.black.withOpacity(.7)),
        decoration: InputDecoration(
            disabledBorder: InputBorder.none,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyColors.Primary.withOpacity(.8),width: 2),
                borderRadius: BorderRadius.all(Radius.circular(30))
            ),
            hintText: "  $label  ",
            hintStyle: TextStyle(fontFamily: "cairo",fontSize: 14),
            contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 14)
        ),
      ),
    );
  }


}