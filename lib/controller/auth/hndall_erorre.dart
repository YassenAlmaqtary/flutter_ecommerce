import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mystore/serverc/auth_server.dart';
import 'dart:convert';
class HndallErorre extends GetxController{

  var isAuth = false.obs;
  final List<String> errors = [];
  bool remember = false;

  void addError({String error}) {
    if (!errors.contains(error)) {
      errors.add(error);

    }
    update();
  }

  void removeError({String error}) {
    if (errors.contains(error)) {
      errors.remove(error);

    }
    update();

  }

  void rememberChaing(bool value){
    remember=value;
    update();
  }

  void  checkIfLoggedIn() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    var res= await Network().cheekTokrn('/cheekToken');
    var body = json.decode(res.body.toString());
    if(token!=null){
      if(body['status'])
        isAuth.value=true;
      else isAuth.value=false;
    }

  }


}


