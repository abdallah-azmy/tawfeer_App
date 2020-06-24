import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tawfeer/publaic/constants/LoadingDialog.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:tawfeer/publaic/constants/MyText.dart';

import '../ListsAsBackEnd.dart';

class Notifications extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _classState();
  }
}

class _classState extends State<Notifications> {
  GlobalKey<ScaffoldState> _scafold = new GlobalKey<ScaffoldState>();


  var _loading = false;

  @override
  void initState() {
    super.initState();
    _setGetAdverts();
  }

  _setGetAdverts() async {
//    var _user=json.decode(GlobalState.instance.get("user"));
//    var body={
//      "user_id":"${_user["user_id"]}",
//      "lang":"${GlobalState.instance.get("lang")}"
//    };
//    var _data=await Http(_scafold).get("Client/GetNotification", body, context);
//    if(_data!=null){
//      _shops=_data["data"];
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

        appBar: AppBar(
          title: MyText(
            title: "${tr("notifications")}",
            size: 18,
            color: MyColors.Primary,
          ),
          backgroundColor: MyColors.white,
          elevation: 15,
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
        backgroundColor: Colors.grey.withOpacity(.1),
        body: RefreshIndicator(
          backgroundColor: MyColors.Primary,
          onRefresh: () => _setGetAdverts(),
          child: Visibility(
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
            replacement: notificatione.length == null || notificatione.length == 0
                ? Center(
              child: MyText(
                color: MyColors.Primary,
                alien: TextAlign.center,
                size: 16,
                title: "لا يوجد اشعارات",
              ),
            )
                : ListView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              children: List.generate(notificatione.length, (index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Material(
                    elevation: 7,
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      height: 40,
                      margin: EdgeInsets.symmetric(vertical: 7),
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.notifications,
                            color: MyColors.blue,
                            size: 25,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          MyText(
                            title: "${notificatione[index]["notification"]}",
                            color: MyColors.blackOpacity.withOpacity(.8),
                            size: 13,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ));
  }
}
