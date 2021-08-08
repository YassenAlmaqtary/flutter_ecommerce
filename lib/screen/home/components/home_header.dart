import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mystore/confSize.dart';
import '../../../components/search_field.dart';
import './Icon_btn_with_counter.dart';
import 'package:mystore/screen/cart/cart_screen.dart';


class HomeHeader extends StatelessWidget {

  const HomeHeader({Key key}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:getProportionateScreenWidth(context:context,inputWidth:20)),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
            numOfitem:0,
            svgSrc:"assets/icons/Cart Icon.svg",
            press: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3,
            press: () {},
          ),
        ],

      ),
    );
  }
}
