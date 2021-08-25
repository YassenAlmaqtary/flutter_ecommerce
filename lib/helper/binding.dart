import 'package:get/get.dart';
import 'package:mystore/controller/auth/user_controller.dart';
import 'package:mystore/controller/product/ProductContrller.dart';
import 'package:mystore/controller/vendor/vendor_controller.dart';
import './../controller/auth/hndall_erorre.dart';
import 'package:mystore/controller/category/main_category_controller.dart';
import 'package:mystore/controller/category/sub_category_controller.dart';

class Binding extends Bindings{
  @override
  void dependencies() {

   Get.put(()=>UserController());
   Get.put(()=>HndallErorre());
   Get.put(()=>MainCategoryController());
   Get.put(()=>SubCategoryController());
   Get.put(()=>VendorController());
  // Get.put(()=>ProductController());


  }




}





