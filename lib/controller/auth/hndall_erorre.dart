import 'package:get/get.dart';

class HndallErorre extends GetxController{


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


}


