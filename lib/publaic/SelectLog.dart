//import 'package:easy_localization/easy_localization.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:pik/publaic/Bloc/Counter.dart';
//import 'package:pik/publaic/constants/GlobalState.dart';
//import 'package:pik/publaic/constants/MyColors.dart';
//import 'package:pik/publaic/constants/MyText.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:provider/provider.dart';
//
//class SelectLog extends StatefulWidget {
//  Function func;
//  SelectLog(this.func);
//
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return _classState();
//  }
//}
//
//class _classState extends State<SelectLog> {
//  GlobalKey<ScaffoldState> _scafold = new GlobalKey<ScaffoldState>();
//
//
//  var _lang;
//  bool _chooseLang = false;
//  String _showLang = "العربية";
//@override
//
//
//
//  _setChangeLang(val) async {
//    setState(() {});
//    _lang = val;
//    if(val=="ar"){
//      widget.func(Locale('ar', 'EG'));
//    }else{
//      widget.func(Locale('en', 'US'));
//    }
//    final language = Provider.of<Counter>(context);
//    language.changeLang(true);
//  }
//
//  _changeLang(){
//    if(GlobalState.instance.get("lang")=="en"){
//      setState(() {
//        _showLang = "${tr("langAr")}";
//        _chooseLang=true;
//      });
//
//    }
//    else{
//      setState(() {
//        _showLang = "${tr("langEn")}";
//        _chooseLang=false;
//      });
//    }
//
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//
//
//    _changeLang();
//    return Scaffold(
//      key: _scafold,
//      body: Stack(
//        children: <Widget>[
//
//          Container(
//            height: MediaQuery.of(context).size.height,
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Container(
//                  width: 200,
//                  height: 120,
//                  decoration: BoxDecoration(
//                      image: DecorationImage(
//                          image: AssetImage("images/logo_two.png"),
//                          fit: BoxFit.fill)),
//                ),
//                InkWell(
//                  onTap: () => Navigator.of(context).pushNamed("/register"),
//                  child: Container(
//                    width: MediaQuery.of(context).size.width,
//                    height: 45,
//                    margin:
//                    EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//                    color: MyColors.Primary,
//                    alignment: Alignment.center,
//                    child: MyText(
//                      title: "${tr("register")}",
//                      size: 16,
//                      color: Colors.white,
//                    ),
//                  ),
//                ),
//                InkWell(
//                  onTap: () {
//                    GlobalState.instance.set("index", 0);
//                    Navigator.of(context).pushNamed("/login");
//                  },
//                  child: Container(
//                    width: MediaQuery.of(context).size.width,
//                    height: 45,
//                    margin:
//                    EdgeInsets.symmetric(horizontal: 40, vertical: 10),
//                    color: MyColors.Primary,
//                    alignment: Alignment.center,
//                    child: MyText(
//                      title: "${tr("login")}",
//                      size: 16,
//                      color: Colors.white,
//                    ),
//                  ),
//                ),
//                FlatButton(
//                  onPressed: () {
//                    GlobalState.instance.set("index", 0);
//                    GlobalState.instance.set("lang", "ar");
//                    _setChangeLang("ar");
//                    Navigator.of(context).pushNamed("/visitorHome");
//                  },
//                  child: MyText(
//                    title: "${tr("visitor")}",
//                    size: 14,
//                    color: MyColors.Primary,
//                  ),
//                ),
//
//              ],
//            ),
//          ),
//          Container(
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.end,
//              children: <Widget>[
//                Container(
//                  width: 100,
//                  height: 100,
//                  decoration: BoxDecoration(
//                      image: DecorationImage(
//                          image: AssetImage("images/shape.png"),
//                          fit: BoxFit.fill)),
//                )
//              ],
//            ),
//          ),
//          Positioned(
//            bottom: 10,
//            child: Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: InkWell(
//                onTap: () {
//                  GlobalState.instance.set("index", 0);
//                  Navigator.of(context).pushNamed("/login");
//                },
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                    Padding(
//                      padding: const EdgeInsets.symmetric(horizontal: 5),
//                      child: CupertinoSwitch(
//                        value: _chooseLang,
//                        onChanged: (val) async {
//                          setState(() {
//                            _chooseLang = val;
//                            _chooseLang
//                                ? _setChangeLang("en")
//                                : _setChangeLang("ar");
//                            _chooseLang
//                                ? _showLang = "${tr("langAr")}"
//                                : _showLang = "${tr("langEn")}";
//                            _chooseLang
//                                ? GlobalState.instance.set("lang", "en")
//                                : GlobalState.instance.set("lang", "ar");
//                          });
//                        },
//                        activeColor: MyColors.Primary,
//                      ),
//                    ),
//                    MyText(
//                      title: '$_showLang',
//                      color: Colors.black,
//                      size: 12,
//                    ),
//
//                  ],
//                ),
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
