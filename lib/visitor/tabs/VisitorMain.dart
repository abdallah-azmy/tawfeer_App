import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tawfeer/publaic/Bloc/Counter.dart';
import 'package:tawfeer/publaic/constants/CartIcon.dart';
import 'package:tawfeer/publaic/constants/LoadingDialog.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:tawfeer/publaic/constants/MyText.dart';


class VisitorMain extends StatefulWidget {
  GlobalKey<ScaffoldState> _scafold;

  VisitorMain(this._scafold);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _classState();
  }
}

class _classState extends State<VisitorMain> {

  List<String> _adverts = [
    "images/panner.jpeg",
    "images/banner.png",
    "images/panner.jpeg",
    "images/banner.png",
  ];
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
//      "number_markets":"0",
//      "lang":"${GlobalState.instance.get("lang")}"
//    };
//    print(body);
//    var _data=await Http(widget._scafold).get("Client/Home", body, context);
//    if(_data!=null){
//      _adverts=_data["ads"];
//      _shops=_data["markets"];
//      final counter = Provider.of<Counter>(context);
//      counter.setValue(int.parse(_data["cart_count"].toString()));
//      _loading=false;
//      setState(() {
//
//      });
//
//    }
  }

  _setRefrshData(){
    final language = Provider.of<Counter>(context);
    if(language.lang){
      language.changeLang(false);
      // To get the english adverts when language changed //
      _setGetAdverts();
    }
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    _setRefrshData();
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          80,
        ),
        child: SafeArea(
          child: Material(
            elevation: 5,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/logo.png"),
                            fit: BoxFit.fill)),
                  ),
                ),
                Positioned(
                  left: 85,
                  top: 25,
                  child: InkWell(
                    onTap:(){
                      Navigator.of(context).pushNamed("/VisitorProductSearch");
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 15),
                      child: Icon(
                        Icons.search,
                        size: 30,
                        color: MyColors.Primary,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 25,
                  left: 0,
                  child: CartIcon(widget._scafold),
                )
              ],
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
              child: LoadingDialog(widget._scafold).showLoadinView(),
            )
          ],
        ),
        visible: _loading,
        replacement: RefreshIndicator(
          backgroundColor: MyColors.Primary,
          onRefresh: () => _setGetAdverts(),
          child: ListView(
            padding: EdgeInsets.only(top: 10),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                child: CarouselSlider(
                  height: 160.0,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.85,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.easeOutSine,
                  pauseAutoPlayOnTouch: Duration(seconds: 10),
                  enlargeCenterPage: true,
                  items: _adverts.map((obj) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: 140,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              image: DecorationImage(
                                  image: AssetImage(obj), fit: BoxFit.fill)),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  children: <Widget>[
                    InkWell(
                      onTap:(){
                        Navigator.of(context).pushNamed("/VisitorDepts");
                      },
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            height: 95,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      "images/dept1.png",
                                    ),
                                    fit: BoxFit.fill)),
                          ),
                          Positioned(
                            right: 70,
                            top: 50,
                            child: MyText(
                              title: "${tr("listOfTypes")}",
                              size: 20,
                              color: MyColors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed("/VisitorOffers");
                      },
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            height: 95,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      "images/dept2.png",
                                    ),
                                    fit: BoxFit.fill)),
                          ),
                          Positioned(
                            right: 70,
                            top: 50,
                            child: MyText(
                              title: "${tr("promotionalOffers")}",
                              size: 20,
                              color: MyColors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.of(context).pushNamed("/VisitorBranches");
                      },
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 15),
                            height: 95,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      "images/dept3.png",
                                    ),
                                    fit: BoxFit.fill)),
                          ),
                          Positioned(
                            right: 70,
                            top: 50,
                            child: MyText(
                              title: "${tr("branches")}",
                              size: 20,
                              color: MyColors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
