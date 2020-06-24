import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tawfeer/publaic/Bloc/Counter.dart';
import 'package:tawfeer/publaic/constants/GlobalState.dart';
import 'package:provider/provider.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';

class CartIcon extends StatefulWidget{
  GlobalKey<ScaffoldState> scafold;


  CartIcon(this.scafold);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _classState();
  }

}

class _classState extends State<CartIcon>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final counter = Provider.of<Counter>(context);
    return Visibility(
      child: Container(),
      visible: GlobalState.instance.get("user")==null||GlobalState.instance.get("user")=="null",
      replacement: InkWell(
        onTap: ()=>Navigator.of(widget.scafold.currentContext).pushNamed("/notifications"),
        child: Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 25),
                  child: Icon(
                    Icons.notifications_none,
                    size: 30,
                    color: MyColors.Primary,
                  ),
                ),
                Positioned(
                  right: 4,
                  top: 0,
                  child: Visibility(
                    visible: counter.count!=0,

                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.red,
                      child:
                      Center(child: Text("${counter.count}",style: TextStyle(fontSize: 8),)),
                    ),
                  ),
                )
              ],
            )
        ),
      ),
    );
  }

}