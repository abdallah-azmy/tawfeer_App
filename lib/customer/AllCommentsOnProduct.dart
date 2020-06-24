import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tawfeer/publaic/constants/LoadingDialog.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:tawfeer/publaic/constants/MyText.dart';
import '../ListsAsBackEnd.dart';

class AllCommentsOnProduct extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _classState();
  }
}

class _classState extends State<AllCommentsOnProduct> {
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
        appBar: PreferredSize(
          preferredSize: Size(
            MediaQuery.of(context).size.width,
            80,
          ),
          child: SafeArea(
            child: Material(
              color: MyColors.white,
              elevation: 15,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Container(
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 25,
                              color: MyColors.Primary,
                            ),
                          ),
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        MyText(
                          title: "التقييمات",
                          size: 18,
                          color: MyColors.Primary,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        MyText(
                          title: "4.5 متوسط التقييمات",
                          size: 15,
                          color: MyColors.Primary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.grey.withOpacity(.1),
        floatingActionButton: FloatingActionButton(
          backgroundColor: MyColors.blue,
          onPressed: () {

            Navigator.of(context).pushNamed("/CommentOnProduct");
          },
          child: Center(
            child: Icon(
              Icons.add,
              size: 35,
              color: MyColors.white,
            ),
          ),
        ),
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
            replacement:  comments.length == null || comments.length == 0
                ? Center(
              child: MyText(
                color: MyColors.Primary,
                alien: TextAlign.center,
                size: 16,
                title: "لا يوجد تعليقات علي المنتج",
              ),
            )
                :ListView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              children: List.generate(comments.length, (index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: 280,
                    margin: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                    decoration: BoxDecoration(
                      color: MyColors.white,
                      borderRadius: BorderRadius.circular(7),
                      boxShadow: [
                        BoxShadow(
                          color: MyColors.blackOpacity.withOpacity(.4),
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                          offset: Offset(
                              2.0, 2.0), // shadow direction: bottom right
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            MyText(
                              title: "${comments[index]["name"]}",
                              color: MyColors.blackOpacity,
                              size: 16,
                            ),
                            Spacer(),
                            SmoothStarRating(
                              color: MyColors.gold,
                              size: 17,
                              starCount: 5,
                              borderColor: Colors.grey.withOpacity(.4),
                              spacing: 2,
                              rating:
                                  double.parse("${comments[index]["rate"]}"),
                            ),
                          ],
                        ),
                        MyText(
                          title: "${comments[index]["comment"]}",
                          color: MyColors.blackOpacity.withOpacity(.4),
                          size: 13,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ));
  }
}
