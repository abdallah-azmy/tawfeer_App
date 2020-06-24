import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tawfeer/publaic/Bloc/Counter.dart';
import 'package:tawfeer/publaic/constants/LoadingDialog.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:tawfeer/publaic/constants/MyText.dart';
import 'package:provider/provider.dart';


class Language extends StatefulWidget {
  Function func;

  Language(this.func);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _classState();
  }
}

class _classState extends State<Language> {
  GlobalKey<ScaffoldState> _scafold = new GlobalKey<ScaffoldState>();

  var _loading = false;

  bool arabicCheck = true;
  bool englishCheck = false;

  @override
  void initState() {
    super.initState();
//    _setGetAdverts();
    retriveLanguage();
  }

  retriveLanguage()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang =  prefs.getString('lang');
    if(lang == "ar"){
      setState(() {
        arabicCheck = true;
        englishCheck = false;
      });
    }else if (lang == "en"){
      setState(() {
        englishCheck = true;
        arabicCheck = false;

      });
    }else{
      setState(() {
        arabicCheck = !arabicCheck;
        englishCheck = !englishCheck;
      });
    }
  }

  _setGetAdverts() async {
//    var _user=json.decode(GlobalState.instance.get("user"));
//    var body={
//      "user_id":"${_user["user_id"]}",
//      "lang":"${GlobalState.instance.get("lang")}"
//    };
//    var _data=await Http(widget._scafold).get("Client/GetFavouritMarkets", body, context);
//    if(_data!=null){
//      _shops=_data["markets"];
//    }
//    _loading=false;
//    setState(() {
//
//    });
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    _setRefrshData();


    print("neeeeeeeeeeeeeeeeeeeeeeeeeeew");

    return Scaffold(
      backgroundColor: MyColors.white,
      key: _scafold,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 7,
        title: MyText(
          title: "${tr("Language")}",
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
        onTap: () async{
          SharedPreferences prefs = await SharedPreferences.getInstance();
          if(arabicCheck == true) {
            widget.func(Locale('ar', 'EG'));

            await prefs.setString("lang", "ar");
          }else if (englishCheck == true){

            widget.func(Locale('en', 'US'));
            await prefs.setString("lang", "en");
          }
        },
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
      body: Visibility(
        child: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 150,
              alignment: Alignment.center,
              child: LoadingDialog(_scafold).showLoadinView(),
            )
          ],
        ),
        visible: _loading,
        replacement: RefreshIndicator(
          backgroundColor: MyColors.white,
          onRefresh: () => _setGetAdverts(),
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    onTap: ()async{

                      setState(() {
                        arabicCheck = !arabicCheck;
                        englishCheck = !englishCheck;
                      });

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.flag,
                          size: 25,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        MyText(
                          title: "العربية",
                          size: 18,
                          color: MyColors.blackOpacity,
                        ),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: arabicCheck == true ? MyColors.blue : MyColors.white,
                              border:
                                  Border.all(width: 1.5, color: MyColors.blue)),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: arabicCheck
                                ? Icon(
                                    Icons.check,
                                    size: 17.0,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    null,
                                    size: 17.0,
                                    color: Colors.white,
                                  ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Divider(color: MyColors.blackOpacity.withOpacity(.6),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: InkWell(
                    onTap: ()async{

                      setState(() {
                        englishCheck = !englishCheck;
                        arabicCheck = !arabicCheck;
                      });

                      final language = Provider.of<Counter>(context);
                      language.changeLang(true);

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.flag,
                          size: 25,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        MyText(
                          title: "English",
                          size: 18,
                          color: MyColors.blackOpacity,
                        ),
                        Spacer(),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: englishCheck == true ? MyColors.blue : MyColors.white,
                              border:
                              Border.all(width: 1.5, color: MyColors.blue)),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: englishCheck
                                ? Icon(
                              Icons.check,
                              size: 17.0,
                              color: Colors.white,
                            )
                                : Icon(
                              null,
                              size: 17.0,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Divider(color: MyColors.blackOpacity.withOpacity(.6),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
