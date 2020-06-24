import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:tawfeer/publaic/constants/MyText.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'constants/LoadingDialog.dart';

class ActiveCode extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _classState();
  }
}

class _classState extends State<ActiveCode> {
  GlobalKey<ScaffoldState> _scafold = new GlobalKey<ScaffoldState>();


  final TextEditingController _pinPutController = TextEditingController();

  BoxDecoration pinPutDecoration = BoxDecoration(
      border: Border.all(width: 1.5, color: Colors.grey.withOpacity(.3)),
      borderRadius: BorderRadius.circular(7),
      color: Colors.grey.withOpacity(.3));
  BoxDecoration selectedPinPutDecoration = BoxDecoration(
      border: Border.all(width: 1.5, color: MyColors.blue),
      borderRadius: BorderRadius.circular(7),
      color: Colors.white);


  _setActiveUser() async {
    if (_pinPutController.text.trim().isEmpty) {
      LoadingDialog(_scafold).showNotification("${tr("code")}");
      return;
    }
    Navigator.of(context).pushReplacementNamed("/login");

//    var _id=GlobalState.instance.get("user_id");
//    var url = "Client/ChangePasswordByCode";
//    var body={
//      "user_id":"$_id",
//      "code":"${_code.text}",
//      "password":"${_pass.text}",
//      "lang":"${GlobalState.instance.get("lang")}"
//    };
//    var _data=await Http(_scafold).post("$url", body, context);
//    if(_data!=null){

//    }
  }

//  _setResendCode()async{
//    var _id=GlobalState.instance.get("user_id");
//    var body={
//      "user_id":"$_id",
//      "lang":"${GlobalState.instance.get("lang")}"
//    };
//    var _data=await Http(_scafold).post("Client/resend_code", body, context);
//    if(_data!=null){
//      print(_data);
////      Navigator.of(context).pushReplacementNamed("/login");
//    }
//  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      key: _scafold,
      backgroundColor: MyColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.white,
        elevation: 0,
        title: InkWell(
            onTap: () => Navigator.of(context).pushNamed("/register"),
            child: Container(
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.arrow_back_ios,
                    size: 23,
                    color: MyColors.Primary,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MyText(
                    title: "${tr("retrivePassword")}",
                    size: 20,
                    color: MyColors.Primary.withOpacity(.5),
                  )
                ],
              ),
            )),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("images/logo.png"),
                                fit: BoxFit.fill)),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: MyText(
                          title:
                              "${tr("longText")}",
                          size: 14,
                          color: MyColors.Primary.withOpacity(.3),
                          alien: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: MyText(
                          title: "${tr("entreCodeHere")}",
                          size: 14,
                          color: MyColors.Primary.withOpacity(.6),
                          alien: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        child: PinPut(
                          fieldsCount: 4,
                          eachFieldWidth: 10,
                          eachFieldHeight: 45,
                          controller: _pinPutController,
                          submittedFieldDecoration: selectedPinPutDecoration,
                          followingFieldDecoration: pinPutDecoration,
                          selectedFieldDecoration: selectedPinPutDecoration,
                        ),
                      ),
                      SizedBox(
                        height: 55,
                      ),
                      InkWell(
                        onTap: () => _setActiveUser(),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 45,
                          margin: EdgeInsets.symmetric(vertical: 30),
                          decoration: BoxDecoration(
                              color: MyColors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                          alignment: Alignment.center,
                          child: MyText(
                            title: "${tr("login")}",
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          MyText(
                            title: "${tr("didn'tGetTheMessage")}",
                            size: 14,
                            color: MyColors.Primary.withOpacity(.3),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          InkWell(
                            onTap: () {},
                            child: MyText(
                              title: "${tr("resend")}",
                              size: 14,
                              color: MyColors.blue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
