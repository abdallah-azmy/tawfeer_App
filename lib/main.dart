import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:provider/provider.dart';
import 'package:tawfeer/publaic/Complains.dart';
import 'package:tawfeer/visitor/VisitorBranches.dart';
import 'package:tawfeer/visitor/VisitorDepts.dart';
import 'package:tawfeer/visitor/VisitorHome.dart';
import 'package:tawfeer/visitor/VisitorOffers.dart';
import 'package:tawfeer/visitor/VisitorProductDetails.dart';
import 'package:tawfeer/visitor/VisitorProductSearch.dart';
import 'package:tawfeer/visitor/VisitorShop.dart';
import 'customer/Addresses.dart';
import 'customer/Branches.dart';
import 'publaic/ChangePassword.dart';
import 'customer/CommentOnProduct.dart';
import 'publaic/Terms.dart';
import 'customer/Depts.dart';
import 'customer/EditPersonalFile.dart';
import 'customer/Favorite.dart';
import 'customer/Language.dart';
import 'customer/LoyalityCard.dart';
import 'customer/Notifications.dart';
import 'customer/Offers.dart';
import 'customer/OrderDetails.dart';
import 'customer/Orders.dart';
import 'customer/Profile.dart';
import 'customer/AllCommentsOnProduct.dart';
import 'customer/ProductDetails.dart';
import 'customer/ProductSearch.dart';
import 'customer/Shop.dart';
import 'customer/Wallet.dart';
import 'publaic/Bloc/Counter.dart';
import 'publaic/Bloc/favouriteProducts.dart';
import 'publaic/ForgetPassword.dart';
import 'publaic/Login.dart';
import 'publaic/Register.dart';
import 'publaic/ActiveCode.dart';
import 'publaic/Splash.dart';
import 'publaic/WelcomePage.dart';
import 'customer/Home.dart';


void main() {
  runApp(EasyLocalization(
    child: MyApp(),
    supportedLocales: [Locale('ar', 'EG'), Locale('en', 'US')],
    path: 'assets/langs',
  ));
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _myAppState();
  }
}

class _myAppState extends State<MyApp> {
  static final navigatorKey = new GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
  }

  var _local = Locale('ar', 'EG');
  _setChangeLanguage(local) {
    _local = local;
    context.locale = _local;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counter()),
        ChangeNotifierProvider(create: (_) => FavouriteBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        title: 'tawfeer',
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: Locale('ar', 'EG'),
        onGenerateRoute: (RouteSettings routeSettings) {
          return PageRouteBuilder<dynamic>(
              settings: routeSettings,
              transitionDuration: const Duration(milliseconds: 300),
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) {
                return effectMap[PageTransitionType.rippleLeftDown](
                    Curves.linear, animation, secondaryAnimation, child);
              });
        },
        theme: ThemeData(
          primarySwatch: Colors.grey,
          cursorColor: Color(0xffe4aa69),
          focusColor: Color(0xffe4aa69),
          accentColor: Color(0xffe4aa69),
          primaryColor: Colors.grey,
          platform: TargetPlatform.android,
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          }),
        ),
        home: Splash(navigatorKey, _setChangeLanguage),
        routes: {
          "/splash": (BuildContext con) => Splash(navigatorKey, _setChangeLanguage),
          "/welcomePage": (BuildContext con) => WelcomePage(),
          "/login": (BuildContext con) => Login(_setChangeLanguage),
          "/ActiveCode": (BuildContext con) => ActiveCode(),
          "/register": (BuildContext con) => Register(),
          "/Conditions":(BuildContext con)=>Terms(),
          "/Complains":(BuildContext con)=>Complains(),
          "/forgetPassword": (BuildContext con) => ForgetPassword(),
          "/ChangePasswordPersonalFile":(BuildContext con)=>ChangePassword(),



          "/home": (BuildContext con) => Home(),
          "/shop":(BuildContext con)=>Shop(),
          "/productDetails":(BuildContext con)=>ProductDetails(),
          "/ProductAllComments":(BuildContext con)=>AllCommentsOnProduct(),
          "/CommentOnProduct":(BuildContext con)=>CommentOnProduct(),
          "/Offers":(BuildContext con)=>Offers(),
          "/Branches":(BuildContext con)=>Branches(),
          "/Favorite":(BuildContext con)=>Favorite(),
          "/Orders":(BuildContext con)=>Orders(),
          "/Addresses":(BuildContext con)=>Addresses(),
          "/PersonalFile":(BuildContext con)=>Profile(),
          "/EditPersonalFile":(BuildContext con)=>EditPersonalFile(),
          "/Wallet":(BuildContext con)=>Wallet(),
          "/LoyalityCard":(BuildContext con)=>LoyalityCard(),
          "/Language":(BuildContext con)=>Language(_setChangeLanguage),
          "/orderDetails":(BuildContext con)=>OrderDetails(),
          "/Depts":(BuildContext con)=>Depts(),
          "/notifications":(BuildContext con)=>Notifications(),
          "/productSearch":(BuildContext con)=>ProductSearch(),
//
//
          "/visitorHome":(BuildContext con)=>VisitorHome(),
          "/VisitorBranches":(BuildContext con)=>VisitorBranches(),
          "/VisitorDepts":(BuildContext con)=>VisitorDepts(),
          "/VisitorOffers":(BuildContext con)=>VisitorOffers(),
          "/VisitorProductDetails":(BuildContext con)=>VisitorProductDetails(),
          "/VisitorProductSearch":(BuildContext con)=>VisitorProductSearch(),
          "/VisitorShop":(BuildContext con)=>VisitorShop(),
        },
      ),
    );
  }
}
