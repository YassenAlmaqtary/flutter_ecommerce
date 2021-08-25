import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mystore/components/search_field.dart';
import 'package:mystore/confSize.dart';
import 'package:mystore/controller/vendor/vendor_controller.dart';
import 'package:mystore/helper/screen_arguments.dart';
import 'package:get/get.dart';
import 'package:mystore/screen/product/product_screen.dart';

import '../../components/grid_list.dart';
class VendorScreen extends StatelessWidget {
  static String routeName='/vendor';

  //int id;
  //SubCategoresScreen(this.id);
  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context).settings.arguments as ScreenArguments;

    return SafeArea(

    child:Scaffold(
      body:Padding(
        padding:EdgeInsets.symmetric(horizontal:getProportionateScreenWidth(context:context,inputWidth:20)),
        child: Column(
          children: [
         SizedBox(
           width:getProportionateScreenWidth(context:context,inputWidth:320),
             child: SearchField(),
         ),
          SizedBox(height:getProportionateScreenWidth(context:context,inputWidth:10),),
          Expanded(
            child:GetBuilder<VendorController>(
              init:VendorController(subCategory_id:args.model_id),
                builder:(controller)=>controller.load.value? Center(
            child: CircularProgressIndicator(),
          ):GridtList(models:controller.vendors,routeName:ProductScreen.routeName,subcategory_id:args.model_id)

            ),
          )

          ],
        ),
      ),

    ),

    );
  }
}

