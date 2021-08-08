import 'package:flutter/material.dart';
import 'package:mystore/confSize.dart';
import 'package:mystore/localezation_app.dart';
import 'package:mystore/screen/sign_up/sign_up_screen.dart';
import 'package:mystore/screen/splash/compones/contnens.dart';

import '../constants.dart';

class NoAccountText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          LocaleztionApp.of(context).getlangTitle("Do_not_account"),
          style: TextStyle(
            fontSize:
                getProportionateScreenWidth(context: context, inputWidth: 16),
          ),
        ),
         GestureDetector (
           onTap:(){
             Navigator.pushNamed(context, SignUpScreen.routeName);
           },
          child: Text(
            LocaleztionApp.of(context).getlangTitle("sign_up"),
            style: TextStyle(
              fontSize: getProportionateScreenWidth(
                context: context,
                inputWidth: 16,
              ),
              color:kPrimaryColor
            ),
          ),
        ),
      ],
    );
  }
}
