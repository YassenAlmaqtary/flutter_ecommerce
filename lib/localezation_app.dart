import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class LocaleztionApp{
  final Locale locale;
  LocaleztionApp(this.locale);




  static LocaleztionApp of(BuildContext context) {
    return Localizations.of<LocaleztionApp>(context, LocaleztionApp);
  }

   static const LocalizationsDelegate<LocaleztionApp> delegate=_DemoLocalizationsDelegate();


  Map<String,String>_lodlang;

   Future Load()async{
    String _LangFile=await rootBundle.loadString('assets/languge/${locale.languageCode}.json');
    // print(_LangFile+"yassen");
     Map<String,dynamic>_loadvalue=jsonDecode(_LangFile);
    _lodlang=_loadvalue.map((key, value) => MapEntry(key, value.toString()));

   }
  String getlangTitle(String k){
      return _lodlang[k];
   }




}

class _DemoLocalizationsDelegate extends LocalizationsDelegate<LocaleztionApp> {

  const _DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ar'].contains(locale.languageCode);


  @override
  Future<LocaleztionApp> load(Locale locale)async{
    LocaleztionApp localeztionApp =LocaleztionApp(locale);
    await localeztionApp.Load();
    return localeztionApp;
    //return SynchronousFuture<LocaleztionApp>(localeztionApp);
  }

  @override
  bool shouldReload(_DemoLocalizationsDelegate old) => false;
}
