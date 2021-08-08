import 'package:flutter/material.dart';
import './components/body.dart';
class OtpScreen extends StatelessWidget {
  static String routeName="/otp";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Otp Verifcotion",
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
