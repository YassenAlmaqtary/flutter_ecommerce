import 'package:flutter/material.dart';
import 'package:mystore/model/product.dart';
import './components/body.dart';



class DetailsScreen extends StatelessWidget {
  static String routeName="/detail";
  @override
  Widget build(BuildContext context) {
   final ProductDetailsArguments args=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      body:Body(product:args.product),
    );
  }
}

class ProductDetailsArguments{
  Product product;
  ProductDetailsArguments({@required this.product});

}
