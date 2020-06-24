import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:tawfeer/publaic/constants/MyText.dart';


class MyAccount extends StatefulWidget {
  GlobalKey<ScaffoldState> _scafold;
  MyAccount(this._scafold);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _classState();
  }
}

class _classState extends State<MyAccount> {

  var language = "English";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    retriveLanguage();
  }


  retriveLanguage()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang =  prefs.getString('lang');
    if(lang == "ar"){
      setState(() {
        language = "English";
      });
    }else if (lang == "en"){
      setState(() {
        language = "العربية";
      });
    }else{
      setState(() {
        language = "English";
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    retriveLanguage();

    return Scaffold(
        backgroundColor: MyColors.blackOpacity.withOpacity(.08),
        appBar: PreferredSize(
          preferredSize: Size(
            MediaQuery.of(context).size.width,
            80,
          ),
          child: SafeArea(
            child: Material(
              elevation: 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/logo.png"),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      MyText(
                        title: "${tr("_welcome")} Mahmoud",
                        size: 18,
                        color: MyColors.blue,
                      ),
                      MyText(
                        title: "user@example.com",
                        size: 15,
                        color: MyColors.blackOpacity,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 25, top: 10, bottom: 7),
              child: MyText(
                title: "${tr("profile")}",
                size: 14,
                color: MyColors.blackOpacity.withOpacity(.7),
              ),
            ),
            Material(
              elevation: 7,
              color: MyColors.white,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("/Favorite");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.favorite_border,
                            size: 22,
                            color: MyColors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          MyText(
                            title: "${tr("favorite")}",
                            size: 15,
                            color: MyColors.blackOpacity,
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 22,
                            color: MyColors.blackOpacity.withOpacity(.6),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2, bottom: 2),
                      child: Divider(
                        color: MyColors.blackOpacity.withOpacity(.6),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("/Orders");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.crop_square,
                            size: 22,
                            color: MyColors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          MyText(
                            title: "${tr("orders")}",
                            size: 15,
                            color: MyColors.blackOpacity,
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 22,
                            color: MyColors.blackOpacity.withOpacity(.6),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2, bottom: 2),
                      child: Divider(
                        color: MyColors.blackOpacity.withOpacity(.6),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("/Addresses");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.place,
                            size: 22,
                            color: MyColors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          MyText(
                            title: "${tr("addresses")}",
                            size: 15,
                            color: MyColors.blackOpacity,
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 22,
                            color: MyColors.blackOpacity.withOpacity(.6),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2, bottom: 2),
                      child: Divider(
                        color: MyColors.blackOpacity.withOpacity(.6),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("/PersonalFile");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.person,
                            size: 22,
                            color: MyColors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          MyText(
                            title: "${tr("personalFile")}",
                            size: 15,
                            color: MyColors.blackOpacity,
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 22,
                            color: MyColors.blackOpacity.withOpacity(.6),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2, bottom: 2),
                      child: Divider(
                        color: MyColors.blackOpacity.withOpacity(.6),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("/Wallet");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.account_balance_wallet,
                            size: 22,
                            color: MyColors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          MyText(
                            title: "${tr("wallet")}",
                            size: 15,
                            color: MyColors.blackOpacity,
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 22,
                            color: MyColors.blackOpacity.withOpacity(.6),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2, bottom: 2),
                      child: Divider(
                        color: MyColors.blackOpacity.withOpacity(.6),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("/LoyalityCard");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.credit_card,
                            size: 22,
                            color: MyColors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          MyText(
                            title: "${tr("loyaltyCard")}",
                            size: 15,
                            color: MyColors.blackOpacity,
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 22,
                            color: MyColors.blackOpacity.withOpacity(.6),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, top: 10, bottom: 7),
              child: MyText(
                title: "${tr("settings")}",
                size: 14,
                color: MyColors.blackOpacity.withOpacity(.7),
              ),
            ),
            Material(
              elevation: 7,
              color: MyColors.white,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("/Language");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.outlined_flag,
                            size: 22,
                            color: MyColors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          MyText(
                            title: "${tr("Language")}",
                            size: 15,
                            color: MyColors.blackOpacity,
                          ),
                          Spacer(),
                          MyText(
                            title: "$language",
                            color: MyColors.blackOpacity.withOpacity(.6),
                            size: 14,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 22,
                            color: MyColors.blackOpacity.withOpacity(.6),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, top: 10, bottom: 7),
              child: MyText(
                title: "${tr("contactUs")}",
                size: 14,
                color: MyColors.blackOpacity.withOpacity(.7),
              ),
            ),
            Material(
              elevation: 7,
              color: MyColors.white,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("/Conditions");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.content_paste,
                            size: 22,
                            color: MyColors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          MyText(
                            title: "${tr("conditions")}",
                            size: 15,
                            color: MyColors.blackOpacity,
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 22,
                            color: MyColors.blackOpacity.withOpacity(.6),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2, bottom: 2),
                      child: Divider(
                        color: MyColors.blackOpacity.withOpacity(.6),
                      ),
                    ),
                    InkWell(
                      onTap: () {Navigator.of(context).pushNamed("/Complains");},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.phone,
                            size: 22,
                            color: MyColors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          MyText(
                            title: "${tr("complains")}",
                            size: 15,
                            color: MyColors.blackOpacity,
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 22,
                            color: MyColors.blackOpacity.withOpacity(.6),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 25, top: 20, bottom: 20),
              child: InkWell(
                onTap: (){

                  Navigator.pushNamedAndRemoveUntil(context, "/login", (Route route) => route.isFirst);
                },
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.power_settings_new,
                      color: MyColors.blackOpacity.withOpacity(.7),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    MyText(
                      title: "${tr("logout")}",
                      size: 14,
                      color: MyColors.blackOpacity.withOpacity(.7),
                    ),
                  ],
                ),
              ),
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
        ));
  }
}
