import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mystore/model/model.dart';
import 'package:mystore/model/product.dart';
import 'package:mystore/model/vendor.dart';
import 'package:mystore/serverc/auth_server.dart';


class ProductController extends GetxController {

  ValueNotifier<bool> _load = ValueNotifier(false);

  List<Model>_products = [];

  ValueNotifier<bool> get load => _load;

  List<Model> get products => _products;
  int subCategory_id, vendor_id;

  ProductController({this.subCategory_id, this.vendor_id});
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    print("subCategory_id+${this.subCategory_id}");
    print("vendor_id+${this.vendor_id}");
    if (this.subCategory_id != null && this.vendor_id != null)
      await ProuductWithSubCategory(
          subcatecoryId: this.subCategory_id, vendor_id: this.vendor_id);
  }


  ProuductWithSubCategory({int subcatecoryId, int vendor_id }) async {
    _load.value = true;
    _products = [];
    var res = await Network().getData('/getProuductWithSubCategory/${subcatecoryId}/${vendor_id}/?lange=ar');
    var body = json.decode(res.body.toString());
    if (body['status'])
      for (var product in body['products']) {
        _products.add(Product.fromJson(product));
      }

    if (_products.length == 0)
      _load.value = false;
    _load.value = false;
    update();
  }


}