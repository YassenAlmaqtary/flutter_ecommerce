import 'package:flutter/cupertino.dart';

import './product.dart';
import './model.dart';

class Cart implements Model{
  final product;
  final int numOfItem;

  Cart({@required this.product, @required this.numOfItem});

  @override
  List<String> GetImages() {

  }

  @override
  String getName() {
  }

  @override
  String getPhto() {
  }

  @override
  int getid() {

  }

  @override
  List<Color> GetColors() {
  }

}

List<Cart>demoCarts=[
  Cart(product:demoProducts[0],numOfItem:3),
  Cart(product: demoProducts[1], numOfItem: 1),
  Cart(product: demoProducts[3], numOfItem: 1),
];
