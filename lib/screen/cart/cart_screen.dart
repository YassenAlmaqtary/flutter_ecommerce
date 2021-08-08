import 'package:flutter/material.dart';
import 'package:mystore/model/product.dart';
import './components/body.dart';
import './components/checkout_card.dart';
import 'package:mystore/localezation_app.dart';
class CartScreen extends StatelessWidget {
 static String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:buildAppBar(context),
     body:Body(),
     bottomNavigationBar:CheckoutCard(),
    );
  }
  AppBar buildAppBar(BuildContext context){
     return  AppBar(
       centerTitle: true,
       title:Column(
         children: [
           Text(
           LocaleztionApp.of(context).getlangTitle("title_card"),
            // AppLocalizations.of(context).card,
             style: TextStyle(
                 color: Color(0xffc1c1c1),
                 fontWeight: FontWeight.bold,
                 fontSize: 20.0),
           ),
           Text(
             "${demoProducts.length}"+LocaleztionApp.of(context).getlangTitle("item_card"),
             style:Theme.of(context).textTheme.subtitle1
           ),
         ],
       ) ,
       elevation: 0.0,
       leading: IconButton(
         icon: Icon(Icons.arrow_back_ios),
         color: Color(0xffA9A9A9),
         iconSize: 20,
         onPressed: () {
           Navigator.pop(context);
         },
       ),
     );
  }
}
