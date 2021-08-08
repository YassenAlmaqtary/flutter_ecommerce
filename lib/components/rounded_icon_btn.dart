import 'package:flutter/material.dart';
import 'package:mystore/confSize.dart';


class RoundedIconBtn extends StatelessWidget {
 final IconData icon;
 final GestureTapCallback press;
 final bool showShadow;

  const RoundedIconBtn({Key key, this.icon,this.showShadow ,this.press}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width:getProportionateScreenHeight(context:context,inputHeight:40),
      height:getProportionateScreenHeight(context:context,inputHeight:40),
      decoration:BoxDecoration(
        shape: BoxShape.circle,
        boxShadow:[
          if(showShadow)
            BoxShadow(
              offset:Offset(0,6),
              blurRadius:10,
                color: Color(0xFFB0B0B0).withOpacity(0.2)
            )
        ],
      ),
      child:FlatButton(
        onPressed:press,
        color:Colors.white,
        padding:EdgeInsets.zero,
        shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(50)) ,
        child:Icon(icon),
      ),
    );
  }
}


