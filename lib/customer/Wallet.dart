import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tawfeer/publaic/constants/LoadingDialog.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:tawfeer/publaic/constants/MyText.dart';

class Wallet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _classState();
  }
}

class _classState extends State<Wallet> {
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
          title: "${tr("wallet")}",
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
              title: "${tr("addCredit")}",
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
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      "images/walletback.png",
                      height: 250,
                      width: 320,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    MyText(
                      title: "${tr("availableCredit")}",
                      color: MyColors.blackOpacity,
                      size: 23,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MyText(
                          title: "199",
                          color: MyColors.blue,
                          size: 80,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            MyText(
                              title: "ريال",
                              color: MyColors.blackOpacity.withOpacity(.5),
                              size: 16,
                            ),
                            MyText(
                              title: "سعودي",
                              color: MyColors.blackOpacity.withOpacity(.5),
                              size: 16,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
