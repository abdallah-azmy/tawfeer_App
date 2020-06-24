//import 'dart:convert';
//
//import 'package:easy_localization/easy_localization.dart';
//import 'package:flutter/material.dart';
//import 'package:http/http.dart'as http;
//import 'package:dio/dio.dart';
//
//import 'LoadingDialog.dart';
//
//
//class Http{
//
//  var _scafold;
//  String baseUrl="https://pik.4hoste.com/";
//
//
//  Http(this._scafold);
//
//
//
//  post(url,body,context)async{
//    LoadingDialog(_scafold).showDilaog();
//    var response = await http.post("$baseUrl$url",body: body);
//    if(response.statusCode==200){
//      var data=json.decode(response.body);
//      print(data);
//      if(data["key"]==1){
//        Navigator.of(context).pop();
//        LoadingDialog(_scafold).showNotification(data["msg"].toString());
//        return data;
//      }else{
//        Navigator.of(context).pop();
//        LoadingDialog(_scafold).showNotification("${data["msg"].toString()}");
//      }
//    }else{
//      Navigator.of(context).pop();
//       LoadingDialog(_scafold).showNotification("${tr("chickNet")}");
//    }
//
//    return null;
//
//  }
//
//  get(url,body,context,{close=false})async{
//    var response = await http.post("$baseUrl$url",body: body);
//    if(close){
//      Navigator.of(context).pop();
//    }
//    if(response.statusCode==200){
//      var data=json.decode(response.body);
//      print(data);
//      if(data["key"]==1){
//        return data;
//      }else{
//         LoadingDialog(_scafold).showNotification(data["msg"].toString());
//      }
//    }else{
//       LoadingDialog(_scafold).showNotification("${tr("chickNet")}");
//    }
//    return null;
//  }
//
//  uploadFile(url,Map<String,dynamic> body,context)async{
//    LoadingDialog(_scafold).showDilaog();
//    FormData formData = new FormData();
//
//    body.forEach((key,val){
//      formData.add("$key", val);
//    });
//
//    var response = await Dio().post("$baseUrl$url", data: formData,
//        options: Options(
//          method: 'POST',
//          responseType: ResponseType.json , // or ResponseType.JSON
//        ));
//    print(response.data);
//
//    if(response.statusCode==200){
//      var data=response.data;
//      if(data["key"]==1){
//        Navigator.of(context).pop();
//        return data;
//      }else{
//        Navigator.of(context).pop();
//        LoadingDialog(_scafold).showNotification(data["msg"]);
//      }
//    }else{
//      Navigator.of(context).pop();
//      LoadingDialog(_scafold).showNotification("${tr("chickNet")}");
//    }
//  }
//
//
//}