import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tawfeer/publaic/constants/GlobalState.dart';
import 'package:tawfeer/publaic/constants/LoadingDialog.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:tawfeer/publaic/constants/MyText.dart';
import '../ListsAsBackEnd.dart';

class VisitorProductDetails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _classState();
  }
}

class _classState extends State<VisitorProductDetails> {
  GlobalKey<ScaffoldState> _scafold = new GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> _sheetScafold = new GlobalKey<ScaffoldState>();


  var _product ;
  var _loading = false;

  @override
  void initState() {
    super.initState();
//    _user = json.decode(GlobalState.instance.get("user"));
    _setGetProductDetails();
  }

  _setShareShop(link) async {
    LoadingDialog(_scafold).showDilaog();
    await Share.share(link);
    Navigator.of(context).pop();
  }



  _setGetProductDetails() async {

    String productId = "${GlobalState.instance.get("productId")}";
    setState(() {
      _product = products[int.parse(productId)];
    });

  }





  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      key: _scafold,
      backgroundColor: MyColors.blackOpacity.withOpacity(.05),
      body: (_loading)
          ? ListView(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 150,
                  alignment: Alignment.center,
                  child: LoadingDialog(_scafold).showLoadinView(),
                )
              ],
            )
          : SafeArea(
              child: ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 15, bottom: 30),
                    color: MyColors.white,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: CarouselSlider(
                            height: 180.0,
                            aspectRatio: MediaQuery.of(context).size.width /
                                MediaQuery.of(context).size.height,
                            viewportFraction: 1.0,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 5),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 2000),
                            autoPlayCurve: Curves.easeInOutBack,
                            pauseAutoPlayOnTouch: Duration(seconds: 10),
                            enlargeCenterPage: true,
                            items: List.generate(_product["image"].length,
                                (index) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 140,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "${_product["image"][index]}"),
                                              fit: BoxFit.contain)),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    size: 25,
                                    color: MyColors.Primary,
                                  )),
                              Column(
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).pushReplacementNamed("/login");
                                    },
                                    child: Icon(
                                      _product["fav"] == "true"
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color:
                                          MyColors.blackOpacity.withOpacity(.7),
                                      size: 25,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  InkWell(
                                    onTap: () =>
                                        _setShareShop("${_product["site"]}"),
                                    child: Container(
                                      child: Icon(
                                        Icons.share,
                                        size: 25,
                                        color: MyColors.blackOpacity
                                            .withOpacity(.7),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              MyText(
                                title: "${_product["name"]}",
                                size: 20,
                                color: MyColors.blackOpacity,
                              ),
                              Spacer(),
                              Icon(
                                Icons.star,
                                size: 18,
                                color: MyColors.gold,
                              ),
                              MyText(
                                title: "(${_product["rate"]})",
                                size: 13,
                                color: MyColors.blackOpacity.withOpacity(.4),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          MyText(
                            title:
                            "${tr("longText")}",
                            size: 13,
                            color: MyColors.blackOpacity.withOpacity(.4),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              MyText(
                                title: "${_product["price"]} ${tr("sar")}",
                                size: 18,
                                color: MyColors.blackOpacity,
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              MyText(
                                title: "${_product["oldPrice"]} ${tr("sar")}",
                                size: 17,
                                line: TextDecoration.lineThrough,
                                color: MyColors.blackOpacity.withOpacity(.4),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: <Widget>[
                              MyText(
                                title: "${tr("storedState")}",
                                color: MyColors.blackOpacity.withOpacity(.8),
                                size: 17,
                              ),
                              MyText(
                                title: " / ${"available"}  ${_product["availableNum"]}",
                                color: Colors.green,
                                size: 17,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushReplacementNamed("/login");
                            },
                            child: Material(
                              elevation: 7,
                              borderRadius: BorderRadius.circular(50),
                              child: Container(
                                height: 47,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: MyColors.blue),
                                child: Center(
                                  child: MyText(
                                    title: "${tr("addToCart")}",
                                    color: MyColors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: <Widget>[
                              MyText(
                                title: "${tr("comments")}",
                                color: MyColors.blackOpacity,
                                size: 16,
                              ),
                              Spacer(),
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).pushReplacementNamed("/login");
                                },
                                child: MyText(
                                  title: "${tr("showAll")}",
                                  color: MyColors.blue,
                                  line: TextDecoration.underline,
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                  Container(
                      height: 140,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(comments.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              width: 280,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 0),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 7),
                              decoration: BoxDecoration(
                                color: MyColors.white,
                                borderRadius: BorderRadius.circular(7),
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        MyColors.blackOpacity.withOpacity(.4),
                                    blurRadius: 2.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(2.0,
                                        2.0), // shadow direction: bottom right
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
                                        borderColor:
                                            Colors.grey.withOpacity(.4),
                                        spacing: 2,
                                        rating: double.parse(
                                            "${comments[index]["rate"]}"),
                                      ),
                                    ],
                                  ),
                                  MyText(
                                    title: "${comments[index]["comment"]}",
                                    color:
                                        MyColors.blackOpacity.withOpacity(.4),
                                    size: 13,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      )),
                  SizedBox(
                    height: 14,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed("/login");
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Material(
                        elevation: 7,
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          height: 35,
                          width: MediaQuery.of(context).size.width * .7,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: MyColors.white),
                          child: Center(
                            child: MyText(
                              title: "${tr("addComment")}",
                              color: MyColors.blue,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10, right: 20, bottom: 15),
                    child: MyText(
                      title: "${tr("anotherProducts")}",
                      size: 16,
                      color: MyColors.blackOpacity,
                    ),
                  ),
                  Container(
                    height: 245,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(products.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: InkWell(
                            onTap: () {
                              GlobalState.instance
                                  .set("productId", "${products[index]["id"]}");
                              Navigator.of(context)
                                  .pushReplacementNamed("/VisitorProductDetails");
                            },
                            child: Material(
                              elevation: 5,
                              borderRadius: BorderRadius.circular(5),
                              color: MyColors.white,
                              child: Container(
//                          height: 225,
                                width: 160,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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

                                        MyText(
                                          title:
                                              "العدد المتاح  ${products[index]["availableNum"]}",
                                          size: 13,
                                          color: MyColors.blackOpacity
                                              .withOpacity(.4),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
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
                                          Navigator.of(context).pushReplacementNamed("/login");
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
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
    );
  }
}
