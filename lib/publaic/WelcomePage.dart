import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:tawfeer/publaic/constants/MyText.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _welcomePage();
  }
}

class _welcomePage extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scafold = new GlobalKey<ScaffoldState>();

  ValueNotifier _notifier = new ValueNotifier<int>(0);
  PageController _controller;
//  var _welcomeData;

  @override
  void initState() {
    super.initState();
//    _welcomeData=json.decode(GlobalState.instance.get("splashData"));
    _controller = new PageController(initialPage: 0);
  }

  _setChangePage(val) {
    _notifier.value = val;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      key: _scafold,
      backgroundColor: MyColors.white,
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (val) => _setChangePage(val),
        children: <Widget>[
          Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 200,
                    width: 250,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/welcome1.png"),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: MyText(
                      title:
                          "هذا النص هو مثال لنص يمكن ان يستبدل من مولد النصوص في نفس المساحة",
                      size: 14,
                      alien: TextAlign.center,
                      color: MyColors.blue,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: PageViewIndicator(
                      pageIndexNotifier: _notifier,
                      length: 3,
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 5),
                      normalBuilder: (animationController, index) => Circle(
                        size: 8.0,
                        color: MyColors.blue,
                      ),
                      highlightedBuilder: (animationController, index) =>
                          ScaleTransition(
                        scale: CurvedAnimation(
                          parent: animationController,
                          curve: Curves.ease,
                        ),
                        child: Circle(
                          size: 14.0,
                          color: MyColors.gold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      _controller.animateToPage(2,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeOut);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: MyText(
                        title: "تخطي",
                        size: 18,
                        color: MyColors.blue,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _controller.animateToPage(1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeOut);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: MyText(
                        title: "استمرار",
                        size: 18,
                        color: MyColors.blue,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 250,
                    width: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/welcome2.png"),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: MyText(
                      title:
                          "هذا النص هو مثال لنص يمكن ان يستبدل من مولد النصوص في نفس المساحة",
                      size: 14,
                      alien: TextAlign.center,
                      color: MyColors.blue,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: PageViewIndicator(
                      pageIndexNotifier: _notifier,
                      length: 3,
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 5),
                      normalBuilder: (animationController, index) => Circle(
                        size: 8.0,
                        color: MyColors.blue,
                      ),
                      highlightedBuilder: (animationController, index) =>
                          ScaleTransition(
                        scale: CurvedAnimation(
                          parent: animationController,
                          curve: Curves.ease,
                        ),
                        child: Circle(
                          size: 14.0,
                          color: MyColors.gold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      _controller.animateToPage(2,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeOut);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: MyText(
                        title: "تخطي",
                        size: 18,
                        color: MyColors.blue,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      _controller.animateToPage(2,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeOut);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: MyText(
                        title: "استمرار",
                        size: 18,
                        color: MyColors.blue,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Scaffold(
            body: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 230,
                    width: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/welcome3.png"),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 50),
                    child: MyText(
                      title:
                          "هذا النص هو مثال لنص يمكن ان يستبدل من مولد النصوص في نفس المساحة",
                      size: 14,
                      alien: TextAlign.center,
                      color: MyColors.blue,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: PageViewIndicator(
                      pageIndexNotifier: _notifier,
                      length: 3,
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 5),
                      normalBuilder: (animationController, index) => Circle(
                        size: 8.0,
                        color: MyColors.blue,
                      ),
                      highlightedBuilder: (animationController, index) =>
                          ScaleTransition(
                        scale: CurvedAnimation(
                          parent: animationController,
                          curve: Curves.ease,
                        ),
                        child: Circle(
                          size: 14.0,
                          color: MyColors.gold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed("/visitorHome");

                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: MyText(
                        title: "تصفح اولا",
                        size: 18,
                        color: MyColors.blue,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed("/login");
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: MyText(
                        title: "تسجيل",
                        size: 18,
                        color: MyColors.blue,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
