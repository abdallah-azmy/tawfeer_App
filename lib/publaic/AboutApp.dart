//
//import 'package:easy_localization/easy_localization.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_html/flutter_html.dart';
//import 'package:pik/publaic/constants/CardIcon.dart';
//import 'package:pik/publaic/constants/LoadingDialog.dart';
//import 'package:pik/publaic/constants/MyColors.dart';
//import 'package:pik/publaic/constants/MyText.dart';
//
//import 'constants/GlobalState.dart';
//import 'constants/Http.dart';
//
//
//
//class AboutApp extends StatefulWidget{
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return _classState();
//  }
//
//}
//
//class _classState extends State<AboutApp>{
//
//  GlobalKey<ScaffoldState>_scafold=new GlobalKey<ScaffoldState>();
//
//
//  var _aboutData;
//  var _loading=true;
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
//    var _data=await Http(_scafold).get("Client/AboutApp", body, context);
//    if(_data!=null){
//      _aboutData=_data["data"];
//    }
//    _loading=false;
//    setState(() {
//
//    });
//
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
//        title: MyText(title: "${tr("about")}",size: 16,color: MyColors.Primary,),
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
//      body: RefreshIndicator(
//        onRefresh: ()=>_setGetAboutData(),
//        backgroundColor: MyColors.Primary,
//        child: Visibility(
//          child: Center(
//            child:  LoadingDialog(_scafold).showLoadinView(),
//          ),
//          visible: _loading,
//          replacement: Container(
//              height: MediaQuery.of(context).size.height,
//              margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
//              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//              decoration: BoxDecoration(
//                  border: Border.all(color: MyColors.gold,width: 1.5)
//              ),
//              child: SingleChildScrollView(
//                child: Html(
//                  data: "$_aboutData",
//                  defaultTextStyle: TextStyle(
//                    color: Colors.grey,
//                    fontSize: 14,
//                    locale: Locale("ar"),
//                    fontFamily: "cairo",
//                  ),
//                  useRichText: false,
//                ),
//              )
//          ),
//        ),
//      ),
//
//    );
//  }
//
//}