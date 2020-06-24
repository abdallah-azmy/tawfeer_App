import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  GlobalKey<NavigatorState> navigatorKey;
  Function func;
  Splash(this.navigatorKey, this.func);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _splashState();
  }
}

class _splashState extends State<Splash> {
  GlobalKey<ScaffoldState> _scafold = new GlobalKey<ScaffoldState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigateAfterSplash();
  }

  navigateAfterSplash() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _user = (prefs.getBool('user') ?? false);
    if (_user) {
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.of(context).pushReplacementNamed("/login");
      });
    } else {
      await prefs.setBool('user', true);
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.of(context).pushReplacementNamed("/welcomePage");
      });
    }

    String lang =  prefs.getString('lang');

    if(lang == "ar"){
      widget.func(Locale('ar', 'EG'));
    }else if (lang == "en"){
      widget.func(Locale('en', 'US'));
    }else{
      widget.func(Locale('ar', 'EG'));
    }

  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/splash.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
        child: Image(
          image: AssetImage("images/logoSplash.png"),
          fit: BoxFit.fill,
//            width: MediaQuery.of(context).size.width,
//            height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}

