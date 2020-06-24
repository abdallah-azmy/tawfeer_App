import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tawfeer/publaic/constants/LoadingDialog.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:tawfeer/publaic/constants/MyText.dart';
import '../ListsAsBackEnd.dart';

class Addresses extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _classState();
  }
}

class _classState extends State<Addresses> {
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
          title: "${tr("addresses")}",
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
          child: addresses.length == null || addresses.length == 0
              ? Center(
            child: MyText(
              color: MyColors.Primary,
              alien: TextAlign.center,
              size: 16,
              title: "${tr("noAddresses")}",
            ),
          )
              : ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                ),
                child: Column(
                  children: List.generate(addresses.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Material(
                        elevation: 5,
                        color: MyColors.whiteGrey.withOpacity(.7),
                        borderRadius: BorderRadius.circular(7),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                  width: 1.5,
                                  color: Colors.grey.withOpacity(.5))),
                          width: MediaQuery.of(context).size.width - 50,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Stack(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.place,size: 20,color: MyColors.blackOpacity.withOpacity(.5),),
                                      SizedBox(width: 10,),
                                      MyText(
                                        title:
                                        "${tr("nameOfAddress")}",
                                        size: 15,
                                        color: MyColors.blackOpacity
                                            .withOpacity(.6),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  MyText(
                                    title:
                                    "${addresses[index]["addressName"]}",
                                    size: 16,
                                    color: MyColors.blackOpacity
                                        .withOpacity(.8),
                                  ),

                                  MyText(
                                    title:
                                    "${addresses[index]["country"]}",
                                    size: 16,
                                    color: MyColors.blackOpacity
                                        .withOpacity(.8),
                                  ),

                                  SizedBox(
                                    height: 7,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
