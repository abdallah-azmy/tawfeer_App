
import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier {
  int _count = 0;
  bool _lang=false;

  int get count => _count;
  bool get lang => _lang;

  void increment() {
    _count++;
    notifyListeners();
  }
  void decrement() {
    _count--;
    notifyListeners();
  }

  void setValue(val) {
    _count=val;
    notifyListeners();
  }

  void changeLang(val) {
    _lang=val;
    notifyListeners();
  }
}