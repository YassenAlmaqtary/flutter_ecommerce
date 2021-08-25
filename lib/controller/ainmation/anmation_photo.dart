import 'package:get/get.dart';

class AnmationPhoto extends GetxController {

  int selectedImage = 0;

  selectImages(int index){
    selectedImage=index;
    update();

   }

}

