import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mystore/confSize.dart';
import 'package:mystore/localezation_app.dart';

class DiscountBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(
          getProportionateScreenWidth(context: context, inputWidth: 20)),
      padding: EdgeInsets.symmetric(
          horizontal:
              getProportionateScreenWidth(context: context, inputWidth: 20),
          vertical:
              getProportionateScreenWidth(context: context, inputWidth: 20)),
      decoration: BoxDecoration(
        color: Color(0xff4F3894),
        borderRadius: BorderRadius.circular(
            getProportionateScreenWidth(context: context, inputWidth: 20)),
      ),
      child:Text.rich(
         TextSpan(
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(text:LocaleztionApp.of(context).getlangTitle("summer_surpise")+"\r"),
            TextSpan(
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(
                      context: context, inputWidth: 24),
                  fontWeight: FontWeight.bold),
              text: LocaleztionApp.of(context).getlangTitle("cashback") +"20%",
            ),
          ],
        ),
      ),
    );
  }
}
