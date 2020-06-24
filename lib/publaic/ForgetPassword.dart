import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tawfeer/publaic/constants/LabelTextField.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:tawfeer/publaic/constants/MyText.dart';
import 'constants/LoadingDialog.dart';

class ForgetPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _classState();
  }
}

class _classState extends State<ForgetPassword> {
  GlobalKey<ScaffoldState> _scafold = new GlobalKey<ScaffoldState>();

  TextEditingController _phone = new TextEditingController();

  _setActiveUser() async {
    if (_phone.text.trim().isEmpty) {
      LoadingDialog(_scafold).showNotification("${tr("enterPhone")}");
      return;
    }
//    var url = "Client/Forget_password";
//    var body={
//      "phone":"${_phone.text}",
//      "lang":"${GlobalState.instance.get("lang")}"
//    };
//    var _data=await Http(_scafold).post("$url", body, context);
//    if(_data!=null){
//      GlobalState.instance.set("user_id","${_data["user_id"]}");
    Navigator.of(context).pushReplacementNamed("/ActiveCode");
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
            onTap: () => Navigator.pop(context),
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
                    title: "${tr("forgetPassword")}",
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
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                        child: MyText(
                          title:
                          "${tr("enterPhone")}",
                          size: 14,
                          color: MyColors.Primary.withOpacity(.6),
                          alien: TextAlign.center,
                        ),
                      ),

                      LabelTextField(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        type: TextInputType.phone,
                        label: "${tr("phone")}",
                        isPassword: false,
                        controller: _phone,
                        fillColor: MyColors.Primary.withOpacity(.07),
                        borderRadius: 7,
                        enableBorder: true,
                        align: TextAlign.center,

                      ),
                      SizedBox(
                        height: 35,
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
