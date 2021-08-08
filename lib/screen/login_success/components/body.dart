import 'package:flutter/material.dart';
import 'package:mystore/components/defult_boutm.dart';
import 'package:mystore/confSize.dart';
import 'package:mystore/screen/home/home_screen.dart';

import '../../../localezation_app.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: SizeConfig(context).screenHeight * 0.04),
          Image.asset(
            "assets/images/success.png",
            height: SizeConfig(context).screenHeight * 0.5,
          ),
          SizedBox(height: SizeConfig(context).screenHeight * 0.08),
          Text(
          LocaleztionApp.of(context).getlangTitle("login_success"),
            style: TextStyle(
              fontSize:
                  getProportionateScreenWidth(context: context, inputWidth: 30),
              fontWeight:FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Spacer(),
          SizedBox(
            width:SizeConfig(context).screenWidth*0.6,
            child: defultBoutm(
            text:LocaleztionApp.of(context).getlangTitle("back_to_home"),
            context:context,
            press:(){
              Navigator.pushNamed(context, HomeScreen.routeName);

            }
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
