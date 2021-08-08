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
  int id;
   SubCategoryController({this.id});
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    print(this.id);
     if(this.id!=null)
       await getSubCategory(catecoryId:this.id);

  }

  getSubCategory({int catecoryId}) async {
    _load.value = true;
    _subCategory=[];
    var res = await Network().getData('/maincategorys/${catecoryId}/?lange=en');
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