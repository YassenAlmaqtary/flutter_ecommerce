import 'package:flutter/material.dart';
import 'package:mystore/components/rounded_icon_btn.dart';
import 'package:mystore/confSize.dart';
import 'package:mystore/constants.dart';
import 'package:mystore/model/product.dart';

class ColorDots extends StatelessWidget {
  final Product product;

  const ColorDots({Key key,this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int  selectedColor =3;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal:getProportionateScreenWidth(context:context,inputWidth:20)),
      child: Row(
        children: [
          ...List.generate(
            product.colors.length,
                (index) => ColorDot(color:product.colors[index],
              isSelected:index==selectedColor,
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
  final bool isSelected;

  const ColorDot({
    Key key,
    this.color,
    this.isSelected,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.only(right:getProportionateScreenWidth(context:context,inputWidth:5)),
      width: getProportionateScreenWidth(context: context, inputWidth: 40),
      height: getProportionateScreenHeight(context: context, inputHeight: 40),
      padding: EdgeInsets.all(
          getProportionateScreenHeight(context: context, inputHeight: 8)),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color:isSelected ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(color:color, shape: BoxShape.circle),
      ),
    );
  }
}
