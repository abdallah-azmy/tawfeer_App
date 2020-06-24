import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tawfeer/publaic/Bloc/Counter.dart';
import 'package:tawfeer/publaic/constants/LabelTextField.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:tawfeer/publaic/constants/MyText.dart';
import 'constants/GlobalState.dart';
import 'constants/LoadingDialog.dart';

class Login extends StatefulWidget {

  Function func;
  Login(this.func);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _classState();
  }
}

class _classState extends State<Login> {
  GlobalKey<ScaffoldState> _scafold = new GlobalKey<ScaffoldState>();



  TextEditingController _mail = new TextEditingController();
  TextEditingController _pass = new TextEditingController();

  bool _showPassword = false;

  var _lang;
  bool _chooseLang = false;
  String _showLang = "English";

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
        _chooseLang = false;
        _showLang= "English";
      });
    }else if (lang == "en"){
      setState(() {
        _chooseLang = true;
        _showLang= "عربي";
      });
    }else{
      setState(() {
        _chooseLang = false;
        _showLang= "English";
      });
    }
  }



  _setChangeLang(val) async {
    setState(() {});
    _lang = val;
    if(val=="ar"){
      widget.func(Locale('ar', 'EG'));
    }else{
      widget.func(Locale('en', 'US'));
    }
    final language = Provider.of<Counter>(context);
    language.changeLang(true);
  }

  _setSelectHome(context) {
    String mail = _mail.text;
    String pass = _pass.text;
    if (mail.trim().isEmpty) {
      LoadingDialog(_scafold)
          .showNotification("${tr("ادخل البريد الالكتروني")}");
      return;
    }
    if (pass.trim().isEmpty) {
      LoadingDialog(_scafold).showNotification("${tr("ادخل كلمة المرور")}");
      return;
    }

    GlobalState.instance.set("user", "thereIsUser");
    var test = GlobalState.instance.get("user");
    print("$test");
    Navigator.of(context)
        .pushNamedAndRemoveUntil("/home", (Route<dynamic> route) => false);
//    _setUserLogin(mail, pass);
  }

//  _setUserLogin(mail, pass) async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//     LoadingDialog(_scafold).showDilaog();
//    var _token = await _firebaseMessaging.getToken();
//    var _lang = GlobalState.instance.get("lang");
//    if (_lang == "null" || _lang == null) {
//      _lang = "ar";
//    }
//    var url = 'Client/sign_in';
//    var body = {
//      "phone": "$mail",
//      "password": "$pass",
//      "token": "$_token",
//      "lang": "$_lang",
//    };
//    print(body);
//
//    var _data =
//        await Http(_scafold).get("$url", body, context, close: true);
//    if (_data != null) {
//      if (_data["active_code"]) {
//        prefs.setString("user", json.encode(_data["data"]));
//        GlobalState.instance.set("user", json.encode(_data["data"]));
//        GlobalState.instance.set("lang", "${_data["data"]["lang"]}");
//        Navigator.of(context)
//            .pushNamedAndRemoveUntil("/home", (Route<dynamic> route) => false);
//      } else {
//        GlobalState.instance.set("user_id", "${_data["data"]["user_id"]}");
//        Navigator.of(_scafold.currentContext).pushNamed("/activeCode");
//      }
//    }
//  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushNamedAndRemoveUntil(
            "/selectLog", (Route<dynamic> route) => false);
        return;
      },
      child: Scaffold(
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
                      title: "${tr("login")}",
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
                          height: 60,
                        ),
                        LabelTextField(
                          margin: EdgeInsets.symmetric(vertical: 7),
                          type: TextInputType.emailAddress,
                          label: "${tr("mail")}",
                          isPassword: false,
                          controller: _mail,
                          enableBorder: true,
                        ),
                        LabelTextField(
                          margin: EdgeInsets.symmetric(vertical: 7),
                          type: TextInputType.visiblePassword,
                          label: "${tr("password")}",
                          isPassword: !this._showPassword,
                          controller: _pass,
                          enableBorder: true,
                          suffix: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: _showPassword ? Colors.blue : Colors.grey,
                            ),
                            onPressed: () {
                              setState(() =>
                                  this._showPassword = !this._showPassword);
                            },
                          ),
                        ),
                        InkWell(
                          onTap: () => _setSelectHome(context),
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
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              FlatButton(
                                onPressed: () => Navigator.of(context)
                                    .pushNamed("/forgetPassword"),
                                child: MyText(
                                  title: "${tr("forgetPassword")}",
                                  size: 14,
                                  color: MyColors.Primary,
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            MyText(
                              title: "${tr("haveNoAccount")}",
                              size: 14,
                              color: MyColors.Primary.withOpacity(.3),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            InkWell(
                              onTap: () => Navigator.of(context)
                                  .pushNamed("/register"),
                              child: MyText(
                                title: "${tr("register")}",
                                size: 14,
                                color: MyColors.blue,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 15,),


                        CupertinoSwitch(
                          value: _chooseLang,
                          onChanged: (val) async {
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            setState(() async{
                              _chooseLang = val;
                              _chooseLang
                                  ? _setChangeLang("en")
                                  : _setChangeLang("ar");
                              _chooseLang
                                  ? _showLang = "${tr("langAr")}"
                                  : _showLang = "${tr("langEn")}";
                              _chooseLang
                                  ? GlobalState.instance.set("lang", "en")
                                  : GlobalState.instance.set("lang", "ar");
                              _chooseLang
                                  ? await prefs.setString("lang", "en")
                                  : await prefs.setString("lang", "ar");
                            });
                          },
                          activeColor: MyColors.Primary,
                        ),
                        MyText(
                          title: '$_showLang',
                          color: Colors.black,
                          size: 12,
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
