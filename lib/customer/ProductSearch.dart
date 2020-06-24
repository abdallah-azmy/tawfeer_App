import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tawfeer/publaic/constants/GlobalState.dart';
import 'package:tawfeer/publaic/constants/LoadingDialog.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:tawfeer/publaic/constants/MyText.dart';
import '../ListsAsBackEnd.dart';

class ProductSearch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _classState();
  }
}

class _classState extends State<ProductSearch> {
  GlobalKey<ScaffoldState> _scafold = new GlobalKey<ScaffoldState>();

  TextEditingController _search = new TextEditingController();

  var _searchProducts = products;
  var _loading = false;

  @override
  void initState() {
    super.initState();
    _setGetAdverts();

  }

  _setSearchFilter(val) {
    _searchProducts =
        products.where((x) => x["name"].toString().contains("$val")).toList();
    setState(() {});
  }

  _setGetAdverts() async {
//    var body={
//      "user_id":"0",
//      "number_markets":"0",
//      "lang":"${GlobalState.instance.get("lang")}"
//    };
//
//    var _data=await Http(_scafold).get("Client/Home", body, context);
//    if(_data!=null){
//      _shops=_data["markets"];
//      _searchShops=_data["markets"];
//      _loading=false;
//      setState(() {
//
//      });
//
//    }
  }





  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      key: _scafold,
      backgroundColor: MyColors.whiteGrey,
      appBar: AppBar(
        elevation: 7,
        backgroundColor: MyColors.white,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 40,
              width: MediaQuery.of(context).size.width - 100,
              child: TextFormField(
                controller: _search,
                onChanged: (val) => _setSearchFilter(val),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: MyColors.blackOpacity.withOpacity(.08),
                    labelText: "${tr("searchHere")}",
                    labelStyle: TextStyle(
                      fontFamily: 'cairo',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    suffixIcon: Icon(Icons.search)),
              ),
            ),
          ],
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
          replacement: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 10),
                child: Row(
                  children: <Widget>[
                    MyText(
                      title: "${tr("searchResults")}",
                      size: 15,
                      color: MyColors.blue,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 10,
                  childAspectRatio: 8 / 11,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  children: List.generate(_searchProducts.length, (index) {
                    return InkWell(
                      onTap: () {
                        GlobalState.instance.set(
                            "productId", "${products[index]["id"]}");
                  Navigator.of(context).pushNamed("/productDetails");
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
                                          "${_searchProducts[index]["image"][1]}"),
                                      fit: BoxFit.fill,
                                      height: 100,
                                    ),
                                  ),

                                  Row(
                                    children: <Widget>[
                                      MyText(
                                        title:
                                            "${_searchProducts[index]["dept"]}",
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
                                            "(${_searchProducts[index]["rate"]})",
                                        size: 13,
                                        color: MyColors.blackOpacity
                                            .withOpacity(.4),
                                      ),
                                    ],
                                  ),
                                  MyText(
                                    title: "${_searchProducts[index]["name"]}",
                                    size: 17,
                                    color: MyColors.blackOpacity,
                                  ),
//                            SizedBox(
//                              height: 2,
//                            ),
                                  MyText(
                                    title:
                                        "العدد المتاح  ${_searchProducts[index]["availableNum"]}",
                                    size: 13,
                                    color:
                                        MyColors.blackOpacity.withOpacity(.4),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      MyText(
                                        title:
                                            "${_searchProducts[index]["price"]} ${tr("sar")}",
                                        size: 16,
                                        color: MyColors.blackOpacity,
                                      ),
                                      Spacer(),
                                      MyText(
                                        title:
                                            "${_searchProducts[index]["oldPrice"]} ${tr("sar")}",
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
            ],
          ),
        ),
      ),
    );
  }
}
