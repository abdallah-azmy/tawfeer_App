import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tawfeer/publaic/constants/LabelTextField.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:tawfeer/publaic/constants/MyText.dart';


class EditPersonalFile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _classState();
  }
}

class _classState extends State<EditPersonalFile> {
  GlobalKey<ScaffoldState> _scafold = new GlobalKey<ScaffoldState>();

  TextEditingController name = new TextEditingController();
  TextEditingController mail = new TextEditingController();



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      backgroundColor: MyColors.white,
      key: _scafold,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 7,
        title: MyText(
          title: "${tr("profile")}",
          size: 17,
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                ))),
        backgroundColor: MyColors.white,
      ),
      bottomSheet: InkWell(
        onTap: () {},
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: MyColors.blue,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15))),
          child: Center(
            child: MyText(
              title: "${tr("save")}",
              color: MyColors.white,
              size: 17,
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Material(
            elevation: 7,
            child: Container(
              margin:   const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  SizedBox(height: 20,),

                  MyText(
                    title: "${tr("name")}",
                    size: 16,
                    color: MyColors.blackOpacity.withOpacity(.4),
                  ),
                  LabelTextField(label: "Mahmoud" ,controller: name,isPassword: false,),


                  SizedBox(height: 10,),

                  MyText(
                    title: "${tr("mail")}",
                    size: 16,
                    color: MyColors.blackOpacity.withOpacity(.4),
                  ),

                  LabelTextField(label: "Mahmoud@example.com" ,controller: mail,isPassword: false,),
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}
