import 'package:flutter/material.dart';
import 'package:mystore/localezation_app.dart';
import 'package:mystore/screen/forgot_password/componets/body.dart';


class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

          appBar:AppBar(
            centerTitle: true,
            title: Text(
              LocaleztionApp.of(context).getlangTitle("forgot_password"),
              style: TextStyle(
                  color: Color(0xffc1c1c1),
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Color(0xffA9A9A9),
              iconSize: 20,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body:Body(),

    );
  }
}
