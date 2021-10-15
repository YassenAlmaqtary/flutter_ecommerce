import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mystore/serverc/auth_server.dart';
import 'package:mystore/model/main_category.dart';
import 'package:mystore/model/sub_category.dart';
import 'dart:convert';


class SubCategoryController extends GetxController {

  ValueNotifier<bool> _load = ValueNotifier(false);

  List<SubCategory>_subCategory = [];

  ValueNotifier<bool> get load =>_load;
  List<SubCategory> get subCategorys => _subCategory;
  int mainCategory_id;
   SubCategoryController({this.mainCategory_id});
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    print(this.mainCategory_id);
     if(this.mainCategory_id!=null)
       await getSubCategory(maincatecoryId:this.mainCategory_id);

  }

  getSubCategory({int maincatecoryId}) async {
    _load.value = true;
    _subCategory=[];
    var res = await Network().getData(apiUrl:'/subcategorys/${maincatecoryId}/?lange=ar');
    var body = json.decode(res.body.toString());
    if (body['status'])
      for (var subcategory in body['subcategorys'] ){
        _subCategory.add(SubCategory.fromJson(subcategory));
      }
      if(_subCategory.length==0)
        _load.value=false;

    _load.value = false;

    update();

  }




}