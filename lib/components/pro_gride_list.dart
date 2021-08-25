import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mystore/components/product_card.dart';
import 'package:mystore/components/search_field.dart';
import 'package:mystore/confSize.dart';
import 'package:mystore/model/model.dart';
import 'package:mystore/model/product.dart';

class ProGridList extends StatelessWidget {
  //static String routeName = '/coltheas';
  //List<Widget> childern;
  List<Model> models;

  ProGridList({this.models});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal:
                getProportionateScreenWidth(context: context, inputWidth: 20)),
        child: Column(
          children: [
            SizedBox(
              width: getProportionateScreenWidth(
                  context: context, inputWidth: 320),
              child: SearchField(),
            ),
            SizedBox(
              height:
                  getProportionateScreenWidth(context: context, inputWidth: 10),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: .7,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return ProductCard(
                    product:models[index],

                  );
                },
                itemCount: models.length,
                padding: EdgeInsets.only(
                    right: getProportionateScreenWidth(context: context, inputWidth: 20)),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
