import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tawfeer/publaic/constants/LoadingDialog.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:tawfeer/publaic/constants/MyText.dart';


class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _classState();
  }
}

class _classState extends State<Profile> {
  GlobalKey<ScaffoldState> _scafold = new GlobalKey<ScaffoldState>();

  var _loading = false;

  @override
  void initState() {
    super.initState();
//    _setGetAdverts();
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

    return Scaffold(
      backgroundColor: MyColors.white,
      key: _scafold,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 7,
        title: MyText(
          title: "${tr("profile")}",
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
          child: ListView(
            children: <Widget>[
              Material(
                elevation: 7,
                child: Container(
                  margin:   const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          MyText(
                            title: "${tr("pubilcInfo")}",
                            size: 16,
                            color: MyColors.blackOpacity.withOpacity(.6),
                          ),
                          Spacer(),
                          InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed("/EditPersonalFile");
                              },
                              child: MyText(
                                title: "${tr("edit")}",
                                size: 16,
                                color: MyColors.blue,
                              )),
                        ],
                      ),
                      SizedBox(height: 20,),

                      MyText(
                        title: "${tr("name")}",
                        size: 16,
                        color: MyColors.blackOpacity.withOpacity(.4),
                      ),
                      MyText(
                        title: "Mahmoud",
                        size: 16,
                        color: MyColors.blackOpacity.withOpacity(.7),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Divider(color: MyColors.blackOpacity.withOpacity(.5),),
                      ),

                      MyText(
                        title: "${tr("mail")}",
                        size: 16,
                        color: MyColors.blackOpacity.withOpacity(.4),
                      ),
                      MyText(
                        title: "Mahmoud@example.com",
                        size: 16,
                        color: MyColors.blackOpacity.withOpacity(.7),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 10,),
              Material(
                elevation: 7,
                child: Container(
                  margin:   const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      MyText(
                        title: "${tr("securityInfo")}",
                        size: 16,
                        color: MyColors.blackOpacity.withOpacity(.7),
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: (){

                          Navigator.of(context).pushNamed("/ChangePasswordPersonalFile");
                        },
                        child: Container(
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(7),
                          border: Border.all(width: 1.5,color: MyColors.blue)),
                          child: Center(child: MyText(title: "${tr("changePassword")}",size: 15,color: MyColors.blue,),),
                        ),
                      )

                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
