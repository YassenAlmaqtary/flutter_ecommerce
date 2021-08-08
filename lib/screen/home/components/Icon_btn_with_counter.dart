import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mystore/confSize.dart';

import '../../../constants.dart';

class IconBtnWithCounter extends StatelessWidget {
  final String svgSrc;
  final int numOfitem;
  final GestureTapCallback press;

  const IconBtnWithCounter({Key key, this.svgSrc, this.numOfitem, this.press}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return InkWell(
      borderRadius:BorderRadius.circular(100),
      onTap:press,
      child: Stack(
        overflow:Overflow.visible,
        children: [
          Container(
              width: getProportionateScreenWidth(context:context,inputWidth:46),
              height:  getProportionateScreenWidth(context:context,inputWidth:46),
              padding:EdgeInsets.all( getProportionateScreenWidth(context:context,inputWidth:12),),
              decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.1),
                  shape:BoxShape.circle,
                  ),
             child: SvgPicture.asset(svgSrc),
          ),
         if(numOfitem!=0)
           Positioned(
             right: 0,
             top: -3,
             child: Container(
               width: getProportionateScreenWidth(
                   context: context, inputWidth: 16),
               height: getProportionateScreenWidth(
                   context: context, inputWidth: 16),
               decoration: BoxDecoration(
                 shape: BoxShape.circle,
                 color: kPrimaryColor,
                 border: Border.all(width: 1.5, color: Colors.white),
               ),
               child: Center(
                 child: Text("$numOfitem", style: TextStyle(
                     fontSize: getProportionateScreenWidth(
                         context: context, inputWidth: 10),
                     height: 1,
                     color: Colors.white,
                     fontWeight: FontWeight.w600
                 ),),
               ),

             ),
           )



        ],
      ),
    );
  }
}
