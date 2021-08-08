import 'package:flutter/material.dart';
import 'package:mystore/components/socal_card.dart';
import 'package:mystore/localezation_app.dart';
import 'package:mystore/screen/sign/components/sign_form.dart';
import '../../../confSize.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(
                inputWidth: 20.0, context: context)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig(context).screenHeight * 0.04,
              ),
              Text(
                LocaleztionApp.of(context).getlangTitle("welcome_back"),
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(
                      inputWidth: 28, context: context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: SizeConfig(context).screenHeight * .03),
              Text(
               LocaleztionApp.of(context).getlangTitle("sign_in_with_your") +"\n"+LocaleztionApp.of(context).getlangTitle("continue_with_cocial_media"),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig(context).screenHeight * .08),
              SignForm(),
              SizedBox(height: SizeConfig(context).screenHeight * .08),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocalCard(
                    icon: "assets/icons/google-icon.svg",
                    press: () {},
                  ),
                  SocalCard(
                    icon: "assets/icons/facebook-2.svg",
                    press: () {},
                  ),
                  SocalCard(
                    icon: "assets/icons/twitter.svg",
                    press: () {},
                  ),

                ],
              ),
              SizedBox(height:getProportionateScreenHeight(context:context,inputHeight:20),),
              Text(
                'By continuing your confirm that you agree \nwith our Term and Condition',
                textAlign:TextAlign.center,
                style:Theme.of(context).textTheme.caption,
              )
            ],
          ),
        ),
      ),
    );
  }
}
