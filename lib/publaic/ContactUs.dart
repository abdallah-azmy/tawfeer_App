//import 'package:easy_localization/easy_localization.dart';
//import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:pik/publaic/constants/CardIcon.dart';
//import 'package:pik/publaic/constants/MyColors.dart';
//import 'package:pik/publaic/constants/MyText.dart';
//import 'package:url_launcher/url_launcher.dart';
//
//import 'constants/GlobalState.dart';
//import 'constants/Http.dart';
//import 'constants/LoadingDialog.dart';
//
//
//
//class ContactUs extends StatefulWidget{
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return _classState();
//  }
//
//}
//
//class _classState extends State<ContactUs>{
//
//  GlobalKey<ScaffoldState>_scafold=new GlobalKey<ScaffoldState>();
//
//
//
//  var _aboutData;
//  var _loading=true;
//  String _phone="",_mail="",_face="",_twitter="";
//
//  @override
//  void initState() {
//    super.initState();
//    _setGetAboutData();
//
//  }
//
//  _setGetAboutData()async{
//    var body={
//      "lang":"${GlobalState.instance.get("lang")}"
//    };
//    var _data=await Http(_scafold).get("Client/ContactUs", body, context);
//    if(_data!=null){
//      _aboutData=_data["data"];
//      _phone=_aboutData["phone"];
//      _mail=_aboutData["email"];
//      _face=_aboutData["facebook"];
//      _twitter=_aboutData["twitter"];
//    }
//    _loading=false;
//    setState(() {
//
//    });
//
//  }
//
//
//  _launchURL(_url) async {
//    if(!_url.toString().startsWith("http")){
//      _url="http://"+_url;
//    }
//    if (await canLaunch(_url)) {
//      await launch(_url);
//    } else {
//       LoadingDialog(_scafold).showNotification("${tr("checkLink")}");
//    }
//  }
//
//  _callPhone(phone) async {
//    await launch("tel:$phone");
//  }
//
//  _sendMail(mail) async {
//    await launch("mailto:$mail");
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
//        title: MyText(title: "${tr("contactUs")}",size: 16,color: MyColors.Primary,),
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
//          )
//        ],
//      ),
//      backgroundColor: MyColors.white,
//      body: Container(
//          height: MediaQuery.of(context).size.height,
//          margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
//          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//          decoration: BoxDecoration(
//              border: Border.all(color: MyColors.gold,width: 1.5)
//          ),
//          child: Visibility(
//            child: Center(
//              child:  LoadingDialog(_scafold).showLoadinView(),
//            ),
//            visible: _loading,
//            replacement: SingleChildScrollView(
//              child: Column(
//                children: <Widget>[
//                  InkWell(
//                    onTap: ()=>_callPhone(_phone),
//                    child: Container(
//                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
//                      decoration: BoxDecoration(
//                        border: Border(
//                            bottom: BorderSide(color: Colors.grey.withOpacity(.4),width: 1.5)
//                        ),
//                      ),
//                      child: Row(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          Icon(Icons.phone_android,size: 30,color: MyColors.Primary,),
//                          SizedBox(width: 5,),
//                          MyText(title: "$_phone",size: 16,color: MyColors.Primary,),
//                        ],
//                      ),
//                    ),
//                  ),
//                  InkWell(
//                    onTap: ()=>_sendMail(_mail),
//                    child: Container(
//                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
//                      decoration: BoxDecoration(
//                        border: Border(
//                            bottom: BorderSide(color: Colors.grey.withOpacity(.4),width: 1.5)
//                        ),
//                      ),
//                      child: Row(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          Icon(Icons.mail,size: 30,color: MyColors.Primary,),
//                          SizedBox(width: 5,),
//                          MyText(title: "$_mail",size: 16,color: MyColors.Primary,),
//                        ],
//                      ),
//                    ),
//                  ),
//                  InkWell(
//                    onTap: ()=>_launchURL(_face),
//                    child: Container(
//                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
//                      decoration: BoxDecoration(
//                        border: Border(
//                            bottom: BorderSide(color: Colors.grey.withOpacity(.4),width: 1.5)
//                        ),
//                      ),
//                      child: Row(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          Icon(FontAwesomeIcons.facebookF,size: 25,color: MyColors.Primary,),
//                          SizedBox(width: 5,),
//                          MyText(title: "$_face",size: 16,color: MyColors.Primary,),
//                        ],
//                      ),
//                    ),
//                  ),
//                  InkWell(
//                    onTap: ()=>_launchURL(_twitter),
//                    child: Container(
//                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
//                      decoration: BoxDecoration(
//                        border: Border(
//                            bottom: BorderSide(color: Colors.grey.withOpacity(.4),width: 1.5)
//                        ),
//                      ),
//                      child: Row(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          Icon(FontAwesomeIcons.twitter,size: 30,color: MyColors.Primary,),
//                          SizedBox(width: 5,),
//                          MyText(title: "$_twitter",size: 16,color: MyColors.Primary,),
//                        ],
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//            ),
//          )
//      ),
//
//    );
//  }
//
//}