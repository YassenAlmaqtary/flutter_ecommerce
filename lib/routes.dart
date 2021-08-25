
import 'package:flutter/widgets.dart';
import 'package:mystore/screen/Category/Sub_categorys_screen.dart';
import 'package:mystore/screen/complete_profile/complete_profile_screen.dart';
import 'package:mystore/screen/details/details_screen.dart';
import 'package:mystore/screen/favourite/favourite_screen.dart';
import 'package:mystore/screen/forgot_password/forgot_password_screen.dart';
import 'package:mystore/screen/login_success/login_success_screen.dart';
import 'package:mystore/screen/otp/otp_screen.dart';
import 'package:mystore/screen/product/product_screen.dart';
import 'package:mystore/screen/sign/sign_screen.dart';
import 'package:mystore/screen/sign_up/sign_up_screen.dart';
import 'package:mystore/screen/splash/compones/splash_screen.dart';
import 'package:mystore/screen/home/home_screen.dart';
import 'package:mystore/screen/cart/cart_screen.dart';
import 'package:mystore/screen/vendor/vendor_screen.dart';


Map<String,WidgetBuilder>Routes= {
  SplashScreen.routeName: (contex) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  SubCategoresScreen.routeName:(context)=>SubCategoresScreen(),
  VendorScreen.routeName:(context)=>VendorScreen(),
  ProductScreen.routeName:(context)=>ProductScreen(),
  FavouriteScreen.routeName:(context)=>FavouriteScreen(),
};