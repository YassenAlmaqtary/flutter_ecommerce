import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mystore/confSize.dart';

class CustomSurffixIcon extends StatelessWidget {
  final String svgIcon;

  const CustomSurffixIcon({Key key, @required this.svgIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal:
            getProportionateScreenWidth(context: context, inputWidth: 18),
        vertical: getProportionateScreenWidth(context: context, inputWidth: 18),
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: getProportionateScreenWidth(context: context, inputWidth: 18),
      ),
    );
  }
}
