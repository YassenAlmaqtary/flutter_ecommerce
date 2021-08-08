import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mystore/routes.dart';
import 'package:mystore/screen/splash/compones/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mystore/localezation_app.dart';
import 'package:get/get.dart';

import 'helper/binding.dart';
void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.grey[50],));

  runApp(MyApp());
}
class MyApp extends StatelessWidget {


List<Locale> lungugeSupport=  [
  const Locale('en', ''), // English, no country code
  const Locale('ar', ''), // Arabic, no country code
  ];


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding:Binding(),
      debugShowCheckedModeBanner:false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.grey[50],
          fontFamily:"Muli",
      ),
      initialRoute:SplashScreen.routeName,
      routes: Routes,

      //...................//
      localizationsDelegates:[
        LocaleztionApp.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
     supportedLocales:lungugeSupport,

      localeResolutionCallback:(Locale locale, Iterable<Locale> supportedLocales){
        if(locale!=null)
        for(Locale lang in supportedLocales){
          if(locale.languageCode==lang.languageCode)
           return locale;
        }
        return supportedLocales.first;
      },


    );
  }
}




