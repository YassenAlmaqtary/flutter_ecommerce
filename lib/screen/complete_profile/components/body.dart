import 'package:flutter/material.dart';
import 'package:mystore/localezation_app.dart';
import '../../../confSize.dart';
import './complete_profile_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                LocaleztionApp.of(context).getlangTitle("complete_profile"),
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(
                      inputWidth: 28, context: context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: SizeConfig(context).screenHeight * .03),
              Text(
                LocaleztionApp.of(context)
                        .getlangTitle("complete_your_details") +
                    "\n" +
                    LocaleztionApp.of(context)
                        .getlangTitle("continue_with_cocial_media"),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig(context).screenHeight * .08),
              CompleteProfileForm(),
              SizedBox(height: SizeConfig(context).screenHeight * .08),
              Text(
                'By continuing your confirm that you agree \nwith our Term and Condition',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
