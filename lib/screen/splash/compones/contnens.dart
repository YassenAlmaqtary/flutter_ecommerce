import 'package:flutter/material.dart';
import 'package:mystore/confSize.dart';


class Contnes extends StatelessWidget {

  String text1,text2,text3,imagPah;
  Contnes({this.text1,this.text2,this.text3,this.imagPah});

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        Text(
          "Mystory",
          style: TextStyle(
              fontSize:getProportionateScreenWidth(inputWidth:30,context:context),
              color: Color(0xffFF7447),
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding:EdgeInsets.symmetric(horizontal:20),
          child: RichText(
            text: TextSpan(
              text: '${text1}',
              style: TextStyle(fontSize: 16.0, color: Color(0xffBDBDBD)),
              children: [
                TextSpan(text: " ${text2} "),
                TextSpan(
                  text: "my story,",
                  style: TextStyle(
                      color: Color(0xffABABAB),
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(text: " ${text3}"),
              ],
            ),
          ),
        ),
        Spacer(),
        Image(
          width:getProportionateScreenWidth(context: context,inputWidth:256),
          height:getProportionateScreenHeight(context: context,inputHeight:253 ),
          image: ExactAssetImage(imagPah),
        ),


      ],
    );
  }
}
