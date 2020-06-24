import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tawfeer/publaic/constants/GlobalState.dart';
import 'package:tawfeer/publaic/constants/LoadingDialog.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:tawfeer/publaic/constants/MyText.dart';

import '../ListsAsBackEnd.dart';

class Offers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _classState();
  }
}

class _classState extends State<Offers> {
  GlobalKey<ScaffoldState> _scafold = new GlobalKey<ScaffoldState>();

  var _loading = false;

  @override
  void initState() {
    super.initState();
    _setGetAdverts();
  }

  _setGetAdverts() async {
//    var body={
//      "category_id":"${GlobalState.instance.get("dept_id")}",
//      "lang":"${GlobalState.instance.get("lang")}"
//    };
//
//    var _data=await Http(_scafold).get("Client/GetMarketsByCategory", body, context);
//    if(_data!=null){
//      _depts=_data["markets"];
//    }
//    _loading=false;
//    setState(() {
//
//    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      key: _scafold,
      backgroundColor: MyColors.blackOpacity.withOpacity(.05),
      appBar: AppBar(
        title: MyText(
          title: "${tr("offers")}",
          size: 18,
          color: MyColors.Primary,
        ),
        backgroundColor: MyColors.white,
        elevation: 10,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              child: Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: MyColors.Primary,
              ),
            )),
      ),

      body: RefreshIndicator(
        onRefresh: () => _setGetAdverts(),
        backgroundColor: MyColors.Primary,
        child: Visibility(
            child: Container(
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              child: LoadingDialog(_scafold).showLoadinView(),
            ),
            visible: _loading,
            replacement: offers.length == null || offers.length == 0
                ? Center(
                    child: MyText(
                      color: MyColors.Primary,
                      alien: TextAlign.center,
                      size: 16,
                      title: "لا يوجد عروض ترويجية",
                    ),
                  )
                : Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListView(
                      children: List.generate(offers.length, (index) {
                        return InkWell(
                          onTap: () {
                          GlobalState.instance.set(
                            "productId", "${products[index]["id"]}");
                  Navigator.of(context).pushNamed("/productDetails");
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Material(
                              elevation: 4,
                              child: Container(
                                height: 130,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: MyColors.white,
                                      border: Border(top: BorderSide(width: 1.5,color: MyColors.blackOpacity.withOpacity(.2)),
                                      bottom: BorderSide(width: 1.5,color: MyColors.blackOpacity.withOpacity(.07)),)
                                      ),
                                  child: Center(
                                    child: MyText(
                                      title: "${offers[index]["text"]}",
                                      size: 18,
                                      color: Colors.red,
                                      alien: TextAlign.center,
                                    ),
                                  )),
                            ),
                          ),
                        );
                      }),
                    ),
                )),
      ),
    );
  }
}
