import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mystore/serverc/auth_server.dart';
import 'package:mystore/model/main_category.dart';
import 'dart:convert';


class MainCategoryController extends GetxController {

  ValueNotifier<bool> _load = ValueNotifier(false);
  List<MainCategory>_mainCategory = [];

  ValueNotifier<bool> get load =>_load;

  List<MainCategory> get mainCategory => _mainCategory;

  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    await getMainCategory();

  }

  getMainCategory() async {
    try{
      _load.value = true;
      _mainCategory=[];
      var res = await Network().getData('/maincategorys?lange=ar');
      var body = json.decode(res.body.toString());
      if (body['status'])
        for (var category in body['categorys'] ){
          _mainCategory.add(MainCategory.fromJson(category));
        }
      if(_mainCategory.length==0)
        _load.value=false;
      _load.value = false;

      update();
    }
    catch(e){
      _load.value = false;
      update();

    }

  }



}