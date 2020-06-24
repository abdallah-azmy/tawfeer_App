import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tawfeer/publaic/constants/LoadingDialog.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:tawfeer/publaic/constants/MyText.dart';

import '../ListsAsBackEnd.dart';

class Branches extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _classState();
  }
}

class _classState extends State<Branches> {
  GlobalKey<ScaffoldState> _scafold = new GlobalKey<ScaffoldState>();

  var _depts = [];
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
      appBar:PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width,80),
        child: SafeArea(
          child: Material(
            color: MyColors.white,
            elevation: 7,
            child: Padding(
              padding: const EdgeInsets.only(top: 15,right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 25,
                        color: MyColors.Primary,
                      ),
                    )),
                SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    MyText(
                      title: "${tr("branches")}",
                      size: 20,
                      color: MyColors.Primary,
                    ),
                    MyText(
                      title: "${offers.length} ${tr("branches in kingdom")}",
                      size: 17,
                      color: MyColors.blue,
                    ),
                  ],
                ),
              ],),
            ),
          ),
        ),



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
            replacement: branches.length == null || branches.length == 0
                ? Center(
                    child: MyText(
                      color: MyColors.Primary,
                      alien: TextAlign.center,
                      size: 16,
                      title: "${tr("no branches")}",
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ListView(
                      children: List.generate(branches.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Material(
                            elevation: 4,
                            child: Container(
//                                height: 300,
                                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 25),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: MyColors.white,
                                    border: Border(
                                      top: BorderSide(
                                          width: 1.5,
                                          color: MyColors.blackOpacity
                                              .withOpacity(.2)),
                                      bottom: BorderSide(
                                          width: 1.5,
                                          color: MyColors.blackOpacity
                                              .withOpacity(.07)),
                                    )),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[

                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                      Icon(Icons.place,size: 25,color: MyColors.blackOpacity,),
                                      SizedBox(width: 20,),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          MyText(
                                            title: "${tr("branche")} ${branches[index]["branchName"]}",
                                            size: 19,
                                            color: MyColors.blackOpacity,
                                          ),
                                          SizedBox(height: 2,),
                                          MyText(
                                            title: "${branches[index]["address"]}",
                                            size: 14,
                                            color: MyColors.blackOpacity.withOpacity(.5),
                                          ),
                                        ],
                                      ),
                                    ],),
                                    SizedBox(height: 10,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(Icons.access_time,size: 25,color: MyColors.blackOpacity,),
                                        SizedBox(width: 20,),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            MyText(
                                              title: "${tr("work time")}",
                                              size: 19,
                                              color: MyColors.blackOpacity,
                                            ),
                                            SizedBox(height: 2,),
                                            MyText(
                                              title: "من ${branches[index]["startTime"]} الي ${branches[index]["endTime"]}",
                                              size: 14,
                                              color: MyColors.blackOpacity.withOpacity(.5),
                                            ),
                                          ],
                                        ),
                                      ],),
                                    SizedBox(height: 10,),
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(Icons.phone,size: 25,color: MyColors.blackOpacity,),
                                        SizedBox(width: 20,),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            MyText(
                                              title: "${tr("branch number")}",
                                              size: 19,
                                              color: MyColors.blackOpacity,
                                            ),
                                            SizedBox(height: 2,),
                                            MyText(
                                              title: "${branches[index]["number"]}",
                                              size: 14,
                                              color: MyColors.blackOpacity.withOpacity(.5),
                                            ),
                                          ],
                                        ),
                                      ],),
                                ],)),
                          ),
                        );
                      }),
                    ),
                  )),
      ),
    );
  }
}
