import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mystore/components/grid_list.dart';
import 'package:mystore/components/pro_gride_list.dart';
import 'package:mystore/components/search_field.dart';
import 'package:mystore/confSize.dart';
import 'package:mystore/controller/product/ProductContrller.dart';
import 'package:mystore/helper/screen_arguments.dart';
import 'package:mystore/model/product.dart';
import 'package:mystore/screen/details/details_screen.dart';

class ProductScreen extends StatelessWidget {
  static String routeName='/product';

  //int id;
  //SubCategoresScreen(this.id);
  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context).settings.arguments as ScreenArguments;
    return SafeArea(

      child:Scaffold(
        body: GetBuilder<ProductController>(
    init:ProductController(subCategory_id:args.subcategory_id,vendor_id:args.model_id),
    builder:(controller)=>controller.load.value? Center(
        child: CircularProgressIndicator(),
    ): ProGridList(models:controller.products)
    ),
      ),

    );
  }
}





