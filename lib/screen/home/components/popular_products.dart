import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mystore/components/product_card.dart';
import 'package:mystore/confSize.dart';
import 'package:mystore/localezation_app.dart';
import 'package:mystore/model/product.dart';
import '../../../constants.dart';
import './section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(
              getProportionateScreenWidth(context: context, inputWidth: 20)),
          child: SectionTitle(
            title: LocaleztionApp.of(context).getlangTitle("popular_product"),
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(context: context, inputWidth: 20),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                (index) {
                  if(demoProducts[index].isPopular){
                   return ProductCard(product:demoProducts[index],) ;
                  }
                  else
                    return SizedBox.shrink();
                },
              ),
              SizedBox(width:getProportionateScreenWidth(context:context,inputWidth:20),)
            ],
          ),
        ),
      ],
    );
  }
}
