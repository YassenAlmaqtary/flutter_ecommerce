import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mystore/confSize.dart';

class SocalCard extends StatelessWidget {
  String icon;
  Function press;

  SocalCard({this.press, this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:press,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal:
                getProportionateScreenWidth(context: context, inputWidth: 10),
            ),
        padding:EdgeInsets.all(getProportionateScreenWidth(context: context, inputWidth:12),),
        width: getProportionateScreenWidth(context: context, inputWidth: 50),
        height: getProportionateScreenHeight(context: context, inputHeight: 50),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
         color:Color(0xFFF5F6F9),
        ),

          child: SvgPicture.asset(icon),


      ),
    );
  }
}
