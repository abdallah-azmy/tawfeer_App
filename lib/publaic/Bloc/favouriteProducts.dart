import 'package:flutter/widgets.dart';

class FavouriteBloc with ChangeNotifier{

  var fav=[];

  setFav(val){
    fav=val;
    notifyListeners();
  }
  changeFav(index)async{

    fav[index]["favourite"]=!fav[index]["favourite"];
    notifyListeners();
  }
  removeFav(index){
    fav.removeAt(index);
    notifyListeners();
  }


}