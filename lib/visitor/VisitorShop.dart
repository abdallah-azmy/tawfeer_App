import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tawfeer/publaic/constants/GlobalState.dart';
import 'package:tawfeer/publaic/constants/LoadingDialog.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:tawfeer/publaic/constants/MyText.dart';
import '../ListsAsBackEnd.dart';

class VisitorShop extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _classState();
  }
}

class _classState extends State<VisitorShop> {
  GlobalKey<ScaffoldState> _scafold = new GlobalKey<ScaffoldState>();


  var _loading = false;
  var dept;

  @override
  void initState() {
    super.initState();
    _getDeptname();
  }

  _getDeptname() async {
    String deptId = "${GlobalState.instance.get("deptId")}";
    setState(() {
      dept = depts[int.parse(deptId)];
    });
//    var body = {
//      "user_id": "${_user["user_id"]}",
//      "market_id": "${GlobalState.instance.get("shopId")}",
//      "lang": "${GlobalState.instance.get("lang")}"
//    };
//    print(body);
//    var _data = await Http(_scafold)
//        .get("Client/MarketDetails", body, context);
//    if (_data != null) {
//      final fav = Provider.of<FavouriteBloc>(context);
//      fav.setFav(_data["data"]["prouducts"]);
//      _shopData = _data["data"];
//      _adverts=_shopData["imgs"];
//      _title = _shopData["name"];
//
//    }
//    _loading = false;
//    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      key: _scafold,
      backgroundColor: MyColors.blackOpacity.withOpacity(.05),
      appBar: AppBar(
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
        title: MyText(
          title: "${dept["name"]}",
          size: 19,
          color: MyColors.blackOpacity,
        ),
      ),


      body: RefreshIndicator(
        onRefresh: () => _getDeptname(),
        backgroundColor: MyColors.Primary,
        child: Visibility(
          child: Container(
            height: MediaQuery.of(context).size.height,
            alignment: Alignment.center,
            child: LoadingDialog(_scafold).showLoadinView(),
          ),
          visible: _loading,
          replacement: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 10,
            childAspectRatio: 8 / 11,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            children: List.generate(products.length, (index) {
              return InkWell(
                onTap: () {
                  GlobalState.instance.set(
                      "productId", "${products[index]["id"]}");
                  Navigator.of(context).pushNamed("/VisitorProductDetails");
                },
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(5),
                  color: MyColors.white,
                  child: Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                            color: MyColors.whiteGrey, width: 1.5)),
                    alignment: Alignment.center,
                    child: Stack(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Image(
                                image: AssetImage(
                                    "${products[index]["image"][1]}"),
                                fit: BoxFit.fill,
                                height: 100,
                              ),
                            ),

                            Row(
                              children: <Widget>[
                                MyText(
                                  title:
                                  "${products[index]["dept"]}",
                                  size: 13,
                                  color: MyColors.blackOpacity
                                      .withOpacity(.4),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.star,
                                  size: 18,
                                  color: MyColors.gold,
                                ),
                                MyText(
                                  title:
                                  "(${products[index]["rate"]})",
                                  size: 13,
                                  color: MyColors.blackOpacity
                                      .withOpacity(.4),
                                ),
                              ],
                            ),
                            MyText(
                              title: "${products[index]["name"]}",
                              size: 17,
                              color: MyColors.blackOpacity,
                            ),
//                            SizedBox(
//                              height: 2,
//                            ),
                            MyText(
                              title:
                              "العدد المتاح  ${products[index]["availableNum"]}",
                              size: 13,
                              color:
                              MyColors.blackOpacity.withOpacity(.4),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                MyText(
                                  title:
                                  "${products[index]["price"]} ${tr("sar")}",
                                  size: 16,
                                  color: MyColors.blackOpacity,
                                ),
                                Spacer(),
                                MyText(
                                  title:
                                  "${products[index]["oldPrice"]} ${tr("sar")}",
                                  size: 15,
                                  line: TextDecoration.lineThrough,
                                  color: MyColors.blackOpacity
                                      .withOpacity(.4),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          top: 5,
                          left: 5,
                          child: InkWell(
                            onTap: () {
                              if (products[index]["fav"] == "false") {
                                setState(() {
                                  products[index]["fav"] = "true";
                                  FavoriteProducts.add(products[index]);
                                });
                                print("liked");
                              } else {
                                setState(() {
                                  products[index]["fav"] = "false";
                                  FavoriteProducts.remove(products[index]);
                                });
                                print("unliked");
                              }
                            },
                            child: Icon(
                              products[index]["fav"] == "true"
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: MyColors.blackOpacity,
                              size: 22,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),

    );
  }
}
