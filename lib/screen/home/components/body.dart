import 'package:flutter/material.dart';
import 'package:mystore/confSize.dart';
import './home_header.dart';
import './discount_banner.dart';
import './special_offers.dart';
import './popular_products.dart';
import 'categories.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child:Column(
          children: [
            SizedBox(height:getProportionateScreenHeight(context:context,inputHeight:20),),
            HomeHeader(),
            SizedBox(height:getProportionateScreenHeight(context:context,inputHeight:10),),
            DiscountBanner(),
            Categories(),
            SpecialOffers(),
           // PopularProducts(),
          ],
        ),

      ),
    );
  }
}
