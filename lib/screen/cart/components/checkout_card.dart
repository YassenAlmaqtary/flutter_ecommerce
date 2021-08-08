import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mystore/components/defult_boutm.dart';
import 'package:mystore/confSize.dart';

import '../../../localezation_app.dart';

class CheckoutCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal:
            getProportionateScreenWidth(context: context, inputWidth: 30),
        vertical: getProportionateScreenWidth(context: context, inputWidth: 15),
      ),
      width: getProportionateScreenWidth(context: context, inputWidth: 30),
      height: getProportionateScreenWidth(context: context, inputWidth: 170),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow:[
            BoxShadow(
              offset:Offset(0,-15),
              blurRadius:20,
              color:Color(0xFFDADADA).withOpacity(0.15),
            ),
          ],
      ),

      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: getProportionateScreenWidth(
                      context: context, inputWidth: 40),
                  height: getProportionateScreenWidth(
                      context: context, inputWidth: 40),
                  decoration: BoxDecoration(
                      color: Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(10)),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
                Text(LocaleztionApp.of(context).getlangTitle("voucher_code")),
                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                )
              ],
            ),
            SizedBox(
                height: getProportionateScreenWidth(
                    context: context, inputWidth: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(text:LocaleztionApp.of(context).getlangTitle("Total")+":\n", children: [
                    TextSpan(
                      text: "\$337.15",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ]),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(
                      context: context, inputWidth: 190),
                  child: defultBoutm(
                    text: LocaleztionApp.of(context).getlangTitle("check_Out"),
                    context: context,
                    press: () {},
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
