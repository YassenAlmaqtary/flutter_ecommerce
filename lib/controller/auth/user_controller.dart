import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mystore/serverc/auth_server.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './hndall_erorre.dart';
import 'package:mystore/screen/login_success/login_success_screen.dart';
import 'package:get/get.dart';

class UserController extends  HndallErorre {
  String email, password,conform_password, name;

  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await checkIfLoggedIn();
  }

  Future logIn({BuildContext context}) async {
    try {
      var data = {
        'email': email,
        'password': password
      };
      var res = await Network().authData(data, '/login');
      var body = json.decode(res.body.toString());
      if (body['status']) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', json.encode(body['user']['api_token']));
        localStorage.setString('user', json.encode(body['user']));
        Navigator.pushReplacementNamed(context, LoginSuccessScreen.routeName);
      }
      checkIfLoggedIn();
      update();
    }
    catch (e) {
      Get.snackbar("errore Singup accond", e.message,
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
        update();
    }
  }

  Future SingUp({BuildContext context}) async {
    try {
      var data = {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation':conform_password,
      };
      var res = await Network().authData(data, '/register');
      var body = json.decode(res.body.toString());
      if (body['status']) {
        SharedPreferences localStorage = await SharedPreferences.getInstance();
        localStorage.setString('token', json.encode(body['user']['api_token']));
        localStorage.setString('user', json.encode(body['user']));
        Navigator.pushReplacementNamed(context, LoginSuccessScreen.routeName);
      }
      checkIfLoggedIn();
      update();
    }
    catch (e) {
      Get.snackbar("errore Singup accond", e.message,
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
      update();
    }
  }



      }









