import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mystore/components/product_card.dart';
import 'package:mystore/components/search_field.dart';
import 'package:mystore/confSize.dart';
import 'package:mystore/model/product.dart';

class ClotheasScreen extends StatelessWidget {
  static String routeName='/coltheas';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        body:Padding(
          padding:EdgeInsets.symmetric(horizontal:getProportionateScreenWidth(context:context,inputWidth:20)),
          child: Column(
            children: [
              SizedBox(
                width:getProportionateScreenWidth(context:context,inputWidth:320),
                child: SearchField(),
              ),
              SizedBox(height:getProportionateScreenWidth(context:context,inputWidth:10),),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing:20,
                  mainAxisSpacing:20,
                  childAspectRatio:.7,
                  crossAxisCount:2,
                  padding:EdgeInsets.only(right:getProportionateScreenWidth(context:context,inputWidth:20)),
                  children: [
                    ProductCard(
                      product:demoProducts[0],
                    ),
                    ProductCard(
                      product:demoProducts[0],
                    ),
                    ProductCard(
                      product:demoProducts[0],
                    ),
                    ProductCard(
                      product:demoProducts[0],
                    ),
                    ProductCard(
                      product:demoProducts[0],
                    ),
                    ProductCard(
                      product:demoProducts[0],
                    ),
                    ProductCard(
                      product:demoProducts[0],
                    ),





                  ],
                ),
              )

            ],
          ),
        ),

      ),

    );
  }
}

