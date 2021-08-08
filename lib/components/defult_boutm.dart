
import 'package:flutter/material.dart';
import 'package:mystore/confSize.dart';

import '../constants.dart';

GestureDetector defultBoutm({Function press,String text,BuildContext context}){
  return GestureDetector(
    onTap:press,
    child: Container(
      child:Center(
        child:Text('${text}',style:TextStyle(
            color:Colors.white,
            fontSize:getProportionateScreenWidth(context:context,inputWidth:16 )
        ),),
      ),
      width:double.infinity,
      height:getProportionateScreenWidth(inputWidth:56,context:context),
      decoration:BoxDecoration(
        borderRadius:BorderRadius.circular(20),
        color:kPrimaryColor,
      ),

    ),
  );
}