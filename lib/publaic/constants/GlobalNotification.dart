//import 'dart:convert';
//
//
//import 'package:firebase_messaging/firebase_messaging.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//import 'package:pik/customer/Notifications.dart';
//
//import 'GlobalState.dart';
//
//class GlobalNotification {
//  final FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
//  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;
//  int _id = 0;
//  static GlobalKey<NavigatorState> navigatorKey;
//  Function reset=(){};
//  static GlobalNotification instance = new GlobalNotification._();
//  GlobalNotification._();
//
//  setupNotification({GlobalKey<NavigatorState> navKey,Function func}) {
//    navigatorKey=navKey;
//    reset=func;
//    _flutterLocalNotificationsPlugin=new FlutterLocalNotificationsPlugin();
//    var android=new AndroidInitializationSettings("@mipmap/launcher_icon");
//    var ios=new IOSInitializationSettings();
//    var initSettings=new InitializationSettings(android, ios);
//    _flutterLocalNotificationsPlugin.initialize(
//      initSettings,
//      onSelectNotification: onSelectNotification,
//    );
//    _firebaseMessaging.configure(
//      onMessage: (Map<String,dynamic>message){
//        _id+=1;
//        _showLocalNotification(message,_id);
//        print(message);
//        return;
//      },
//      onResume: (Map<String,dynamic>message){
//        _id+=1;
//        _showLocalNotification(message,_id);
//        print(message);
//        return;
//      },
//      onLaunch: (Map<String,dynamic>message){
//        _id+=1;
//        _showLocalNotification(message,_id);
//        print(message);
//        return;
//      },
//    );
//    _firebaseMessaging.getToken().then((token){
//      print(token);
//    });
//
//
//  }
//
//
//  _showLocalNotification(message,id)async{
//
//    var _count=int.parse(GlobalState.instance.get("count").toString());
//
//    GlobalState.instance.set("count", "${_count+1}");
//    reset();
//    var _notify=message["notification"];
//
//    // print(message);
//    var android=new AndroidNotificationDetails("${DateTime.now()}", "${_notify["title"]}", "${_notify["body"]}",
//        priority: Priority.High,importance: Importance.Max,playSound: true);
//    var ios=new IOSNotificationDetails();
//    var _platform=new NotificationDetails(android, ios);
//
//    _flutterLocalNotificationsPlugin.show(id, "pik", "${_notify["body"]}", _platform,payload: json.encode(message["data"]));
//
//  }
//
//  Future onSelectNotification(payload) async {
//
//    var obj=json.decode(payload);
//    print("payload $obj");
//
//    Future.delayed(Duration(seconds: 1),(){
//      GlobalState.instance.set("orderData", payload);
//      navigatorKey.currentState.push(
//          MaterialPageRoute(builder: (context) => Notifications())
//      );
////      if(obj["type"]=="1"){
////        navigatorKey.currentState.push(
////            MaterialPageRoute(builder: (context) => PayReservation())
////        );
////      }else if(obj["type"]=="6"){
////        navigatorKey.currentState.push(
////            MaterialPageRoute(builder: (context) => RateProvider())
////        );
////      }else{
////        navigatorKey.currentState.push(
////            MaterialPageRoute(builder: (context) => Notifications())
////        );
////      }
//
//
//
//    });
//
//  }
//}
