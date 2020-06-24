import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tawfeer/publaic/constants/GlobalState.dart';
import 'package:tawfeer/publaic/constants/LoadingDialog.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:tawfeer/publaic/constants/MyText.dart';

import '../ListsAsBackEnd.dart';

class OrderDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _classState();
  }
}

class _classState extends State<OrderDetails> {
  GlobalKey<ScaffoldState> _scafold = new GlobalKey<ScaffoldState>();

  var _loading = false;
  var orderIndex;

  bool ready = false;
  bool onWay = false;
  bool done = false;
  double rate = 0.0;

  @override
  void initState() {
    super.initState();
    _setGetOrderData();
  }

  _setGetOrderData() async {
    setState(() {
      orderIndex = int.parse("${GlobalState.instance.get("orderIndex")}");
    });

    if ("${orders[orderIndex]["state"]}" == "1") {
      setState(() {
        ready = true;
      });
    } else if ("${orders[orderIndex]["state"]}" == "2") {
      setState(() {
        onWay = true;
      });
    } else {
      setState(() {
        done = true;
      });
    }

  }

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
          title: "الطلبات",
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
              title: "تم استلام الطلب",
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
          onRefresh: () => _setGetOrderData(),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Material(
                    elevation: 5,
                    color: MyColors.whiteGrey.withOpacity(.7),
                    borderRadius: BorderRadius.circular(7),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(
                              width: 1.5, color: Colors.grey.withOpacity(.5))),
                      width: MediaQuery.of(context).size.width - 50,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Stack(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 7,
                              ),
                              MyText(
                                title:
                                    "تاريخ الطلب : ${orders[orderIndex]["dateOfOrder"]}",
                                size: 16,
                                color: MyColors.blackOpacity.withOpacity(.6),
                              ),
                              MyText(
                                title:
                                    "رقم الطلب : ${orders[orderIndex]["numOfOrder"]}",
                                size: 16,
                                color: MyColors.blackOpacity.withOpacity(.6),
                              ),
                              MyText(
                                title: "تفاصيل الطلب",
                                size: 17,
                                color: MyColors.blue,
                              ),
                              MyText(
                                title:
                                    "اسم العميل : ${orders[orderIndex]["userName"]}",
                                size: 16,
                                color: MyColors.blackOpacity.withOpacity(.6),
                              ),
                              MyText(
                                title:
                                    "طريقة الدفع : ${orders[orderIndex]["payingMethod"]}",
                                size: 16,
                                color: MyColors.blackOpacity.withOpacity(.6),
                              ),
                              MyText(
                                title:
                                    "الاجمالي : ${orders[orderIndex]["total"]}",
                                size: 16,
                                color: MyColors.blackOpacity.withOpacity(.6),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 7),
                                child: Divider(
                                  height: 1.5,
                                  color: MyColors.blackOpacity.withOpacity(.4),
                                ),
                              ),
                              MyText(
                                title: "شحنة 1 من 1",
                                size: 17,
                                color: MyColors.blue,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Container(
                                      height: 35,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 0),
                                      decoration: BoxDecoration(
                                          color: MyColors.white,
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 15, left: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(width: 1)),
                                              child: CircleAvatar(
                                                radius: 20,
                                                backgroundColor: ready == true
                                                    ? Colors.green
                                                    : Colors.white,
                                                child: Center(
                                                  child: MyText(
                                                    title: "1",
                                                    size: 18,
                                                    color:
                                                        MyColors.blackOpacity,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            MyText(
                                              title: "جاهز للشحن",
                                              color: MyColors.blackOpacity
                                                  .withOpacity(.5),
                                              size: 13,
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(width: 1)),
                                              child: CircleAvatar(
                                                radius: 20,
                                                backgroundColor: onWay == true
                                                    ? Colors.green
                                                    : Colors.white,
                                                child: Center(
                                                  child: MyText(
                                                    title: "2",
                                                    size: 18,
                                                    color:
                                                        MyColors.blackOpacity,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            MyText(
                                              title: "في الطريق",
                                              color: MyColors.blackOpacity
                                                  .withOpacity(.5),
                                              size: 13,
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(width: 1)),
                                              child: CircleAvatar(
                                                radius: 20,
                                                backgroundColor: done == true
                                                    ? Colors.green
                                                    : Colors.white,
                                                child: Center(
                                                  child: MyText(
                                                    title: "3",
                                                    size: 18,
                                                    color:
                                                        MyColors.blackOpacity,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 3,
                                            ),
                                            MyText(
                                              title: "تم تسليمه",
                                              color: MyColors.blackOpacity
                                                  .withOpacity(.5),
                                              size: 13,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      MyText(
                                        title: "${orders[orderIndex]["dept"]}",
                                        size: 13,
                                        color: MyColors.blackOpacity
                                            .withOpacity(.4),
                                      ),
                                      MyText(
                                        title: "${orders[orderIndex]["name"]}",
                                        size: 17,
                                        color: MyColors.blackOpacity,
                                      ),
                                      MyText(
                                        title:
                                            "${orders[orderIndex]["price"]} ${tr("sar")}",
                                        size: 16,
                                        color: MyColors.blackOpacity,
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Image(
                                    image: AssetImage(
                                        "${orders[orderIndex]["image"]}"),
                                    fit: BoxFit.fill,
                                    height: 100,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              MyText(
                                title: "تقييم المنتج",
                                size: 17,
                                color: MyColors.blue,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SmoothStarRating(
                                color: MyColors.gold,
                                size: 35,
                                starCount: 5,
                                borderColor: Colors.grey.withOpacity(.4),
                                spacing: 2,
                                rating: rate,
                                onRated: (val) {
                                  setState(() {
                                    rate = val;
                                  });
                                  print("$rate");
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
