import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:tawfeer/publaic/constants/MyColors.dart';
import 'package:tawfeer/publaic/constants/MyText.dart';
import 'package:tawfeer/publaic/constants/RichTextFiled.dart';
import '../ListsAsBackEnd.dart';

class CommentOnProduct extends StatefulWidget {
  @override
  _CommentOnProductState createState() => _CommentOnProductState();
}

class _CommentOnProductState extends State<CommentOnProduct> {
  double rate = 0.0;
  TextEditingController _comment = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blackOpacity.withOpacity(.05),
      appBar: AppBar(
        backgroundColor: MyColors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            size: 25,
          ),
        ),
        title: MyText(
          title: "تقييم المنتج",
          size: 19,
          color: MyColors.blackOpacity,
        ),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Center(
            child: SmoothStarRating(
              color: MyColors.gold,
              size: 45,
              starCount: 5,
              borderColor: Colors.grey.withOpacity(.4),
              spacing: 2,
              rating: rate,
              onRated: (val) {
                setState(() {
                  rate = val;
                });
                print("$rate");
              },
            ),
          ),
          Center(
            child: RichTextFiled(
//              height: MediaQuery.of(context).size.height * .65,
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              controller: _comment,
              label: "اكتب نص التقييم",
              max: 15,
            ),
          ),
          Center(
            child: InkWell(
              onTap: (){
                if(_comment.text!=null){
                  Map map2 = {"rate": "$rate",
                    "name": "مستخدم جديد",
                    "comment": "${_comment.text}",};
                 comments.add(map2);

                  Navigator.pop(context);
                }

              },
              child: Container(
                height: 40,
                child: Center(child: MyText(title: "تقييم",color: MyColors.white,size: 17,),),
                margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
                decoration:
                    BoxDecoration( color: MyColors.blue,borderRadius: BorderRadius.circular(10)),

              ),
            ),
          )
        ],
      ),
    );
  }
}
