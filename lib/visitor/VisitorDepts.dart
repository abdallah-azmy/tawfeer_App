import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tawfeer/publaic/constants/GlobalState.dart';
import 'package:tawfeer/publaic/constants/LoadingDialog.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:tawfeer/publaic/constants/MyText.dart';
import '../ListsAsBackEnd.dart';

class VisitorDepts extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _classState();
  }
}

class _classState extends State<VisitorDepts> {
  GlobalKey<ScaffoldState> _scafold = new GlobalKey<ScaffoldState>();


  var _loading = false;

  @override
  void initState() {
    super.initState();
    _setGetAdverts();
  }

  _setGetAdverts() async {
//     setState(() {
//      _loading = true;
//    });
//    var body = {"lang": "${GlobalState.instance.get("lang")}"};
//
//    var _data = await Http(widget._scafold)
//        .get("Client/GetAllCategories", body, context);
//    if (_data != null) {
//      _depts = _data["data"];
//      _sub = false;
//    }
//    _loading = false;
//    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    _setRefrshData();
    return Scaffold(
      key: _scafold,
      appBar: AppBar(
        title: MyText(
          title: "${tr("depts")}",
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
      backgroundColor: MyColors.blackOpacity.withOpacity(.05),
      body: Visibility(
        child: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: LoadingDialog(_scafold).showLoadinView(),
        ),
        visible: _loading,
        replacement: depts.length == null || depts.length == 0
            ? Center(
                child: MyText(
                  color: MyColors.Primary,
                  alien: TextAlign.center,
                  size: 16,
                  title: "${tr("noShops")}",
                ),
              )
            : RefreshIndicator(
                onRefresh: () => _setGetAdverts(),
                backgroundColor: MyColors.Primary,
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  childAspectRatio: 5 / 4,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  children: List.generate(depts.length, (index) {
                    return InkWell(
                      onTap: () {
                        GlobalState.instance
                            .set("deptId", "${depts[index]["id"]}");
                        Navigator.of(context).pushNamed("/VisitorShop");
                      },
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "${depts[index]["image"]}"))),
                          child: Center(
                            child: MyText(
                              title: "${depts[index]["name"]}",
                              size: 18,
                              color: MyColors.white,
                              alien: TextAlign.center,
                            ),
                          )),
                    );
                  }),
                ),
              ),
      ),
    );
  }
}
