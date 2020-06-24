import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tawfeer/publaic/constants/LabelTextField.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:tawfeer/publaic/constants/MyText.dart';
import 'constants/RichTextFiled.dart';

class Complains extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _classState();
  }
}

class _classState extends State<Complains> {
  GlobalKey<ScaffoldState> _scafold = new GlobalKey<ScaffoldState>();

  var _loading = false;

  TextEditingController _name = new TextEditingController();
  TextEditingController _mail = new TextEditingController();
  TextEditingController _message = new TextEditingController();

  @override
  void initState() {
    super.initState();
//    _setGetAdverts();
  }



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
          title: "${tr("complains")}",
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
      body: ListView(
        children: <Widget>[
          Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "images/logo.png",
                  height: 140,
                  width: 140,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  height: 20,
                ),
                MyText(
                  title:
                  "${tr("you can send questions from our messages")}",
                  size: 16,
                  color: MyColors.blackOpacity.withOpacity(.5),
                  alien: TextAlign.center,
                ),
                LabelTextField(
                  margin: EdgeInsets.symmetric(vertical: 7),
                  type: TextInputType.text,
                  label: "${tr("name")}",
                  isPassword: false,
                  controller: _name,
                  enableBorder: true,
                ),
                LabelTextField(
                  margin: EdgeInsets.symmetric(vertical: 7),
                  type: TextInputType.emailAddress,
                  label: "${tr("mail")}",
                  isPassword: false,
                  controller: _mail,
                  enableBorder: true,
                ),
                SizedBox(height: 10,),
                RichTextFiled(
                  controller: _message,
                  label: "${tr("you can send questions from our messages")}",
                  max: 6,
                ),
                SizedBox(height: 30,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: MyColors.blue),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: MyText(
                      title: "${tr("send")}",

                      size: 19,
                      color: MyColors.white,
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                MyText(
                  title: "${tr("or from social media")}",
                  size: 17,
                  color: MyColors.blackOpacity,
                ),
                SizedBox(height: 10,),
                MyText(
                  title: "${tr("longText")}",
                  size: 14,
                  alien: TextAlign.center,
                  color: MyColors.blackOpacity.withOpacity(.4),
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: 30,
                          width: 30,
                          child: Center(child: Image.asset("images/twitter.png"))),
                      Container(
                          height: 30,
                          width: 30,
                          child: Center(child: Image.asset("images/face.png"))),
                      Container(
                          height:30,
                          width: 30,
                          child: Center(child: Image.asset("images/insta.png"))),
                      Container(
                          height: 30,
                          width: 30,
                          child: Center(child: Image.asset("images/whatsapp.png"))),

                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
