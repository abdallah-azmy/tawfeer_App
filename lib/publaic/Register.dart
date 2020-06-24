import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tawfeer/publaic/constants/LabelTextField.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:tawfeer/publaic/constants/MyText.dart';
import 'constants/LoadingDialog.dart';

class Register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _classState();
  }
}

class _classState extends State<Register> {
  GlobalKey<ScaffoldState> _scafold = new GlobalKey<ScaffoldState>();

  bool terms = false;
  bool _showPassword = false;
  bool _showConfPassword = false;
  TextEditingController _name = new TextEditingController();
  TextEditingController _phone = new TextEditingController();
  TextEditingController _mail = new TextEditingController();
  TextEditingController _pass = new TextEditingController();
  TextEditingController _conf = new TextEditingController();




  _setRegisterUser() async {
    if (_name.text.trim().isEmpty ||
        _phone.text.trim().isEmpty ||
        _mail.text.trim().isEmpty ||
        _pass.text.trim().isEmpty ||
        _conf.text.trim().isEmpty) {
      LoadingDialog(_scafold)
          .showNotification("${tr("من فضلك ادخل جميع البيانات")}");
      return;
    } else if (_pass.text != _conf.text) {
      LoadingDialog(_scafold)
          .showNotification("${tr("خطأ في تأكيد كلمة المرور")}");
      return;
    }

    if (!terms) {
      LoadingDialog(_scafold).showNotification("${tr("acceptTerms")}");
      return;
    }

    Navigator.of(context).pushNamed("/vereficationCode");

  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return WillPopScope(
      onWillPop: () {
        Navigator.of(context)
            .pushNamedAndRemoveUntil("/login", (Route<dynamic> route) => false);
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
              onTap: () => Navigator.of(context).pushNamed("/login"),
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
                      title: "${tr("register")}",
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
                          height: 17,
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
                          height: 30,
                        ),
                        LabelTextField(
                          margin: EdgeInsets.symmetric(vertical: 7),
                          type: TextInputType.text,
                          label: "${tr("name")}",
                          isPassword: false,
                          controller: _name,
                          enableBorder: true,
                        ),
                        LabelTextField(
                          margin: EdgeInsets.symmetric(vertical: 7),
                          type: TextInputType.phone,
                          label: "${tr("phone")}",
                          isPassword: false,
                          controller: _phone,
                          enableBorder: true,
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
                        LabelTextField(
                          margin: EdgeInsets.symmetric(vertical: 7),
                          type: TextInputType.visiblePassword,
                          label: "${tr("confirmPassword")}",
                          isPassword: !this._showConfPassword,
                          controller: _conf,
                          enableBorder: true,
                          suffix: IconButton(
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: _showConfPassword ? Colors.blue : Colors.grey,
                            ),
                            onPressed: () {
                              setState(() =>
                                  this._showConfPassword = !this._showConfPassword);
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Checkbox(
                              value: terms,
                              checkColor: MyColors.gold,
                              activeColor: MyColors.blue,
                              onChanged: (bool newValue) {
                                setState(() {
                                  terms = newValue;
                                });
                                print("$newValue");
                              },
                            ),
                            MyText(
                              title: "${tr("iReadAndAgreed")}",
                              size: 14,
                              color: MyColors.Primary.withOpacity(.5),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            InkWell(
                              onTap: () {},
                              child: MyText(
                                title: "${tr("conditions")}",
                                size: 14,
                                line: TextDecoration.underline,
                                color: MyColors.blue,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () => _setRegisterUser(),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 45,
                            margin: EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                                color: MyColors.blue,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            alignment: Alignment.center,
                            child: MyText(
                              title: "${tr("register")}",
                              size: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),

                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              MyText(
                                title: "${tr("haveAccount")}",
                                size: 14,
                                color: MyColors.Primary.withOpacity(.3),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              InkWell(
                                onTap: () => Navigator.of(context)
                                    .pushNamed("/login"),
                                child: MyText(
                                  title: "${tr("login")}",
                                  size: 14,
                                  color: MyColors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15,)
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
