//import 'dart:convert';
//
//import 'package:easy_localization/easy_localization.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_html/flutter_html.dart';
//import 'package:pik/publaic/constants/CardIcon.dart';
//import 'package:pik/publaic/constants/GlobalState.dart';
//import 'package:pik/publaic/constants/LoadingDialog.dart';
//import 'package:pik/publaic/constants/MyColors.dart';
//import 'package:pik/publaic/constants/MyText.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//
//import 'constants/Http.dart';
//
//
//
//class Settings extends StatefulWidget{
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return _classState();
//  }
//
//}
//
//class _classState extends State<Settings>{
//
//  GlobalKey<ScaffoldState>_scafold=new GlobalKey<ScaffoldState>();
//
//  var _notify=true;
//  var _user;
//
//  @override
//  void initState() {
//    super.initState();
//    _user=json.decode(GlobalState.instance.get("user"));
//    _notify=_user["notify"];
//
//  }
//
//  _sendChangNotify(val)async{
//     LoadingDialog(_scafold).showDilaog();
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    var body={
//      "user_id":"${_user["user_id"]}",
//      "state":"$val",
//      "lang":"${_user["lang"]}"
//    };
//    var _data=await Http(_scafold).get("Client/ChangeClientNotificationState", body, context,close: true);
//    if(_data!=null){
//      _notify=val;
//      var userData=_data["data"];
//      print(userData);
//      prefs.setString("user", json.encode(userData));
//      GlobalState.instance.set("user", json.encode(userData));
//
//    }
//    setState(() {
//
//    });
//
//  }
//
//  _setCloseAccount()async{
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    var body={
//      "user_id":"${_user["lang"]}",
//      "lang":"${GlobalState.instance.get("lang")}"
//    };
//    var _data=await Http(_scafold).post("Client/CloseAccount", body, context);
//    if(_data!=null){
//      prefs.setString("user", null);
//      prefs.setString("userType", null);
//      GlobalState.instance.set("user", null);
//      Navigator.of(context).pushNamedAndRemoveUntil("/selectLog", (Route<dynamic> route) => false);
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//
//
//    return Scaffold(
//      key: _scafold,
//      appBar: AppBar(
//        title: MyText(title: "${tr("settings")}",size: 16,color: MyColors.Primary,),
//        backgroundColor: MyColors.white,
//        elevation: 0,
//        leading: InkWell(
//            onTap: (){Navigator.of(context).pop();},
//            child: Container(
//              child: Icon(Icons.arrow_back_ios,size: 25,color: MyColors.Primary,),
//            )
//        ),
//        actions: <Widget>[
//          Padding(
//            padding: EdgeInsets.symmetric(horizontal: 10),
//            child: CardIcon(_scafold),
//          ),
//        ],
//      ),
//      backgroundColor: MyColors.white,
//      body: ListView(
//        children: <Widget>[
//          Container(
//              margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
//              padding: EdgeInsets.symmetric(vertical: 10),
//              decoration: BoxDecoration(
//                  border: Border.all(color: MyColors.gold,width: 1.5)
//              ),
//              child: Column(
//                children: <Widget>[
//                  Container(
//                    height: 45,
//                    padding: EdgeInsets.symmetric(horizontal: 10),
//                    decoration: BoxDecoration(
//                        border: Border(
//                            bottom: BorderSide(color: Colors.grey[200],width: 1.5)
//                        )
//                    ),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        MyText(title: "${tr("notifications")}",size: 16,color: MyColors.Primary,),
//                        Switch(
//                            activeColor: MyColors.Primary,
//                            activeTrackColor: MyColors.gold,
//                            value: _notify,
//                            onChanged: (val)=>_sendChangNotify(val)
//                        )
//                      ],
//                    ),
//                  ),
//                  InkWell(
//                    onTap: ()=>Navigator.of(context).pushNamed("/languages"),
//                    child: Container(
//                      height: 50,
//                      padding: EdgeInsets.symmetric(horizontal: 10),
//                      decoration: BoxDecoration(
//                          border: Border(
//                              bottom: BorderSide(color: Colors.grey[200],width: 1.5)
//                          )
//                      ),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          MyText(title: "${tr("lang")}",size: 16,color: MyColors.Primary,),
//                          Icon(Icons.keyboard_arrow_down,size: 25,color: MyColors.Primary,)
//                        ],
//                      ),
//                    ),
//                  ),
//                  InkWell(
//                    onTap: ()=>Navigator.of(context).pushNamed("/changePassword"),
//                    child: Container(
//                      height: 50,
//                      padding: EdgeInsets.symmetric(horizontal: 10),
//                      decoration: BoxDecoration(
//                          border: Border(
//                              bottom: BorderSide(color: Colors.grey[200],width: 1.5)
//                          )
//                      ),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          MyText(title: "${tr("changePassword")}",size: 16,color: MyColors.Primary,),
//                          Icon(Icons.arrow_forward_ios,size: 20,color: MyColors.Primary,)
//                        ],
//                      ),
//                    ),
//                  ),
//
//                ],
//              )
//          ),
//
////            InkWell(
////              onTap: ()=>_setCloseAccount(),
////              child: Container(
////                width: MediaQuery.of(context).size.width,
////                height: 45,
////                margin: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
////                decoration: BoxDecoration(
////                    color: Colors.white,
////                    borderRadius: BorderRadius.all(Radius.circular(5))
////                ),
////                alignment: Alignment.center,
////                child: MyText(title: "${tr("deactivation")}",size: 16,color: Colors.red,),
////              ),
////            ),
//        ],
//      ),
//
//    );
//  }
//
//}