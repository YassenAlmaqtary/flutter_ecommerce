import 'package:flutter/material.dart';
import 'confSize.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
//url fetch api
//const String url='http://172.16.13.178:8000/';
//const String url_image='http://172.16.13.178:8000';
const String url='http://192.168.248.1:8000/';
const String url_image='http://192.168.248.1:8000';

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(inputWidth:28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";


 InputDecoration  otpInputDecoration ({BuildContext context}){
return InputDecoration(
contentPadding:
EdgeInsets.symmetric(vertical: getProportionateScreenWidth(context:context,inputWidth:15)),
border: outlineInputBorder(context:context),
focusedBorder: outlineInputBorder(context:context),
enabledBorder: outlineInputBorder(context: context),
);
}
OutlineInputBorder outlineInputBorder({BuildContext context}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(context:context,inputWidth:15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

Color colorConvert(String color) {
  color = color.replaceAll("#", "");
  if (color.length == 6) {
    return Color(int.parse("0xFF"+color));
  } else if (color.length == 8) {
    return Color(int.parse("0x"+color));
  }
}