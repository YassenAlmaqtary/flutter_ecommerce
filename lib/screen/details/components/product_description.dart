import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mystore/confSize.dart';
import 'package:mystore/constants.dart';
import 'package:mystore/localezation_app.dart';
import 'package:mystore/model/product.dart';

class ProductDescription extends StatelessWidget {
  final Product product;
  final GestureTapCallback pressOnSeeMore;

  const ProductDescription({Key key, this.product, this.pressOnSeeMore})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal:
                getProportionateScreenWidth(context: context, inputWidth: 20),
          ),
          child:
              Text(product.title, style: Theme.of(context).textTheme.headline6),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width:
                getProportionateScreenWidth(context: context, inputWidth: 65),
            padding: EdgeInsets.all(
                getProportionateScreenWidth(context: context, inputWidth: 15)),
            child: SvgPicture.asset(
              "assets/icons/Heart Icon_2.svg",
              color:
                  product.isFavourite ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
              height:
                  getProportionateScreenWidth(context: context, inputWidth: 16),
            ),
            decoration: BoxDecoration(
                color:
                    product.isFavourite ? Color(0xFFFFE6E6) : Color(0xFFF5F6F9),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(context: context, inputWidth: 20),
            right:
                getProportionateScreenWidth(context: context, inputWidth:80),
          ),
          child: Text(
            product.description,
            maxLines: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(context:context,inputWidth:20),
            vertical: 10,
          ),
          child: GestureDetector(
            onTap:pressOnSeeMore,
            child: Row(
              children: [
                Text(
                  LocaleztionApp.of(context).getlangTitle("see_more_detail"),
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width:5),
                Icon(Icons.arrow_forward_ios,
                color:kPrimaryColor,
                  size:12,
                ),
              ],
            )
          ),
        )
      ],
    );
  }
}