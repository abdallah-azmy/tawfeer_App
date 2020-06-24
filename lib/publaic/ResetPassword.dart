//import 'package:easy_localization/easy_localization.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:pik/publaic/constants/LabelTextField.dart';
//import 'package:pik/publaic/constants/MyColors.dart';
//import 'package:pik/publaic/constants/MyText.dart';
//
//import 'constants/GlobalState.dart';
//import 'constants/Http.dart';
//import 'constants/LoadingDialog.dart';
//
//
//
//class ResetPassword  extends StatefulWidget{
//
//
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return _classState();
//  }
//
//}
//
//class _classState extends State<ResetPassword>{
//
//  GlobalKey<ScaffoldState>_scafold=new GlobalKey<ScaffoldState>();
//
//
//
//  TextEditingController _code=new TextEditingController();
//  TextEditingController _pass=new TextEditingController();
//  TextEditingController _confirm=new TextEditingController();
//
//  _setActiveUser()async{
//
//    if(_code.text.trim().isEmpty||_pass.text.trim().isEmpty){
//       LoadingDialog(_scafold).showNotification("${tr("enterPhone")}");
//      return;
//    }
//    if(_pass.text.trim()!=_confirm.text.trim()){
//       LoadingDialog(_scafold).showNotification("من فضلك ادخل تاكيد رمز المرور صحيحا");
//      return;
//    }
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
//      Navigator.of(context).pushReplacementNamed("/login");
//    }
//  }
//
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
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//
//
//    return Scaffold(
//      key: _scafold,
//
//      body: Stack(
//        children: <Widget>[
//          Container(
//            margin: EdgeInsets.only(top: 120),
//            height: MediaQuery.of(context).size.height,
//            child: ListView(
//              children: <Widget>[
//
//                Container(
//                  child: Column(
//                    children: <Widget>[
//                      Container(
//                        width: 280,
//                        height: 150,
//                        decoration: BoxDecoration(
//                            image: DecorationImage(image: AssetImage("images/logo.png"),fit: BoxFit.fill)
//                        ),
//                      ),
//
//                      LabelTextField(
//                        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
//                        type: TextInputType.number,
//                        label: "${tr("code")}",
//                        isPassword: false,
//                        controller: _code,
//                        prefix: Icon(Icons.code,size: 25,),
//                      ),
//                      LabelTextField(
//                        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
//                        type: TextInputType.text,
//                        label: "${tr("password")}",
//                        isPassword: true,
//                        controller: _pass,
//                        prefix: Icon(Icons.lock,size: 25,),
//                      ),
//                      LabelTextField(
//                        margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
//                        type: TextInputType.text,
//                        label: "${tr("confirm")}",
//                        isPassword: true,
//                        controller: _confirm,
//                        prefix: Icon(Icons.lock,size: 25,),
//                      ),
//                    ],
//                  ),
//                ),
//
//                SizedBox(height: 50,),
//
//                InkWell(
//                  onTap: ()=>_setActiveUser(),
//                  child: Container(
//                    width: MediaQuery.of(context).size.width,
//                    height: 45,
//                    margin: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
//                    decoration: BoxDecoration(
//                        color: MyColors.Primary,
//                        borderRadius: BorderRadius.all(Radius.circular(5))
//                    ),
//                    alignment: Alignment.center,
//                    child: MyText(title: "${tr("send")}",size: 16,color: Colors.white,),
//                  ),
//                ),
//
//
//              ],
//            ),
//          ),
//          Container(
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.end,
//              children: <Widget>[
//                InkWell(
//                  onTap: ()=>Navigator.of(context).pop(),
//                  child: Container(
//                    padding: EdgeInsets.symmetric(horizontal: 5),
//                    child: Row(
//                      children: <Widget>[
//                        Icon(Icons.arrow_back_ios,size: 20,color: MyColors.Primary,),
//                        SizedBox(width: 5,),
//                        MyText(title: "${tr("prevPage")}",size: 16,color: MyColors.Primary,)
//                      ],
//                    ),
//                  ),
//                ),
//                Spacer(),
//                Container(
//                  width: 100,height: 100,
//                  decoration: BoxDecoration(
//                      image: DecorationImage(image: AssetImage("images/shape.png"),fit: BoxFit.fill)
//                  ),
//                ),
//              ],
//            ),
//          )
//        ],
//      ),
//    );
//  }
//
//
//}