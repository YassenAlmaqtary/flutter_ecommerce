import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mystore/model/model.dart';
import 'package:mystore/model/vendor.dart';
import 'package:mystore/serverc/auth_server.dart';


class VendorController extends GetxController {

  ValueNotifier<bool> _load = ValueNotifier(false);

  List<Model>_vendors = [];
  ValueNotifier<bool> get load =>_load;
  List<Model> get vendors => _vendors;
  int subCategory_id;
  VendorController({this.subCategory_id});
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    print(this.subCategory_id);
    if(this.subCategory_id!=null)
      await getvendorWithsubcategory(subcatecoryId:this.subCategory_id);

  }



  getvendorWithsubcategory({int subcatecoryId, int vendor_id}) async {
    _load.value = true;
    _vendors=[];
    var res = await Network().getData(apiUrl:'/vendor-of-product-of-subctgory/${subcatecoryId}/?lange=ar');
    var body = json.decode(res.body.toString());
    if (body['status'])
      for (var vendor in body['vendors'] ){
        _vendors.add(Vendor.fromJson(vendor));
      }
    if(_vendors.length==0)
      _load.value=false;
    _load.value = false;
    update();

  }



}