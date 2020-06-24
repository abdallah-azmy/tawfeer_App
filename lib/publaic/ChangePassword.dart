import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tawfeer/publaic/constants/LabelTextField.dart';
import 'package:tawfeer/publaic/constants/LoadingDialog.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:tawfeer/publaic/constants/MyText.dart';


class ChangePassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _classState();
  }
}

class _classState extends State<ChangePassword> {
  GlobalKey<ScaffoldState> _scafold = new GlobalKey<ScaffoldState>();


  TextEditingController password = new TextEditingController();
  TextEditingController newPassword = new TextEditingController();
  TextEditingController confirmNewPassword = new TextEditingController();

  bool unVisiblePass = true;
  bool unVisibleNewPass = true;
  bool unVisibleConfirmPass = true;



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      backgroundColor: MyColors.white,
      key: _scafold,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 7,
        title: MyText(
          title: "${tr("changePassword")}",
          size: 17,
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                child: Icon(
              Icons.arrow_back_ios,
              size: 25,
            ))),
        backgroundColor: MyColors.white,
      ),
      bottomSheet: InkWell(
        onTap: () {},
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: MyColors.blue,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15))),
          child: Center(
            child: MyText(
              title: "${tr("save")}",
              color: MyColors.white,
              size: 17,
            ),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                LabelTextField(
                  label: "${tr("changePassword")}",
                  controller: password,
                  isPassword: unVisiblePass,
                  enableBorder: true,
                  suffix: InkWell(
                      onTap: () {
                        if (unVisiblePass = true){
                          setState(() {
                            unVisiblePass = false ;
                          });
                        }else{
                          setState(() {
                            unVisiblePass = true ;
                          });
                        }

                      }, child: Icon(Icons.remove_red_eye)),
                ),
                SizedBox(
                  height: 20,
                ),
                LabelTextField(
                  label: "${tr("newPassword")}",
                  controller: newPassword,
                  isPassword: unVisibleNewPass,
                  enableBorder: true,
                  suffix: InkWell(
                      onTap: () {
                        if (unVisibleNewPass = true){
                          setState(() {
                            unVisibleNewPass = false ;
                          });
                        }else{
                          setState(() {
                            unVisibleNewPass = true ;
                          });
                        }

                      }, child: Icon(Icons.remove_red_eye)),
                ),
                SizedBox(
                  height: 20,
                ),
                LabelTextField(
                  label: "${tr("confirm password")}",
                  controller: confirmNewPassword,
                  isPassword: unVisibleConfirmPass,
                  enableBorder: true,
                  suffix: InkWell(
                      onTap: () {
                        if (unVisibleConfirmPass = true){
                          setState(() {
                            unVisibleConfirmPass = false ;
                          });
                        }else{
                          setState(() {
                            unVisibleConfirmPass = true ;
                          });
                        }

                      }, child: Icon(Icons.remove_red_eye)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
