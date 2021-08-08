import 'package:flutter/material.dart';
import '../../../confSize.dart';
import '../../../constants.dart';
import 'package:mystore/model/card.dart';
class CartCard extends StatelessWidget {
  final Cart cart;

  const CartCard({Key key, @required this.cart}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(

      padding:EdgeInsets.only(bottom:getProportionateScreenWidth(context:context,inputWidth:3),top:getProportionateScreenWidth(context:context,inputWidth:20)),
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: .88,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(
                    context: context, inputWidth: 10)),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(cart.product.images[0]),
              ),
            ),
          ),
          SizedBox(
            width:getProportionateScreenWidth(context:context,inputWidth:13),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.product.title,
                style: TextStyle(color: Colors.black, fontSize: 16),
                maxLines:2,
              ),
              SizedBox(
                height: 10,
              ),
              Text.rich(
                TextSpan(
                    text: "\${art.product.price}",
                    style: TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.w600),
                    children: [
                      TextSpan(
                        text: "x${cart.numOfItem}",
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    ]),
              ),
            ],
          )
        ],
      ),
    );
  }
}
