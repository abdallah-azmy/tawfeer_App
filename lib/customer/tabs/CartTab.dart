import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:tawfeer/publaic/constants/LoadingDialog.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:tawfeer/publaic/constants/MyText.dart';
import '../../ListsAsBackEnd.dart';

class CartTab extends StatefulWidget {
  GlobalKey<ScaffoldState> _scafold;

  CartTab(this._scafold);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _classState();
  }
}

class _classState extends State<CartTab> {

  var _loading = false;
  var _numPro = 1;
  var totalPrice = 0 ;
  var num = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];


  @override
  void initState() {
    super.initState();
//    _setGetAdverts();
  }

  void _onDropDownItemSelected(int newValueSelected) {
    setState(() {
      _numPro = newValueSelected;
    });
  }

  calculate(index){
    setState(() {
      totalPrice = totalPrice + int.parse(productsInCart[index]["price"]);
    });
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 7,
        title: MyText(
          title: "${tr("cart")}",
          size: 17,
        ),
        backgroundColor: MyColors.white,
      ),
      bottomNavigationBar: productsInCart.length == null || productsInCart.length == 0
          ? Container(
        height: 1,

      )
          :Container(
        height: 55,
        color: MyColors.blue,
        child: Center(
          child: MyText(
            title: "${tr("continuePaying")}",
            size: 17,
            color: MyColors.white,
          ),
        ),
      ),
      body: Visibility(
        child: ListView(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height - 150,
              alignment: Alignment.center,
              child: LoadingDialog(widget._scafold).showLoadinView(),
            )
          ],
        ),
        visible: _loading,
        replacement: RefreshIndicator(
          backgroundColor: MyColors.white,
          onRefresh: () => _setGetAdverts(),
          child: productsInCart.length == null || productsInCart.length == 0
              ? Center(
            child: MyText(
              color: MyColors.Primary,
              alien: TextAlign.center,
              size: 16,
              title: "${tr("noProductsInCart")}",
            ),
          )
              : ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 15, top: 10),
                child: Row(
                  children: <Widget>[
                    MyText(
                      title: "${productsInCart.length}  ${tr("product")}",
                      size: 15,
                      color: MyColors.blackOpacity,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                ),
                child: Column(
                  children: List.generate(productsInCart.length, (index) {
                    calculate(index);
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Material(
                        elevation: 5,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  top: BorderSide(
                                      width: 1.5,
                                      color: Colors.grey.withOpacity(.5)),
                                  bottom: BorderSide(
                                      width: 1.5,
                                      color: Colors.grey.withOpacity(.5)))),
                          height: 170,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Stack(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  MyText(
                                    title: "${productsInCart[index]["dept"]}",
                                    size: 13,
                                    color:
                                        MyColors.blackOpacity.withOpacity(.4),
                                  ),
                                  MyText(
                                    title: "${productsInCart[index]["name"]}",
                                    size: 18,
                                    color: MyColors.blackOpacity,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      MyText(
                                        title:
                                            "${productsInCart[index]["price"]} ${tr("sar")}",
                                        size: 16,
                                        color: MyColors.blackOpacity,
                                      ),
                                      SizedBox(
                                        width: 40,
                                      ),
                                      MyText(
                                        title:
                                            "${productsInCart[index]["oldPrice"]} ${tr("sar")}",
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        height: 25,
                                        width: 47,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: MyColors.blackOpacity
                                                  .withOpacity(.2)),
                                        ),
                                        padding: EdgeInsets.all(1),
                                        child: DropdownButton<int>(
                                          isDense: true,
                                          items:
                                              num.map((int dropDownStringItem) {
                                            return DropdownMenuItem<int>(
                                              value: dropDownStringItem,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5),
                                                child: MyText(
                                                  title: "$dropDownStringItem",
                                                  size: 13,
                                                  color: MyColors.blackOpacity,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                          onChanged: (int newValueSelected) {
                                            // Your code to execute, when a menu item is selected from drop down
                                            _onDropDownItemSelected(
                                                newValueSelected);
                                          },
                                          value: _numPro,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 60,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (productsInCart[index]["fav"] ==
                                              "false") {
                                            setState(() {
                                              productsInCart[index]["fav"] =
                                                  "true";

                                              FavoriteProducts.add(products[index]);
                                            });
                                            print("liked");
                                          } else {
                                            setState(() {
                                              productsInCart[index]["fav"] =
                                                  "false";
                                              FavoriteProducts.remove(products[index]);
                                            });
                                            print("unliked");
                                          }
                                        },
                                        child: Container(
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                productsInCart[index]["fav"] ==
                                                        "true"
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color: MyColors.blackOpacity,
                                                size: 22,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              MyText(
                                                title: "${tr("addToFav")}",
                                                size: 15,
                                                color: MyColors.blackOpacity
                                                    .withOpacity(.4),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width: 1.5,
                                        color: MyColors.blackOpacity
                                            .withOpacity(.4),
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            totalPrice = 0 ;
                                            productsInCart.remove(productsInCart[index]);
                                          });

                                          print("remove $index");
                                        },
                                        child: Container(
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.delete_outline,
                                                color: MyColors.blackOpacity,
                                                size: 22,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              MyText(
                                                title: "${tr("delete")}",
                                                size: 15,
                                                color: MyColors.blackOpacity
                                                    .withOpacity(.4),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
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
                                      "${productsInCart[index]["image"][0]}",
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MyText(
                      title: "${tr("totalPrice")}",
                      size: 15,
                      color: MyColors.blackOpacity.withOpacity(.6),
                    ),
                    MyText(
                      title: "${totalPrice} ${tr("sar")}",
                      size: 15,
                      color: MyColors.blackOpacity,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    MyText(
                      title: "${tr("shippingGenre")}",
                      size: 15,
                      color: MyColors.blackOpacity.withOpacity(.6),
                    ),
                    MyText(
                      title: "20 ${tr("sar")}",
                      size: 15,
                      color: MyColors.blackOpacity,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
