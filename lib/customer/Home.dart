import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tawfeer/customer/tabs/MyAccount.dart';
import 'package:tawfeer/customer/tabs/CartTab.dart';
import 'package:tawfeer/customer/tabs/Main.dart';
import 'package:tawfeer/publaic/constants/GlobalState.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:tawfeer/publaic/constants/MyText.dart';


class Home extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _appDescrition();
  }
}

class _appDescrition extends State<Home> {
  GlobalKey<ScaffoldState> _scafold = new GlobalKey<ScaffoldState>();


  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _setIntialIndex();
  }

  _setIntialIndex() async {
    var selected = GlobalState.instance.get("index");
    if (selected != null) {
      setState(() {
        _currentIndex = int.parse(selected);
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> tabs = [
      Main(_scafold),
      CartTab(_scafold),
      MyAccount(_scafold),
    ];

    return WillPopScope(
        child: Scaffold(
          key: _scafold,
          backgroundColor: Colors.white,
          body: tabs[_currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(color: MyColors.white, boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 5.0,
              ),
            ]),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              iconSize: 30,
              backgroundColor: Colors.white,
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: MyColors.blue,
                  ),
                  title: Container(),
                  activeIcon: Container(
                    width: MediaQuery.of(context).size.width*.31,
                      decoration: BoxDecoration(
                          color: MyColors.blue.withOpacity(.2),
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.home,
                            color: MyColors.blue,
                          ),
                          SizedBox(width: 3,),
                          MyText(
                            title: "${tr("home")}",
                            size: 16,
                            color: MyColors.blue,
                          )
                        ],
                      )),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_cart,
                    color: MyColors.blue,
                    size: 28,
                  ),
                  title: Container(),
                  activeIcon: Container(
//                      width: MediaQuery.of(context).size.width*.3,
                      decoration: BoxDecoration(
                          color: MyColors.blue.withOpacity(.2),
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.shopping_cart,
                            color: MyColors.blue,
                            size: 28,
                          ),
                          SizedBox(width: 3,),
                          MyText(
                            title: "${tr("cart")}",
                            size: 16,
                            color: MyColors.blue,
                          )
                        ],
                      )),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: MyColors.blue,
                  ),
                  title: Container(),
                  activeIcon: Container(
                      width: MediaQuery.of(context).size.width*.3,
                      decoration: BoxDecoration(
                          color: MyColors.blue.withOpacity(.2),
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.person,
                            color: MyColors.blue,
                          ),
                          MyText(
                            title: "${tr("profile")}",
                            size: 16,
                            color: MyColors.blue,
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
//              drawer: MyDrawer(_scafold, widget.func),
        ),
        onWillPop: () async => false);
  }
}
