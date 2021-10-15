import 'package:get/get.dart';


class AinmationColor extends GetxController{

  int selectedColor = 0;

  selectColors(int index){
    selectedColor=index;
    update();

  }


}

