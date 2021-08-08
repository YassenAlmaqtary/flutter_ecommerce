import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mystore/components/grid_list.dart';
import 'package:mystore/components/search_field.dart';
import 'package:mystore/confSize.dart';
import 'package:mystore/helper/screen_arguments.dart';
import 'package:mystore/model/product.dart';

class SubCategoresScreen extends StatelessWidget {
  static String routeName='/sub_Categores';

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
            child:GridtList(models:demoProducts,),
          )

          ],
        ),
      ),

    ),

    );
  }
}

