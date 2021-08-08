import 'package:flutter/material.dart';
import '../../../confSize.dart';
import '../../../constants.dart';
import './otp_form.dart';

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
                "Otp Verifcotion",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(
                      inputWidth: 28, context: context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: SizeConfig(context).screenHeight * .03),
              Text("We sent your code to +1 898 860 ***"),
              buildTimer(context:context),
              SizedBox(height: SizeConfig(context).screenHeight * .08),
                 OtpForm(),
              SizedBox(height: SizeConfig(context).screenHeight * .08),
              GestureDetector(
                child: Text(
                  "Resend OTP Code",
                  textAlign: TextAlign.center,
                  style:TextStyle(decoration:TextDecoration.underline)
                ),
                onTap:(){
                  // OTP code resend
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
   Row buildTimer({BuildContext context}){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "This code will expired in",
        ),
        SizedBox(
          width: getProportionateScreenWidth(
              context: context, inputWidth: 4),
        ),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (context, value,child){
            return Text("00${value.toInt()}",
              style:TextStyle(color:kPrimaryColor),
            );
          },
        )
      ],
    );
  }
}
