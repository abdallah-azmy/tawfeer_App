import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tawfeer/publaic/constants/LoadingDialog.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:tawfeer/publaic/constants/MyText.dart';
import '../ListsAsBackEnd.dart';

class Favorite extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _classState();
  }
}

class _classState extends State<Favorite> {
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
      backgroundColor: MyColors.blackOpacity.withOpacity(.05),
      key: _scafold,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 7,
        title: MyText(
          title: "${tr("favorite")}",
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
          child: FavoriteProducts.length == null || FavoriteProducts.length == 0
              ? Center(
                  child: MyText(
                    color: MyColors.Primary,
                    alien: TextAlign.center,
                    size: 16,
                    title: "${tr("noProductsInFav")}",
                  ),
                )
              : ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: Column(
                        children:
                            List.generate(FavoriteProducts.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Material(
                              elevation: 5,
                              color: MyColors.white,
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            width: 1.5,
                                            color: Colors.grey.withOpacity(.5)),
                                        bottom: BorderSide(
                                            width: 1.5,
                                            color:
                                                Colors.grey.withOpacity(.5)))),
                                height: 170,
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Stack(
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 10,
                                        ),
                                        MyText(
                                          title:
                                              "${FavoriteProducts[index]["dept"]}",
                                          size: 13,
                                          color: MyColors.blackOpacity
                                              .withOpacity(.4),
                                        ),
                                        MyText(
                                          title:
                                              "${FavoriteProducts[index]["name"]}",
                                          size: 18,
                                          color: MyColors.blackOpacity,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            MyText(
                                              title:
                                                  "${FavoriteProducts[index]["price"]} ${tr("sar")}",
                                              size: 16,
                                              color: MyColors.blackOpacity,
                                            ),
                                            SizedBox(
                                              width: 40,
                                            ),
                                            MyText(
                                              title:
                                                  "${FavoriteProducts[index]["oldPrice"]} ${tr("sar")}",
                                              size: 15,
                                              line: TextDecoration.lineThrough,
                                              color: MyColors.blackOpacity
                                                  .withOpacity(.4),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        InkWell(
                                          onTap: (){
                                            productsInCart.add(FavoriteProducts[index]);

                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Icon(
                                                Icons.shopping_cart,
                                                size: 22,
                                                color: MyColors.blackOpacity
                                                    .withOpacity(.6),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              MyText(
                                                title: "${tr("addProToCard")}",
                                                size: 15,
                                                color: MyColors.blackOpacity
                                                    .withOpacity(.6),
                                              ),
                                              Spacer(),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    products[index]["fav"] = "false";
                                                    FavoriteProducts.removeAt(
                                                        index);

                                                  });

                                                  print("remove $index");
                                                },
                                                child: Container(
                                                  child: Row(
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.delete_outline,
                                                        color:
                                                            Colors.red,
                                                        size: 22,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      MyText(
                                                        title: "${tr("delete")}",
                                                        size: 15,
                                                        color: Colors.red,
                                                      ),
                                                      SizedBox(
                                                        width: 20,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Positioned(
                                      left: 10,
                                      top: 10,
                                      child: Container(
                                          height: 80,
                                          width: 80,
                                          child: Image.asset(
                                            "${FavoriteProducts[index]["image"][0]}",
                                            fit: BoxFit.fill,
                                          )),
                                    )
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
