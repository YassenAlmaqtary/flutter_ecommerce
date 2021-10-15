import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:mystore/model/product.dart';
import 'package:mystore/serverc/auth_server.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CardController extends GetxController {
  Product product;
  int quintity;
  ValueNotifier<bool> _load = ValueNotifier(false);

  ValueNotifier<bool> get load => _load;

  CardController({this.product, this.quintity});

  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }
  Future addToCard() async {
    try {
      _load.value=true;
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      var user, data;
      if (localStorage.getString('user').isNotEmpty) {
        user = jsonDecode(localStorage.getString('user'));
        data = {
          'product_id': product.id.toString(),
          'user_id': user['id'].toString(),
          'quintity': quintity.toString(),
        };
        var res = await Network().authData(data,'/add-to-card');
        var body = json.decode(res.body);
        if(body['status']==false)
          Get.snackbar("error","لتم اضافتها الى السلة مسبقا",
              colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
      }
      else

      _load.value=false;
      update();
    }
    catch (e) {
      print(e);
      update();
    }
  }
}
