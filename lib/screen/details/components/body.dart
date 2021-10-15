import 'package:flutter/material.dart';
import 'package:mystore/components/defult_boutm.dart';
import 'package:mystore/localezation_app.dart';
import 'package:mystore/model/product.dart';
import '../../../confSize.dart';
import './product_images.dart';
import './top_rounded_container.dart';
import './product_description.dart';
import './color_dots.dart';

class Body extends StatelessWidget {
  Product product;

  Body({@required this.product});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      children: [
        SizedBox(
            height:
                getProportionateScreenWidth(context: context, inputWidth: 50)),
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                //pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots(product: product),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig(context).screenWidth * .15,
                          right: SizeConfig(context).screenWidth * .15,
                          top:getProportionateScreenWidth(context:context,inputWidth:15),
                          bottom:getProportionateScreenWidth(context:context,inputWidth:40),
                        ),
                        child: defultBoutm(
                            context: context,
                            text: LocaleztionApp.of(context).getlangTitle("add_to_chart"),
                            press: () {

                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
