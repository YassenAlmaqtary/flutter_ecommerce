import 'package:flutter/material.dart';
import 'package:mystore/localezation_app.dart';

import '../../../confSize.dart';
import 'forgot_pass_form.dart';

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
                LocaleztionApp.of(context).getlangTitle("forgot_password"),
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(
                      inputWidth: 28, context: context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: SizeConfig(context).screenHeight * .03),
              Text(
                LocaleztionApp.of(context).getlangTitle(
                        "Please_enter_your_email_and_we_will_send") +
                    "\n" +
                    LocaleztionApp.of(context)
                        .getlangTitle("you_a_link_to_return_to_your_account"),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig(context).screenHeight * .08),
              ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}
