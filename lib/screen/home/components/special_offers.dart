import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mystore/confSize.dart';
import 'package:mystore/localezation_app.dart';
import './section_title.dart';

class SpecialOffers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(
              getProportionateScreenWidth(context: context, inputWidth: 20)),
          child: SectionTitle(
            title: LocaleztionApp.of(context).getlangTitle("special_for_you"),
            press: () {},
          ),
        ),
       SizedBox(
         height:getProportionateScreenWidth(context:context,inputWidth:100),
         child: ListView(
           padding:EdgeInsets.only(left:getProportionateScreenWidth(context:context,inputWidth:20)),
           scrollDirection:Axis.horizontal,
           children: [
             SpecialOfferCard(
               image: "assets/images/Image Banner 2.png",
               category: "Smartphone",
               numOfBrands: 18,
               press: () {},
             ),
             SpecialOfferCard(
               image: "assets/images/Image Banner 3.png",
               category: "Fashion",
               numOfBrands: 24,
               press: () {},
             ),
           ],
         ),
       )
      ],
    );
  }
}
class SpecialOfferCard extends StatelessWidget {
  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;
  double width,height,border;
   SpecialOfferCard(
       {Key key,
         @required this.category,
         @required this.image,
         @required this.numOfBrands,
         @required this.press,
         this.width=242,
         this.height=100,
         this.border=20,
       }
       ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:EdgeInsets.only(right:getProportionateScreenWidth(context: context,inputWidth:20,)),
      child: GestureDetector(
        onTap:press,
        child: SizedBox(
          width: getProportionateScreenWidth(
              context: context, inputWidth: this.width),
          height: getProportionateScreenWidth(
              context: context, inputWidth: this.height),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(this.border),
            child:  Stack(
              children: [
                Image.asset(image,fit:BoxFit.cover,),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(
                          context: context, inputWidth: 15),
                      vertical: getProportionateScreenWidth(
                          context: context, inputWidth: 10)),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(
                                  context: context, inputWidth: 18)),
                        ),
                        TextSpan(text: "$numOfBrands Brands"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
