import 'package:flutter/material.dart';
import 'package:mystore/components/rounded_icon_btn.dart';
import 'package:mystore/confSize.dart';
import 'package:mystore/constants.dart';
import 'package:mystore/model/product.dart';
import 'package:get/get.dart';
import 'package:mystore/controller/ainmation/ainmation_color.dart';


class ColorDots extends StatelessWidget {
  final Product product;

  const ColorDots({Key key,this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:getProportionateScreenWidth(context:context,inputWidth:20)),
      child: Row(
        children: [
          ...List.generate(
             product.colors.length,
                (index) => ColorDot(color:product.colors[index],
              index:index,
            ),
          ),
          Spacer(),
          RoundedIconBtn(
            icon:Icons.remove,
            showShadow:false,
            press:(){},
          ),
          SizedBox(width:getProportionateScreenWidth(context:context,inputWidth:20)),
          RoundedIconBtn(
            icon:Icons.add,
            showShadow:true,
            press:(){},
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  final int index;

  const ColorDot({
    Key key,
    this.color,
    this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AinmationColor>(
      init:AinmationColor() ,
      builder:(controller)=> GestureDetector(
        onTap:(){
          controller.selectColors(this.index);
        },
        child: Container(
          margin:EdgeInsets.only(right:getProportionateScreenWidth(context:context,inputWidth:5)),
          width: getProportionateScreenWidth(context: context, inputWidth: 40),
          height: getProportionateScreenHeight(context: context, inputHeight: 40),
          padding: EdgeInsets.all(
              getProportionateScreenHeight(context: context, inputHeight: 8)),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border:
                Border.all(color:controller.selectedColor==this.index ? kPrimaryColor : Colors.transparent),
            shape: BoxShape.circle,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(color:color, shape: BoxShape.circle),
          ),
        ),
      ),
    );
  }
}
