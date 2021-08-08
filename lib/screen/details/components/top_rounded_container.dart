import 'package:flutter/material.dart';
import 'package:mystore/confSize.dart';

class TopRoundedContainer extends StatelessWidget {
  final Color color;
  final Widget child;


  const TopRoundedContainer({Key key, this.color, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width:double.infinity,
     margin:EdgeInsets.symmetric(vertical:getProportionateScreenWidth(context:context,inputWidth:20)),
      padding :EdgeInsets.symmetric(vertical:getProportionateScreenWidth(context:context,inputWidth:20)),
    child:child,
    decoration:BoxDecoration(
      color:color,
     borderRadius:BorderRadius.only(topLeft:Radius.circular(40),topRight:Radius.circular(40)) ,
    ),
    );
  }
}
